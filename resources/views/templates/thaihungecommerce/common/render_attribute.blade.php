
@php
/*
This view use render attribute product
$details: is list attributes group by groupId
$groups: is group attribute
*/
@endphp

@foreach ($details as $groupId => $detailsGroup)

<div class="item">
    <div class="title-variations">
        {!! $groups[$groupId] !!} :
    </div>
    <div class="value-variations">
        @foreach ($detailsGroup as $k => $detail)
            @php
                $valueOption = $detail->name.'__'.$detail->add_price;
            @endphp
            <input type="radio" id="rd{{$groupId.$k}}" class="rd-variation" {{ (($k == 0) ? "checked" : "") }} name="form_attr[{{ $groupId }}]" value="{{ $valueOption }}">
            <label for="rd{{$groupId.$k}}" >
                {!! sc_render_option_price($valueOption) !!}
            </label >
        @endforeach
    </div>
</div>
@endforeach
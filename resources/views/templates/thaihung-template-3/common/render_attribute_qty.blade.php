
@php
/*
This view use render attribute product
$details: is list attributes group by groupId
$groups: is group attribute
*/
@endphp

@foreach ($details as $groupId => $detailsGroup)
  {{--   <br><b><label> {!! $groups[$groupId] !!}</label></b>: --}}
	 <div class="choose-qty d-flex justify-content-between">
	    <div>Kích Thước</div>
	    <div>
	        Số lượng
	    </div>
	</div>
    @foreach ($detailsGroup as $k => $detail)
{{--         <label class="radio-inline"><input {{ (($k == 0) ? "checked" : "") }} type="radio" name="form_attr[{{ $groupId }}]" value="{{ $detail->name }}">{{ $detail->name }}</label> --}}

         <div class="choose-qty d-flex justify-content-between">
            <div><input type="checkbox"  class="check-qty"><span class="info-diameter">{{ $detail->name }}</span></div>
            <div>
                <input disabled="disabled" class="quantity b-calculator__input form-control"  type="number" name="form_attr[{{ $groupId }}]" value="1" min="1" />
            </div>
        </div>
    @endforeach
@endforeach
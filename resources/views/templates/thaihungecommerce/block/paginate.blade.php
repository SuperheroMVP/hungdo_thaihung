@if ($paginator->hasPages())
    <div class="shop-control shop-after-control">
        <nav class="woocommerce-pagination">
            {{-- Previous Page Link --}}
            @if ($paginator->onFirstPage())
                <span class="disabled" aria-disabled="true" aria-label="« Previous">
                    <span class="page-numbers" aria-hidden="true">‹</span>
                </span>
            @else
                <span class="">
                    <a class="page-numbers" href="{{ $paginator->previousPageUrl() }}" rel="prev" aria-label="« Previous">‹</a>
                </span>
            @endif

            {{-- Pagination Elements --}}
            @foreach ($elements as $element)
                {{-- "Three Dots" Separator --}}
                @if (is_string($element))
                    <span class="disabled" aria-disabled="true" aria-label="« Previous">
                        <span class="page-numbers" aria-hidden="true">{{$element}}</span>
                    </span>
                @endif

                {{-- Array Of Links --}}
                @if (is_array($element))
                    @foreach ($element as $page => $url)
                        @if ($page == $paginator->currentPage())
                            <span class="" aria-current="page">
                                <span class="page-numbers current">{{ $page }}</span>
                            </span>
                        @else
                            <li class="">
                                <a class="page-numbers" href="{{ $url }}">{{ $page }}</a>
                            </li>
                        @endif
                    @endforeach
                @endif
            @endforeach

            {{-- Next Page Link --}}
            @if ($paginator->hasMorePages())
                <span class="">
                    <a class="page-numbers" href="{{ $paginator->nextPageUrl() }}" rel="next" aria-label="Next »">›</a>
                </span>
            @else
                <span class="disabled" aria-disabled="true" aria-label="Next »">
                    <span class="page-numbers" aria-hidden="true">›</span>
                </span>
            @endif
        </ul>
    </nav>
@endif

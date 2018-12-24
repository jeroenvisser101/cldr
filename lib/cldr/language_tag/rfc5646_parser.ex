# Generated from lib/cldr/language_tag/rfc5646_parser.ex.exs, do not edit.
# Generated at 2018-12-24 09:23:08Z.

defmodule Cldr.Rfc5646.Parser do
  @moduledoc false

  import Cldr.Rfc5646.Grammar

  alias Cldr.LanguageTag

  def parse(rule \\ :language_tag, input) when is_atom(rule) and is_binary(input) do
    apply(__MODULE__, rule, [input])
    |> unwrap
  end

  defp unwrap({:ok, acc, "", _, _, _}) when is_list(acc),
    do: {:ok, acc}

  defp unwrap({:error, <<first::binary-size(1), reason::binary>>, rest, _, _, offset}),
    do:
      {:error,
       {LanguageTag.ParseError,
        "#{String.capitalize(first)}#{reason}. Could not parse the remaining #{inspect(rest)} " <>
          "starting at position #{offset + 1}"}}

  @doc """
  Parses the given `binary` as language_tag.

  Returns `{:ok, [token], rest, context, position, byte_offset}` or
  `{:error, reason, rest, context, line, byte_offset}` where `position`
  describes the location of the language_tag (start position) as {line, column_on_line}.

  ## Options

    * `:line` - the initial line, defaults to 1
    * `:byte_offset` - the initial byte offset, defaults to 0
    * `:context` - the initial context value. It will be converted
      to a map

  """
  @spec language_tag(binary, keyword) ::
          {:ok, [term], rest, context, line, byte_offset}
          | {:error, reason, rest, context, line, byte_offset}
        when line: {pos_integer, byte_offset},
             byte_offset: pos_integer,
             rest: binary,
             reason: String.t(),
             context: map()
  def language_tag(binary, opts \\ []) when is_binary(binary) do
    line = Keyword.get(opts, :line, 1)
    offset = Keyword.get(opts, :byte_offset, 0)
    context = Map.new(Keyword.get(opts, :context, []))

    case(language_tag__0(binary, [], [], context, {line, offset}, offset)) do
      {:ok, acc, rest, context, line, offset} ->
        {:ok, :lists.reverse(acc), rest, context, line, offset}

      {:error, _, _, _, _, _} = error ->
        error
    end
  end

  defp language_tag__0(rest, acc, stack, context, line, offset) do
    language_tag__39(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__2(rest, acc, stack, context, line, offset) do
    language_tag__3(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__3(rest, acc, stack, context, line, offset) do
    language_tag__10(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__5(rest, acc, stack, context, line, offset) do
    language_tag__6(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__6(
         <<"art-lojban", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__7(rest, ["art-lojban"] ++ acc, stack, context, comb__line, comb__offset + 10)
  end

  defp language_tag__6(
         <<"cel-gaulish", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__7(rest, ["cel-gaulish"] ++ acc, stack, context, comb__line, comb__offset + 11)
  end

  defp language_tag__6(<<"no-bok", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__7(rest, ["no-bok"] ++ acc, stack, context, comb__line, comb__offset + 6)
  end

  defp language_tag__6(<<"no-nyn", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__7(rest, ["no-nyn"] ++ acc, stack, context, comb__line, comb__offset + 6)
  end

  defp language_tag__6(
         <<"zh-guoyu", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__7(rest, ["zh-guoyu"] ++ acc, stack, context, comb__line, comb__offset + 8)
  end

  defp language_tag__6(
         <<"zh-hakka", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__7(rest, ["zh-hakka"] ++ acc, stack, context, comb__line, comb__offset + 8)
  end

  defp language_tag__6(<<"zh-min", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__7(rest, ["zh-min"] ++ acc, stack, context, comb__line, comb__offset + 6)
  end

  defp language_tag__6(
         <<"zh-min-nan", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__7(rest, ["zh-min-nan"] ++ acc, stack, context, comb__line, comb__offset + 10)
  end

  defp language_tag__6(
         <<"zh-xiang", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__7(rest, ["zh-xiang"] ++ acc, stack, context, comb__line, comb__offset + 8)
  end

  defp language_tag__6(rest, _acc, _stack, context, line, offset) do
    {:error,
     "expected one of the regular language tags in BCP-47 while processing a grandfathered language tag inside a BCP47 language tag",
     rest, context, line, offset}
  end

  defp language_tag__7(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__8(
      rest,
      [
        regular:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__8(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__4(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__9(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__5(rest, [], stack, context, line, offset)
  end

  defp language_tag__10(rest, acc, stack, context, line, offset) do
    language_tag__11(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__11(
         <<"en-GB-oed", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__12(rest, ["en-GB-oed"] ++ acc, stack, context, comb__line, comb__offset + 9)
  end

  defp language_tag__11(<<"i-ami", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__12(rest, ["i-ami"] ++ acc, stack, context, comb__line, comb__offset + 5)
  end

  defp language_tag__11(<<"i-bnn", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__12(rest, ["i-bnn"] ++ acc, stack, context, comb__line, comb__offset + 5)
  end

  defp language_tag__11(
         <<"i-default", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__12(rest, ["i-default"] ++ acc, stack, context, comb__line, comb__offset + 9)
  end

  defp language_tag__11(
         <<"i-enochian", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__12(rest, ["i-enochian"] ++ acc, stack, context, comb__line, comb__offset + 10)
  end

  defp language_tag__11(<<"i-hak", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__12(rest, ["i-hak"] ++ acc, stack, context, comb__line, comb__offset + 5)
  end

  defp language_tag__11(
         <<"i-klingon", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__12(rest, ["i-klingon"] ++ acc, stack, context, comb__line, comb__offset + 9)
  end

  defp language_tag__11(<<"i-lux", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__12(rest, ["i-lux"] ++ acc, stack, context, comb__line, comb__offset + 5)
  end

  defp language_tag__11(
         <<"i-mingo", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__12(rest, ["i-mingo"] ++ acc, stack, context, comb__line, comb__offset + 7)
  end

  defp language_tag__11(
         <<"i-navajo", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__12(rest, ["i-navajo"] ++ acc, stack, context, comb__line, comb__offset + 8)
  end

  defp language_tag__11(<<"i-pwn", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__12(rest, ["i-pwn"] ++ acc, stack, context, comb__line, comb__offset + 5)
  end

  defp language_tag__11(<<"i-tao", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__12(rest, ["i-tao"] ++ acc, stack, context, comb__line, comb__offset + 5)
  end

  defp language_tag__11(<<"i-tay", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__12(rest, ["i-tay"] ++ acc, stack, context, comb__line, comb__offset + 5)
  end

  defp language_tag__11(<<"i-tsu", rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__12(rest, ["i-tsu"] ++ acc, stack, context, comb__line, comb__offset + 5)
  end

  defp language_tag__11(
         <<"sgn-BE-FR", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__12(rest, ["sgn-BE-FR"] ++ acc, stack, context, comb__line, comb__offset + 9)
  end

  defp language_tag__11(
         <<"sgn-BE-NL", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__12(rest, ["sgn-BE-NL"] ++ acc, stack, context, comb__line, comb__offset + 9)
  end

  defp language_tag__11(
         <<"sgn-CH-DE", rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       ) do
    language_tag__12(rest, ["sgn-CH-DE"] ++ acc, stack, context, comb__line, comb__offset + 9)
  end

  defp language_tag__11(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__9(rest, acc, stack, context, line, offset)
  end

  defp language_tag__12(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__13(
      rest,
      [
        irregular:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__13(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__4(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__4(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__14(
      rest,
      [grandfathered: :lists.reverse(user_acc)] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__14(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__1(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__15(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__2(rest, [], stack, context, line, offset)
  end

  defp language_tag__16(rest, acc, stack, context, line, offset) do
    language_tag__17(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__17(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 === 120 or x0 === 88) and x1 === 45 do
    language_tag__18(rest, [] ++ acc, stack, context, comb__line, comb__offset + 2)
  end

  defp language_tag__17(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__15(rest, acc, stack, context, line, offset)
  end

  defp language_tag__18(rest, acc, stack, context, line, offset) do
    language_tag__19(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__19(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__20(rest, [<<x0::integer>>] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__19(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__15(rest, acc, stack, context, line, offset)
  end

  defp language_tag__20(rest, acc, stack, context, line, offset) do
    language_tag__22(rest, acc, [7 | stack], context, line, offset)
  end

  defp language_tag__22(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__23(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__22(rest, acc, stack, context, line, offset) do
    language_tag__21(rest, acc, stack, context, line, offset)
  end

  defp language_tag__21(rest, acc, [_ | stack], context, line, offset) do
    language_tag__24(rest, acc, stack, context, line, offset)
  end

  defp language_tag__23(rest, acc, [1 | stack], context, line, offset) do
    language_tag__24(rest, acc, stack, context, line, offset)
  end

  defp language_tag__23(rest, acc, [count | stack], context, line, offset) do
    language_tag__22(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__24(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__25(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__25(rest, acc, stack, context, line, offset) do
    language_tag__27(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__27(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__28(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__27(rest, acc, stack, context, line, offset) do
    language_tag__26(rest, acc, stack, context, line, offset)
  end

  defp language_tag__28(rest, acc, stack, context, line, offset) do
    language_tag__29(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__29(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__30(rest, [<<x0::integer>>] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__29(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__26(rest, acc, stack, context, line, offset)
  end

  defp language_tag__30(rest, acc, stack, context, line, offset) do
    language_tag__32(rest, acc, [7 | stack], context, line, offset)
  end

  defp language_tag__32(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__33(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__32(rest, acc, stack, context, line, offset) do
    language_tag__31(rest, acc, stack, context, line, offset)
  end

  defp language_tag__31(rest, acc, [_ | stack], context, line, offset) do
    language_tag__34(rest, acc, stack, context, line, offset)
  end

  defp language_tag__33(rest, acc, [1 | stack], context, line, offset) do
    language_tag__34(rest, acc, stack, context, line, offset)
  end

  defp language_tag__33(rest, acc, [count | stack], context, line, offset) do
    language_tag__32(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__34(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__35(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__26(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__36(rest, acc, stack, context, line, offset)
  end

  defp language_tag__35(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__27(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__36(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__37(
      rest,
      [private_use: :lists.reverse(user_acc)] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__37(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__1(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__38(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__16(rest, [], stack, context, line, offset)
  end

  defp language_tag__39(rest, acc, stack, context, line, offset) do
    language_tag__40(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__40(rest, acc, stack, context, line, offset) do
    language_tag__62(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__42(rest, acc, stack, context, line, offset) do
    language_tag__43(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__43(rest, acc, stack, context, line, offset) do
    language_tag__44(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__44(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90)) do
    language_tag__45(
      rest,
      [<<x0::integer, x1::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp language_tag__44(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, _, _, _, acc | stack] = stack
    language_tag__38(rest, acc, stack, context, line, offset)
  end

  defp language_tag__45(rest, acc, stack, context, line, offset) do
    language_tag__47(rest, acc, [1 | stack], context, line, offset)
  end

  defp language_tag__47(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) do
    language_tag__48(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__47(rest, acc, stack, context, line, offset) do
    language_tag__46(rest, acc, stack, context, line, offset)
  end

  defp language_tag__46(rest, acc, [_ | stack], context, line, offset) do
    language_tag__49(rest, acc, stack, context, line, offset)
  end

  defp language_tag__48(rest, acc, [1 | stack], context, line, offset) do
    language_tag__49(rest, acc, stack, context, line, offset)
  end

  defp language_tag__48(rest, acc, [count | stack], context, line, offset) do
    language_tag__47(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__49(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__50(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__50(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__51(
      rest,
      [
        language:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__51(rest, acc, stack, context, line, offset) do
    language_tag__55(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__53(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__52(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__54(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__53(rest, [], stack, context, line, offset)
  end

  defp language_tag__55(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__56(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__55(rest, acc, stack, context, line, offset) do
    language_tag__54(rest, acc, stack, context, line, offset)
  end

  defp language_tag__56(
         <<x0::integer, x1::integer, x2::integer, x3::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90)) and
              ((x3 >= 97 and x3 <= 122) or (x3 >= 65 and x3 <= 90)) do
    language_tag__57(
      rest,
      [script: <<x0::integer, x1::integer, x2::integer, x3::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 4
    )
  end

  defp language_tag__56(
         <<x0::integer, x1::integer, x2::integer, x3::integer, x4::integer, x5::integer,
           x6::integer, x7::integer, x8::integer, x9::integer, x10::integer, x11::integer,
           x12::integer, x13::integer, x14::integer, x15::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90)) and x3 === 45 and
              ((x4 >= 97 and x4 <= 122) or (x4 >= 65 and x4 <= 90)) and
              ((x5 >= 97 and x5 <= 122) or (x5 >= 65 and x5 <= 90)) and
              ((x6 >= 97 and x6 <= 122) or (x6 >= 65 and x6 <= 90)) and x7 === 45 and
              ((x8 >= 97 and x8 <= 122) or (x8 >= 65 and x8 <= 90)) and
              ((x9 >= 97 and x9 <= 122) or (x9 >= 65 and x9 <= 90)) and
              ((x10 >= 97 and x10 <= 122) or (x10 >= 65 and x10 <= 90)) and x11 === 45 and
              ((x12 >= 97 and x12 <= 122) or (x12 >= 65 and x12 <= 90)) and
              ((x13 >= 97 and x13 <= 122) or (x13 >= 65 and x13 <= 90)) and
              ((x14 >= 97 and x14 <= 122) or (x14 >= 65 and x14 <= 90)) and
              ((x15 >= 97 and x15 <= 122) or (x15 >= 65 and x15 <= 90)) do
    language_tag__57(
      rest,
      [
        script: <<x12::integer, x13::integer, x14::integer, x15::integer>>,
        language_subtags: [
          <<x0::integer, x1::integer, x2::integer>>,
          <<x4::integer, x5::integer, x6::integer>>,
          <<x8::integer, x9::integer, x10::integer>>
        ]
      ] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 16
    )
  end

  defp language_tag__56(
         <<x0::integer, x1::integer, x2::integer, x3::integer, x4::integer, x5::integer,
           x6::integer, x7::integer, x8::integer, x9::integer, x10::integer, x11::integer,
           rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90)) and x3 === 45 and
              ((x4 >= 97 and x4 <= 122) or (x4 >= 65 and x4 <= 90)) and
              ((x5 >= 97 and x5 <= 122) or (x5 >= 65 and x5 <= 90)) and
              ((x6 >= 97 and x6 <= 122) or (x6 >= 65 and x6 <= 90)) and x7 === 45 and
              ((x8 >= 97 and x8 <= 122) or (x8 >= 65 and x8 <= 90)) and
              ((x9 >= 97 and x9 <= 122) or (x9 >= 65 and x9 <= 90)) and
              ((x10 >= 97 and x10 <= 122) or (x10 >= 65 and x10 <= 90)) and
              ((x11 >= 97 and x11 <= 122) or (x11 >= 65 and x11 <= 90)) do
    language_tag__57(
      rest,
      [
        script: <<x8::integer, x9::integer, x10::integer, x11::integer>>,
        language_subtags: [
          <<x0::integer, x1::integer, x2::integer>>,
          <<x4::integer, x5::integer, x6::integer>>
        ]
      ] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 12
    )
  end

  defp language_tag__56(
         <<x0::integer, x1::integer, x2::integer, x3::integer, x4::integer, x5::integer,
           x6::integer, x7::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90)) and x3 === 45 and
              ((x4 >= 97 and x4 <= 122) or (x4 >= 65 and x4 <= 90)) and
              ((x5 >= 97 and x5 <= 122) or (x5 >= 65 and x5 <= 90)) and
              ((x6 >= 97 and x6 <= 122) or (x6 >= 65 and x6 <= 90)) and
              ((x7 >= 97 and x7 <= 122) or (x7 >= 65 and x7 <= 90)) do
    language_tag__57(
      rest,
      [
        script: <<x4::integer, x5::integer, x6::integer, x7::integer>>,
        language_subtags: [<<x0::integer, x1::integer, x2::integer>>]
      ] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 8
    )
  end

  defp language_tag__56(
         <<x0::integer, x1::integer, x2::integer, x3::integer, x4::integer, x5::integer,
           x6::integer, x7::integer, x8::integer, x9::integer, x10::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90)) and x3 === 45 and
              ((x4 >= 97 and x4 <= 122) or (x4 >= 65 and x4 <= 90)) and
              ((x5 >= 97 and x5 <= 122) or (x5 >= 65 and x5 <= 90)) and
              ((x6 >= 97 and x6 <= 122) or (x6 >= 65 and x6 <= 90)) and x7 === 45 and
              ((x8 >= 97 and x8 <= 122) or (x8 >= 65 and x8 <= 90)) and
              ((x9 >= 97 and x9 <= 122) or (x9 >= 65 and x9 <= 90)) and
              ((x10 >= 97 and x10 <= 122) or (x10 >= 65 and x10 <= 90)) do
    language_tag__57(
      rest,
      [
        <<x8::integer, x9::integer, x10::integer>>,
        <<x4::integer, x5::integer, x6::integer>>,
        <<x0::integer, x1::integer, x2::integer>>
      ] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 11
    )
  end

  defp language_tag__56(
         <<x0::integer, x1::integer, x2::integer, x3::integer, x4::integer, x5::integer,
           x6::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90)) and x3 === 45 and
              ((x4 >= 97 and x4 <= 122) or (x4 >= 65 and x4 <= 90)) and
              ((x5 >= 97 and x5 <= 122) or (x5 >= 65 and x5 <= 90)) and
              ((x6 >= 97 and x6 <= 122) or (x6 >= 65 and x6 <= 90)) do
    language_tag__57(
      rest,
      [<<x4::integer, x5::integer, x6::integer>>, <<x0::integer, x1::integer, x2::integer>>] ++
        acc,
      stack,
      context,
      comb__line,
      comb__offset + 7
    )
  end

  defp language_tag__56(
         <<x0::integer, x1::integer, x2::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90)) do
    language_tag__57(
      rest,
      [language_subtags: [<<x0::integer, x1::integer, x2::integer>>]] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 3
    )
  end

  defp language_tag__56(rest, acc, stack, context, line, offset) do
    language_tag__54(rest, acc, stack, context, line, offset)
  end

  defp language_tag__57(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__52(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__52(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__41(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__58(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__42(rest, [], stack, context, line, offset)
  end

  defp language_tag__59(
         <<x0::integer, x1::integer, x2::integer, x3::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90)) and
              ((x3 >= 97 and x3 <= 122) or (x3 >= 65 and x3 <= 90)) do
    language_tag__60(
      rest,
      [language: <<x0::integer, x1::integer, x2::integer, x3::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 4
    )
  end

  defp language_tag__59(rest, acc, stack, context, line, offset) do
    language_tag__58(rest, acc, stack, context, line, offset)
  end

  defp language_tag__60(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__41(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__61(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__59(rest, [], stack, context, line, offset)
  end

  defp language_tag__62(rest, acc, stack, context, line, offset) do
    language_tag__63(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__63(rest, acc, stack, context, line, offset) do
    language_tag__64(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__64(
         <<x0::integer, x1::integer, x2::integer, x3::integer, x4::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90)) and
              ((x3 >= 97 and x3 <= 122) or (x3 >= 65 and x3 <= 90)) and
              ((x4 >= 97 and x4 <= 122) or (x4 >= 65 and x4 <= 90)) do
    language_tag__65(
      rest,
      [<<x0::integer, x1::integer, x2::integer, x3::integer, x4::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 5
    )
  end

  defp language_tag__64(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__61(rest, acc, stack, context, line, offset)
  end

  defp language_tag__65(rest, acc, stack, context, line, offset) do
    language_tag__67(rest, acc, [3 | stack], context, line, offset)
  end

  defp language_tag__67(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) do
    language_tag__68(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__67(rest, acc, stack, context, line, offset) do
    language_tag__66(rest, acc, stack, context, line, offset)
  end

  defp language_tag__66(rest, acc, [_ | stack], context, line, offset) do
    language_tag__69(rest, acc, stack, context, line, offset)
  end

  defp language_tag__68(rest, acc, [1 | stack], context, line, offset) do
    language_tag__69(rest, acc, stack, context, line, offset)
  end

  defp language_tag__68(rest, acc, [count | stack], context, line, offset) do
    language_tag__67(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__69(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__70(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__70(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__71(
      rest,
      [
        language:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__71(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__41(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__41(
         <<x0::integer, x1::integer, x2::integer, x3::integer, x4::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 and ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90)) and
              ((x3 >= 97 and x3 <= 122) or (x3 >= 65 and x3 <= 90)) and
              ((x4 >= 97 and x4 <= 122) or (x4 >= 65 and x4 <= 90)) do
    language_tag__72(
      rest,
      [script: <<x1::integer, x2::integer, x3::integer, x4::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 5
    )
  end

  defp language_tag__41(<<rest::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__72(rest, [] ++ acc, stack, context, comb__line, comb__offset)
  end

  defp language_tag__72(rest, acc, stack, context, line, offset) do
    language_tag__74(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__74(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__75(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__74(rest, acc, stack, context, line, offset) do
    language_tag__73(rest, acc, stack, context, line, offset)
  end

  defp language_tag__75(rest, acc, stack, context, line, offset) do
    language_tag__76(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__76(rest, acc, stack, context, line, offset) do
    language_tag__81(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__78(
         <<x0::integer, x1::integer, x2::integer, x3::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) and
              ((x3 >= 97 and x3 <= 122) or (x3 >= 65 and x3 <= 90) or (x3 >= 48 and x3 <= 57)) do
    language_tag__79(
      rest,
      [Enum.join([<<x0::integer>>, <<x1::integer, x2::integer, x3::integer>>])] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 4
    )
  end

  defp language_tag__78(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, _, acc | stack] = stack
    language_tag__73(rest, acc, stack, context, line, offset)
  end

  defp language_tag__79(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__77(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__80(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__78(rest, [], stack, context, line, offset)
  end

  defp language_tag__81(rest, acc, stack, context, line, offset) do
    language_tag__82(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__82(
         <<x0::integer, x1::integer, x2::integer, x3::integer, x4::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) and
              ((x3 >= 97 and x3 <= 122) or (x3 >= 65 and x3 <= 90) or (x3 >= 48 and x3 <= 57)) and
              ((x4 >= 97 and x4 <= 122) or (x4 >= 65 and x4 <= 90) or (x4 >= 48 and x4 <= 57)) do
    language_tag__83(
      rest,
      [<<x0::integer, x1::integer, x2::integer, x3::integer, x4::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 5
    )
  end

  defp language_tag__82(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__80(rest, acc, stack, context, line, offset)
  end

  defp language_tag__83(rest, acc, stack, context, line, offset) do
    language_tag__85(rest, acc, [3 | stack], context, line, offset)
  end

  defp language_tag__85(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__86(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__85(rest, acc, stack, context, line, offset) do
    language_tag__84(rest, acc, stack, context, line, offset)
  end

  defp language_tag__84(rest, acc, [_ | stack], context, line, offset) do
    language_tag__87(rest, acc, stack, context, line, offset)
  end

  defp language_tag__86(rest, acc, [1 | stack], context, line, offset) do
    language_tag__87(rest, acc, stack, context, line, offset)
  end

  defp language_tag__86(rest, acc, [count | stack], context, line, offset) do
    language_tag__85(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__87(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__88(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__88(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__77(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__77(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__89(
      rest,
      [
        language_variant:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__73(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__90(rest, acc, stack, context, line, offset)
  end

  defp language_tag__89(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__74(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__90(rest, acc, stack, context, line, offset) do
    language_tag__94(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__92(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__91(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__93(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__92(rest, [], stack, context, line, offset)
  end

  defp language_tag__94(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__95(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__94(rest, acc, stack, context, line, offset) do
    language_tag__93(rest, acc, stack, context, line, offset)
  end

  defp language_tag__95(rest, acc, stack, context, line, offset) do
    language_tag__96(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__96(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90)) do
    language_tag__97(
      rest,
      [<<x0::integer, x1::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp language_tag__96(
         <<x0::integer, x1::integer, x2::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and (x1 >= 48 and x1 <= 57) and (x2 >= 48 and x2 <= 57) do
    language_tag__97(
      rest,
      [x2 - 48 + (x1 - 48) * 10 + (x0 - 48) * 100] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 3
    )
  end

  defp language_tag__96(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__93(rest, acc, stack, context, line, offset)
  end

  defp language_tag__97(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__98(
      rest,
      [
        territory:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__98(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__91(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__91(rest, acc, stack, context, line, offset) do
    language_tag__100(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__100(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__101(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__100(rest, acc, stack, context, line, offset) do
    language_tag__99(rest, acc, stack, context, line, offset)
  end

  defp language_tag__101(rest, acc, stack, context, line, offset) do
    language_tag__102(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__102(rest, acc, stack, context, line, offset) do
    language_tag__107(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__104(
         <<x0::integer, x1::integer, x2::integer, x3::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 >= 48 and x0 <= 57 and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) and
              ((x3 >= 97 and x3 <= 122) or (x3 >= 65 and x3 <= 90) or (x3 >= 48 and x3 <= 57)) do
    language_tag__105(
      rest,
      [Enum.join([<<x0::integer>>, <<x1::integer, x2::integer, x3::integer>>])] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 4
    )
  end

  defp language_tag__104(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, _, acc | stack] = stack
    language_tag__99(rest, acc, stack, context, line, offset)
  end

  defp language_tag__105(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__103(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__106(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__104(rest, [], stack, context, line, offset)
  end

  defp language_tag__107(rest, acc, stack, context, line, offset) do
    language_tag__108(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__108(
         <<x0::integer, x1::integer, x2::integer, x3::integer, x4::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) and
              ((x3 >= 97 and x3 <= 122) or (x3 >= 65 and x3 <= 90) or (x3 >= 48 and x3 <= 57)) and
              ((x4 >= 97 and x4 <= 122) or (x4 >= 65 and x4 <= 90) or (x4 >= 48 and x4 <= 57)) do
    language_tag__109(
      rest,
      [<<x0::integer, x1::integer, x2::integer, x3::integer, x4::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 5
    )
  end

  defp language_tag__108(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__106(rest, acc, stack, context, line, offset)
  end

  defp language_tag__109(rest, acc, stack, context, line, offset) do
    language_tag__111(rest, acc, [3 | stack], context, line, offset)
  end

  defp language_tag__111(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__112(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__111(rest, acc, stack, context, line, offset) do
    language_tag__110(rest, acc, stack, context, line, offset)
  end

  defp language_tag__110(rest, acc, [_ | stack], context, line, offset) do
    language_tag__113(rest, acc, stack, context, line, offset)
  end

  defp language_tag__112(rest, acc, [1 | stack], context, line, offset) do
    language_tag__113(rest, acc, stack, context, line, offset)
  end

  defp language_tag__112(rest, acc, [count | stack], context, line, offset) do
    language_tag__111(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__113(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__114(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__114(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__103(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__103(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__115(
      rest,
      [
        language_variant:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__99(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__116(rest, acc, stack, context, line, offset)
  end

  defp language_tag__115(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__100(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__116(rest, acc, stack, context, line, offset) do
    language_tag__118(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__118(rest, acc, stack, context, line, offset) do
    language_tag__119(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__119(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__120(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__119(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__117(rest, acc, stack, context, line, offset)
  end

  defp language_tag__120(rest, acc, stack, context, line, offset) do
    language_tag__221(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__122(rest, acc, stack, context, line, offset) do
    language_tag__123(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__123(rest, acc, stack, context, line, offset) do
    language_tag__124(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__124(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 48 and x0 <= 57) or (x0 >= 97 and x0 <= 115) or (x0 >= 65 and x0 <= 83) or
              (x0 >= 118 and x0 <= 119) or (x0 >= 86 and x0 <= 87) or (x0 >= 121 and x0 <= 122) or
              (x0 >= 89 and x0 <= 90) do
    language_tag__125(
      rest,
      [type: <<x0::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 1
    )
  end

  defp language_tag__124(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, _, _, _, acc | stack] = stack
    language_tag__117(rest, acc, stack, context, line, offset)
  end

  defp language_tag__125(rest, acc, stack, context, line, offset) do
    language_tag__126(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__126(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__127(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__126(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, _, _, _, _, acc | stack] = stack
    language_tag__117(rest, acc, stack, context, line, offset)
  end

  defp language_tag__127(rest, acc, stack, context, line, offset) do
    language_tag__128(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__128(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) do
    language_tag__129(
      rest,
      [<<x0::integer, x1::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp language_tag__128(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, _, _, _, _, _, acc | stack] = stack
    language_tag__117(rest, acc, stack, context, line, offset)
  end

  defp language_tag__129(rest, acc, stack, context, line, offset) do
    language_tag__131(rest, acc, [6 | stack], context, line, offset)
  end

  defp language_tag__131(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__132(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__131(rest, acc, stack, context, line, offset) do
    language_tag__130(rest, acc, stack, context, line, offset)
  end

  defp language_tag__130(rest, acc, [_ | stack], context, line, offset) do
    language_tag__133(rest, acc, stack, context, line, offset)
  end

  defp language_tag__132(rest, acc, [1 | stack], context, line, offset) do
    language_tag__133(rest, acc, stack, context, line, offset)
  end

  defp language_tag__132(rest, acc, [count | stack], context, line, offset) do
    language_tag__131(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__133(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__134(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__134(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__135(
      rest,
      [
        attribute:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__135(rest, acc, stack, context, line, offset) do
    language_tag__137(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__137(rest, acc, stack, context, line, offset) do
    language_tag__138(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__138(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__139(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__138(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__136(rest, acc, stack, context, line, offset)
  end

  defp language_tag__139(rest, acc, stack, context, line, offset) do
    language_tag__140(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__140(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) do
    language_tag__141(
      rest,
      [<<x0::integer, x1::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp language_tag__140(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__136(rest, acc, stack, context, line, offset)
  end

  defp language_tag__141(rest, acc, stack, context, line, offset) do
    language_tag__143(rest, acc, [6 | stack], context, line, offset)
  end

  defp language_tag__143(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__144(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__143(rest, acc, stack, context, line, offset) do
    language_tag__142(rest, acc, stack, context, line, offset)
  end

  defp language_tag__142(rest, acc, [_ | stack], context, line, offset) do
    language_tag__145(rest, acc, stack, context, line, offset)
  end

  defp language_tag__144(rest, acc, [1 | stack], context, line, offset) do
    language_tag__145(rest, acc, stack, context, line, offset)
  end

  defp language_tag__144(rest, acc, [count | stack], context, line, offset) do
    language_tag__143(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__145(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__146(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__146(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__147(
      rest,
      [
        attribute:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__136(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__148(rest, acc, stack, context, line, offset)
  end

  defp language_tag__147(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__137(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__148(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__149(
      rest,
      [collapse_extension(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__149(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__150(
      rest,
      [
        extension:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__150(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__121(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__151(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__122(rest, [], stack, context, line, offset)
  end

  defp language_tag__152(rest, acc, stack, context, line, offset) do
    language_tag__153(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__153(rest, acc, stack, context, line, offset) do
    language_tag__154(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__154(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 === 116 or x0 === 84) and x1 === 45 do
    language_tag__155(rest, [] ++ acc, stack, context, comb__line, comb__offset + 2)
  end

  defp language_tag__154(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__151(rest, acc, stack, context, line, offset)
  end

  defp language_tag__155(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) do
    language_tag__156(
      rest,
      [key: <<x0::integer, x1::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp language_tag__155(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__151(rest, acc, stack, context, line, offset)
  end

  defp language_tag__156(rest, acc, stack, context, line, offset) do
    language_tag__160(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__158(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__157(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__159(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__158(rest, [], stack, context, line, offset)
  end

  defp language_tag__160(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__161(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__160(rest, acc, stack, context, line, offset) do
    language_tag__159(rest, acc, stack, context, line, offset)
  end

  defp language_tag__161(rest, acc, stack, context, line, offset) do
    language_tag__162(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__162(rest, acc, stack, context, line, offset) do
    language_tag__163(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__163(
         <<x0::integer, x1::integer, x2::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) do
    language_tag__164(
      rest,
      [<<x0::integer, x1::integer, x2::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 3
    )
  end

  defp language_tag__163(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__159(rest, acc, stack, context, line, offset)
  end

  defp language_tag__164(rest, acc, stack, context, line, offset) do
    language_tag__166(rest, acc, [5 | stack], context, line, offset)
  end

  defp language_tag__166(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__167(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__166(rest, acc, stack, context, line, offset) do
    language_tag__165(rest, acc, stack, context, line, offset)
  end

  defp language_tag__165(rest, acc, [_ | stack], context, line, offset) do
    language_tag__168(rest, acc, stack, context, line, offset)
  end

  defp language_tag__167(rest, acc, [1 | stack], context, line, offset) do
    language_tag__168(rest, acc, stack, context, line, offset)
  end

  defp language_tag__167(rest, acc, [count | stack], context, line, offset) do
    language_tag__166(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__168(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__169(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__169(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__170(
      rest,
      [
        type:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__170(rest, acc, stack, context, line, offset) do
    language_tag__172(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__172(rest, acc, stack, context, line, offset) do
    language_tag__173(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__173(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__174(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__173(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__171(rest, acc, stack, context, line, offset)
  end

  defp language_tag__174(rest, acc, stack, context, line, offset) do
    language_tag__175(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__175(
         <<x0::integer, x1::integer, x2::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) do
    language_tag__176(
      rest,
      [<<x0::integer, x1::integer, x2::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 3
    )
  end

  defp language_tag__175(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__171(rest, acc, stack, context, line, offset)
  end

  defp language_tag__176(rest, acc, stack, context, line, offset) do
    language_tag__178(rest, acc, [5 | stack], context, line, offset)
  end

  defp language_tag__178(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__179(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__178(rest, acc, stack, context, line, offset) do
    language_tag__177(rest, acc, stack, context, line, offset)
  end

  defp language_tag__177(rest, acc, [_ | stack], context, line, offset) do
    language_tag__180(rest, acc, stack, context, line, offset)
  end

  defp language_tag__179(rest, acc, [1 | stack], context, line, offset) do
    language_tag__180(rest, acc, stack, context, line, offset)
  end

  defp language_tag__179(rest, acc, [count | stack], context, line, offset) do
    language_tag__178(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__180(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__181(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__181(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__182(
      rest,
      [
        type:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__171(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__183(rest, acc, stack, context, line, offset)
  end

  defp language_tag__182(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__172(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__183(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__157(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__157(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__184(
      rest,
      [collapse_keywords(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__184(rest, acc, stack, context, line, offset) do
    language_tag__186(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__186(rest, acc, stack, context, line, offset) do
    language_tag__187(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__187(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 === 116 or x0 === 84) and x1 === 45 do
    language_tag__188(rest, [] ++ acc, stack, context, comb__line, comb__offset + 2)
  end

  defp language_tag__187(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__185(rest, acc, stack, context, line, offset)
  end

  defp language_tag__188(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) do
    language_tag__189(
      rest,
      [key: <<x0::integer, x1::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp language_tag__188(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__185(rest, acc, stack, context, line, offset)
  end

  defp language_tag__189(rest, acc, stack, context, line, offset) do
    language_tag__193(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__191(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__190(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__192(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__191(rest, [], stack, context, line, offset)
  end

  defp language_tag__193(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__194(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__193(rest, acc, stack, context, line, offset) do
    language_tag__192(rest, acc, stack, context, line, offset)
  end

  defp language_tag__194(rest, acc, stack, context, line, offset) do
    language_tag__195(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__195(rest, acc, stack, context, line, offset) do
    language_tag__196(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__196(
         <<x0::integer, x1::integer, x2::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) do
    language_tag__197(
      rest,
      [<<x0::integer, x1::integer, x2::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 3
    )
  end

  defp language_tag__196(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__192(rest, acc, stack, context, line, offset)
  end

  defp language_tag__197(rest, acc, stack, context, line, offset) do
    language_tag__199(rest, acc, [5 | stack], context, line, offset)
  end

  defp language_tag__199(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__200(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__199(rest, acc, stack, context, line, offset) do
    language_tag__198(rest, acc, stack, context, line, offset)
  end

  defp language_tag__198(rest, acc, [_ | stack], context, line, offset) do
    language_tag__201(rest, acc, stack, context, line, offset)
  end

  defp language_tag__200(rest, acc, [1 | stack], context, line, offset) do
    language_tag__201(rest, acc, stack, context, line, offset)
  end

  defp language_tag__200(rest, acc, [count | stack], context, line, offset) do
    language_tag__199(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__201(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__202(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__202(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__203(
      rest,
      [
        type:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__203(rest, acc, stack, context, line, offset) do
    language_tag__205(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__205(rest, acc, stack, context, line, offset) do
    language_tag__206(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__206(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__207(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__206(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__204(rest, acc, stack, context, line, offset)
  end

  defp language_tag__207(rest, acc, stack, context, line, offset) do
    language_tag__208(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__208(
         <<x0::integer, x1::integer, x2::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) do
    language_tag__209(
      rest,
      [<<x0::integer, x1::integer, x2::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 3
    )
  end

  defp language_tag__208(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__204(rest, acc, stack, context, line, offset)
  end

  defp language_tag__209(rest, acc, stack, context, line, offset) do
    language_tag__211(rest, acc, [5 | stack], context, line, offset)
  end

  defp language_tag__211(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__212(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__211(rest, acc, stack, context, line, offset) do
    language_tag__210(rest, acc, stack, context, line, offset)
  end

  defp language_tag__210(rest, acc, [_ | stack], context, line, offset) do
    language_tag__213(rest, acc, stack, context, line, offset)
  end

  defp language_tag__212(rest, acc, [1 | stack], context, line, offset) do
    language_tag__213(rest, acc, stack, context, line, offset)
  end

  defp language_tag__212(rest, acc, [count | stack], context, line, offset) do
    language_tag__211(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__213(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__214(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__214(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__215(
      rest,
      [
        type:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__204(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__216(rest, acc, stack, context, line, offset)
  end

  defp language_tag__215(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__205(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__216(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__190(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__190(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__217(
      rest,
      [collapse_keywords(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__185(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__218(rest, acc, stack, context, line, offset)
  end

  defp language_tag__217(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__186(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__218(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__219(
      rest,
      [
        transform:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__219(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__121(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__220(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__152(rest, [], stack, context, line, offset)
  end

  defp language_tag__221(rest, acc, stack, context, line, offset) do
    language_tag__222(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__222(rest, acc, stack, context, line, offset) do
    language_tag__223(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__223(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 117 or x0 === 85 do
    language_tag__224(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__223(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__220(rest, acc, stack, context, line, offset)
  end

  defp language_tag__224(rest, acc, stack, context, line, offset) do
    language_tag__262(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__226(rest, acc, stack, context, line, offset) do
    language_tag__227(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__227(rest, acc, stack, context, line, offset) do
    language_tag__229(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__229(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__230(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__229(rest, acc, stack, context, line, offset) do
    language_tag__228(rest, acc, stack, context, line, offset)
  end

  defp language_tag__230(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) do
    language_tag__231(
      rest,
      [key: <<x0::integer, x1::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp language_tag__230(rest, acc, stack, context, line, offset) do
    language_tag__228(rest, acc, stack, context, line, offset)
  end

  defp language_tag__231(rest, acc, stack, context, line, offset) do
    language_tag__235(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__233(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__232(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__234(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__233(rest, [], stack, context, line, offset)
  end

  defp language_tag__235(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__236(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__235(rest, acc, stack, context, line, offset) do
    language_tag__234(rest, acc, stack, context, line, offset)
  end

  defp language_tag__236(rest, acc, stack, context, line, offset) do
    language_tag__237(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__237(rest, acc, stack, context, line, offset) do
    language_tag__238(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__238(
         <<x0::integer, x1::integer, x2::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) do
    language_tag__239(
      rest,
      [<<x0::integer, x1::integer, x2::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 3
    )
  end

  defp language_tag__238(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__234(rest, acc, stack, context, line, offset)
  end

  defp language_tag__239(rest, acc, stack, context, line, offset) do
    language_tag__241(rest, acc, [5 | stack], context, line, offset)
  end

  defp language_tag__241(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__242(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__241(rest, acc, stack, context, line, offset) do
    language_tag__240(rest, acc, stack, context, line, offset)
  end

  defp language_tag__240(rest, acc, [_ | stack], context, line, offset) do
    language_tag__243(rest, acc, stack, context, line, offset)
  end

  defp language_tag__242(rest, acc, [1 | stack], context, line, offset) do
    language_tag__243(rest, acc, stack, context, line, offset)
  end

  defp language_tag__242(rest, acc, [count | stack], context, line, offset) do
    language_tag__241(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__243(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__244(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__244(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__245(
      rest,
      [
        type:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__245(rest, acc, stack, context, line, offset) do
    language_tag__247(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__247(rest, acc, stack, context, line, offset) do
    language_tag__248(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__248(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__249(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__248(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__246(rest, acc, stack, context, line, offset)
  end

  defp language_tag__249(rest, acc, stack, context, line, offset) do
    language_tag__250(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__250(
         <<x0::integer, x1::integer, x2::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) do
    language_tag__251(
      rest,
      [<<x0::integer, x1::integer, x2::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 3
    )
  end

  defp language_tag__250(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__246(rest, acc, stack, context, line, offset)
  end

  defp language_tag__251(rest, acc, stack, context, line, offset) do
    language_tag__253(rest, acc, [5 | stack], context, line, offset)
  end

  defp language_tag__253(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__254(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__253(rest, acc, stack, context, line, offset) do
    language_tag__252(rest, acc, stack, context, line, offset)
  end

  defp language_tag__252(rest, acc, [_ | stack], context, line, offset) do
    language_tag__255(rest, acc, stack, context, line, offset)
  end

  defp language_tag__254(rest, acc, [1 | stack], context, line, offset) do
    language_tag__255(rest, acc, stack, context, line, offset)
  end

  defp language_tag__254(rest, acc, [count | stack], context, line, offset) do
    language_tag__253(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__255(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__256(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__256(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__257(
      rest,
      [
        type:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__246(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__258(rest, acc, stack, context, line, offset)
  end

  defp language_tag__257(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__247(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__258(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__232(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__228(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__259(rest, acc, stack, context, line, offset)
  end

  defp language_tag__232(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__229(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__259(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__260(
      rest,
      [collapse_keywords(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__260(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__225(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__261(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__226(rest, [], stack, context, line, offset)
  end

  defp language_tag__262(rest, acc, stack, context, line, offset) do
    language_tag__263(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__263(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__264(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__263(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__261(rest, acc, stack, context, line, offset)
  end

  defp language_tag__264(rest, acc, stack, context, line, offset) do
    language_tag__265(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__265(
         <<x0::integer, x1::integer, x2::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) do
    language_tag__266(
      rest,
      [<<x0::integer, x1::integer, x2::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 3
    )
  end

  defp language_tag__265(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__261(rest, acc, stack, context, line, offset)
  end

  defp language_tag__266(rest, acc, stack, context, line, offset) do
    language_tag__268(rest, acc, [5 | stack], context, line, offset)
  end

  defp language_tag__268(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__269(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__268(rest, acc, stack, context, line, offset) do
    language_tag__267(rest, acc, stack, context, line, offset)
  end

  defp language_tag__267(rest, acc, [_ | stack], context, line, offset) do
    language_tag__270(rest, acc, stack, context, line, offset)
  end

  defp language_tag__269(rest, acc, [1 | stack], context, line, offset) do
    language_tag__270(rest, acc, stack, context, line, offset)
  end

  defp language_tag__269(rest, acc, [count | stack], context, line, offset) do
    language_tag__268(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__270(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__271(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__271(rest, acc, stack, context, line, offset) do
    language_tag__273(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__273(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__274(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__273(rest, acc, stack, context, line, offset) do
    language_tag__272(rest, acc, stack, context, line, offset)
  end

  defp language_tag__274(rest, acc, stack, context, line, offset) do
    language_tag__275(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__275(
         <<x0::integer, x1::integer, x2::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) do
    language_tag__276(
      rest,
      [<<x0::integer, x1::integer, x2::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 3
    )
  end

  defp language_tag__275(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__272(rest, acc, stack, context, line, offset)
  end

  defp language_tag__276(rest, acc, stack, context, line, offset) do
    language_tag__278(rest, acc, [5 | stack], context, line, offset)
  end

  defp language_tag__278(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__279(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__278(rest, acc, stack, context, line, offset) do
    language_tag__277(rest, acc, stack, context, line, offset)
  end

  defp language_tag__277(rest, acc, [_ | stack], context, line, offset) do
    language_tag__280(rest, acc, stack, context, line, offset)
  end

  defp language_tag__279(rest, acc, [1 | stack], context, line, offset) do
    language_tag__280(rest, acc, stack, context, line, offset)
  end

  defp language_tag__279(rest, acc, [count | stack], context, line, offset) do
    language_tag__278(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__280(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__281(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__272(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__282(rest, acc, stack, context, line, offset)
  end

  defp language_tag__281(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__273(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__282(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__283(
      rest,
      [attributes: :lists.reverse(user_acc)] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__283(rest, acc, stack, context, line, offset) do
    language_tag__284(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__284(rest, acc, stack, context, line, offset) do
    language_tag__286(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__286(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__287(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__286(rest, acc, stack, context, line, offset) do
    language_tag__285(rest, acc, stack, context, line, offset)
  end

  defp language_tag__287(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) do
    language_tag__288(
      rest,
      [key: <<x0::integer, x1::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 2
    )
  end

  defp language_tag__287(rest, acc, stack, context, line, offset) do
    language_tag__285(rest, acc, stack, context, line, offset)
  end

  defp language_tag__288(rest, acc, stack, context, line, offset) do
    language_tag__292(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__290(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__289(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__291(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__290(rest, [], stack, context, line, offset)
  end

  defp language_tag__292(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__293(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__292(rest, acc, stack, context, line, offset) do
    language_tag__291(rest, acc, stack, context, line, offset)
  end

  defp language_tag__293(rest, acc, stack, context, line, offset) do
    language_tag__294(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__294(rest, acc, stack, context, line, offset) do
    language_tag__295(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__295(
         <<x0::integer, x1::integer, x2::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) do
    language_tag__296(
      rest,
      [<<x0::integer, x1::integer, x2::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 3
    )
  end

  defp language_tag__295(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__291(rest, acc, stack, context, line, offset)
  end

  defp language_tag__296(rest, acc, stack, context, line, offset) do
    language_tag__298(rest, acc, [5 | stack], context, line, offset)
  end

  defp language_tag__298(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__299(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__298(rest, acc, stack, context, line, offset) do
    language_tag__297(rest, acc, stack, context, line, offset)
  end

  defp language_tag__297(rest, acc, [_ | stack], context, line, offset) do
    language_tag__300(rest, acc, stack, context, line, offset)
  end

  defp language_tag__299(rest, acc, [1 | stack], context, line, offset) do
    language_tag__300(rest, acc, stack, context, line, offset)
  end

  defp language_tag__299(rest, acc, [count | stack], context, line, offset) do
    language_tag__298(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__300(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__301(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__301(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__302(
      rest,
      [
        type:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__302(rest, acc, stack, context, line, offset) do
    language_tag__304(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__304(rest, acc, stack, context, line, offset) do
    language_tag__305(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__305(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__306(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__305(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__303(rest, acc, stack, context, line, offset)
  end

  defp language_tag__306(rest, acc, stack, context, line, offset) do
    language_tag__307(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__307(
         <<x0::integer, x1::integer, x2::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when ((x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57)) and
              ((x1 >= 97 and x1 <= 122) or (x1 >= 65 and x1 <= 90) or (x1 >= 48 and x1 <= 57)) and
              ((x2 >= 97 and x2 <= 122) or (x2 >= 65 and x2 <= 90) or (x2 >= 48 and x2 <= 57)) do
    language_tag__308(
      rest,
      [<<x0::integer, x1::integer, x2::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 3
    )
  end

  defp language_tag__307(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__303(rest, acc, stack, context, line, offset)
  end

  defp language_tag__308(rest, acc, stack, context, line, offset) do
    language_tag__310(rest, acc, [5 | stack], context, line, offset)
  end

  defp language_tag__310(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__311(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__310(rest, acc, stack, context, line, offset) do
    language_tag__309(rest, acc, stack, context, line, offset)
  end

  defp language_tag__309(rest, acc, [_ | stack], context, line, offset) do
    language_tag__312(rest, acc, stack, context, line, offset)
  end

  defp language_tag__311(rest, acc, [1 | stack], context, line, offset) do
    language_tag__312(rest, acc, stack, context, line, offset)
  end

  defp language_tag__311(rest, acc, [count | stack], context, line, offset) do
    language_tag__310(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__312(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__313(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__313(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__314(
      rest,
      [
        type:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__303(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__315(rest, acc, stack, context, line, offset)
  end

  defp language_tag__314(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__304(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__315(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__289(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__285(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__316(rest, acc, stack, context, line, offset)
  end

  defp language_tag__289(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__286(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__316(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__317(
      rest,
      [collapse_keywords(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__317(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__225(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__225(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__318(
      rest,
      [combine_attributes_and_keywords(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__318(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__319(
      rest,
      [
        locale:
          case(:lists.reverse(user_acc)) do
            [one] ->
              one

            many ->
              raise("unwrap_and_tag/3 expected a single token, got: #{inspect(many)}")
          end
      ] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__319(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__121(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__121(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__320(
      rest,
      [collapse_extensions(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__117(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__321(rest, acc, stack, context, line, offset)
  end

  defp language_tag__320(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__118(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__321(rest, acc, stack, context, line, offset) do
    language_tag__325(
      rest,
      [],
      [{rest, context, line, offset}, acc | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__323(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__322(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__324(_, _, [{rest, context, line, offset} | _] = stack, _, _, _) do
    language_tag__323(rest, [], stack, context, line, offset)
  end

  defp language_tag__325(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__326(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__325(rest, acc, stack, context, line, offset) do
    language_tag__324(rest, acc, stack, context, line, offset)
  end

  defp language_tag__326(rest, acc, stack, context, line, offset) do
    language_tag__327(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__327(
         <<x0::integer, x1::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 === 120 or x0 === 88) and x1 === 45 do
    language_tag__328(rest, [] ++ acc, stack, context, comb__line, comb__offset + 2)
  end

  defp language_tag__327(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__324(rest, acc, stack, context, line, offset)
  end

  defp language_tag__328(rest, acc, stack, context, line, offset) do
    language_tag__329(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__329(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__330(
      rest,
      [<<x0::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 1
    )
  end

  defp language_tag__329(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [_, acc | stack] = stack
    language_tag__324(rest, acc, stack, context, line, offset)
  end

  defp language_tag__330(rest, acc, stack, context, line, offset) do
    language_tag__332(rest, acc, [7 | stack], context, line, offset)
  end

  defp language_tag__332(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__333(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__332(rest, acc, stack, context, line, offset) do
    language_tag__331(rest, acc, stack, context, line, offset)
  end

  defp language_tag__331(rest, acc, [_ | stack], context, line, offset) do
    language_tag__334(rest, acc, stack, context, line, offset)
  end

  defp language_tag__333(rest, acc, [1 | stack], context, line, offset) do
    language_tag__334(rest, acc, stack, context, line, offset)
  end

  defp language_tag__333(rest, acc, [count | stack], context, line, offset) do
    language_tag__332(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__334(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__335(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__335(rest, acc, stack, context, line, offset) do
    language_tag__337(
      rest,
      [],
      [{rest, acc, context, line, offset} | stack],
      context,
      line,
      offset
    )
  end

  defp language_tag__337(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when x0 === 45 do
    language_tag__338(rest, [] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__337(rest, acc, stack, context, line, offset) do
    language_tag__336(rest, acc, stack, context, line, offset)
  end

  defp language_tag__338(rest, acc, stack, context, line, offset) do
    language_tag__339(rest, [], [acc | stack], context, line, offset)
  end

  defp language_tag__339(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__340(
      rest,
      [<<x0::integer>>] ++ acc,
      stack,
      context,
      comb__line,
      comb__offset + 1
    )
  end

  defp language_tag__339(rest, acc, stack, context, line, offset) do
    _ = {acc, stack}
    [acc | stack] = stack
    language_tag__336(rest, acc, stack, context, line, offset)
  end

  defp language_tag__340(rest, acc, stack, context, line, offset) do
    language_tag__342(rest, acc, [7 | stack], context, line, offset)
  end

  defp language_tag__342(
         <<x0::integer, rest::binary>>,
         acc,
         stack,
         context,
         comb__line,
         comb__offset
       )
       when (x0 >= 97 and x0 <= 122) or (x0 >= 65 and x0 <= 90) or (x0 >= 48 and x0 <= 57) do
    language_tag__343(rest, [x0] ++ acc, stack, context, comb__line, comb__offset + 1)
  end

  defp language_tag__342(rest, acc, stack, context, line, offset) do
    language_tag__341(rest, acc, stack, context, line, offset)
  end

  defp language_tag__341(rest, acc, [_ | stack], context, line, offset) do
    language_tag__344(rest, acc, stack, context, line, offset)
  end

  defp language_tag__343(rest, acc, [1 | stack], context, line, offset) do
    language_tag__344(rest, acc, stack, context, line, offset)
  end

  defp language_tag__343(rest, acc, [count | stack], context, line, offset) do
    language_tag__342(rest, acc, [count - 1 | stack], context, line, offset)
  end

  defp language_tag__344(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__345(
      rest,
      [List.to_string(:lists.reverse(user_acc))] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__336(_, _, [{rest, acc, context, line, offset} | stack], _, _, _) do
    language_tag__346(rest, acc, stack, context, line, offset)
  end

  defp language_tag__345(
         inner_rest,
         inner_acc,
         [{rest, acc, context, line, offset} | stack],
         inner_context,
         inner_line,
         inner_offset
       ) do
    language_tag__337(
      inner_rest,
      [],
      [{inner_rest, inner_acc ++ acc, inner_context, inner_line, inner_offset} | stack],
      inner_context,
      inner_line,
      inner_offset
    )
  end

  defp language_tag__346(rest, user_acc, [acc | stack], context, line, offset) do
    language_tag__347(
      rest,
      [private_use: :lists.reverse(user_acc)] ++ acc,
      stack,
      context,
      line,
      offset
    )
  end

  defp language_tag__347(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__322(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__322(rest, user_acc, [acc | stack], context, line, offset) do
    case(flatten(rest, user_acc, context, line, offset)) do
      {user_acc, context} when is_list(user_acc) ->
        language_tag__348(rest, user_acc ++ acc, stack, context, line, offset)

      {:error, reason} ->
        {:error, reason, rest, context, line, offset}
    end
  end

  defp language_tag__348(rest, acc, [_, previous_acc | stack], context, line, offset) do
    language_tag__1(rest, acc ++ previous_acc, stack, context, line, offset)
  end

  defp language_tag__1(<<""::binary>>, acc, stack, context, comb__line, comb__offset) do
    language_tag__349("", [] ++ acc, stack, context, comb__line, comb__offset)
  end

  defp language_tag__1(rest, _acc, _stack, context, line, offset) do
    {:error, "expected a BCP47 language tag", rest, context, line, offset}
  end

  defp language_tag__349(rest, acc, _stack, context, line, offset) do
    {:ok, acc, rest, context, line, offset}
  end
end

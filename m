Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CE7C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUQ35AnnrFrErASZvKnvL7WSgh4fUb3oILYVexJJ2n0=; b=ezFW6t9Azo7rup4e3gZw0y1AWm
	MHL/on2UxLeeZUK3bqBPJHCwehSUr65K/t7MmfBqnTJxbcovUeI3YYEyoIbXNwL5wocaz4Tepx2Ec
	YXwVrb5lEKzSlhZ8VAbC17tUqa35aAbwuLL3anRP4tiP9TOLBkopPCNWQO+wX7T6p+yUfRDK9ZNRs
	wt0DTLp75T/GGY+Flqp9A85t7AL5n7fQY5V/xcFKiI1UGcRvpsvZqVC0Qx1V1V3casLrcbRyQbnXW
	3RakRcx/Pe5JadnUIgnRGjoWVCGcSyZH7bd1vExidP2ZnEJhDT0aB0OUh88Pf10knZS7kJ/z1BcQS
	/6yVAMCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFS-00000004Gek-1WrM;
	Wed, 26 Feb 2025 15:22:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnItu-00000004CCa-2lln;
	Wed, 26 Feb 2025 15:00:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 534BF5C68F8;
	Wed, 26 Feb 2025 15:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F29CC4CED6;
	Wed, 26 Feb 2025 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740582041;
	bh=SNUssUfj17J4uIaq7GMjKEnFmTIghJOj6hKk940Kd6E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pVL1Sy0Ujj3kI3JO7Yn8jGwom9daT9LLYY6j4fA86+X0nuR17W0j53jAMT7sN2a7M
	 frH3iTtwuQ7E0CxvryIpQAsU4tDbOwLy6QkFWrtyY1EwV9VD4YEeDWs1cnvP6fSEY2
	 7aQAy5c4rd3HSqbeAUPHDTLnLSinpAKHkpo69fWGmfDmbTjLSRzrb30sDJigMnIbD3
	 zCoszkQhQOLO/iyfxbfvvCNbD68ENnoAfDFoXeGPHzan/XpkB5odxm4WZriR14qFo1
	 UQp6C7eSeQhhgYqdDEAbfNHvdC2gFrYwgOik+/gm1c2HWQbzarLap99gjn3dRskn+c
	 SwbPCv9nJ98Dw==
Message-ID: <bed0195c-8691-4269-9d29-7fb820087f03@kernel.org>
Date: Wed, 26 Feb 2025 16:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 DMIC backend to dai-link
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>,
 kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
 <20250225-genio700-dmic-v2-7-3076f5b50ef7@collabora.com>
 <20250226-ludicrous-seagull-of-music-a40daf@krzk-bin>
 <9240905b-29af-4ea7-8ff9-a0cb2233da72@notapiano>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <9240905b-29af-4ea7-8ff9-a0cb2233da72@notapiano>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_070042_783071_506F8C15 
X-CRM114-Status: GOOD (  21.49  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 26/02/2025 14:30, Nícolas F. R. A. Prado wrote:
> On Wed, Feb 26, 2025 at 09:22:29AM +0100, Krzysztof Kozlowski wrote:
>> On Tue, Feb 25, 2025 at 11:33:53AM -0300, Nícolas F. R. A. Prado wrote:
>>> MT8188 platforms also have DMIC DAIs, which were previously undescribed.
>>> Add DMIC_BE as a possible backend for the dai-link property.
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>>  Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
>>> index 362e729b51b43ec16716aee70ad736420def81f3..8c77e7f68ad7b6f5b88b53cedccb291139a2eeea 100644
>>> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
>>> @@ -62,6 +62,7 @@ patternProperties:
>>>              - PCM1_BE
>>>              - DL_SRC_BE
>>>              - UL_SRC_BE
>>> +            - DMIC_BE
>>
>> Any reason why you keep adding to the end of the lists but not
>> alphabetically sorted? It's enum, so it's expected to be sorted which
>> reduces conflicts between edits. Last commit already broke sorting :/
> 
> Well, I wasn't aware enums were supposed to be sorted. That doesn't seem to be

If the code is sorted, which was the case here, why there has to be an
explicit rule telling you must sort it? Just keep existing style.

> documented anywhere. In fact, in example-schema.yaml the enum is not sorted [1].

Way of avoiding conflicts in some sort of lists is valid more or less
everywhere.

> So it'd be great to update that example to follow that rule as well as
> explicitly document it. Maybe even a dt-binding check that checks for this?
> That'll make it much easier to learn about and follow this rule :).

That would lead to numerous exceptions, because some places choose to
sort not alphanumerically and that's fine as well.

If checkpatch was no written in Perl, I would be happy to grow the tool,
but from all cryptic languages to re-learn again Rust is much higher
than Perl.

> 
> I don't think it'd be worth it to send another patch just to fix sorting in
> this case as it's already been merged, but I'll keep this in mind whenever I
> send future dt-binding patches.

Indeed, I found only later that Mark applied.

> 
> Thanks,
> Nícolas
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/example-schema.yaml#n52


Best regards,
Krzysztof


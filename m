Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7A6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 12:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esY/D8bl/QfmQw4B2W4j9JrytTyRSwrTgfWdVVV9Tdc=; b=gp28MdlHfknmK8mkZ3TFNyYtAj
	lEnteWHTNGrPym9TxpeohSPEAP9WvD4ACOLuw784Qo8jpdTkJzPnyF/4P+YWTKHe+gtPy+2JxBl2V
	3ifkcA4FFI0dL4f/YcVe01ys5McMWyvWBbQ+aVbxRv0rvQnJPlLnXjQvk0o/euRGD+dIghaWPbC6w
	UiFJPLbaX2Q4Shl0CJNcYpV1iVVoxcppOmYn17sDgyz1lxEWhmO6H4CS9uMi91Xa0WJi34DSebeic
	RIxeIPBXVzV8Jxn48sTN+slDsWRjJ5ovioRr/s6QPV7oUYxpvUQGBAyfML1L9N5HGYqySZRDozaj7
	Hf6uWTow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLiF5-00000000Mbk-093j;
	Thu, 12 Dec 2024 12:24:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLiE0-00000000MQ3-1cYR;
	Thu, 12 Dec 2024 12:23:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 475D7A41F02;
	Thu, 12 Dec 2024 12:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481F9C4CECE;
	Thu, 12 Dec 2024 12:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734006203;
	bh=/ls9pYCxlVKyApv0ZjmCWkI7T6wumvfIJXXnkpGns3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j8ctZ0tW7sx5h5ct6OyXImRl0zgNHL78YFdwFz0eRV/eo0aWnIUc4JuckgxQlduts
	 K4OgiDOhy/0u8UBck8j/7xDe/bw45AJpDE05w9DjD7zcH6cR4Nnw/NwIQYnfkZzQ8v
	 pe3v8R6cNhbI9+S7vtJ5jrTkwIEKoLmqN+7zRSWM2Q6tTVGExfXtOP+zUorF5Pw4cT
	 MyMKa5jIJ4QQVZMUE6hVhk19NDFYVPPF16wpWZk2tbJZw4aF0OdXA2AwpuRr2JsZGU
	 4n8UAduprWL0P2oMI06v15kV12GOSVGyORHE49RLeyv02fDCBm7p4ERwBhltPreYO0
	 uRB6ZNL3s1PQg==
Message-ID: <5d48f335-7b14-487b-ba08-6354d21d8993@kernel.org>
Date: Thu, 12 Dec 2024 13:23:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: mailbox: mediatek: Add GCE header
 file for MT8196
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mchehab@kernel.org"
 <mchehab@kernel.org>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
 <Moudy.Ho@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh@kernel.org" <robh@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
 <20241211032256.28494-2-jason-jh.lin@mediatek.com>
 <ozifi65uycmxc5hqeu4onbths5u7dg532iufjxplsjw4jjmhf6@6bdsaabd7hl7>
 <04f7bd2a7d69ab7d02c88cf05bda5ae0c4cb6573.camel@mediatek.com>
 <e9caf0fe-a77f-40cb-9fc3-9da3d95f27ca@kernel.org>
 <ce68d58f78d12317cab689e0ee1c02dc373d50dc.camel@mediatek.com>
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
In-Reply-To: <ce68d58f78d12317cab689e0ee1c02dc373d50dc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_042324_567107_9A17B531 
X-CRM114-Status: GOOD (  38.48  )
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

On 12/12/2024 12:24, Jason-JH Lin (林睿祥) wrote:
>>>>
>>>> On Wed, Dec 11, 2024 at 11:22:49AM +0800, Jason-JH.Lin wrote:
>>>>> Add the Global Command Engine (GCE) header file to define the
>>>>> GCE
>>>>> thread priority, GCE subsys ID and GCE events for MT8196.
>>>>
>>>> This we see from the diff. What we do not see is why priority is
>>>> a
>>>> binding. Looking briefly at existing code: it is not a binding,
>>>> there
>>>> is
>>>> no driver user.
>>>>
>>>
>>> This priority value is used to configure the priority level for
>>> each
>>> GCE hardware thread, so it is a necessary hardware attribute.
>>
>> I did not say these are not "hardware". I said these are not
>> bindings.
>> Bring arguments why these are bindings.
>>
> 
> Not only bringing arguments, we use it to configure each GCE thread's
> priority.
> 
> Please forgive me to ask a trivial question.
> Do you mean if there is no driver using it directly, then it can not be
> a binding?

Here:
<qqqwdzmcnkuga6qvvszgg7o2myb26sld5i37e4konhln2n4cgc@mwtropwj3ywv>

> Or could you give me an example for what should be binding and what
> should not be binding?

Look at all clock IDs of recent arm64 SoC clock controllers.

> 
> 
> Considering to these 3 points, I think GCE thread priority is suitable
> to be part of the Device Tree Binding:
> 
> 1. Describing Hardware Properties
> - The Device Tree is a data structure for describing hardware, and GCE
> thread priority, as part of the hardware, should be described in the
> Device Tree.

I thought we talk about bindings, not DeviceTree. Where is any
Devicetree here? Please point me to the code which is Devicetree in this
patch.


> 
> 2. Driver Usage
> - Device Tree data is used by drivers to initialize and configure
> hardware, and GCE thread priority is necessary configuration data for
> the driver. After parsing the mboxes args from DTS, CMDQ driver use it
> to configure GCE thread.

We talk about bindings, so why are you describing something else?

> 
> 3. Standardization
> - Device Tree bindings should be standardized, and GCE thread priority
> should have consistent meaning and usage across different hardware
> platforms. Looking into the latest header: mediatek,mt8188-gce.h,
> mediatek,mt6795-gce.h and mt8195-gce.h, they all have defined GCE
> thread priority.

None of above arguments have anything related to the talk here. You
invent some stuff like "standardization" or "driver usage".



> 
>>>
>>> It's hard to find where the priority is used in existing driver
>>> code
>>> because we parsed it from DTS.
>>
>> So not a binding.
>>
>>>
>>> It is used in all mediaTeks' DTS using the GCE.
>>> For example, in mt8195.dts:
>>>
>>> vdosys0: syscon@1c01a000 {
>>>     compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-
>>> mmsys",
>>> "syscon";
>>>     reg = <0 0x1c01a000 0 0x1000>;
>>>     mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
>>>     #clock-cells = <1>;
>>>     mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0xa000
>>> 0x1000>;
>>> }
>>>
>>> CMDQ driver(mtk-cmdq-mailbox.c) will get the args parsed from
>>> mboxes
>>> property in cmdq_xlate() and then it will store CMDQ_THR_PRIO_4 to
>>> the
>>> specific thread structure.
>>
>> So not a binding.
>>
>>> The user of CMDQ driver will send command to CMDQ driver by
>>> cmdq_mbox_send_data(), and this priority setting will be configured
>>> to
>>> GCE hardware thread.
>>
>> And other things there are the same, we do not talk only about this
>> one
>> thing. I asked last time to drop which is not a binding.
>>
>>
> 
> I just reference all the previous mediatek,mtXXXX-gce.h to add the same
> binding. Except for the GPR part I added this time, I don't know what
> else should be dropped.

Your commit msg does not help me, either. Why this is supposed to be a
binding? Basically your rationale is: someone added headers, so I call
it binding.

This is invalid argument.

Someone added junk, incorrect style or bugs, so you do the same?


> 
>> ...
>>
>>>>> +
>>>>> +/*
>>>>> + * GCE General Purpose Register (GPR) support
>>>>> + * Leave note for scenario usage here
>>>>> + */
>>>>> +/* GCE: write mask */
>>>>
>>>> That's a definite no-go. Register masks are not bindings.
>>>>
>>>
>>> I'm sorry to the confusion.
>>>
>>> These defines are the index of GCE General Purpose Register for
>>> generating instructions, they are not register masks.
>>
>> Index of register is also sounding like register.
>>
>>>
>>> The comment "/* GCE: write mask */" is briefly describe that the
>>> usage
>>> of GCE_GPR_R0 and GCE_GPR_R01 is used to store the register mask
>>> when
>>> GCE executing the WRITE instruction. And it can also store the
>>> register
>>> mask of POLL and READ instruction.
>>>
>>> I will add more words to make this comment clearer, like this:
>>> /*GCE: store the mask of instruction */
>>
>> Not sure, because I feel you just avoid doing what is right and keep
>> pushing your own narrative. Where is it used in the driver?
>>
>> I just looked for "GCE_GPR_R00" - no usage at all. So not a binding.
>>
> 
> Currently, GCE_GPR_R15 is used for generating POLL instruction and it
> has been defined as a MACRO `#define CMDQ_POLL_ADDR_GPR (15)`
> in mtk-cmdq-helper.c.

I search for GCE_GPR_R15. No usage at all.

Point me to specific line in your code. Paste it here.

Above #define does not use.

I am finishing replying, because you keep avoiding actual answers and
bring some false proves forcing me to re-iterate the same over and over.

Point to specific line of code and you point to something else and then
claim this is argument in discussion.



Best regards,
Krzysztof


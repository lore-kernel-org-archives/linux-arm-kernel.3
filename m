Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA06D33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPAcTY2IJ3Jwsohx3QQn9jafhPwYw4TiHZjQIB0PHSA=; b=Qs8pa/W5h/Hb57ogdY0ufMDj5w
	96sr3pfIAJwSKJjQx5kckPk72DRAzRzVsNfparCCnwhdAOOiJq93w9f89zbZfpeRxuQIf3xQcmzRU
	KPcSJepU/MRu4MAlvfXK0vKUelJywPgrr6f05m0GdavJdmgDaEpHvYJLeVKJPchKIsJSZ07M02kvC
	N4xj2r6R7s9Kv6FTjYqbr7My0xTkySa6Oq/KFEBu+kd8k0eCzzN3ccc6OQxkMULFHLyVrPBep+F2p
	+sFrfBwiPwmvLBm+V1bcgvIZxUScNPWj8X7I8abiSwtz3TimbFne4PBi+m1LmxNckKgSrCtrtleCu
	pAEAMJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RFz-0000000BE7Q-0yJx;
	Mon, 28 Oct 2024 15:02:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Qgq-0000000B79M-3ZvL;
	Mon, 28 Oct 2024 14:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730125551;
	bh=nzbeRC8p1ugu2E5p8U1ZLC9i2WJ4DpBmxiovMdzFjB0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=psHnpBDlyIoBue1qxNZAsRNdEq3/bomzXLFpsQqv596QTFtpBWUyraULO2IdN96QB
	 cCbtO1QYndaTTUmE8lIYyBkkuFT9wpBKp5LRdmqGrJCLzbC5P7701Lx2nTBxYq57NK
	 +UbFvMsaciTgHHdCMFY11UxXlG09/t8oG5WFyYfbEoBwL6g07cztXCk/WYL1AllBnp
	 NSoq6ptWRSCoSG8Q7l2MkvL17MfjaG4b8j2IDslzbVq6wYS55TARY+rpvnjuFj66aO
	 29uOmaPygiFgSw4cdh5F9zW5MXeczWQmEFCdIFniBcLsuyLOFFs27Bvg41wGh9S0S7
	 YonAhjR0T++3g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 899EB17E35FC;
	Mon, 28 Oct 2024 15:25:50 +0100 (CET)
Message-ID: <20c793fb-cfdf-4c05-a421-3eb623ff6df0@collabora.com>
Date: Mon, 28 Oct 2024 15:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add adsp
 and dai-link properties
To: Fei Shao <fshao@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sound@vger.kernel.org
References: <20241025104548.1220076-1-fshao@chromium.org>
 <20241025104548.1220076-2-fshao@chromium.org>
 <5vmfh2nkxtpzt2vk4j6ghro7z5stoyvry3enzoqepg6hjxqrho@fofs5cwa2iqq>
 <CAC=S1njPjtvhsc+voNK447wbQmRiN0xVDi-jgOmba4NLRiNi0Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAC=S1njPjtvhsc+voNK447wbQmRiN0xVDi-jgOmba4NLRiNi0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_072553_120957_4456BE50 
X-CRM114-Status: GOOD (  37.56  )
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

Il 28/10/24 12:10, Fei Shao ha scritto:
> On Mon, Oct 28, 2024 at 4:54 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Fri, Oct 25, 2024 at 06:44:41PM +0800, Fei Shao wrote:
>>> Add "mediatek,adsp" property for the ADSP handle if ADSP is enabled on
>>> the platform.
>>
>> We see this from the diff.
>>
>>> Add "mediatek,dai-link" property for the required DAI links to configure
>>> sound card.
>>
>> We see this from the diff.
>>
>>>
>>> Both properties are commonly used in the MediaTek sound card driver.
>>
>> If they are used, why suddenly they are needed? What changed?
> 
> Nothing has changed. These should have been added altogether when the
> binding was first introduced. This patch is to fill the gaps and fix
> dtbs_check warnings, like I mentioned in the cover letter.
> I can add a line in the commit message saying it's to fix the warning
> in addition to the cover letter, if that's preferred.
> 
>>
>>>
>>> Signed-off-by: Fei Shao <fshao@chromium.org>
>>> ---
>>>
>>>   .../bindings/sound/mediatek,mt8188-mt6359.yaml         | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
>>> index f94ad0715e32..701cedfa38d2 100644
>>> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
>>> @@ -29,6 +29,16 @@ properties:
>>>       $ref: /schemas/types.yaml#/definitions/phandle
>>>       description: The phandle of MT8188 ASoC platform.
>>>
>>> +  mediatek,adsp:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: The phandle of MT8188 ADSP platform.
>>
>> And what is the difference between ASoC and ADSP platforms? What are
>> they used for?
> 
> I'm not a MediaTek or audio folks, and I'm afraid that I'm not the
> best person to explain the details accurately in front of experts on
> the list... I know it's an audio DSP but that explains nothing.
> MediaTek didn't provide a meaningful explanation in the tree or
> commits, and I want to avoid adding additional but likely misleading
> descriptions from someone who doesn't have enough knowledge,
> potentially causing even more confusing situations in the future.
> Plus, the same changes were accepted as-is in the past, so I assumed
> they might be self-explanatory to people who are familiar with the
> matter.
> 

The Audio DSP is a Tensilica HiFi-5 DSP, and it's a block that is - hardware
speaking - separated from the rest of the Audio interfaces of the SoC.

The whole sound subsystem can work either with or without the DSP, in the sense
that the DSP itself can remain unpowered and completely unconfigured if its
functionality is not desired - hence, this is a board specific configuration:
if the board wants to use the DSP, we use the DSP - otherwise, we just don't.

Regarding the two "platforms", in short:
"mediatek,platform" -> Audio Front End (AFE)
"mediatek,adsp" -> Audio DSP

Now, you can either link the AFE DAIs to the I2S

As for "mediatek,platform" - that's used to link the Analog Front End (AFE) as
the DAI Link platform (so the path is direct to/from DL/UL DAIs to AFE) or the
ADSP one as the DAI Link platform (so that the path is to/from DL/UL DAIs to
DSP to AFE), but that - of course - still requires an AFE, otherwise you cannot
get the audio out of the speakers or in from the mic anyway.

>>
>>> +
>>> +  mediatek,dai-link:
>>> +    $ref: /schemas/types.yaml#/definitions/string-array
>>> +    description:
>>> +      A list of the desired dai-links in the sound card. Each entry is a
>>> +      name defined in the machine driver.
>>
>> The list is provided below. I don't understand why do you need it. Your
>> msg is pretty useless - you describe what you do, instead of why.
> 
> I think this is used to explicitly list the intermediate but hidden
> DAIs, but again, there's not much info about them unless MediaTek can
> explain more details and why they need a vendor property for this.
> 

Yes, this is used for exactly that... but I believe that we can deprecate this
now that we have support for the "standard" `audio-routing` property and for the
DAI Link nodes (examples that you can find in current device trees are mm-dai-link,
hs-playback-dai-link, or any other subnode of the sound card).

Specifically, those subnodes *do* require a "link-name" property, which *does*
effectively contain the same DAI Link names as the ones that are inside of the
"mediatek,dai-link" property.

On MT8195, you can find both the subnodes and the mediatek,dai-link - yes - but
that was done to retain compatibility of the device tree with old drivers (so,
an unusual case of new device tree on old kernel).

Finally, I believe that we can avoid adding that "mediatek,dai-link" property
to the MT8188 binding, and rely on:
  1. Whatever is provided in struct snd_soc_card for that device; and
  2. Whatever is provided in device trees as dai link subnodes, which would
     restrict N.1 as that's anyway describing card prelinks.

Cheers,
Angelo

> Regards,
> Fei
> 
>>
>> Best regards,
>> Krzysztof
>>



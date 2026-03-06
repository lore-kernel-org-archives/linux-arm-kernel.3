Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A87DF01812
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 09:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmrvjE16QF4hZxqUg7e0aOGEYSeU7bMbrVnHKPbyBjg=; b=Y3GyZ0xfmMlMfyjU0IzPdJOknf
	ycDFtG9JAidrr5ful4CF5hluvl1noT9cOT13XdnlGnSzXPEMS0Xjo+TTfbNFxb1GL0Wx5YCCeZh78
	eGCgdyFut3+Amo4ytCl5hImRLCihC/N+7d85BdgkRXdlFMEpWuHjGkL0JD6+TqMoKare+PL/4JnZo
	TSTBtAvrH1VEbiALjjYdn08+tyLkUZuGVaksRxqDrHee1/vC+cIlActed6LthFDqtRPN8d3kfiwLI
	B6PtWT1bQL5TpFx6RHhwixDmC9wply9UsuQ0XsE1AFz1DVRlj0QuLGmhKQi8amjq7DFI8Spqsm74l
	aDanbeow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRKZ-00000003Kz6-0Xk9;
	Fri, 06 Mar 2026 09:18:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRKW-00000003KyL-0Rby;
	Fri, 06 Mar 2026 09:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772788721;
	bh=OH702f+DlOSO+MCKoOLFzipEKjfAn3TXofGaFrLTaQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aQa1sWd2F8WTv1R+3RswL7qWrKeVIWzE2vX3Cg+7Ivx3TJuCLZIkf7zjgpblReBtu
	 iep1moGyo0iCJFd9jL6w/BUkDeKLNxsajQolbE28XCR7HLEqapCEKHqCbkdLFklcni
	 /BhNZNbHfWOmiiDvN4Nvn+jX4EwHpXVk8YNaZOmSM8Y3OxUIvufH+4s7G432o9F6VG
	 5tLq/lNoQBJilutcyClY3N1V4Iu/2rrt/+u0+lZifvMNIvDgBbiR4OxwDLu3Wqyje2
	 KwCcxdAEvCKA5Emi+uvO1pcgVemR8leQMVtdxWUMHcDPcdh6bCw2C5PmU9hD8e9F0+
	 Y8fh0QkPcc3fw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D3AE817E04DC;
	Fri,  6 Mar 2026 10:18:40 +0100 (CET)
Message-ID: <e179c650-5d0e-4004-a983-e3b63d4c28c5@collabora.com>
Date: Fri, 6 Mar 2026 10:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: arm: mediatek: audsys: Support
 mt8192-audsys variant
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org,
 matthias.bgg@gmail.com, julien.massot@collabora.com,
 eugen.hristev@linaro.org, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
 <CAL_JsqL=zAqyVDAP_B1VW1FWKoS9OEdTNZiZabSNxDscBryYgw@mail.gmail.com>
 <0ccca45c-34af-4d38-ad0f-6cd080f2882d@collabora.com>
 <0b3a1fa9-4024-44b9-a42f-6b82862e2ac9@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <0b3a1fa9-4024-44b9-a42f-6b82862e2ac9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_011844_296571_D1FA948B 
X-CRM114-Status: GOOD (  10.72  )
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

Il 06/03/26 10:10, Krzysztof Kozlowski ha scritto:
> On 10/02/2026 15:28, AngeloGioacchino Del Regno wrote:
>>>> + - if:
>>>> +     properties:
>>>> +       compatible:
>>>> +         contains:
>>>> +           const: mediatek,mt8192-audsys
>>>> +   then:
>>>> +     properties:
>>>> +       audio-controller:
>>>> +         $ref: /schemas/sound/mt8192-afe-pcm.yaml#
>>>> +
>>>>
>>>
>>> Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1:
>>> [warning] too many blank lines (2 > 1) (empty-lines)
>>>
>>> Please fix as these are warnings in linux-next now.
>>>
>>
>> Ack. Sorry for the mistakes. Not sure how this happened.
>>
>> Let me see when I can get some minutes to get this addressed.
>>
> 
> This was 2 weeks ago.
> 
> Warning is still there in next. Please revert your patch or take the fix
> from mailing list, but anyway this should not be broken for two weeks.
> 
It's done. Sorry for the wait, but it's been extremely busy days around here.

Cheers,
Angelo


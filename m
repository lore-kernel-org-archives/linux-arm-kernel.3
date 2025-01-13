Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAA8E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ww/NJVPcRv9ikhyEBRdtYI98rEh+ExDHcvkvWghNMdA=; b=eKsGALcb5bvrmJeFyhgY0kPGVz
	yXpAvPxMWyrwbnU8uNYb/U2CaNJ63fYUD2r359BZHdl084Zomyk2dzF7Dh1Z9vH/z0n6RflecQWA5
	hWCFYnXPdBR+0DBlPvtr0spQbfwU9fGmGaK+JrZKRmEF/IOjdUZPMLqpA9qTcSsUFBhw6yTumrCO3
	HtH1UsG4AEph5nSO2WdaDfIJShTfasT5l6Ww0avF5Ef083vpU6hPa3bBU/dCdCnjwooZ+wNdMbHhd
	nSmYoCmA9XwAjsRhaBecZ1J2BUhtF7+8rssNraaNpmQ6Y8rauc6IsYF0lZiX7+pikGRh5dUirJnPn
	R03DJbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIta-00000004yeZ-3dPp;
	Mon, 13 Jan 2025 11:46:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIsL-00000004yRR-3yw3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:44:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D437CA40F22;
	Mon, 13 Jan 2025 11:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB246C4CED6;
	Mon, 13 Jan 2025 11:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736768696;
	bh=LVtEFY41ensxufRFG4hAMlaOCuTkTZrxHeKsNslynlY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iUJTtFYGhRtto7Q3CbZ3GIkwWMLu5Cyb2J1ciWAftdVwfY69rW1h3XTDgnxfm5oHQ
	 C+4yiDqDchI9QOQEi2lQtQpaiynatrAs2NtCwnJ3UE3CgEUGWeXeoPTu3w22WKqjvs
	 DEFeshE5Wbvq5wgVPNQ//G03vJdi8+EdWq1rJhFS8RXANh2pyPH0EiMxv7mOOlriT6
	 wzMc5ml+kl7BJZs+hgaRfSLc36weK54iCFK3L1evHkofYjvnf3aXhtDgIy2G3X+Bfv
	 uyBHNovzgGk6SY7PZeZI8C4yvMut6iQcImtspCViAvxh+kDY2fCOTLgaKRIqtwn6fo
	 xm5fB6Dd/0wag==
Message-ID: <79672620-9bfa-4162-9555-3f7274914cbf@kernel.org>
Date: Mon, 13 Jan 2025 12:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] ASoC: dt-bindings: audio-graph-card2: add widgets
 and hp-det-gpios support
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Frank Li <Frank.li@nxp.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-4-laurentiumihalcea111@gmail.com>
 <nxcoukgiwtcsowi2uxytxa32mdp5dhl4tvnetpd2spti7oiiu3@mpqbv43ivznc>
 <e5665b6a-c2ad-470f-8a36-b7adc05c1cf0@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <e5665b6a-c2ad-470f-8a36-b7adc05c1cf0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_034458_117340_78A04940 
X-CRM114-Status: GOOD (  15.24  )
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

On 08/01/2025 13:19, Laurentiu Mihalcea wrote:
> 
> 
> 
> On 12/17/2024 9:07 AM, Krzysztof Kozlowski wrote:
>> On Mon, Dec 16, 2024 at 09:50:37AM -0500, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>
>>> Introduce the 'widgets' property, allowing the creation of widgets from
>>> 4 template widgets: Microphone, Line, Headphone, and Speaker. Also
>>> introduce the 'hp-det-gpios' property, which allows using headphone
>>> detection using the specified GPIO.
>>>
>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>> ---
>>>  .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
>> I have impression you are duplicating audio graph properties instead of
>> referencing proper schema, but considering that the bindings
>> audio-graph-card and audio-graph-card2 differ only by number "2" without
>> any description, not sure what is correct here.
> 
> Please correct me if I'm wrong here.
> 
> As things stand now and based on Kuninori Morimoto's comment on this
> (https://lore.kernel.org/lkml/87cyhw8lg5.wl-kuninori.morimoto.gx@renesas.com/) I'd say we can't
> (or, rather, shouldn't) directly reference audio-graph.yaml here.

Thanks

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> 
> Now, I wonder if the "proper" solution here would be to take the common properties
> of audio-graph.yaml and audio-graph-card2.yaml and create a new binding that can be
> referenced by both aforementioned bindings? Would that make things even more confusing
> (we'd probably end up with audio-graph.yaml, audio-graph-card.yaml, audio-graph-card2.yaml,
> and audio-graph-common.yaml)? Should this be addressed as part of this series?


Really not sure. Common bindings are often good choice but I already
struggle with grasping the differences between both audio-graph-cards,
so more of it might not help.

Best regards,
Krzysztof


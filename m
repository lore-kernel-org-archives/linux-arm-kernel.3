Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6313FC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3X+SeoTjAXlgqca/HAI2vRHsJMCwVVLxr6PRLlhP5s=; b=DtA8HNf9yhOPNdJo6HwgXYIXsK
	eXJQXAsDicFjhN0t8OkLieTY/L3d1w/2JItNOOEjjh3bFoexE0aMVeHmlowKC5/WqvQqaul8/5qjE
	TTeQcrMIt1QXDFdZq+fyvzhTwH4SKAQ6BZNAP9RNqFrIxeNaJulvKoEa6tzhyvIMvQALhtrnolWQH
	Xo+NwBJ2p8GezDWlQvfngb6nvUufNrA4kky1t2pFcaArR7LfdMPZH+/wsxluv4EXmL2SSnAA8DWqb
	SLJS1HVAK9IY9zdXqb45Xll2J+xgOs6g8lWNUJ6Z10Adl20K5eTHFW6WVBZv1B0UrAX939lmAUyd5
	dpPSRNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3jf-00000000Uj7-48rF;
	Mon, 03 Mar 2025 11:13:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3dW-00000000ScU-1kF0;
	Mon, 03 Mar 2025 11:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000021;
	bh=CuLBO8WEfBYQo9g1568escIyXpzN1KWlf5T5E7ZWKe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KNt5cB6E3tkRk+KKq5J3Wa/5X0IpYAsoezW4HlQh4DGPzZv5msphj0aJ25cZ+FC42
	 YfXxZ8N/aZEyhL2QCYB8Q4seia6L1TOdC7Hx+jjukIAjt84SKAMOLXUWsTjEeJjVNe
	 GV2exr4OBpRnWotJOqs7uTK9mULIc3wigF3uxPtpJyluKe5FlVz10Sb2olWnpyWY1z
	 05DBQ83fmv2tQg1JBVhqDWfWGohD5PRTbASI31pfFcLZPFeh0cy/wgTTbZcsGV3rWc
	 DrpNZnK7pPLCiv7uaKXpqzm8DwiTN8T7oHHJxE2+UcfJ63UaVjIGj5Fq/2ErIru1h+
	 aVvnltR/+o4Ag==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D3BDC17E0F3D;
	Mon,  3 Mar 2025 12:06:59 +0100 (CET)
Message-ID: <8af68114-82cd-45b3-a0a9-baa46d64c936@collabora.com>
Date: Mon, 3 Mar 2025 12:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/20] ASoC: mediatek: mt6359-accdet: Always use
 internal resistor
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
 <20250302-mt6359-accdet-dts-v2-12-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-12-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030702_598230_4B8467F1 
X-CRM114-Status: GOOD (  10.69  )
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

Il 02/03/25 17:30, Nícolas F. R. A. Prado ha scritto:
> The code currently reads a property mediatek,eint-use-ext-res with
> values ranging between 0 and 4. Not only should this be a boolean
> property, but there's no need for it to even be a DT property, seeing as
> all current boards will use the internal resistor anyway. Since there's
> no current dt-binding or Devicetree user of this property, remove its
> handling and make the driver always configure the internal resistor.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Adding up to this - I even checked a few downstream smartphone devicetrees, and
not even those are ever using external resistor. This won't ever be needed.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




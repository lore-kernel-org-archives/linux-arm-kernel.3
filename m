Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01387C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwQ9NlNyv8kYwhRe6rUvmaw+gqPbK8w1DG6hQ9wmmZI=; b=WI0pUy+3kGQlCjJ9xxkkCgnLfh
	++gAyTEkKjRjdWSDMAS+lwTMxhkDr9z10GobtlBWff1t54J8iQi3H21Kgqdl5TjQ1w1yoYT7X9wCm
	rYZ9BH7/piWzVUZ/C/RQd31fgPpBWp0Hw8sBa6dwrkTBP6KjzzbE10uIZpRELFLBvhvauXwLALL/T
	v4k02yW97jPga6ozM1U4GfrwN+syDI/ByBLL6sm61W/6D2dpNBicY3+uFslzRmlPaYrGyaZxtta3K
	wRuyRgWtyMi/zDaW2seqRsot1iTfLIMwfhpXrX9NGxPp1e30E0Hem5zQQRDi6JSlP2RSvLOG3Fcg0
	YZQoX96Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDg9-000000035Xp-3lbu;
	Wed, 26 Feb 2025 09:26:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDeb-000000035G5-24Nx;
	Wed, 26 Feb 2025 09:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740561871;
	bh=aTaZuav1IXJYZAPJXWsET7WDRhEiVQTB0oqAdkenAYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TwepVOEPXKKnSkNQGhl7To1NnH3FzLC+16EN2ydRcTupyJN+A56RJq1cQ0xGvWAVg
	 Yl4y+YzftkD+c/dVxmuwhw/rhFn4XlIaK944qjWpj48seA48LqeS2WS+cQ4OcRzrAi
	 /i+lqML/6K0y8jVo6ywdR5feXVc3mJSqS9oBbD2xlgaDnQfyxYgYcobyJVDlplDJfe
	 ymd4mUJ8UI5m4lP3cWtQW2ATx9hFPlEOVGyX9xyDIyGH5NRFu+csYztyaBO8H/HzEh
	 Fh2ZOf/GR7ZPTYMadMo5rMgarUoDYOsQpdtx221X444rZzb/oEYk2TtpfXXRA1JHfd
	 viO19ZUL2mhsQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8EAB317E0B10;
	Wed, 26 Feb 2025 10:24:30 +0100 (CET)
Message-ID: <bf9a74f6-fba3-4720-b2b1-1c8e5dae1f83@collabora.com>
Date: Wed, 26 Feb 2025 10:24:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Enable DMIC for Genio 700/510 EVK
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 parkeryang <Parker.Yang@mediatek.com>, Zoran Zhan <zoran.zhan@mediatek.com>
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_012433_682494_5FFED57C 
X-CRM114-Status: GOOD (  11.13  )
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

Il 25/02/25 15:33, Nícolas F. R. A. Prado ha scritto:
> This series enables the dual digital microphones present on the Genio
> 700 and 510 EVK boards.
> 
> Patches 1 and 2 add some required clocks, patch 3 changes volatility
> handling of some registers to prevent issues, patch 3 adds the DMIC DAI
> driver for MT8188 and updates the AFE with its routes, patch 4 adds the
> DMIC backend and widget to the mt8188-6359 machine sound driver, patch 5
> adds the audio routes for the DMIC to the Devicetree, patch 6 adds
> DMIC_BE in the dt-binding and patch 6 assigns a wakeup-delay-ms to the
> DMIC DAI.
> 
Patches 6 and 8 applied to v6.14-next/dts64

arm64: dts: mediatek: mt8390-genio-common: Add routes for DMIC
arm64: dts: mediatek: mt8390-genio-common: Add delay codec for DMIC

Thanks!


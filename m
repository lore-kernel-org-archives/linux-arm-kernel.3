Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C11D3B7F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr0hn5BxebcecJSxrbQZQsPMnorRMfas1BABYByMrEg=; b=qDCO1ipNHvxBdcZfyzBX+pc2Jb
	rTlmKpfpaTytiRGyrDh49kTSK3a97WvV4y+8q8Hy/txXDvV5GXwgdM+/BI04DGsH3g5HlwKberzNv
	9D82WBzwNX/EAChXTfEL4O3T2+qQEua5/58yJ+RlqduO0+GIaSl5PDcsUJdWKCs13uBR3u8k1F2dj
	G6hLO8jx98n8AyabUYF6f6Ehv5R7PqewroOelnBTigC5KT2Bu1eLe23Euv3e9I5Zl3U6eZkzLOfo7
	7ZgfZvlZ5Q+HPhDdcPjnpBH4i5NiKy/c/6s7cD3uq1lUQQIqLT+okO304ehBGuXKIEh3PQkNH65Dh
	Hb9rPvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV7n-00000007Vdr-3v0c;
	Mon, 25 Nov 2024 09:11:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV6q-00000007VWy-3zVD;
	Mon, 25 Nov 2024 09:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732525818;
	bh=T5l/crnSH/yazYRVOP6L4UeoDSvfH2frc5oLxWFb9tk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZHDQqBz+p3aFA1pmZqzhqAhg7x0C7I9ubEAYhXhZXAXw8m7NlQdI2oL6mRbw0ML0f
	 j4hxJZ7dt1x/SPVFBAtLbi9m8kMikDSMSGlbz256yFvNjPOon5vSloZKkfDwWNwRgR
	 wj/Lp1vYj+qoZYJ3gkmxYTwesDPFpLg7J2gWtt7ZEAcBBLhmW8W9jRx/q73I5hPj1Z
	 Z/4uYgRSVVRnsZzboIMElZ7I+FizxehljMmK1zItpmWrlu0TBy19z+5y/ZOMSj0Z98
	 VKR61041kpKoT+J/BIyho6szecNvYXzqiqS4zTSw4nU1CIT0S/Q69T3rLfm4ipbAc1
	 mNAd2K/BcUjZA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4977B17E1330;
	Mon, 25 Nov 2024 10:10:18 +0100 (CET)
Message-ID: <5d88488c-9ad6-4449-9a6f-b5ebe7e76ae9@collabora.com>
Date: Mon, 25 Nov 2024 10:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: Introduce MT8188 Geralt
 platform based Ciri
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241124085739.290556-1-fshao@chromium.org>
 <20241124085739.290556-3-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241124085739.290556-3-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_011021_134768_CD37DD94 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

Il 24/11/24 09:52, Fei Shao ha scritto:
> Introduce MT8188-based Chromebook Ciri, also known commercially as
> Lenovo Chromebook Duet (11", 9).
> 
> Ciri is a detachable device based on the Geralt design, where Geralt is
> the codename for the MT8188 platform. Ciri offers 8 SKUs to accommodate
> different combinations of second-source components, including:
> - audio codecs (RT5682S and ES8326)
> - speaker amps (TAS2563 and MAX98390)
> - MIPI-DSI panels (BOE nv110wum-l60 and IVO t109nw41)
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




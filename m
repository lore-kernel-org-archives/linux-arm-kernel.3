Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832D2D3B985
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 11:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6r09eGO29hFVlc9g9XHiIyH90sGII+XuoxVlhSLsVI=; b=BYRwdoSZXVtErePV3kt/JXcpg/
	EKtvSQCNStHAaTkapjBYNY3bMbW20PHasFFrug7PshKCpUmw0A38wgKs/O9UdmnEOti7Dwr4nBEHZ
	OgflcPuv+xwUy/8h0ImC159GS+ghmZCg/HOY4vBpmboyz+2kWj/6ZMKZvwyiAWW8mNzGsB+A3wT9B
	yAM7aL8ujWKJFLMV4Jso1VLlggYvNjaNip22GGiMEY8hcoU7kIud5uCnh/GYGaCxmw0AyvPmssOXY
	Bdy6jbw/o4vn0/6DlzRlFnTzaXmImJZuOnO+Q/mLmZKWevANG/4pNborGSEFjZ7jGY//+t3kWa27n
	pMcE/lNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtsw-0000000AQmA-1yCy;
	Tue, 26 Nov 2024 11:37:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtqq-0000000AQBg-2Kws;
	Tue, 26 Nov 2024 11:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732620926;
	bh=QKn+D2JA1x9aHpNwHEHtqeGvHQ9SrMz5QDwoqSS7K8Y=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=VLkKuPDD7AoYEKzEuIF4jtm58yDWLQdccmF9eJSeg4PCGVC9DMyUvD1a+G/+nRsq6
	 nxtc0jsjw3Z0wdM3mzKvfn2vL5IoNbQcBGJB2pTSCQDgVSqkZt0xGUOcGnC8wcblgX
	 Dsn1Z4hLNXlAA4XnQJsLik5J+YheWem23AyC8w1oFfkSvInHFTxgYR7hk9FnIMxSIs
	 e4UusOTHL47OAYP7zam8TIrvZVlb3WAXE4RdDJ/d5m5TiigI6R0baAN5UY4b5tjMHA
	 iLNajeM+LRTxhDT34dufQ44F0Dcl0vZbP2zS8Xt3e97b7kIifTG8Ip8Q2+KUCttRvW
	 WzUVK+mjyVydA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5442017E3628;
	Tue, 26 Nov 2024 12:35:26 +0100 (CET)
Message-ID: <473283aa-fc84-4b3f-93bc-653c9d83c837@collabora.com>
Date: Tue, 26 Nov 2024 12:35:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: mt8186: Add Starmie device
To: Wojciech Macek <wmacek@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Rafal Milecki <rafal@milecki.pl>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241126103632.419469-1-wmacek@chromium.org>
 <20241126103632.419469-3-wmacek@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241126103632.419469-3-wmacek@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_033528_740420_55798F1C 
X-CRM114-Status: GOOD (  12.78  )
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

Il 26/11/24 11:36, Wojciech Macek ha scritto:
> Add support for Starmie Chromebooks.
> 
> Signed-off-by: Wojciech Macek <wmacek@chromium.org>
> ---
> Changelog v3-v2:
>   - Cleaned up DTS
>     - Re-using dsi_out node
>     - Removed unnecessary delete-nodes
>     - Moved touchpads to per-board dts
>     - Modified 3.3/6V power regulator node
> Changelog v2-v1:
>   - No changes
>   arch/arm64/boot/dts/mediatek/Makefile         |   2 +
>   .../mediatek/mt8186-corsola-starmie-sku0.dts  |  31 ++
>   .../mediatek/mt8186-corsola-starmie-sku1.dts  |  31 ++
>   .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 465 ++++++++++++++++++
>   4 files changed, 529 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
> 

..snip..
> +/*
> + * Battery on Starmie is using a different address than default.
> + */
> +&battery {

I didn't ask you to do it this way, and that was for a good reason.

Besides, you haven't run dtbs_check before sending this.
Give it a go and you'll see why.

Regards,
Angelo

> +	reg = <0xf>;
> +};



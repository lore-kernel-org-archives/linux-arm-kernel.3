Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ACEC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54H/In3+EhnhMeyApAiqJgb8qBXgzwkWCFPfc494L1I=; b=dRTZAjadU7NaYdD/zp1qFyt+Y9
	WDPtb/N7DzXD74/OV25ylC0UV10yVjjzAIjSiOsRvlOqIF6JC1Z2S5B3yA1ToA4PO3Q5hhSHDE2TA
	e71l7DYc58VoOGKxbTTjIKdltgsZSA+3sRQICQLHhdpTXNWHv+83LvtorpVCKGb0V6qnadkh8MLzD
	oLRzRXLLgD95NrKuydrMrIB4/1IVKCXLMSn6uBKuINFIvb0CvdQMrU9xotZK6LTo3kiyzmkffhWCo
	iLrh8fR6xT2Ne21GohsfPXcCvnUE0LD6zjHsxyZJmi6CE8vJVu8Bg3OHHzB0Jm91sN62En+aGkv+2
	tTzvizag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrHa-0000000Gb1s-3lkS;
	Tue, 25 Feb 2025 09:31:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqpo-0000000GUwn-41a7;
	Tue, 25 Feb 2025 09:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740474155;
	bh=GFEfTorG2zuWJ97TPko5rQZtvEKeuqQGPMRIfo2OrTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S/RE2gc5EDyN1SrEb2R9W642N50m8FsfRZ8bRHF3PVg1aUG1WzgVkxIFT6NDriogy
	 WdnxD5k5YT47acDuj/yQUYBapJvHYIA2nKsriI8rlWRvja3Nq1tjZxsPkYRiLyRC0b
	 Xv+71o/UZEzvQU6kwD1QM1xsIblLaR7Ff9zxCchBd/ITmzaPbL5jAcRoErtZHdCKk3
	 ZS2HYEV+Ti/XpOlMdHSKh8LhcU71UEIPdaH9QsbuBZpA9ItcNknmf+oXr19w2OHYzj
	 7SERwnx3yXbv3++KdygVOM6BvCi0yNR6TVtWjK4tMwK0krpW+R6+2oyX4ce0+sb0/n
	 8evHq8R3JTM+w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD42117E0E91;
	Tue, 25 Feb 2025 10:02:34 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, pablo.sun@mediatek.com
In-Reply-To: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
References: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 0/3] MediaTek MT8188 MTU3 USB and Genio 510/700
 TypeC
Message-Id: <174047415469.19243.15192184553085173709.b4-ty@collabora.com>
Date: Tue, 25 Feb 2025 10:02:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010237_152785_B566AF6D 
X-CRM114-Status: UNSURE (   7.05  )
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

On Thu, 20 Feb 2025 11:55:11 +0100, AngeloGioacchino Del Regno wrote:
> This series adds MTU3 nodes to the MT8188 base devicetree, fixes the
> Geralt Chromebooks to use it, and adds support for all of the USB
> ports, including TypeC Power Delivery, Alternate Modes, etc, found
> on the MediaTek Genio 510 and Genio 700 Evaluation Kits.
> 
> This also adds the missing SuperSpeed port to the mtk-xhci binding.
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/3] dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP
      commit: 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a
[2/3] arm64: dts: mediatek: mt8188: Add MTU3 nodes and correctly describe USB
      commit: 598c4ad870d3942ea948d2b99c55239acdde3224
[3/3] arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX
      commit: 1afaeca17238ef6480b1a76e7fd8b3c33d406ef7

Cheers,
Angelo




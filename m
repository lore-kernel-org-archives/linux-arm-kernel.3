Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD782C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEx1FP37iC4a8DlrnPd+Y4IHbK2CIl5hs6MpX/CmorY=; b=AxCH2rj+bO4NldB6kEnt1nOcYQ
	XXCiMcMsW0bVAnimw9QFEZtXTvNHqAIArfbA29l/Ggb8vzexr4a5JytdlWRMhGcZ8UVJEHyRejztx
	aKQrSWujsIYP75tQ5eSKE59Gm0nUiRVAnmg3SQ2tjN7OlbsCjSrEycVAtpvxPiZIXyJbS+RaeP8WM
	QDYJWNwnjUfbtzK0SGSt5iDXisjMJhQIwB5uGcwth6eE9XZdoyNDeDiCQp4rHV/elgJtQCkLVs/60
	sWPFQ31gH0pmAFgEfaXcmITKt7olaX6QEx/0myJoxcI/kTmJF7mr+M0TFGihIZmtfL1Sh6ChZNxek
	8YA4HqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBEy-00000001oEQ-3Bro;
	Mon, 30 Jun 2025 09:55:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWB5O-00000001mis-37DX;
	Mon, 30 Jun 2025 09:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=FEx1FP37iC4a8DlrnPd+Y4IHbK2CIl5hs6MpX/CmorY=; b=i6E84CgAw30oBBT8WA+laoNCAU
	bLXkPBN6JeTbPIKyshz3ocIBhWa4H+49GXTenM6KXpaFmhB9ajk+7WFLFa+DUiBzecqsDQtL+x+1a
	0lPS8PbrOYVmS1M1aHNWyUSrGyPLtrqvLClkKECWqc9AqMGoysXEGefvdb5VXbyosDbARyU9SGiaA
	HzhXtYzoRkZTOXzIJ1BtF5fim2sVrElKv64h9MhXKPpVv77tDxl/xVvkuxHlniCzSaeC9jx6ewj8t
	oLOiYoECHTbo0xXDjP4GEVTXaxDDsOopGxckidZ9tzC/A5/gdiH2hoBM7zMskfMup03xe9nY6Akw0
	BzHmncTg==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWB5L-0006Zc-0x; Mon, 30 Jun 2025 11:45:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable PCIe on ROCK 4D
Date: Mon, 30 Jun 2025 11:45:46 +0200
Message-ID: <175127673172.138768.17598009818347376680.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621-rk3576-rock4d-pcie-v1-1-2b33c9f12955@collabora.com>
References: <20250621-rk3576-rock4d-pcie-v1-1-2b33c9f12955@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_024602_776817_57B640C6 
X-CRM114-Status: GOOD (  12.00  )
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


On Sat, 21 Jun 2025 16:37:55 +0200, Nicolas Frattaroli wrote:
> The RADXA ROCK 4D board has a PCIe controller connected to a flat flex
> connector, compatible with the one the RPi5 uses.
> 
> Enable the associated combphy and pcie controller node, as well as add
> the remaining pinctrl definition for the reset.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: enable PCIe on ROCK 4D
      commit: 29ff4bbff793334d6aff2238fdc3ccf3859d60da

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


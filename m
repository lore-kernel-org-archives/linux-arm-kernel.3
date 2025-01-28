Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97406C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGeNObgPtgq54kPtmrdkDCI2N8ZHYHSijDKpuZYgM3g=; b=P6ywrFdILZEq5iQVu3b6+N0YxY
	U0xYI3UE1OaOuSmyzzvt09Gbj5TvNeJpGWAihihS57JhsB4GlUEC7M5K5VI+mEJA5TZoFU+EJr+cs
	pwiigs9zJ59mxu8KULd/waCmJ5UZpbgLz5kZHckbzPJBqnQWRPvQ7qz23YR6xkkpYu12sEv7Y3u4f
	D239/copO0fAmoLxJlg58+xmS+HN1Ay2FMJsZNzRWm1CVnuUlcO0wHYOvnqS8wObJw220Qnh2mBxO
	3DXnNtMBM5RwQvC6AuOG+cN9+TtXcDkCJGHx7UlHB8irnIUMHHIDHjAEcgLtyP1N4Q56dZZlb0Uu7
	P6QTXMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tclLx-00000004vvC-0TPa;
	Tue, 28 Jan 2025 13:10:05 +0000
Received: from smtp-bc09.mail.infomaniak.ch ([45.157.188.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tclGg-00000004v3P-0Hlx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 13:04:41 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Yj58y1vTNzS9S;
	Tue, 28 Jan 2025 14:04:34 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Yj58x40fmzbWh;
	Tue, 28 Jan 2025 14:04:33 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 28 Jan 2025 14:04:14 +0100
Subject: [PATCH v3 2/4] arm64: dts: rockchip: add overlay test for Edgeble
 NCM6A
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-pre-ict-jaguar-v3-2-7be2f09d390a@cherry.de>
References: <20250128-pre-ict-jaguar-v3-0-7be2f09d390a@cherry.de>
In-Reply-To: <20250128-pre-ict-jaguar-v3-0-7be2f09d390a@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, 
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_050438_235070_A8E9C171 
X-CRM114-Status: GOOD (  12.03  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The Edgeble NCM6A can have WiFi modules connected and this is handled
via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
NCM6A WiFi6 Overlay")).

In order to make sure the overlay is still valid in the future, let's
add a validation test by applying the overlay on top of the main base
at build time.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index bba9b2f1c761040545bea561878e9b63f8c29488..267966ea69b194887d59e38a4220239a90a91306 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -136,7 +136,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-evb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-genbook.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-io.dtb
-dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-firefly-itx-3588j.dtb
@@ -183,3 +182,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
 rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
 	rk3568-wolfvision-pf5-io-expander.dtbo
+
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
+rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
+	rk3588-edgeble-neu6a-wifi.dtbo

-- 
2.48.1



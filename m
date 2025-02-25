Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FDBC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sRvC9xyRaKFw44KDfxlYmtJ9FimYw0kouBKkM0uu3k=; b=V0P/PS76ppWi1QlHPxhYTgYDJ6
	6Yq+kVP8GdQMoo+Vpfd8V/N6/2nmdqEaiA4zcAL90umVToXcN24ngDXGuzW3aWH9D5rA3JDNG2FFR
	seZ2F5lVBfXhCYKeaIwrD/sf+UVdShlndGxcSfhmcS+dPS+lCzY8EFO6jcIdPwchWkj1K5iik0fvd
	60Gp8872/j6h6A2V7tIfF567rQMAR/3nskIHSQbz/rslLuWMx8DjbQUTVzwCTSbisKewOY8hZjriM
	LWtjb1rlFOqF/RRJmXCQsvhF31VzN6e14ulI+IOlQ2jmoQa2JVvDjbsJko2d5+v1qRIO25sPivS1R
	TlBOsn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmu6q-0000000HDgV-07R4;
	Tue, 25 Feb 2025 12:32:24 +0000
Received: from smtp-bc08.mail.infomaniak.ch ([2001:1600:4:17::bc08])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtVY-0000000H6c6-2NPa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 11:53:55 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Z2GGN1zmGzPp2;
	Tue, 25 Feb 2025 12:53:48 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Z2GGM4bc9zCcj;
	Tue, 25 Feb 2025 12:53:47 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 25 Feb 2025 12:53:29 +0100
Subject: [PATCH v3 1/2] arm64: dts: rockchip: fix pinmux of UART0 for PX30
 Ringneck on Haikou
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250225-ringneck-dtbos-v3-1-853a9a6dd597@cherry.de>
References: <20250225-ringneck-dtbos-v3-0-853a9a6dd597@cherry.de>
In-Reply-To: <20250225-ringneck-dtbos-v3-0-853a9a6dd597@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_035352_753054_63ECDA4F 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

UART0 pinmux by default configures GPIO0_B5 in its UART RTS function for
UART0. However, by default on Haikou, it is used as GPIO as UART RTS for
UART5.

Therefore, let's update UART0 pinmux to not configure the pin in that
mode, a later commit will make UART5 request the GPIO pinmux.

Fixes: c484cf93f61b ("arm64: dts: rockchip: add PX30-µQ7 (Ringneck) SoM with Haikou baseboard")
Cc: stable@vger.kernel.org
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
index eb9470a00e549fc107603be216a5f714914e7a2c..9a568f3d0a9916dff22222c59e5e0c94ce226858 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
@@ -222,6 +222,7 @@ &u2phy_otg {
 };
 
 &uart0 {
+	pinctrl-0 = <&uart0_xfer>;
 	status = "okay";
 };
 

-- 
2.48.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA558C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGC6dNYDSFk7GpjxNZ+/VTQajPaQV20gSzBlwiElU0E=; b=kap3MRz7i4PAE1KAU/5PXaMYhH
	pyp9jsCZJyd23Wz3qcTApmXKm6lhnVHOKe3wKcdyWfKfUnnvrKGF/eLpSy+rJHOFjiNLM2cCUGYuk
	33EIDkWXM0N2/TY6GuGgULXMV57sXShutLZNKuANtGJ+MC3cYJ58h8qb6P0+46Q4/U3GrKWz7Svd8
	VjL/6tednpiVJ6hPIWPJS8o/aEoNBPFeSVRs4LfQ/ogbWL0UXJ35WI/w2WdQv7zGMi2X1L2cC63Yw
	qVe24B4dEwD/EBAL4/DX3HKN/x6w9sfM7Ulc3YXlRdvOnVNHUUkKqlHjlAsKSM8VucsC8xOuEvVAV
	2EmVP8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKDP-0000000E0N1-3CDs;
	Thu, 19 Jun 2025 18:42:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSJ5c-0000000Dn3L-09UO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 17:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E2E81A546F5;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD7EC4AF09;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354214;
	bh=rz1gZsh7A4S3qN6IuAlTDtQuCkgP2vb88SwwNf0Nq2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dlYkaJ3OTDpwCeKrBYMhpeu+Ctm4JFHWkf4GpF969PbSB+fdQ3tpM18wnHtoc8KjY
	 xAYlT47yv+7DfOgDuEysznix7QLCwPW+4LnFwKlu0/2rKeYy8Btu1J8CmbhbaLXLcb
	 3GQJRKhKaq7YU/2u0mvxiqcs7E75AIF22W2k7exrZp22dLt8chij53y1xkf+Y+Nrfh
	 9uNVBG2mAqgVY6D5jOU7xJJ5U60M18PmHR0JRCYCpVMJC/oE7isV96yFpIXPNY7wKe
	 5MbaAbfFAwoipZgGPgfT9WX5lqyCaFBa6/JcpOBj83DIyEYhx8syjhkfOpoTPw0OY9
	 RAQpn3zhGs2bA==
Received: by wens.tw (Postfix, from userid 1000)
	id 3703F5FFF4; Fri, 20 Jun 2025 01:30:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 4/5] arm64: dts: allwinner: a523: Add UART1 pins
Date: Fri, 20 Jun 2025 01:30:06 +0800
Message-Id: <20250619173007.3367034-5-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619173007.3367034-1-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_103016_155773_19F6C719 
X-CRM114-Status: GOOD (  10.52  )
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

From: Chen-Yu Tsai <wens@csie.org>

UART1 is normally used to connect to the Bluetooth side of a Broadcom
WiFi+BT combo chip. The connection uses 4 pins.

Add pinmux nodes for UART1, one for the RX/TX pins, and one for the
RTS/CTS pins.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 30613a0b1124..6f62201fd739 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -168,6 +168,20 @@ uart0_pb_pins: uart0-pb-pins {
 				allwinner,pinmux = <2>;
 				function = "uart0";
 			};
+
+			/omit-if-no-ref/
+			uart1_pins: uart1-pins {
+				pins = "PG6", "PG7";
+				function = "uart1";
+				allwinner,pinmux = <2>;
+			};
+
+			/omit-if-no-ref/
+			uart1_rts_cts_pins: uart1-rts-cts-pins {
+				pins = "PG8", "PG9";
+				function = "uart1";
+				allwinner,pinmux = <2>;
+			};
 		};
 
 		ccu: clock-controller@2001000 {
-- 
2.39.5



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C40DCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 12:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xXfOlg+vxhS0Rr3hUv2hxCnZTAbxGhsNk9YtBS4+xrU=; b=LP7nJHTG5srRZfMhpBfWq1CU2p
	YrC3wcWXZHg3+QnklF78uiy5/2KHGiRM01pfJRlE0qH2PwiryQKYohJfLuEZPu13Y4LcpTLkoJvzC
	xXLBud+EjtupfomXaXJWpWT5FCeUtkV3P8JwzHvO5vj1Bwrqfyltrz3g9/DZ5sldAHw0xnE3ead5i
	CygUoACNlZyqHtiCJKhSKXPhVfxkLH9vpljCVu17O/Fs0aaTu9ZrlRChq2a7vp4iwumNiboWslADQ
	q3uauOVE0cg0iqJ2/i7GY8P7xqcctIYkfCOgCsOJ2lhxFF1ulwTgGnX1CAdkLnR29Jb2XLtJckET1
	MJQPA+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzsC-0000000CK1p-0WU8;
	Sun, 26 Oct 2025 12:29:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzs9-0000000CK1T-1gsH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 12:29:22 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 276F1AB4;
	Sun, 26 Oct 2025 13:27:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761481652;
	bh=pzVG8b6JUQj2Bt9sXSZDDeW26gA2PpIPU+wUY7d6Xsk=;
	h=From:To:Cc:Subject:Date:From;
	b=GW/HxhpZ225i9Tvtsc4U23VNmiAhwLYsTJ3RjLrnvkhZbEUkjAmNKDNwXOWW5j3ef
	 KheSpcpvBNMuK25qlcmu/lCiZqRQRba0bz3fp70o+uCfdU86P1GS+vnASzsLoR6ysW
	 wps6oAsvkagbrnHgvcNoLJgc4wHI0nsxcEknZUIY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Date: Sun, 26 Oct 2025 14:29:04 +0200
Message-ID: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_052921_582134_A765BAAA 
X-CRM114-Status: GOOD (  14.39  )
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

Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
(DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
devices produces an interrupts storm. Disable EEE support to fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
The exact reason for the interrupt storm is unknown, and my attempts to
diagnose it was hindered by my lack of expertise with DWMAC. As far as I
understand, the DWMAC implements EEE support, and so does the RTL8211E
PHY according to its datasheet. What each side does exactly is unknown
to me. One theory I've heard to explain the issue is that the two
implementations conflict. There is no register in the RTL8211E PHY to
disable EEE on the PHY side while still advertising its support to the
peer and relying on the implementation in the DWMAC (if this even makes
sense), so disabling EEE is the only viable option.

This patch is likely a workaround, but it fixes ethernet usage on the
board, so it's in my opinion worth being merged. If someone with better
knowledge of EEE and DWMAC, as well as an interest in getting it working
properly on the Debix board, wants to submit additional patches to drop
eee-broken-1000t, I will be happy to test them.
---
 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index 9422beee30b2..4aa47f71425b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -102,6 +102,7 @@ ethphy0: ethernet-phy@1 { /* RTL8211E */
 			reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <20>;
 			reset-deassert-us = <200000>;
+			eee-broken-1000t;
 		};
 	};
 };
-- 
Regards,

Laurent Pinchart



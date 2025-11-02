Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2B6CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 11:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UFp9uyDfAJu5Ntc/6gRGjtb9QV6wdPmwDNklV5Bf0E0=; b=MA96QQH3ZFMmwgjjI1zkY2nNSu
	sDJF5uMjSIoMgISvnHLORjLo610cqcF9rU4cezmidiRq/nFzNvgglZ/mxiFoed2cWBsGS1j19Mega
	UFvhvRqYY1A07ggfIgwys0UfKn0ATc/G0B23eG3sb7NmK02qpUw9jgQxsfTl272l+DQQM/bACch+F
	3qq+0352mnoyZQ9c4GHEi3ZlyF70Suuq3xU39+9R10RMdpyqpJ1t05XPPhiLgT7EnmHjLD96hgpNu
	fWPONrJQweEYnifRn+IC9AU7jnh3yJYTdriyXaL6JoKjzfXish4zpZ8CDNy8FCopRBWG619NjwSm7
	7e+XViiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFW35-00000008V8c-2VJZ;
	Sun, 02 Nov 2025 11:15:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFW32-00000008V7V-184y;
	Sun, 02 Nov 2025 11:15:02 +0000
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C8552C73;
	Sun,  2 Nov 2025 12:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762081986;
	bh=Ne9Ze/9I/Yc7zOCgdwkMbHmMs0v58RaQD9Vhq7QvZ+w=;
	h=From:To:Cc:Subject:Date:From;
	b=sc9mCJWKI+yC+RGC0Xx004+wGs+YO5yI36d9cLqVAdyr70ba6ny3eQUVDhg3KnfvN
	 3X3A2wUB4MqvwfIwTlCoLEl70FVVmo7t2iHa9x/y49W7djWtG2o4DScrf+ncNtRLp1
	 ZniAbU7r6iEUVGDr6WBAnwa1uRL+BqvjmrmJtPd0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Rob Herring <robh@kernel.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0 alias
Date: Sun,  2 Nov 2025 13:14:42 +0200
Message-ID: <20251102111443.18206-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_031501_373385_2903CD7C 
X-CRM114-Status: UNSURE (   9.27  )
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

The RP1 ethernet controller DT node contains a local-mac-address
property to pass the MAC address from the boot loader to the kernel. The
boot loader does not fill the MAC address as the ethernet0 alias is
missing. Add it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Moved the alias to bcm2712-rpi-5-b.dts
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 09a849dd09b1..3e0319fdb93f 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -18,6 +18,12 @@
 
 #include "bcm2712-rpi-5-b-ovl-rp1.dts"
 
+/ {
+	aliases {
+		ethernet0 = &rp1_eth;
+	};
+};
+
 &pcie2 {
 	#include "rp1-nexus.dtsi"
 };

base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
-- 
Regards,

Laurent Pinchart



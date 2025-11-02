Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A712CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 00:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9KKOSGcC4Gv0mBQr2RRLZ64rQwH/g7Y7rLofvM1P0Pw=; b=Cl2FZBWd2FQzWYJyYU7PgPScmo
	zSpmjTlWp1nMepaeK+aLsY2K3/19/Dptez/h97bxEL+3zZIEcwT37ROtGTc9DZoakwv7w0Yv/GAg3
	RWv9PMLAAzktT7D+puvk0+DmoiGUdJ9Hx2tMiWzGCnE2etcKRACB8F/hZn+OGlWjf9CY7/DGD7Bib
	MeATffUX3So/d7Pw9NEZN1ysr/Kp2XkxXgU+hcFzN2i01BhxDP4QSbnp7JBT1mXACIXqHNjEw2hAJ
	yw7vyRe7NFB66rVx3B2tsVeXzC1RDXOuKDc8Kgb6pzlAI8Tc/IhgXA1upIPN1oRKVwHVe4/T7UONa
	L3FIQ2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFLyE-00000008BhW-2CIV;
	Sun, 02 Nov 2025 00:29:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFLyB-00000008Bh3-3IkV;
	Sun, 02 Nov 2025 00:29:21 +0000
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2596C10BE;
	Sun,  2 Nov 2025 01:27:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762043243;
	bh=rnmqrkMo+QIg+hCxy908HQ9gxuv5YMsX1uU3VXsARms=;
	h=From:To:Cc:Subject:Date:From;
	b=ad4dY9n7zDkBCjRAtDec1NJbDYhYZSCvRUDJ8Ba3pcOCaTPzAbtCf3quNTGXi3INw
	 rJJZteVTPfvX97wwDXlEcLEymeAtMt0MO7aeLMsWr4LCg4xBoGrJWZdof6HxEqWtzW
	 mpcFBhft6t5jGrjAyPfy2Bh0QK6wuVBx8GFiN+uU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
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
Subject: [PATCH] arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0 alias
Date: Sun,  2 Nov 2025 02:29:00 +0200
Message-ID: <20251102002901.467-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_172920_277834_B4565314 
X-CRM114-Status: UNSURE (   9.22  )
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
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 04738bf281eb..fa438ac8c9ef 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -10,6 +10,7 @@ / {
 	model = "Raspberry Pi 5";
 
 	aliases {
+		ethernet0 = &rp1_eth;
 		serial10 = &uart10;
 	};
 

base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
-- 
Regards,

Laurent Pinchart



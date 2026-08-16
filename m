Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24CEC5DF79
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgltKba5DUL8ktAPlC2pa1q04TIfIhh7EmL3+FTkAf4=; b=ODLMJgOLLUj0axCVmpgZj9KvuQ
	tlQCg1zPMXO5l38cf4wCrktM2GeUlrvXB4JXjxc0bHByoRMz8KKdEHQ+Dtew1n6tutmGRi7VsmIWB
	Hw68vhcr0VyIw7NrRA3bFRImXVEfojp/tUbbgEVLN5c9Jk1r9ZoWdZL5YrEnOWiy4bNGFBH3Fe4xV
	3ZvhU0h12trullAal7f2G0ztA69ctAaUE+nMjvgaVP4NmOmdoslSizwAnCAYh3PP5KOtHcgNlDShr
	7MdlTSlJMdd6bjrFQZ7ehOflwGO/JG4s+YqVisrDDsWxLT+Jy4g6xscGhQP438kPzvUYS9h6wKSHt
	aLH4Rzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvbVB-00000004oPq-2fFc;
	Sun, 16 Aug 2026 14:06:17 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvbV7-00000004oMu-2Xaa;
	Sun, 16 Aug 2026 14:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=BgltKba5DUL8ktAPlC2pa1q04TIfIhh7EmL3+FTkAf4=; b=O6KFrZkLlE7jBnqfe8TMorQFKC
	3BwOFaXOFtvQ+uu/8ykRAUksJM/5b10/JStYcFb8FXH5RcAvT/AJcByzhOWfGul8sTCa9tq0zFUtd
	vy8iIKtCzcVQLk4o28kT6+YHg04ScgsstpTKxE0rlatuR+RX+n3L4Wk5EkGQu6DSl5MA6/LcJjoLe
	0xVum/KfQtm+UPIe0FymIKAiODaPy9BnoZ66KNFMGr2MTEH48tagvSe6RudPwPZebMf+djzzFoiOo
	5Fz33k2881HRmsDBwAb6MkQUKFr1+bFkgBggCi+qcq1FJSOl6IqIQDkPuV0mZ1ove3J2CnjEtIcoP
	GVAoUDGg==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvbV5-002tuI-Eb; Sun, 16 Aug 2026 16:06:11 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 16 Aug 2026 11:05:43 -0300
Subject: [PATCH 4/4] ARM: dts: bcm2835: Add the V3D reset line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260816-vc4-reset-control-v1-4-896444373716@igalia.com>
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
In-Reply-To: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=QjW5FtN3UmQIj/so/SS0WHmGYCiNglIrR2CAelpRBHY=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBqgcO4ASZcagjs+hTuprttcTy1r7V+HtWoGUMaC
 Ly7M5v7KFeJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaoHDuAAKCRA/8w6Kdoj6
 qmQ+B/wLNmVCbLGXL9JmqNTIEFFxtkm2TnwjaOppIHWi72TV46bzZkiZr/ChdKpjhCn4hmrHesy
 EOUYayq60/CWaBsMmWpmrhoTXAT0Kj2kRXwr/Ln78KapZKmIairNkKrkgOibCrxScqFCmIWSkXh
 etTef9Xp61tYcIiOTGbW0r3jGmwkm4F9YWDC10VqB/EAV5HH4QVDjlBR5gU9cNfM4vEdfV0W6kG
 RxDdKVvY3d7g++xPhaYiAwUu9JSTK6+rbfKsHI4V2D77OV1XfZOB4+lxhrsLImEbXPdIJyd0HJ4
 i+Qsb0Oh2/UqdxDHSCLGHVuIjYejvbG2Gny//QBft5uGm5hW
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_070613_649571_7B818212 
X-CRM114-Status: UNSURE (   9.07  )
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

The PM block exposes a reset line for the V3D block, which the vc4 driver
uses to reset the GPU when recovering from a hang instead of forcing its
power domain down. Wire it up in the shared V3D node, covering BCM2835,
BCM2836 and BCM2837.

BCM2711 already describes the same reset line for its V3D node.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 1e76b290510d..39eea8ce1058 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
 			compatible = "brcm,bcm2835-v3d";
 			reg = <0x7ec00000 0x1000>;
 			interrupts = <1 10>;
+			resets = <&pm BCM2835_RESET_V3D>;
 		};
 
 	};

-- 
2.55.0



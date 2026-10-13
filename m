Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9BACC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 16:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3JJebDaF8d0BDkPiP93+YZIa8Qgu2HPfzUYjFA6D8SE=; b=OsUqByUbPU9dryOLOcf5a9NLM7
	BAom2S4OFWmY4BCloXpuzS6GEV0jY2UIScLpKaaOgI6fX1CSqzwTRbb7EG21yqtHXLUOXVN7BmHyQ
	w/W7sEzqCvFvKHg1BDIDBdwKdy5Pr8iZsPbrnZkPPfPg2ne2kHyZAKGIYNXO4bAmpPoIiyTDR8iBU
	8ZGSAdlM5vGOXn/9hCs+3gmSOU7RPiuZAGgYbXlmqmlZSLTnGweYl3RRRG3SVdChVQpoT7tGclduF
	hzIfPJBSNVdpZEgLdvNpy5SHeCq3SqYOJ9IPakKwMJ60Qb4YAttzhIZsa66aVDntyrG8lp2sOY8/A
	X/389CMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGf2j-0000000DSjT-1Map;
	Tue, 13 Oct 2026 16:07:57 +0000
Received: from 1.mo550.mail-out.ovh.net ([178.32.127.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGf2Y-0000000DShH-1SUs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 16:07:51 +0000
Received: from director1.ghost.mail-out.ovh.net (unknown [10.110.43.142])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4j3zkg6d5cz5x7k
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:07:39 +0000 (UTC)
Received: from ghost-submission-c7b579475-655hp (unknown [10.110.164.42])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 10B87C12C2;
	Tue, 13 Oct 2026 16:07:38 +0000 (UTC)
Received: from armadeus.com ([37.59.142.104])
	by ghost-submission-c7b579475-655hp with ESMTPSA
	id J4tGM0lXzmr7Qy8AW2yxgA
	(envelope-from <sebastien.szymanski@armadeus.com>); Tue, 13 Oct 2026 16:07:38 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-104R005ed722c48-267d-45b9-9d0f-38bc83d56095,
                    E71387541862F9B32BD99FE93336DDEC16E392F6) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.148.202.169
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 13 Oct 2026 18:07:24 +0200
Subject: [PATCH] ARM: dts: apf6: fix Ethernet support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261013-apf6-fix-ethernet-v1-1-9530efe1d23e@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5FMBSE4VeRs3aSloS4ryIW1JRj0SttiUS8u
 2L5ZTL/SQFeEOiXneSxS5C/S9B5Rmbu3QSWMZkKVVRa6ZL71VZs5WDEGd4hsqlrUzYKVmGg9Fs
 90v422+5z2IYFJj4huq4bM+Rl6HUAAAA=
X-Change-ID: 20261013-apf6-fix-ethernet-c77c390ef0eb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.16.0
x-ovh-tracer-id: 6290121306616026755
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFwwrfl1iPxPmWO6o6uy7jINWKAyMh0x8QwmnQbFs9EgGBBoRnjM3BUaJEZr2O/b+jim7kDcbnaQ7gbObCvdaGwmrI7ygNuePUx2XfOlPU+ynH2L/Y3qjv+8V1sNGQDoWzTS4dPbg8+1q+A4z3650pMSEERHWOc6c7wHIzQ/cd0AAinuhk1ciGuYw2D4AM54rlUTc3EI7eSXJzVYl3OyTQSK/C+/uQKTz4zratc5VMMn5UDog0h/EUCyQxoTf55Y9AhqDDFZ6zvIsDrjC6HgMcTURajxU4gpbIZHaHPJuId6YRUZECM9rjL8rwWeXi3BZLeaf9O0cp/v2LK91+ydBE1Cuw9Pz2sSygtJMQyySiDwFOAUi8ORxeqSMQrjDiQ0hvpyhJSbt0z4x6XkLSR8k+ax+FeuHgblj6pXTpJ2oX8PfgfeozveVLFleydNnQ4oXi0DIU8tXFyC8L29F3qX3iF4UfhYYFXp7F2QZNo/NH3I4mxKSZv0Ft9+Cp+rL/OGDhI08pI5gNytOWguWYqqf3bFQELasVhKUY/p3Pfo+g23wKeyoagsRZk/6PuKX6sw922J8Zhfn9bs8IQkCb137qDmQHpYHwcRHo53H+aZxPyrip2ZmCeGVzf2dAbl/9cXTZ1PO2ntPh2FHu8y6E7+ioS6FxxoaJz9TbW/IvmujYNdA
DKIM-Signature: a=rsa-sha256; bh=3JJebDaF8d0BDkPiP93+YZIa8Qgu2HPfzUYjFA6D8SE=;
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1791907659; v=1;
 b=htzndDN0tLZisLCb4+yCj80PN7xv9g7YXxQHdVwxNFA1I1KYQbyiZdbAzxypK7zIFvtWUdlA
 r+p/WVV+ppUAzuY9Cza1y/KRrwjnBRzj7oRtHamoL4OZoIQbEG3XxkBEHIrdeIpf1KXsfSXMgrq
 2/UbPM+mFpBi2IH1HsQ5viSypY+iiIFKg1drKuXZkQavLVjJhuqIRQm3zouS2VZrbD1Xz6WIxod
 yySiVzNtMLCjy/x0YLJTaXg29Aks8YfKXhaRmr6Nr6MiJWt0mlCrXkCR4PjW8lgmCZKsqFPEfV1
 4XJdz2LUx6I4EgcjawOWbX78kUilhY/TtDYORO48qvGqw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_090749_334897_3FAA71B4 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Julien Boibessot <julien.boibessot@armadeus.com>, =?utf-8?q?S=C3=A9bastien_Royen?= <sebastien.royen@armadeus.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Commit f5d9aa79dfdf ("ARM: imx6q: remove clk-out fixup for the Atheros
AR8031 and AR8035 PHYs") removed a PHY fixup that setted the clock.
Make the Ethernet interface work again by doing as advised in the
commit's log, set the clock in the device tree.

Fixes: f5d9aa79dfdf ("ARM: imx6q: remove clk-out fixup for the Atheros AR8031 and AR8035 PHYs")
Cc: stable@vger.kernel.org
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apf6.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6.dtsi
index b78ed7974ea9..b55a3539fbe8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6.dtsi
@@ -41,6 +41,7 @@ ethphy1: ethernet-phy@1 {
 			reg = <1>;
 			interrupt-parent = <&gpio1>;
 			interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+			qca,clk-out-frequency = <125000000>;
 			status = "okay";
 		};
 	};

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261013-apf6-fix-ethernet-c77c390ef0eb

Best regards,
--  
Sébastien Szymanski <sebastien.szymanski@armadeus.com>



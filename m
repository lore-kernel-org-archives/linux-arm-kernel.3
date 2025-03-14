Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540BAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n+IF7ozOuHRbo7rwX765zhLKBt2dCvj0KZ4Df+uvM94=; b=403EVdy26g5irCmdu1hVjWpKt9
	3VxoX0jsVAYFdrjnRhMGFvajaSlc0Hi0DieNkPsn3pwetLjpdMxqNVbfrapZPSphvEPr0R1M1k+R+
	IEGmK5nsbPmoY2M6ZFWkU/cTgkSqv9gI8xHVK2RTPRHE3D5Pn9nDsGvxoqVCuEqsMhoCaiXcpKM72
	rNLQ3K7wVGUtbtUs5Ibg/Tpr0iQd62jrclBohFCo/ohdaRI4sW7sB1Jfb6NqIBOrfnp3y58esjITZ
	4VoiRINnHIv+rBTbMeRsbfwzHh5j5lgm4DLknVJy/sPG26vtEtw7Epn3qRYCL4OdZbmOQ+J/U7jCd
	Opuekasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7oD-0000000Ejx1-25HG;
	Fri, 14 Mar 2025 16:22:53 +0000
Received: from 6.mo550.mail-out.ovh.net ([46.105.43.205])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7mO-0000000Ejos-3wo8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:21:05 +0000
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.140.244])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4ZDqNl0QxZz1Sn6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 16:20:54 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-zj8mb (unknown [10.110.96.7])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3EFC21FE97;
	Fri, 14 Mar 2025 16:20:53 +0000 (UTC)
Received: from armadeus.com ([37.59.142.100])
	by ghost-submission-5b5ff79f4f-zj8mb with ESMTPSA
	id ks6EBmVX1GfALgEAEG6nww
	(envelope-from <sebastien.szymanski@armadeus.com>); Fri, 14 Mar 2025 16:20:53 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-100R003ae709b19-23ae-4007-881d-73b92853cf78,
                    A221DEE5FCFF6DF9682F22B3F1BEC7AEAAD40A3F) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.148.253.243
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 14 Mar 2025 17:20:38 +0100
Subject: [PATCH] ARM: dts: opos6ul: add ksz8081 phy properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250314-opos6ul-fix-ethernet-v1-1-1c0172949b40@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAFZX1GcC/x2MWwqAIBAArxL73YJmSnWV6KPHWguhoRZBdPekz
 2GYeSBSYIrQFQ8EujiydxlkWcC8jW4l5CUzVKLSQska/eGjOXe0fCOljYKjhFK1YtbaWDU1kNM
 jUPb/th/e9wObJ8NoZgAAAA==
X-Change-ID: 20250314-opos6ul-fix-ethernet-1390c556f3b8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 6297721129035754449
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedufedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeetudffuedugeffuddvhfefjedufeejleekgefhjeeuuedtvdegheeikefhleehgeenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=n+IF7ozOuHRbo7rwX765zhLKBt2dCvj0KZ4Df+uvM94=;
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1741969255; v=1;
 b=mOL+L/T8DYvSoFyvIIJidGZU/d7OjCIh4pn74qmxxp0p7sZf0C2Q9c+hqV7D3DyX8zfJ7Bq2
 3j9gY53vF3fK5u927AfbHLuzHomAYz/NEU/iCq/V1cs/mdc2YF8meUS2fYIhTHZVG/YQm+cOrGj
 d03aQFJpMPALNpC/yiQ/QckiZHS8knJ5+uyiW3kLkHs+Jopc74ge0W9YaUZJTQCbyzX45XvCPxx
 nMoI1hfrFdWQcme3k3L7mqtRjoKY13mIAWhRuXQ21bNM0UGMnnfoX8HAIhqc8Kvx/1Pjf1pOOZw
 YO0rJp+Dawi7Oy9OySNxDE2xy8QWqpRDBH7ET8oGPfBug==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_092102_363354_76BA6699 
X-CRM114-Status: GOOD (  10.06  )
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
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, Julien Boibessot <julien.boibessot@armadeus.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Commit c7e73b5051d6 ("ARM: imx: mach-imx6ul: remove 14x14 EVK specific
PHY fixup") removed a PHY fixup that setted the clock mode and the LED
mode.
Make the Ethernet interface work again by doing as advised in the
commit's log, set clock mode and the LED mode in the device tree.

Fixes: c7e73b5051d6 ("ARM: imx: mach-imx6ul: remove 14x14 EVK specific PHY fixup")
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-opos6ul.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-opos6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-opos6ul.dtsi
index f2386dcb9ff2c0c11e00069b81689c81af7f5446..dda4fa91b2f2cc28ef59e2d6513dc1732982feea 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-opos6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-opos6ul.dtsi
@@ -40,6 +40,9 @@ ethphy1: ethernet-phy@1 {
 			reg = <1>;
 			interrupt-parent = <&gpio4>;
 			interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+			micrel,led-mode = <1>;
+			clocks = <&clks IMX6UL_CLK_ENET_REF>;
+			clock-names = "rmii-ref";
 			status = "okay";
 		};
 	};

---
base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
change-id: 20250314-opos6ul-fix-ethernet-1390c556f3b8

Best regards,
-- 
Sébastien Szymanski <sebastien.szymanski@armadeus.com>



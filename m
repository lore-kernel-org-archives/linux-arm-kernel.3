Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE2BC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZirhegsNlA4cVv32gZFx0umrgQ69d0iaG2KfRICau9g=; b=t8RWAH+LCs1nTOV2l7Avf3z11n
	7xmQu0hUOZtqXrxdD/CtGmGRoM6Hp9XsqLYb9Jrm2nMkph64WgBG+T18farH4HeU5vgUUcTNKUJBR
	0//6FHsugP0eV7vqf0dGp0EGUdV7/4acnqOY8tnvGcie2andTAnhMbyK+oGzadQMhnruv7+OLp5Sz
	iSVu3axsE43mJoEJVU4xx6WzCUrBJWgnN5206UCFGzkkDe1ILg0Vh8ZnAii+gcBApqYl0cPVjNbH9
	Syonai9vT1eI5VZtEQKVi54cI6gy+uS0NMiX6+C7gHa9KuhD/GfdYeMwxdkaQEgAotB1CNOeu0ZKG
	Wr8atC9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5XF-00000000qvg-1DX3;
	Mon, 03 Mar 2025 13:08:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5Vg-00000000qkF-07qI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:07:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B28E5C0160;
	Mon,  3 Mar 2025 13:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4F7DC4CED6;
	Mon,  3 Mar 2025 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741007222;
	bh=KD/u2uj8WkbEL97tLItjWeuPMc7ZQab5ZdYmsWVBdF8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Nq0wc9mPshq8VCggTjzNZISVHcZ4iX0WG/pkAbnAhdY0iu+OXmWJhHQmIz7I+8hQf
	 jZFsbgo2kUQJiGuAzarrlvtP21ZPl1UgLisuRUA3JLeZtA73GWrpI2Zizr8cUgbiJZ
	 53i9SLDsEkVRK7XR2i13xpGZQXaTULLKSPlhqQ1g302pZdKxrenULZBjGQlRmOqTbJ
	 IC2RWx56coREVyBpnUKsYG0vAVKT9Qu1Rr9OAawClystfs6xKQGEDks4kcE8JSF2sa
	 OcPPUFxLgIZEZ7Y9khJZAGklQ7cXevHLEZb8z21tuE2HX6W5rzV82aLjckGWK/MvTs
	 eKyWYY0qBZzpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15BCC282D1;
	Mon,  3 Mar 2025 13:07:02 +0000 (UTC)
From: "Chester A. Unal via B4 Relay" <devnull+chester.a.unal.arinc9.com@kernel.org>
Date: Mon, 03 Mar 2025 13:06:50 +0000
Subject: [PATCH] ARM: dts: BCM5301X: Fix switch port labels of ASUS
 RT-AC5300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-for-broadcom-fix-rt-ac5300-switch-ports-v1-1-e058856ef4d3@arinc9.com>
X-B4-Tracking: v=1; b=H4sIAGmpxWcC/x2NQQqDMBAAvyJ77sI20Yb2K6WHmKx1DzWyG2xB/
 HuDx4FhZgdjFTZ4dDsob2JSlgbXSwdpjsubUXJjcOQG8uRxKoqjlphT+eAkP9SKMQ2eCO0rNc2
 4Fq2GIdzGQD1nF+7Qaqtys8/T83Ucf/OpD9N5AAAA
X-Change-ID: 20250303-for-broadcom-fix-rt-ac5300-switch-ports-776b704ed279
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Hauke Mehrtens <hauke@hauke-m.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tom Brautaset <tbrautaset@gmail.com>, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Chester A. Unal" <chester.a.unal@arinc9.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741007221; l=1355;
 i=chester.a.unal@arinc9.com; s=arinc9; h=from:subject:message-id;
 bh=pnEACfUXw4i/i7KomdhkZyj3vwZ11bi8No1VYOFnwDs=;
 b=qLc0CTqWEMG6zp53x9qNafll5DaO+iOLlCT86V716Yc1ca2n5cHbE8Kbt6Cg9WBKQgh9SCUWJ
 F5fOYwVex56C5CTxFBl9oDM/M4keZbY0lv0dqahvCYqSn3bKx9yQyqv
X-Developer-Key: i=chester.a.unal@arinc9.com; a=ed25519;
 pk=/g3vBAV0YSvcIpSQ052xJbid7nrPXz8ExGKhTEuc6IY=
X-Endpoint-Received: by B4 Relay for chester.a.unal@arinc9.com/arinc9 with
 auth_id=306
X-Original-From: "Chester A. Unal" <chester.a.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_050704_183380_AAFB4C38 
X-CRM114-Status: GOOD (  10.11  )
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
Reply-To: chester.a.unal@arinc9.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Chester A. Unal" <chester.a.unal@arinc9.com>

After using the device for a while, Tom reports that he initially described
the switch port labels incorrectly. Correct them.

Reported-by: Tom Brautaset <tbrautaset@gmail.com>
Fixes: 961dedc6b4e4 ("ARM: dts: BCM5301X: Add DT for ASUS RT-AC5300")
Signed-off-by: Chester A. Unal <chester.a.unal@arinc9.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
index 6c666dc7ad23ef7c31ac22904c39789838caea2e..01ec8c03686a66dd1efa439333f83737fe572191 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
@@ -126,11 +126,11 @@ &srab {
 
 	ports {
 		port@0 {
-			label = "lan4";
+			label = "wan";
 		};
 
 		port@1 {
-			label = "lan3";
+			label = "lan1";
 		};
 
 		port@2 {
@@ -138,11 +138,11 @@ port@2 {
 		};
 
 		port@3 {
-			label = "lan1";
+			label = "lan3";
 		};
 
 		port@4 {
-			label = "wan";
+			label = "lan4";
 		};
 	};
 };

---
base-commit: 768953614c1c13fdf771be5742f1be573eea8fa4
change-id: 20250303-for-broadcom-fix-rt-ac5300-switch-ports-776b704ed279

Best regards,
-- 
Chester A. Unal <chester.a.unal@arinc9.com>




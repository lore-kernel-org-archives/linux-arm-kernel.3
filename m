Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DECCCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0TGR1WogFTAuvl3b2JxHVLD9uWuc1cSp63ywOzxVjw=; b=fQaKrZno/zOAXBKlHl60dc9Svl
	6GpZG5MC7AgmAo/ESkhff0VRp7Wi0EpX1++GO56D52Lu7VjvcQKDAkBmScLTUhNiIjiuojYPbteaQ
	QSV9YUkRL1HlE6a2+l8dqLo4WW3vPCj+0N6nnVGoOOKixpzS5p3NPgLbUy7UPGKeOWCqrIEh9/9so
	95+Zfr4NfNAqJ0RaPajbnVrZ+i0rbQCJuO56LKiy+G8mDgvcDF4KLjwn4X6jAxuvOj5IKLKShS1u1
	nmm5eeJS3UviADKp2xOvu7kQQUuQAWttRkyVpKOWrx7gXJzfgrV+TyGlzsC4Bl9mVWKhMmzoGk/bc
	WzBkWt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqSH-0000000HQMG-2KIQ;
	Wed, 17 Jun 2026 13:37:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqSG-0000000HQLD-1NJB;
	Wed, 17 Jun 2026 13:37:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0499445A4;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A028EC4AF15;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781703439;
	bh=Y0cWCT4yjqLtXogLm+JZvDjfNTCrMoqhAiZrJULbINw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QNQOboHv9ApLrlQupKPM6W4k0uezyUeEnvWzkg4tZANPaDkiCvTz1CATtwSBdu3ik
	 kuGyLKU9TDsWsYxE/3NeEYkTtBEko4Li82D4aixkl0H9+32PktiMIc3aK3W+SMm5U3
	 +oZFlgY28oQJKpmYniOXd7NlUN4v5/PBAb3xHmUVdDcsTn7WJm2AlNJSmxyqhauazo
	 M0aVg+3M36TkcXSjFrmDJMjTaOicblfPB9yoFBAF3Jp1OQPZGpd46nXduKCImBavZt
	 dMxlf8IM3Jz3WbxJGEtF8d0tE1W54DcHUhV+Lw/hkiy+tCAs/Re8abnXiha70BP4nQ
	 4HQhELiXReDXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946AECD98F2;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh1.proton.me@kernel.org>
Date: Wed, 17 Jun 2026 22:37:01 +0900
Subject: [PATCH v2 3/5] ARM: dts: mediatek: mt8127: Fix indentation error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-mt8127-amazon-ford-basic-v2-3-6859e29e72a8@proton.me>
References: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, Zakariya Hadrami <zkh1@proton.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781703437; l=646;
 i=zkh1@proton.me; s=20260616; h=from:subject:message-id;
 bh=0uKY942SYdvjWSBpaLmMsTG1mV/4mbR327xAEav7Pe4=;
 b=hczPIBOrOps8IUGtgnPWx/iCDDqqPQE+srrW4PmFCIEjvSIKKlO+EckSCAY/VlThZEkTihr0m
 CWLwSLKo7CsA7neVAu7Wm13hiIgYiE1YGXp5onOoN/xIpMFKZhKSbjm
X-Developer-Key: i=zkh1@proton.me; a=ed25519;
 pk=9DiJwhINAERP95fbFofXSP77GEnvfO/rMIRRRFDhaoc=
X-Endpoint-Received: by B4 Relay for zkh1@proton.me/20260616 with
 auth_id=824
X-Original-From: Zakariya Hadrami <zkh1@proton.me>
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
Reply-To: zkh1@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zakariya Hadrami <zkh1@proton.me>

Fix an indentation error caused by a space at the start of a line.

Signed-off-by: Zakariya Hadrami <zkh1@proton.me>
---
 arch/arm/boot/dts/mediatek/mt8127.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt8127.dtsi b/arch/arm/boot/dts/mediatek/mt8127.dtsi
index aced173c2a52..bd61ec7e70c0 100644
--- a/arch/arm/boot/dts/mediatek/mt8127.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt8127.dtsi
@@ -75,7 +75,7 @@ uart_clk: dummy26m {
 			compatible = "fixed-clock";
 			clock-frequency = <26000000>;
 			#clock-cells = <0>;
-                };
+		};
 	};
 
 	timer {

-- 
2.54.0




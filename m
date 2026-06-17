Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586C5CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 02:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0TGR1WogFTAuvl3b2JxHVLD9uWuc1cSp63ywOzxVjw=; b=cvSM5wuQ/DTg/KsZrZs81/IrVW
	HfHP7wjFEugcQtz+qQnFsbPTksfFhHBcbRi50c+c9MDZo1dCaVE5FiakdFkBQXd3pwDdel055Qvaz
	BzZulRYQIRPfjAN5ws4Sl0WkF0dvN2zDQ3jL5KP3bV7/Qm5zhwMiTnv9vRUEbYDA7sXSb6h3LPkhP
	o49BZYc0F/w+4XEWqP7+u1W0e1CcyvvShua+GKQO+bLmIpabSpYywMqbcCtPrYHkLLNxeetoWOpxH
	EQWOrIxEpei7OapVCUlUMJFt/DSakxB+pQDisi6J/bZaukgqUReu0AspaQ4LTBqmuxGqHJ9zlzgaK
	jytsrB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfty-0000000GUr4-3bd5;
	Wed, 17 Jun 2026 02:21:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZftx-0000000GUq1-12Wp;
	Wed, 17 Jun 2026 02:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 594A760120;
	Wed, 17 Jun 2026 02:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07961C4AF0D;
	Wed, 17 Jun 2026 02:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781662872;
	bh=Y0cWCT4yjqLtXogLm+JZvDjfNTCrMoqhAiZrJULbINw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rH+WQ72BFm05jT0b8f2f/AZ2CkF722FWJeCCL6PKEQj/sJ/mB++Gug89RylcC+944
	 nR8RLAQ6ky1g6PIcEyKWUErzPUri7KgwemEySi/qqiFgcPXty976lg2nktPe9BYyfh
	 EsNVh4DxR9cgdnDtHv52qIMgNQ/C+8HtwIX3hFc0NPhCPJ7l1AEqc9vwQ0D8PZ1oPr
	 MJlL6V6BLTZ+Vp5yXRBhBC4zjLNZF1ZLUahv3lN+DD3refEDToSR4eGiPhiOZcJKwZ
	 0Vn3F8dQhmRTk2kzlWNn1dPfmI7lCiF/SzuYT5ihlyGo0IQ3SDciF2685SJtsatkhQ
	 kustmxdAmBzEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CA2CD98EE;
	Wed, 17 Jun 2026 02:21:11 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh1.proton.me@kernel.org>
Date: Wed, 17 Jun 2026 11:20:10 +0900
Subject: [PATCH 1/5] ARM: dts: mediatek: mt8127: Fix indentation error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-mt8127-amazon-ford-basic-v1-1-d02ad15ac359@proton.me>
References: <20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me>
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781662870; l=646;
 i=zkh1@proton.me; s=20260616; h=from:subject:message-id;
 bh=0uKY942SYdvjWSBpaLmMsTG1mV/4mbR327xAEav7Pe4=;
 b=xHx5Gn9Gq0Z0wUNlXF28Rbsz7c/kBJukg66Jk3CoI0EZFFvXDvRQeYwk4bHd3VItDoHk/9Nqz
 sx0ekvvZU4EBUsy1ACxn43jcD/VpRvGrJwkl6QRW6xOMLnMQr6xF603
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




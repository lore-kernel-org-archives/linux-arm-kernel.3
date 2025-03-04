Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FD1C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1DbjIk7uHqZkc2lDdI7SDqfEZEMoVKdYjiNEw7yAnPw=; b=Q4ZANm3aLi6v/XSNMFmQOQEW/m
	oW9rlZ/ldpl+Y1FcCDtsx1P4kg1ZjO84rpvR/0NzMktOilz0jlyp3gG0tLRdHX9wv/ZiyVvYzA9C4
	rD34SRje/WAxEvaSyc8S6DiS7sAZZM36n2AA7WEibihQ3GL94wWCtEDBdz72vJUByRvMOwnFo8k5g
	TaekcwAB26Aita79gz7OAmL9ClDktW5oadDYZeB+l+zVOIT05VgMLn/C/C7wQv6ex2EpfGNbvhbH8
	rY6dsjwwnKJ0IdgnNTBFDH5ZXfaSuzzVdw9fvDUsBO5cSLa++t572QlP47eiYEN0RSFZ6Cg86kkz5
	1yvolJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLcT-00000003EUX-3Qhf;
	Tue, 04 Mar 2025 06:19:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLZZ-00000003Dn2-1mT1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D930D5C54AB;
	Tue,  4 Mar 2025 06:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58A86C4CEE5;
	Tue,  4 Mar 2025 06:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741068966;
	bh=2gdXNj/tlPSSHbBqSwyfbWrKXXsk+K7ZabA7kS1I4Hg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=jvR5k2Ej9EovxXEKAhyAqt6wzfek6yiFgrKTjBC3H0dDoJryDUY1jMGaWZ9pzp/p6
	 FXOMUQEOmaCQyxIVLzaxgttKM/KSCqtauWJeY67mrhmyIvbHZycrWK60nri/yvcbCe
	 luMGxaHnVPzp/TAkMqdD/pe3LXZFq053P4pttHwE1C6OAHJUGKtA223k8RYfEIToEw
	 ARogIPObwntyvJphpVNcftNFkM1avQr7DflXHPw2GEaIDJgbCf/USf+d0t9CKBVDa9
	 W1Zj8qlvriJKwFVFijgYHUJPqXpRNPhcMZgqXAQfpeqbi0S7plPIyTzgPQYyWUn5KB
	 TorNk+UB0oTLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FA6C021B8;
	Tue,  4 Mar 2025 06:16:06 +0000 (UTC)
From: Nayab Sayed via B4 Relay <devnull+nayabbasha.sayed.microchip.com@kernel.org>
Date: Tue, 04 Mar 2025 11:45:40 +0530
Subject: [PATCH] ARM: dts: microchip: sama7g5: add ADC hw trigger edge type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-sama7g5-hw-trigger-enable-v1-1-61b5618285f0@microchip.com>
X-B4-Tracking: v=1; b=H4sIAIuaxmcC/x3MwQqDMAyA4VeRnA1kreLwVYaHVGMNzG6ksgniu
 1s8fof/PyCLqWToqwNMfpr1kwoedQXjwikK6lQMjlxLnjxmXrmLLS5/3ExjFENJHN6CTxco+Km
 hxjGU/msy636/X8N5XiSpX5trAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nayab Sayed <nayabbasha.sayed@microchip.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=922;
 i=nayabbasha.sayed@microchip.com; h=from:subject:message-id;
 bh=eJnQC/9attKgZIiaANkEiYWZpDq4uolpOBt4ZgepDmk=;
 b=owGbwMvMwCEmfMj/xNz7ei8ZT6slMaQfm7Uk+2f+9iV2N1Y/lzcXr1/UvOdZyYt864Dq3CtHD
 7Zsfq6/sqOUhUGMg0FWTJGle/P82YZFfzozf3KugJnDygQyhIGLUwAm0n6f4X9R9DI532kSk8oV
 Nsuqv5cwq2CamaXu0ay/qfTGKVGnWlZGhvnHVbi/xlzIq//9k28qi9XuJ+YfEvaLFTSdlV+z/rK
 gBBsA
X-Developer-Key: i=nayabbasha.sayed@microchip.com; a=openpgp;
 fpr=E108A58C09FB2280B0AB41DAE24318EF3B3861A3
X-Endpoint-Received: by B4 Relay for nayabbasha.sayed@microchip.com/default
 with auth_id=304
X-Original-From: Nayab Sayed <nayabbasha.sayed@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_221609_519014_34BB1E84 
X-CRM114-Status: UNSURE (   8.55  )
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
Reply-To: nayabbasha.sayed@microchip.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nayab Sayed <nayabbasha.sayed@microchip.com>

Set ADC trigger edge type property as interrupt edge rising value.

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 0f5e6ad438dd..2543599013b1 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
@@ -137,6 +137,7 @@ &adc {
 	vref-supply = <&vddout25>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_mikrobus1_an_default &pinctrl_mikrobus2_an_default>;
+	atmel,trigger-edge-type = <IRQ_TYPE_EDGE_RISING>;
 	status = "okay";
 };
 

---
base-commit: 99fa936e8e4f117d62f229003c9799686f74cebc
change-id: 20250303-sama7g5-hw-trigger-enable-82b0b3d4042a

Best regards,
-- 
Nayab Sayed <nayabbasha.sayed@microchip.com>




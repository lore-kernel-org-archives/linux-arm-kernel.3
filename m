Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8763C98335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4b1Pw4rq4IAY++skoQGoLvDR+ElbaHO3HpVxVfAz7G4=; b=nhQ57bzsMf8+OcjaS3yIjU3BwV
	odBdm4tPAaGVmtkz7U5P0B/3toLedqCEfYZmZwftXBRESjbs1+66PQIi856eg6A7CuE6K92DO3H3f
	aNKEJ2qxe51HlDtL1HQBxDFnG9cWKsiOSQfGkd3/exT9/Mk4dg/cUst4xRrHgM0rYmU9kbrPeLl51
	MO8JHjcQRDb0u9tzsKxhTXbs2KBj3U+hrIoG4XI0FevKMFQbU+yeuWrgbJgoiw0EI/ajmcWMzqyL0
	vVMMRxR4NdXWtTYGVT3PeeheW2bvpCAzx1LwsFoH8sAQBePeGjJ+x8JgoiGx1BS6PlrtcrxsA17V8
	03d4Jf4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrN4-0000000C3cn-0wVS;
	Mon, 05 Jan 2026 20:40:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrMy-0000000C3Y4-1rDA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38C394437A;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F13B4C116D0;
	Mon,  5 Jan 2026 20:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767645603;
	bh=UtvNcjcIMpGSppUdJOdPW7QXVRLCQ+I0+xxTB6u4/ug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b6mEqIZLhxBaGOqCG6APjpIqBD4l6RADXF22CTXmSr4xLuhVABXLjEUuykbZHfQ+Z
	 wgWzDpf6gVspjQjdxnjGgQBvfRbsZ9ku7+ICjKeebGebNN7iejx4qqJmoDD74T7CbT
	 79rWvah85pgqQxnkY204lLq8BaAV0TVL9tU/4lZlJLsxU/W3o0xr5ID1cWVc5IiZjm
	 fk+n32oV5nOQ2qDT2gMRW6s5TCyRh/iY+9y3SA3l8wqcfnMSjl+R8L5ATVHS8Jp96b
	 UCAccWeV4jHoXbFNLQIqWHBxDF0RMwPw0ah4F6aTJvRQZ3lNOSqqimwHje2T1fjqOj
	 Mev8mb9QWyTUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B16C98337;
	Mon,  5 Jan 2026 20:40:02 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Date: Mon, 05 Jan 2026 21:39:39 +0100
Subject: [PATCH 2/6] arm64: dts: imx8mq-librem5: Set vibrator's PWM
 frequency to 20kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-l5-dtb-fixes-v1-2-f491881a7fe7@puri.sm>
References: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
In-Reply-To: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=749;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=mWjiGD93KU5JQ4pA+53e2M04IxEsYMuhokGFrksgrDY=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpXCGgqttq+Ouq2hv/6Dn4UoLGmbKx102d0r23m
 sd7dnppWf+JAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVwhoAAKCRDo8jXPO9vD
 /850D/9l1AIG6Fq3262RjmKQIbLMBPF2FY+th7kkzgYFngWz0A5u2NRdh6boDdtnOGnRS0V00zH
 NbkDdMa2HxNrHyeym7aY3yl8u2CjCY9u95MPSF2tP3KzdKneriMf+n3aRvDcuL8B+51umwjyCQ4
 PkLfg197GmTBl4TLrSPBI1tsEJ43/LjKUjpWrIuq7N9V55TiJ8oXVQU++8MfQuN5CxgpAhoiR5t
 bcvc+Hup+gU7OUbrGwAI0+Y2ydK9Zf/KrPBJLIVC+XvbjL8KULTVpk7GYQeejaBlaQfK4Xn1G3Y
 nmh0sGLTNIq7FQlIkWOw7R0xHiQuXO2iJb2aOzYN7/PkLmB4ayhOQjMxf9kNzb/dEuVOZzQ04wo
 C3mHsMCScHznwjqnhp9FVkWBLSe4mUjSYVM7+TZB22qRAmkcgoQeoH7A4LFcB59Zmb/PJxO/Msx
 lH0Tq+bU7+UuWNx8E6COQcBQ6IJFwuoRjBrGL+nBNzSzP+P94NQ6s1NvhrDBKn6GxLkL1bWDy/m
 JScZEu9klnyXrChzl9BcE+Wvw1O/euoK9IeMTMiKbhDYb9QlBzKHiGkJ4YLYeFRxcTDl6Cyjn6j
 Dl6Mj8m6uQxtNhobkxrxZ3YaFSHTdPi0Mj1wkrT3ibSFY62aLmO5VlkLzZ4/KcpYxLP1CKLXTjP
 GtGUtV4z6JBxWaQ==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_124004_528996_6BB8D6D3 
X-CRM114-Status: GOOD (  11.00  )
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
Reply-To: sebastian.krzyszkowiak@puri.sm
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

1Hz as used previously was way too long.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index ce039bd701c2..b92b5f7b2bd7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -287,7 +287,7 @@ bm818_codec: sound-wwan-codec {
 
 	vibrator {
 		compatible = "pwm-vibrator";
-		pwms = <&pwm1 0 1000000000 0>;
+		pwms = <&pwm1 0 50000 0>;
 		pwm-names = "enable";
 		vcc-supply = <&reg_vdd_3v3>;
 	};

-- 
2.52.0




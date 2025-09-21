Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C64CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 21:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfUF8zUilXrGYgo9jL3RN5M1s60c0zU2vrztaBkz3pc=; b=foxvnCFx9aaw/L5WFvMam2zhIj
	+BJyPlz1ZmtspkRkpOv21ynipPRYeMdoR8vcLchkFt4DOTCZIojVWqQjhQJBZ5H2ZZ2ZF9GRyYtx/
	8/jVWY8T/G+gRE1ggtq+Xdi3IHMZ47XOTN9VJCNpazv7dEXfn7Og1HMNBbPp6MP+zZpI7fmCiLwzL
	9Uqk4QNVhcxzWRu143d3ugYcBSRT6LYBkwbLMu8UvOqkLpLB5klDkU7qhM8ZyRyfw3RbRY9AeFXPo
	k5Nd9xJdO2ONgZC7mjpfQhM6/EQXJQBOj06GV+nxnU8AviccbM6A8s9QjkZYtETJHzTd1OUvDCRuu
	YIge5HFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RGE-00000008DPT-1suS;
	Sun, 21 Sep 2025 21:06:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RFy-00000008DC0-2d2t;
	Sun, 21 Sep 2025 21:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0AFE44DA7;
	Sun, 21 Sep 2025 21:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 952A3C116C6;
	Sun, 21 Sep 2025 21:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758488761;
	bh=A62YsqWjZSe9kXXL1MOBMy1Bo5w7CmZKPebVTxOJmPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MPBlu7SJ8nFiDSjHY0xvI/Vp/R1avwaw8HJcWjP5VeHWp1KHO3Mlo+oip87zvYAED
	 mviP/Cnr0+uQrYkF0IAywvs0xxvgYbmNglu7HVldqt1lqc0GlnsZf8DLuwPr/jpuTo
	 4WD0JHy85IUtCrQqyMgrQAXezSrtiOmnQQuZn5sQ90QhYmVHt1Xx+Q5vkGfJWOKFIq
	 hvEXoz356mfnsEreXomR6zInCJDW7wQAmE9T49DHPNkmkMZ+nX0cM1JUNKgTiCYqLn
	 JHdOIDyRq3cOU0B2+BbaZQycgLJCiH6u6DdL1WOv5s/hHrGxBWdVwKwNc8u+oZrFbk
	 a7IfKkk+6jWPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EEDCAC5A7;
	Sun, 21 Sep 2025 21:06:01 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sun, 21 Sep 2025 14:05:55 -0700
Subject: [PATCH v3 2/5] arm64: dts: rk3399-pinephone-pro: Add accelerometer
 sensor support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-ppp_light_accel_mag_vol-down-v3-2-7af6651f77e4@gmail.com>
References: <20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com>
In-Reply-To: <20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758488760; l=883;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=yqTWC7jKpb8I52PhxolHfv7gF8MtXmXISaUnHuJbdvQ=;
 b=SxrpwB2hOxDIb2lKlv+QTgKIX8QHC0UN4pNbVBFkISr/PPSkY4PbMxYF4+r0kxqOFYBtyqrKs
 xqmC4O599h/D5UVc5nk96J4JGrFPO6hyFVhsYoOyTFJYZktLGrk+iWP
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_140602_678666_0A9368BB 
X-CRM114-Status: UNSURE (   8.42  )
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
Reply-To: guptarud@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ondrej Jirman <megi@xff.cz>

Pinephone Pro uses mpu6500.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 65ee0b805034a4357a766d4f1f9efa2d4a843d77..21ff12ac5f6e52041f485c9f2702f5a15ee831f9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -544,7 +544,13 @@ mpu6500@68 {
 		reg = <0x68>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <RK_PC6 IRQ_TYPE_LEVEL_LOW>;
+		vdd-supply = <&vcc_1v8>;
 		vddio-supply = <&vcc_1v8>;
+
+		mount-matrix =
+			"1", "0", "0",
+			"0", "-1", "0",
+			"0", "0", "1";
 	};
 };
 

-- 
2.51.0




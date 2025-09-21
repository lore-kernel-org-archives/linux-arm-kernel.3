Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC3CCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfUF8zUilXrGYgo9jL3RN5M1s60c0zU2vrztaBkz3pc=; b=m6OcPlrFkEfrVfmD/nJIJ+T9nK
	dGjz7zds9fYZ6MdUg8CKy+gJNMVmt8QmbuSmAhXZrdpIpVUdwAyWGOff5RbRr0P+PK6DDUGU2V0xb
	3MFPdgrKbjGy9VAKvQDjKW1oA6mGQpGfOJ8d6p33m/U6k6svNFso+fQIJrX9pZcyr7MdTBMlrvkQ9
	194CdIz3bQEyiWH3xo1c2Mo3EjI4XGfHOZSEWtiYblo1hr0myeUsN1/fGRFItS7WA514WZhpynMF+
	XX9CgzdnijpD7iDd8aagn1TZw42MbdjbkOy/bnzLr0aiOh6JK1iG//pKCYFtidcj5UqEcjd5nSM/R
	5J4gV3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0F3X-000000071h4-1wIO;
	Sun, 21 Sep 2025 08:04:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0F3V-000000071fg-4BFB;
	Sun, 21 Sep 2025 08:04:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1864F601A5;
	Sun, 21 Sep 2025 08:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F40FC116C6;
	Sun, 21 Sep 2025 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758441860;
	bh=A62YsqWjZSe9kXXL1MOBMy1Bo5w7CmZKPebVTxOJmPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ry0taYF86t9zjQY20G3YIVi3jEq3Vq7WrCEWNytKVPRy7s2v+ef2yKSlzEaTrDSpI
	 EI5MdvJYjZWaenXnn5EVZwqnTfrG/BqzCDzeyo+WL9o+AGiTEg+72KNgz0sJLcVjLa
	 BW4iS6+djrhVhTw8x+IBWmlYf92rUilu6unHzDr4vUXEzwrJOB5n2JySC7EghZOtD/
	 b1stBqHfLJMQdRTRtSLdCj3Ua1ZhNxmhpxK3Ia1a0og06vZJ2uzbopvDMN7hAkG+Sj
	 sLjXSTdI+HgOR+TU5AG021G8IAY2YR8Dt7MEEyNkASMCIyQ/FtE0to71f/OAn9mt8u
	 ipSlGuA6A3faQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601BDCAC5A8;
	Sun, 21 Sep 2025 08:04:20 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sun, 21 Sep 2025 01:04:20 -0700
Subject: [PATCH v2 2/5] arm64: dts: rk3399-pinephone-pro: Add accelerometer
 sensor support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-ppp_light_accel_mag_vol-down-v2-2-e6bcc6ca74ae@gmail.com>
References: <20250921-ppp_light_accel_mag_vol-down-v2-0-e6bcc6ca74ae@gmail.com>
In-Reply-To: <20250921-ppp_light_accel_mag_vol-down-v2-0-e6bcc6ca74ae@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758441859; l=883;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=yqTWC7jKpb8I52PhxolHfv7gF8MtXmXISaUnHuJbdvQ=;
 b=snSHL8sMKhp8Ssd721h8sYObmysqUVUw5bq/HHvwf9OLUk+k3oZWSZddaSpvA93hbUXD+Ixo7
 Hbk8G1uTsb6AuBaLEeNrchcqXI8N5QIaPP31fVKRL7t5iBqcFVeHyzy
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
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




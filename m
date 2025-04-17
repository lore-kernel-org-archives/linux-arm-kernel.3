Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10481C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 23:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ORTpw2X4PY8KrbU+2FjcGPX4BTuxhr8yqFzbMeNPgbY=; b=s8y6MWBshvV3ycpW3z/pkOqpSe
	7Zj82niAdtxBlraP+bW+FRwK2E2eOMi6BR9kr71WDOVifUK48ycOfODeS7UVI1k0BSW57OqVHdXNe
	05OKNQazQ8YBrW4hyv4lQXXa78dF4+VPc29SBybWfmrQ59Ltu2MAc8Hw2jMVR6wkHe2e8IcDhYsjh
	8sOjtctMRvOBjtlVGC9pxNMho0SaGYwLFQg8Ff/zCTatSG0kvE+4Jsd4JTgf2Is6iGdbfW5oj/ph0
	o3lKzSB0zwPuOI+V7XOpHcf5GIeWa02CUHjmcXIjK7SsADAWVrYSP+ZvFWnQwBZWhKCoeB1phFWO5
	6Yf+goow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ytk-0000000Ed6B-13wY;
	Thu, 17 Apr 2025 23:44:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Yiz-0000000Eaw6-0iCW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 23:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 300354A53B;
	Thu, 17 Apr 2025 23:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31C8EC4CEEA;
	Thu, 17 Apr 2025 23:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744932772;
	bh=NjeDRiJTwUo1cP3hkUv6xDm1gfr1mj3fB9ermM3sWkI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=OW6CQJvs7mRM8Ph4luHzB5TaTF/gDC0wIDwXS+GHSid/HWyY1ZfwUKwWc1BAZgOIq
	 Q3o98pAK+tt/DmxJPBEZuy+EXseDivse2c8XsEUTc7pL/h+VGzVC3FsJqi4FbKvhAA
	 UKA2uDXMHQOtT9j2/8Ege7CcHaLs1ezhtfZCC65c3oBV60Qo614sRF/bb9ajKT0Joz
	 cpuLFja2dsor6zIobA9IS3EVzklgprGS9Dzn5QLu/7S64VbtkNoxDYGbwAcJCcPW3g
	 8hjN65fsgewJ7aAuetF07k+Nb7judNAoXsaBp93TA58OfR8qE3Pe5ADfIvHQIrAa/k
	 8CgSu3zoYTy0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3D4C369C2;
	Thu, 17 Apr 2025 23:32:52 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 18 Apr 2025 01:32:49 +0200
Subject: [PATCH] ARM: dts: allwinner: orangepi-zero: Enable audio codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
X-B4-Tracking: v=1; b=H4sIAKCPAWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0Nz3fyCKt3E0pTMfF0LSwMLE8tki6Qko1QloPqCotS0zAqwWdGxtbU
 AXPuJz1sAAAA=
X-Change-ID: 20250417-opz-audio-890849c8bb2e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744932771; l=1299;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=k/eQQFQjUWyBWBOWbfy/ABZzzwLp3ynUUvGy69783PQ=;
 b=XFDURnfsrz3fEywg3lhFqDKzoRTAi/FcZG9XBdQ96YdDa7CZFBotwe5QPeCWFtnsRKebQD/SK
 u4ZHjkpmgcCB6noff2Vt0VoZe7aulUZBUyOZs83ORW4NTGoV7Puxm/G
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_163253_232061_244A3523 
X-CRM114-Status: UNSURE (   7.55  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Line out playback and microphone capture work, after enabling the
corresponding ALSA controls. Tested with the Orange Pi Zero interface
board, which is a (mostly) passive adapter from the 13-pin header to
standard connectors (2x USB A, 1x Audio/Video output, 1x built-in
microphone).

  https://orangepi.com/index.php?route=product/product&product_id=871

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
index 1b001f2ad0efd2e77218742efe6d8edfdd18a816..d65ede3dd6ed1206248a39c91e46065684e7ba29 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
@@ -112,6 +112,14 @@ wifi_pwrseq: pwrseq {
 	};
 };
 
+&codec {
+	allwinner,audio-routing =
+		"Line Out", "LINEOUT",
+		"MIC1", "Mic",
+		"Mic",  "MBIAS";
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_vdd_cpux>;
 };

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250417-opz-audio-890849c8bb2e

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>




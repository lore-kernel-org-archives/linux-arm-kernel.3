Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39099C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8mmxGk7xx59lcCfz0o6Dq9Ong00dSSEccWw7MQ4Gnso=; b=4NmeTPUSLwoWLP1hpEAsiu8G6z
	ns+/TdGaBcHgvJD/LoeIklmKvjuI2Onnh3C56wJUNtSUpLdMM6fbq2ePpY4yv/PRfwonRf2Y4WHmz
	AXYFRXNVhshSAFo3U3g6ESKE5aIUsL9ZYzRPveXgagN2ddU9h/KydpQsYm9D+W3h/JULb1sf6oQlZ
	imQGrkEU/jzIoXBV/tO2yyPeCZfIhhsn/XuGNzaS1vvqbb9KRn70OTnHv/UGIHU88KSpFZlyb+PBe
	oNZpB6oaRnhyV7O6sWwo0pbebDvC5jthBvZLmnUOy2a7iPz7DDdIKYGPFlvev359Dm4fvcJAuseBO
	4t9ycWtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57Ma-0000000AXxz-3QIB;
	Wed, 16 Apr 2025 18:19:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u579U-0000000AVYn-1jvA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:06:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B46F5C3A54;
	Wed, 16 Apr 2025 18:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF97AC4CEE2;
	Wed, 16 Apr 2025 18:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744826782;
	bh=PVkhubuFxAaW2HEyB3Yl5c1VtK6NW7DIrcdAG8enNZc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Im2xwCnbuWvXprxRMFN95uCNBl4XFTCLZC5G3/pNuuqiITId0KO4AYAhS49Bfljri
	 U3+tG0xNx4jDl4XH/iM6UUCVlV/QE378Y4zhkcHMv0raFO6cVuOg1CAw8ZyaGYCYiU
	 glfjWAcaNQt0/RdqWGH6PC22Y6LKk3c3uCUlUvVUzLQefupDJt8/5s0pb/Q0OFnLt9
	 AhdNdrvB5fmJqlAQRGLgYuOqCk0uLsPrTxtKChK+MQd7cNN8W6gTCMejvWIDmsdzte
	 NoLOAMUZE4jqdJlnyJNc0uQF2HAvaP4Wwao26xK1iBQbJkRThTR9CaRo/l8jmJYnCZ
	 IrTQrCVfVhUTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75D7C369BA;
	Wed, 16 Apr 2025 18:06:22 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 16 Apr 2025 20:06:18 +0200
Subject: [PATCH] arm64: dts: apple: touchbar: Mark ps_dispdfr_be as
 always-on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-arm64_dts_apple_touchbar-v1-1-e1c0b53b9125@jannau.net>
X-B4-Tracking: v=1; b=H4sIAJnx/2cC/x3MywqAIBBA0V+JWSdUmD1+JUJMpxroIWNFEP170
 vIs7n0gIBMGaJMHGC8KtG8ReZqAnc02oSAXDUVWlJnMlTC8KqndEbTxfkF97KedB8NClbV1TSU
 dNhXE3DOOdP/rrn/fD/MfiopqAAAA
X-Change-ID: 20250416-arm64_dts_apple_touchbar-658cd974de97
To: Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nick Chan <towinchenmi@gmail.com>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2090; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=vW+HnwVsI6HKFCWS8Ni6G5ezcLgPyLTobLTnqE3VCiY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhvT/H+dWvp50jXemd5qQ38RFF3hTijMsYu7mde2Ydziu+
 KpFdK5BRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkY+zH8z965537Wq0sasRts
 wlRYNmew7NDQK/Cxvlme92LpL6YWXoY/PILfNx+xaZGRT/UpC81uWrzrNUvCNpd5TLmLLgRUvLj
 MAQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_110624_552257_EDF19F59 
X-CRM114-Status: GOOD (  10.25  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Janne Grunau <j@jannau.net>

The driver depends on boot loader initialized state which resets when the
ps_dispdfr_be power-domain is powered off. This happens on suspend or
when the driver is missing during boot.
Mark the domain as always on until the driver can handle this.

Fixes: 7275e795e520 ("arm64: dts: apple: Add touchbar screen nodes")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 10 ++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 2dfe7b895b2bc0a913e73141e558fa5124a13b2e..e2d9439397f71a93c28b75a7eea589f4bcb3e374 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -77,6 +77,16 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/*
+ * The driver depends on boot loader initialized state which resets when this
+ * power-domain is powered off. This happens on suspend or when the driver is
+ * missing during boot. Mark the domain as always on until the driver can
+ * handle this.
+ */
+&ps_dispdfr_be {
+	apple,always-on;
+};
+
 &display_dfr {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 3d73f9ee2f46a35a3b23da5b233ef316c7372ef7..be86d34c6696cb47d31696541266e504cee8ce10 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -40,6 +40,16 @@ led-0 {
 	};
 };
 
+/*
+ * The driver depends on boot loader initialized state which resets when this
+ * power-domain is powered off. This happens on suspend or when the driver is
+ * missing during boot. Mark the domain as always on until the driver can
+ * handle this.
+ */
+&ps_dispdfr_be {
+	apple,always-on;
+};
+
 &display_dfr {
 	status = "okay";
 };

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250416-arm64_dts_apple_touchbar-658cd974de97

Best regards,
-- 
Janne Grunau <j@jannau.net>




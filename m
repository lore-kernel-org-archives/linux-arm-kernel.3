Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454CF606EE82
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=snqNe45S;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2BMPAoc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tBXbAkaPauO/t+CrWaIYHzrmfu0tKOxa9L0c762SX8c=; b=snqNe45SeRGMXO0AmmcwFtSVy6
	A0BWoaeQjPcpgk+HTVNqnk2324rA3m918RRRNFGL37O53dhXN3bt0SIo8QML3LuKBX3NmIBFgJhQX
	txkDQFsfKG0fLMH3GxmL3xnIpn4eb8Kj9BsRU1oh0N0MskZU/i4vGM/8xNbp89gs4nshhY0pAe8Qs
	AXw6TVIK3r4qM6tjFaSxblZmqGuQPPUXl1JsKyu9IlwebEfc32BwwjU/qSDjNK40Tz+BAAZKNcpc1
	WFFiRgevCYjOiv9BPexBN3bfXMqv1P1CP7qv5I34tjpNnSVLX4+W8D7bQGkC7oI4lZO7kQEIEtRBN
	3xQDDD6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJI-00000008ZLx-0yUH;
	Thu, 05 Nov 2026 11:07:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJC-00000008ZJv-3j7K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:07:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81FCA419B5;
	Thu,  5 Nov 2026 11:07:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793876826;
	b=cs1HOWnn0QPOcKYr+3L9Ffu07/k8MJU97vpL0kySmjaX77w0IhANxhQhFO/X3MrK3fTh
	 ein5SDySK07U2HPI6vA2o6Gknl58/FNAReX1vCygPn026zz2x/fTUC2ZkOcg9nlzAyxzQ
	 b/FbIk18VOnVRW8noc/cUfjLqtvSe/+7BSicEwCxg5V6yX65ZG+m3sAsj1rdA6JMVarwM
	 siFsI/4L2/u5riXJJEh526NUKAVGsTItWwfhMTdqlT8Y59vp95NjI6IKPZ8s5tR7lZZxB
	 ph6MfDEg/rslSB3WxYs1eHDlsc7yJw3k0xuzUYmWPF6oEq2o5JxmLwbcIW/+On+OxMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793876826;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tBXbAkaPauO/t+CrWaIYHzrmfu0tKOxa9L0c762SX8c=;
	b=ScjYiDdQBi+JqWGntDMEAbB8UI+pwzg+OvwU9U1uOIB+wCgyGxtLEnQ/MstgC2ouNTfa
	 56HCegQ206yr9Xxpa+rE8Lw31msvDnxajyoz+DmsfT07Ag4BuYyTHsL8OAMVvFo8LNbZH
	 pB23H5SvxnZ9sUYhGptjH1RBz2wIT0/rFeB85zu7fQ/x4WP4UO3kJNAqXf1cR2PQuqg9K
	 4j6QX7n+36HKZ5yfmZkLvNoTXNwZKA7w60EPYjWDvCWuG0jHeYU2C36Wl5MiODw9+/r0i
	 d+YlfDY878LuW+UUu9rxOung7iQKZBw9uCLPORT7PJo5CLSjv0TPJKD7hIv4hLNqLag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D85711F00A02;
	Thu,  5 Nov 2026 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793876826;
	bh=tBXbAkaPauO/t+CrWaIYHzrmfu0tKOxa9L0c762SX8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j2BMPAocDYMQivjJRrMUmpL1QRkYiVIKg2ATMiKBheO9SDjdDBdKkxEyeW590ohl3
	 BcTNT3IBfUH4UmiTgjjf231BT2wWVBdFEKvFC8ojxXzxTOJQNMXxmPXz7NgaeGiJJa
	 0CokYhEsq29t6Q1WknMMilGOJPVpMJy93A+38ztdWSIN+0ZMos/EZlI0THMTjLUIQO
	 C0ljCL62AW3DJABIWjR7I1cZjV0FjJ63NLE1bU23b28xT9gSD1nE8Fqh3wk6REfVIV
	 n471E0Um+HAj6AHuy4qc1Idn8mCVXrpP8uHXoKPbuWYZ6V9KekGdkzmjTWQFTWFpBo
	 948N1tEF0qbKg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 487A847204;
	Thu,  5 Nov 2026 11:07:05 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 05 Nov 2026 19:06:35 +0800
Subject: [PATCH v11 1/5] dt-bindings: arm: add Ambarella CV75 platforms
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-cv75-soc-v11-1-aa6ee0b2380d@ambarella.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
In-Reply-To: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793876823; l=1278;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=3/nmC3518iJUv3pa+4TrYyrJ8fmY9AVoXsn+4KhycZM=;
 b=sHGDFju4cllJ5Y9Odms3t4EBMsH4RYnVLSgBITJ0YNXgkrWA0vc7OuwcD2CK0z537nRpvXvgs
 MyYgPxHpgikCDGR2JRfTWtgvNWqEFR1Es3ev8KIJtqodBbB2pQO2EnY
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Long Zhao <longzhao@ambarella.com>

Document the CV75 EVK board compatible for the initial SoC bring-up.
The ambarella vendor prefix is already applied in the devicetree tree.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../devicetree/bindings/arm/ambarella.yaml         | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ambarella.yaml b/Documentation/devicetree/bindings/arm/ambarella.yaml
new file mode 100644
index 000000000000..72946e94fa76
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/ambarella.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/ambarella.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella SoC platforms
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+properties:
+  $nodename:
+    const: "/"
+
+  compatible:
+    oneOf:
+      - description: Ambarella CV75 boards
+        items:
+          - enum:
+              - ambarella,cv75-evk
+          - const: ambarella,cv75
+
+additionalProperties: true

-- 
2.34.1




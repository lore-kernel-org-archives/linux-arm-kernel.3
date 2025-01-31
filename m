Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936A3C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpXIxb/MdG+ObimhZZPZ1lZIvIZbSlS8h5Q34NbFtkQ=; b=wf1P6k2I3r8VviEienQi27xIcb
	QuFiVJrCmCEvvmsABo0ij7g3/sfqmdnXQyCHEYIa7x4QMJpUaMue9++TYeKqQk/1md4mJ6WsrZ5Iw
	8fsbuoQ1XsXPF8BmOwaHnxinAPVLhq5zZNoob8kxpqUrNnP7DKn7qbdrz9xa+/Mv7k2iI8kVXPG6O
	7EISw6xevMMIcKO7i6+v087KmxsqQNEgJoFhhiiF9JFDO+4RMbERlqyf9LjHCjbXXc9XJw0NTTxdo
	plqoE7bfUiSxNVYB2T+q6jmtfRWStrxhbJvgS/eGar0fy/KLdEH5r814cPHtN80Ru6IA3Q2yJdH8q
	b/APmo8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyKQ-0000000BR1t-2pIo;
	Fri, 31 Jan 2025 21:13:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyFx-0000000BQFK-1q0J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:08:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1FA42A41D69;
	Fri, 31 Jan 2025 21:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C86CC4CEE8;
	Fri, 31 Jan 2025 21:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357732;
	bh=pA+myvP/+kW1tdoHHa/+v6g0X2wfWCQZqyzpEqfgcMc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ohvzy+TabFrY6iS6xeJZEo4sxmIOz0CCgw/N9/H4opjDL8Mg+x+jq2Iw5bRy6wCD7
	 T84n0CStOA1aHBbZvKmg4wngVDvh9rmnkk6KOlPSkZzXiZZ2VCX+mUrL8upYQ/coaB
	 ZkQLBBBSH35F8G7qlXYTwR/hCIos52dcyyxa6jReOcq9HVC7Vro91wDLym1MFVEoqx
	 xG3isCLOYOmvJQGG3qwAu/oVtc69k/cuOhdk6VR+sbGSQmUKLod2hKdTMTYu9QBDyS
	 SYKqVexA/e5CqaWqo0GPhkXmNZbIE+XD7tZbQUYN/nehrD2rxX82nOej3+RSY4g3aW
	 GazuWSp/T2ZPw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 31 Jan 2025 15:08:26 -0600
Subject: [PATCH 2/6] dt-bindings: marvell: armada-7k-8k: Move Armada 8KPlus
 to schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-dt-marvell-fixes-v1-2-55f9f6acd4b1@kernel.org>
References: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
In-Reply-To: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_130853_557440_11552C25 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Move the text binding for the Armada 8KPlus to the existing DT schema
for Marvell 7k and 8k SoCs.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/marvell/armada-7k-8k.yaml     |  8 ++++++++
 .../devicetree/bindings/arm/marvell/armada-8kp.txt        | 15 ---------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
index 538d91be8857..f1a7e6576306 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -39,6 +39,14 @@ properties:
           - const: marvell,armada-ap806-quad
           - const: marvell,armada-ap806
 
+      - description: Armada 8080 SoC
+        items:
+          - enum:
+              - marvell,armada-8080-db
+          - const: marvell,armada-8080
+          - const: marvell,armada-ap810-octa
+          - const: marvell,armada-ap810
+
       - description: Armada CN9130 SoC with no external CP
         items:
           - const: marvell,cn9130
diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-8kp.txt b/Documentation/devicetree/bindings/arm/marvell/armada-8kp.txt
deleted file mode 100644
index f3e9624534c6..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/armada-8kp.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Marvell Armada 8KPlus Platforms Device Tree Bindings
-----------------------------------------------------
-
-Boards using a SoC of the Marvell Armada 8KP families must carry
-the following root node property:
-
- - compatible, with one of the following values:
-
-   - "marvell,armada-8080", "marvell,armada-ap810-octa", "marvell,armada-ap810"
-     when the SoC being used is the Armada 8080
-
-Example:
-
-compatible = "marvell,armada-8080-db", "marvell,armada-8080",
-	     "marvell,armada-ap810-octa", "marvell,armada-ap810"

-- 
2.47.2



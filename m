Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BF1606AB2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aqL89oP4;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=fQwPSBpU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xBtco3yaw3qEzXnfIqoE7d0Ook29poapW94M82D2xPU=; b=aqL89oP4bXMfz6
	9zE6Ovic4Q/9oykFdClPXFT/Mq4OvW1KCCFd3FljhGnY0VXJ07pxBewI4eZaCFrmRI/xqGJ9X3g/B
	kj6ThB8jEDmeo8/s+aDzeLnxH8uH5GgVzp+Wn/gna8mrFJHaIn8C1ex5XkusyCt/02qVFvRFxQJ9E
	/4XgbFT8dSvifXnS+TCWJZOUwIBdvBz4yCqQpAnpIJDLydU50nEec9a+3AoU5T3257Rwgl8aXHXTc
	gMjTPWUVXzxlcKd4C4HpdbrsyeshxB8hRNyD7AxxvFJ9VhoQXDBwasFHkUrPb9AAQDRj0DZQ3TQvk
	LTGnjj8TkoaPmaBl+2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5U5-00000007LIW-2rF7;
	Wed, 28 Oct 2026 15:22:37 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Tx-00000007L86-23F8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:22:32 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261028152226euoutp02e2d99a9974243a21252659b3cd571681~iusKwxdiF1405914059euoutp02n
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 15:22:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261028152226euoutp02e2d99a9974243a21252659b3cd571681~iusKwxdiF1405914059euoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793200947;
	bh=xBtco3yaw3qEzXnfIqoE7d0Ook29poapW94M82D2xPU=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=fQwPSBpUAkaEsyUCQ8rrhxlmIAkTBNxkPuEgbG+gG3aOm6HHfPWc9RMqVhK9J4qwY
	 r4oD6xTY4JUxACnPovdtFm3WyAAqO3BL8vLaaClPD9mWfOiWUWDHlkLKMfQr/HW2QJ
	 PYxcITTU6peVRe7kuEi1ejqICeAKFyQqlcLEqQ7A=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152226eucas1p1d17fa9350e2d480774843e5b9e78fb37~iusKa4ztM1685916859eucas1p1c;
	Wed, 28 Oct 2026 15:22:26 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152225eusmtip16d6428135e48edb5558e2cbfe49d21ca~iusJm4mEe2037320373eusmtip1Q;
	Wed, 28 Oct 2026 15:22:25 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 28 Oct 2026 16:21:41 +0100
Subject: [PATCH v6 1/5] dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-jh7110-inno-hdmi-phy-v6-1-f3379684d97e@samsung.com>
In-Reply-To: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Emil Renner
	Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=WSoM/PLgxIAO3P/HP4El0/pBeW1xIxFbcAyyXD+Ha8c=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9EjYQKrk1N7aa4wx7YUij4xrX0wvezhLa4u1Tvszj1
	ttgJXOujlIWBjEOBlkxRZazG6ONJP8xPC0//vgXzBxWJpAhDFycAjAR40uMDB9e3f7AwHDgHr+p
	vXKjo+9VyeuvreZVLtXQ3Rpn/SNpJTvD/6pz/6TnXMx1FtvNzcvDJZt7KNSqQmzjvGy1fKboc4v
	KWAA=
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261028152226eucas1p1d17fa9350e2d480774843e5b9e78fb37
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028152226eucas1p1d17fa9350e2d480774843e5b9e78fb37
X-EPHeader: CA
X-CMS-RootMailID: 20261028152226eucas1p1d17fa9350e2d480774843e5b9e78fb37
References: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
	<CGME20261028152226eucas1p1d17fa9350e2d480774843e5b9e78fb37@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_082229_841850_3F440402 
X-CRM114-Status: GOOD (  14.43  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the dt-binding for the StarFive JH7110 Innosilicon HDMI PHY.

This device is a child of the starfive,jh7110-hdmi-subsystem node. It
functions as both a PHY provider for the controller and as a clock
provider for the variable pixel clock (hdmi_pclk), which it generates
from its refoclk.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../phy/starfive,jh7110-inno-hdmi-phy.yaml         | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6417553e0f5ba295b0451301ca7c1a25534993a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Innosilicon INNO HDMI PHY
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The PHY portion of the StarFive JH7110 INNO HDMI IP.
+
+properties:
+  compatible:
+    const: starfive,jh7110-inno-hdmi-phy
+
+  clocks:
+    maxItems: 1
+    description: Reference oscillator.
+
+  '#clock-cells':
+    const: 0
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - '#clock-cells'
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  # Shown as a child of the HDMI subsystem node; see
+  # Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml
+  # for the full node.
+  - |
+    phy {
+        compatible = "starfive,jh7110-inno-hdmi-phy";
+        #clock-cells = <0>;
+        clocks = <&xin24m>;
+        #phy-cells = <0>;
+    };
+
+...

-- 
2.34.1



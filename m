Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034CEC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 20:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r47px2LK1MaSlDpFcSezxdMNmccxTjNecKxUSivvSho=; b=iiYoSXCqbpWosq8seRwBKn4ofT
	bF7tYu0Jj+KlJQ1eyN7U8CPhfBB+AHlts5Pzz+LYGRYrBztMEQJMQ9SrJrK4/Pk3h6NO8hT00syAP
	Mh+I5wyjQWx/le9RQwC4LhMKfjo+OpN/I+d7y4/A7In5kJ5RT0h0ChWhpCep01ypDNGSYp0fCp2n6
	FPIxDO3Wzs7l9CXmclz+eTOMqz/rR/PlKaftV8mByXH97fc7JMkLjRZHFVJMnCaonmqM5dtdP926n
	PLXi/1XNME2d73nQjpzAS+0ca/AlQDiMi5Ql6aujr0ON928/7gi1jPpbbRXGZ2gUF9T+KxKhY7zQM
	Z3viZ8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wVa-0000000A5e2-03Jm;
	Wed, 16 Sep 2026 20:45:35 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wVW-0000000A5d6-3bvs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 20:45:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4278910485C;
	Wed, 16 Sep 2026 22:45:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789591518; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=r47px2LK1MaSlDpFcSezxdMNmccxTjNecKxUSivvSho=;
	b=MsM6wl976XxP1ZAiDG1peEfD7V9q9HgKjY9MpQcgPdjTEWDEDgfb/yaUvZMDyIySuLQg3Y
	thS6aq39W8OW+AiefX7ZW5UNClayP/hs8+3cLzR6AefXSSJ953v1aSoq5dlkYtvvQpWkvm
	Juo1Y8vksOvSLWY0hxTXdAm1VgNyYJHvLLWOZ10sqFeC4u0FpLHRVw7CWme17JN6U70J21
	jEaS9JRbmlA8PCGNsBSda5Q3E2pqT/nCwNg4axHbl8HbL+eCAuowPPPNImvSQmvzuvwyvP
	Qph55c6LGntM2hefCbl7YzF2oorwRV3k56QPp3LTR6dBXhc5CvhEeeckFb0ioQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP VHIP6 EvalBoard
Date: Wed, 16 Sep 2026 22:44:27 +0200
Message-ID: <20260916204509.166633-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_134531_045537_C1806ABD 
X-CRM114-Status: UNSURE (   7.28  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Document ifm ZynqMP VHIP6 EvalBoard reference design binding.
The board is populated with four ethernet ports, QSPI NOR,
eMMC, UART and USB host interfaces.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: No change
V3: Add AB from Krzysztof
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2b35..49ef4e0c68501 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -44,6 +44,11 @@ properties:
           - const: xlnx,zynq-zed
           - const: xlnx,zynq-7000
 
+      - items:
+          - const: ifm,zynqmp-vhip6-evalboard
+          - const: ifm,zynqmp-vhip6
+          - const: xlnx,zynqmp
+
       - items:
           - enum:
               - xlnx,zynqmp-zc1751
-- 
2.53.0



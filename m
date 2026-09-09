Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E010C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QWmB/VSyokIGvVRWumP/+sjSxE2iWjDgbQnn5Lul6MM=; b=bd647yaM2BGFeHZmCcgIPyTBOD
	2dRLpjyViS/hhzY6O+3hwfYLvK1/haaze5NhKtjO5C8szrotz4lQLPmgKY/zRzRsWOc8B3Q7V/K0W
	+o8gRfprR8Mkf5AL+tRxJgkycciyz00X78LbI+V3EbJ9Vnwrrnv9G5byVhkLrlPAGmBAOK+XqrTCI
	zy9N+VI7+4OC6QYHRrmAbEKZmFatQdYDvJYFmRPRMxSJTtpx2Gii3hIJr7tL9oPC1e8SEHDYpAiy7
	nruLUtx7Tb5tPqNJ101xmZCS8Vl81I3L4ksW64c2jOJXVExu0JpVZoOBX23qOFWk3H2FkqrXktbOt
	FTkbIb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LPd-0000000CMrQ-0Xoy;
	Wed, 09 Sep 2026 16:44:41 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LPZ-0000000CMqO-394O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:44:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDB23101EA3;
	Wed, 09 Sep 2026 18:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788972271; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=QWmB/VSyokIGvVRWumP/+sjSxE2iWjDgbQnn5Lul6MM=;
	b=NjETiQxMoOZs2OeK+uW8gfDtpodsZUamP7h7bh0Lbz/LanOuhJBEv1IAXyG3zgygYANLAK
	6XQnxK+d/liTztzLcofhU061xKBAs+UsS5+rtEUDF+396nAR+M4I5MpH2Z7iDXqLAvmLtS
	TqhcVvXlkENaTNbnrBkUjCwEE42WYJrDRYACFt3fPUIWdJe14bj7KshScTh8Exw/gC4kdQ
	GhBXDwrgQ/MZJ/uuE8kk/xoiaw516UU4worK1pj9h/n20uHjiRGrKUnzCuu9Aes9vyHBqx
	aFg+H3pRDnNWBmTzbHWGH3HYpNnXNtdvS3gEuwn/ZqSWPdcHw3q5wRdtqHn/Sg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP VHIP6 EvalBoard
Date: Wed,  9 Sep 2026 18:43:23 +0200
Message-ID: <20260909164423.97288-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_094438_011979_35129098 
X-CRM114-Status: UNSURE (   7.14  )
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



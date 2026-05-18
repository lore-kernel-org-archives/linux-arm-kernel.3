Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF08CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9pzCnUAgpCJo/n35rVhS9jWsC1cM/O7g5lBt/Si4KE=; b=45ibQwgizjRpJS0E2kfggeJnMV
	1UNCUhMWWtQhm2A3lJdZ7ws7xZ7uZVRaBK8VAOxi4/mIVe2sMrqMbCMzbCVH+9RMCTTTl4GZsZ/W5
	+slBS3Vv13wmjvPssZ9LjqgEGFjIsF+7Ua3Htt0Gj4fwtyrkZ5JHa44PkXG+/LmfTnEJo6v25kG2O
	2/Ic0A60mPUl/dQMMjdRSUcc2+2Nii6rEhF5aFcroGrCXCbyPzvGcfLfyrFeycHHTP+b/Ps9VFn4E
	aHr2n/7Ec5yYr/ry47hjXHIf9jYIwZcAAvcou/HrGo6uIzTfOtOntjhJLo41BTQTOGVtoCuGzVS8P
	Trf/FwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzzA-0000000GAs1-13W2;
	Mon, 18 May 2026 15:34:28 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzz8-0000000GAqz-2QLo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:34:27 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 768551F80041
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 15:34:24 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id E2CB4B407FB; Mon, 18 May 2026 15:34:23 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 43B41B407FC;
	Mon, 18 May 2026 15:33:41 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v9 1/9] dt-bindings: media: sun6i-a31-csi: Add optional interconnect properties
Date: Mon, 18 May 2026 17:33:30 +0200
Message-ID: <20260518153339.619947-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518153339.619947-1-paulk@sys-base.io>
References: <20260518153339.619947-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_083426_773669_325C6606 
X-CRM114-Status: GOOD (  11.20  )
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

An interconnect can be attached to the sun6i-a31-csi device, which is
useful to attach the dma memory offset. Add related properties.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
index 1aa5775ba2bc..978ef2dc0ae7 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
@@ -40,6 +40,12 @@ properties:
   resets:
     maxItems: 1
 
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    const: dma-mem
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     description: Parallel input port, connect to a parallel sensor
-- 
2.54.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DACCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 02:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkeP2m3y81BmBqAzeVGSHW+GitZ+LG4b3Rv5WVj5sfY=; b=PUOIA8heNG0Umg0Z8E1YDIoSMc
	CnI6VjlV3ssGOfUzm1/VTj/ZsrrfuhdIC+pOoG2UheLQS0h+flwJXPUTi74d+P+UH9piNfkfEJezR
	M3pYmOiLm5WihFGV3JHsPYVKasky31qh7U8dYLaFvqH6QCxufQsnfs4pmhjQaM7PjcH0jgJ4anG+5
	MuDfWhWlbinNNOmcgJZcMBm0J+UBBjv1wYvLd8GDQFhDQuVYLuw2vDheJEaTpttwyXrh1+ZgFdWQo
	4NRkAYOb2jPWnNZLtugt6hQOr0b2SREl2YGbCA/N0iYCyoh1qhut38zxiCQku/rSbngll4/j7Gctf
	1FO1017w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1PO-0000000CQM1-2ERb;
	Wed, 13 Aug 2025 02:40:10 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1KM-0000000CPx4-0mdQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 02:34:59 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DF9647A00C4;
	Tue, 12 Aug 2025 22:34:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Tue, 12 Aug 2025 22:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1755052496; x=
	1755138896; bh=CkeP2m3y81BmBqAzeVGSHW+GitZ+LG4b3Rv5WVj5sfY=; b=j
	lhGdGtT7nkkpSOtYqdlb43MAMNOUJTvUy9/TeA8jt/5ThK+FeN3zfM6ojbNJyl5U
	c52sGn1OsGmgFcqkt3dpsZIyUJSstuBhY4D7FZXEWVLsDewNatVw2hnv9pTZwZpn
	xPuFUOjRlR5f/IKvE+JTyRosQapu9hhpbz63l6/+7X0WxqvAGAFG4zARbimwHGPV
	iJL1FMKqgikbo7j7bqW2JvaraTuLvdR1LoSq4ZUJdOu+n3wTng3q1/Kjr7BU/6qW
	xCG0Re6gCBNixdRT0uJiz9emj5YR9CUKGxAguKKXXRVFms3q5cJN8qIfl17Z7qC8
	L4FKWV2YFnEpmTUJaYUqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1755052496; x=1755138896; bh=C
	keP2m3y81BmBqAzeVGSHW+GitZ+LG4b3Rv5WVj5sfY=; b=f+ktbM7oVnMA+yt0t
	3IOh19JKIz2GpXoptppxG+pZSXC2Ks71F6DeVZ+OmlDhLQYuuQlwZc9K7XaTpUgv
	SiAbh6BVAnIFQPMKy4kg+snyU1YhEL+ufwJKaZ50xvq5E4Fo6Mm19iziXsXqfMf4
	//sRe/Q2NCxPurqxIVEa0IQugVV7HWCyNzwBYH8nqXwY92vqTzepaj609Q9IWLJf
	UknuM2Rf85p39mrnHMUeI5xmYFlCoP8sbTsft8ISEi4cfp3KtJFCo2NQTNR9pHop
	jhNlFEr42dBXwNFwUBrburFqhoKEHpjaWkguGNDegHM+0+3ahiKjQ5MN7CfRihvR
	zA0Pw==
X-ME-Sender: <xms:0PmbaCh3RNuvP1p5Hl7_69ezyZaOPudEe1LPSUBFTh7XHcPuRF3HGg>
    <xme:0PmbaJz81-rYDFcArhSsiF8INWG8fVflvHwDjfBMT-JWPCtx6xxWcJk3Ns_M2bEat
    k140J9-RrIMvP3C500>
X-ME-Received: <xmr:0PmbaL2WbmXpTt5kFIP6FXAtUDie4hZSsYLIzbO_2MunUpCQ-a5htwga2dL57BSXEm5gkUXi9x9rYk81x3qq5i4vPFcm5rx4M6AlwLrg-4RGbuYxD70wUu0cJjRWfI3_F9ucr5c9-joRbzqVKWP4uGq5r_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejtddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrthhhvgif
    ucfotgeurhhiuggvuceomhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghuqeenucggtf
    frrghtthgvrhhnpedtveffiefhgfduiefhgfduuddvueeukeetkedviefhgeevlefgffev
    gefhgeeigfenucffohhmrghinhepthhrrghvvghrshgvrdgtohhmrdgruhdpuggvvhhitg
    gvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghupdhnsggprhgtphhtth
    hopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghvihgtvghtrhgvvges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvg
    hrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehshhgr
    fihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdr
    rghu
X-ME-Proxy: <xmx:0PmbaG_R3e5yH229-8PcAh3IMx7SddGBxdMWrq5C4b5YokTW1pCYGQ>
    <xmx:0PmbaLqbfGAU1gEoYqx8LNhTOEbYa0uBX9g9f9mcISy3qyXROx-GMQ>
    <xmx:0PmbaASa72WkloH-GVwxRq_MKzYiyc3qC3uG0IuKxdvixDc1tvo_Ww>
    <xmx:0PmbaOPhtTB27xByGbzh2ouIf2cva24HjC8uM7R1ZU4PylkjFQgt0Q>
    <xmx:0PmbaE6TJHie2cP0bDrDCkwsAE-v2EYPF9f-c0kuiLj_WGWrZCOElqwU>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Aug 2025 22:34:53 -0400 (EDT)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v2 1/2] dt-bindings: mfd: add Traverse Ten64 board controller
Date: Wed, 13 Aug 2025 12:34:34 +1000
Message-ID: <20250813023435.27776-2-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20230501064727.8921-1-matt@traverse.com.au>
References: <20230501064727.8921-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_193458_279326_0599C792 
X-CRM114-Status: GOOD (  14.16  )
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

This adds the device tree binding for the board
(micro)controller on Ten64 family boards[1].

The schema is simple and is (presently) only
consumed by U-Boot, but it is possible that
it could be consumed by nvmem or other type
drivers in the future, as well as extended
to future Traverse boards.

[1] https://ten64doc.traverse.com.au/hardware/microcontroller/

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 .../mfd/traverse,ten64-controller.yaml        | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/traverse,ten64-controller.yaml

diff --git a/Documentation/devicetree/bindings/mfd/traverse,ten64-controller.yaml b/Documentation/devicetree/bindings/mfd/traverse,ten64-controller.yaml
new file mode 100644
index 000000000000..13fed94e8406
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/traverse,ten64-controller.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/traverse,ten64-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Traverse Ten64 board microontroller
+
+maintainers:
+  - Mathew McBride <matt@traverse.com.au>
+
+description: |
+  The board microcontroller on the Ten64 board family is
+  reponsible for management of power sources on the board,
+  as well as signalling the SoC to power on and reset.
+  It also implements useful auxiliary functions like bootcount,
+  serial/MAC address storage and scratch registers.
+
+properties:
+  compatible:
+    const: traverse,ten64-controller
+
+  reg:
+    description:
+      I2C device address.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        board-controller@7e {
+          compatible = "traverse,ten64-controller";
+          reg = <0x7e>;
+        };
+    };
-- 
2.43.0



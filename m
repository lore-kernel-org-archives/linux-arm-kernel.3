Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E0CC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=; b=eaHDE2Pafn9hVWgwMMR8gP+QcC
	ciSDHOSWwDiEgEkrdzMvLc9GN26LGDhnb4P6Ljr5i27LcFvVe14SdcSZiABIeHi9rkyyH6LxLOWZ7
	qKAc0HRlsN2IDMAugtBK4KW6JSEmFJ2Foiv8thIyJWiRSERI4cwvd0rU2nah8BEbvzq7cXUA4bg09
	ikL/kxy2EloIxhblcRGLmZQuiaJqUgGaSo+mjo9Mh4NonMPDb4rh670/bQv6eMMhZ1aVea9WSc7yE
	yyih/HjYjn3r/uhnNfiUonjj4rjHzy/cjdtCI3NYUZdxXstdh1wZD4tFRRrvyX6LohPX8cRDSVp6/
	b5bpEaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYl-00000008efd-1eL4;
	Wed, 16 Sep 2026 08:00:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kY6-00000008e8q-2W5r
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=; b=EYVSEidn/98LCmhmA2MGGO9aXR
	tPVdoffp+2anNEUXS6eirwUf+a2mmfDRs0TO5XgCfK2dOpKhKPNDD89KFgXBbQZdwUxWs8zqsm/Vh
	o0iKfceVBNp5ynXmEzEd8BQUcp2N3+R8iNEdl71thDUsbPA2066/R4tajwC6AhbPfuOPqZDVg23x6
	F8PG8F1ZTSmq8JkylbxOuuof8q9aNiINGKvzxE7AsaRpFsDMOkpky2bDyYnDHpEn/UInZTT95rR4X
	reRn6liWr29g0lRvHexjhyUQexF9LALs9Mwswf22DcIsS1MwcMaAa8Kr/h83odG/RqTovArzzW6jl
	fm5LzVbQ==;
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kY2-00000007bc4-1LNe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:20 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so462179a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545556; x=1790150356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=;
        b=SCLM4+MH6n1fa+KN+c3dgv8kXHkBDTs+j0fn7XaMgC+aNWEL5Zofb4hTAzY5fGoixz
         ggQSMrrRqOx42noPeaWCcLMYxJCCJwaYum6YJU/bMg10sZd2Jk4ydW/+1i9JdXc9u+ms
         r6rbGGcCpP47tatZiGN4ID6w5Myho6NiZK6WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545556; x=1790150356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=;
        b=tfjNkLtZreSx4XPNlXrKsKqGpLKeUvc/ioZQEbaqv6FOKAnnr4mKY8nVdKNfS7Tq5q
         wh68L+HRxhcQmf8jjKa1d0JB9QEq8kU0GxZa3BzON7hjX0E6qEFQZhCVewqxHx7tDKa7
         6dcyS0d/p7aGrWEysZ18E4YtoTTqrFQS1HO6lIfgXm6CbJwqHZog/0aDtFPL3qqwAqBB
         EWgluNSUyp626tv2k+CNHeXEFiFX5f2mNiajMlKiNUWukzn1NNjjbyMv4bNn7KAJmFkU
         v7DM5J86skJn032pnJ7UhDBQFqTDhoLFI5U0WFpLsD1dZkPH9GQY7SJ2mSuMtbmrk+fF
         ftRg==
X-Forwarded-Encrypted: i=1; AKwUvBxOCRMy77f2kjzKy7uzTtewhBF4T24Cq9nytvMSqyNqXDV33G70LAMyrRcuMYB9p63m6DGIjKIqmlfAThMZPu1a@lists.infradead.org
X-Gm-Message-State: AFuF++l8u+FL3mn+N+L/cGFts0MgaV/KPgDEh4RyJpNBtM4H1zxU8P2l
	sDgNpr7ursA6j9QF+kTPNgOX8/OKQqdq5u1UxFYnsIxSApFElZ24FQeIqkn6BuCMRw==
X-Gm-Gg: AYBFou2KWQYisI4QJoZlFmMd55LIu3yjnx0uAkhbZqeoppADx15TIvdhtM+FW/1Y0qf
	+FiBA4VYIxaejrM+wX8o2aTi7o55J4v3JKf17UL71SGlDRJc3gY2xs7oPBfw7vpf0qLpbPBoSY3
	mru+mmfxAGdRGf0luqeGdhoD1eepFUl7yHLKowWScpucU36q78Z0SfZ4xkm+wR5PYMPviApjrrz
	4rqaWWnDJaTdE3pNvpjXDLKLYdTKtuq81WLJc9RH/m7AsJbkcKsKH/o/j7WUcUYlu4ps4XrFLjc
	TSnxlt90QSs/GyB15sJBWzIA2c0k9RdfSdQkm1CQP/tXUZh319dRrQy+nIrqtzSc8lU2AlZC7/s
	7N3be/9enop+PCshl5I15p2unp0MICIFJ/uZdt3FpkN5xuKZKTOFVJ9o8AbR8z8TgXM1+N60MXK
	GVCY9O0uq1/co8wYcUWB987xMw7sdOMX5fE6JUP9aP1wwd0fwL0fP9Iqu12fZjeZXe8vmk37zZS
	XN6xseIKvF6997lk88ilHosmGbIHwz+4ll7SVYS53I50bIT0wPawJU8ow==
X-Received: by 2002:a17:90b:4cc8:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39e1e330a2dmr4372580a91.10.1789545556050;
        Wed, 16 Sep 2026 00:59:16 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 10/15] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Wed, 16 Sep 2026 15:57:36 +0800
Message-ID: <20260916075745.3549953-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085918_736745_49F1DD99 
X-CRM114-Status: GOOD (  13.13  )
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability. The SSUSB controller
handles the device or gadget mode. Saying that SSUSB handles the HS
portion is wrong.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Switch to a "ports" sub-node for describing USB connections. Port 1 is
Super Speed if the controller is SS-capable, otherwise it is High Speed.
Port 2 is High Speed if SS-capable. This port mapping scheme directly
matches what the hardware returns in its capability registers.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Squashed DT binding revert and addition together
- Dropped reviewed-by from Bartosz
---
 .../bindings/usb/mediatek,mtk-xhci.yaml         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
@@ -188,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.55.0.1032.g73a4cd73de-goog



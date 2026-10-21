Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E92660A4AC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qErXZUXh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VVekNWmS;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=NDLGehXr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdsRy3FdNj9Kswl3REe6DGR89Sl6i9oOncs6NvWhlhI=; b=qErXZUXhDg1gK+xtUK9wvGleXr
	gKqAAn9GATarSt0xvKk84IWVOboJ1iVpNXpG83kYvlxW1Aw1e5pFe+/TwsJfEXwj1nXmuiLdPwnW1
	bsZoOw5o1BojsB7YN6p4rnSCNbUdnXqHs2R13U2Zs6CeUBM20nBKwgTMnMOwipK+6fB5uRQ7U3gRq
	JjqB79n28hn+Qml0Al782h/ddXrKG0H6HvS5K6FddD9yn57eRjHdbXDpS1iG/eib0qbvCQ8dn7dSm
	hMdlcKh6c544lhWOBvXDPYPg/IqaxP2hvLWH3V1nJaLTcCCEiA/6BPZAUeCI4J3Tw+U86loGElU5j
	IrO4Q/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa77-0000000CY9i-2qmt;
	Wed, 21 Oct 2026 17:28:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa74-0000000CY7r-18bY;
	Wed, 21 Oct 2026 17:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZdsRy3FdNj9Kswl3REe6DGR89Sl6i9oOncs6NvWhlhI=; b=VVekNWmS6fv3O3cw8TIV1k+381
	C6DikXGkd3pgeU3TRlQS0WUC2m7H9IRHETCYniaXOwBFXnj9T6L+MBRzSznZlC9tFgNHoNG8+GmB6
	E8MEeTLZoSV5u2RZ7dw/0yNSJiWrtziaqeJLvglBUoQsTFTTBMXbI+IVUJBLDZGxzbP+dT86VAdIK
	TfSzE8EYOU6BK0dBm8mG3bqe2Bq8VOTi08pFnN5KI+bAoRl23xuiq7pOKmSf9IsStXXvPXmbEL8KO
	e/5XkKarLz7tu4RST4wLb0qR4fDDnuOq/i3a4VoOofxYCEiqJUAMRKnfJvqkhlONeDkOaGMv5C+7w
	/AP9x+1w==;
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJa71-000000064sg-15OD;
	Wed, 21 Oct 2026 17:28:29 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 6F7EAC0003DA;
	Wed, 21 Oct 2026 10:28:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 6F7EAC0003DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603705;
	bh=FtqWf2DPt79qNMVOTUeCCsa1564XmuQp15xUpDs450I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NDLGehXrkry6eXTAIRQNMA8nxMTkQq0yzevWo0m07xo2UhCstGiPHLXmUIOsqfXGG
	 I/+lG7M+N/lQZ0/zuKsgZfpajrtZR0/88GlnAxSDWWuAOT9oF3HhJxgpJBF3jpqmAU
	 /us/ByY8Wa7wOwOPAwS8FH2SJ/YMqU6V0Lqsn1ks=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 0DDD9AEA2;
	Wed, 21 Oct 2026 13:28:23 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 2/9] dt-bindings: phy: bcm-ns-usb3-phy: Describe the NSP variant
Date: Wed, 21 Oct 2026 10:28:11 -0700
Message-ID: <20261021172819.668120-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021172819.668120-1-florian.fainelli@broadcom.com>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_182827_500310_5BD1FCA2 
X-CRM114-Status: GOOD (  11.78  )
X-Spam-Score: -1.2 (-)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Northstar Plus uses the Northstar Bx PHY register sequence but also
requires coordinated USB2 and USB3 core resets and a USB2 IDM interface
clock enable.

Add an NSP compatible with a required USB2 DMP phandle. Describe the
shared PHY relationship with EHCI, OHCI and xHCI so initialization
finishes before any host starts operating.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/phy/bcm-ns-usb3-phy.yaml         | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
index 7fd419db45d0..00d69b86cbff 100644
--- a/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/bcm-ns-usb3-phy.yaml
@@ -14,6 +14,9 @@ description: |
   Known B1: BCM4707 rev 6
   Known C0: BCM47094 rev 0
 
+  Northstar Plus uses the Bx programming sequence, with coordinated USB2 and
+  USB3 resets. Its PHY is shared by the EHCI, OHCI and xHCI controllers.
+
 maintainers:
   - Rafał Miłecki <rafal@milecki.pl>
 
@@ -22,6 +25,7 @@ properties:
     enum:
       - brcm,ns-ax-usb3-phy
       - brcm,ns-bx-usb3-phy
+      - brcm,nsp-usb3-phy
 
   reg:
     description: address of MDIO bus device
@@ -32,6 +36,13 @@ properties:
     description:
       Phandle to the DMP (Device Management Plugin) syscon
 
+  usb2-dmp-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the USB2 DMP on Northstar Plus, for its interface clock and
+      reset. All USB host controllers must reference this shared PHY so that
+      initialization completes before any of them starts using it.
+
   "#phy-cells":
     const: 0
 
@@ -41,6 +52,18 @@ required:
   - usb3-dmp-syscon
   - "#phy-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: brcm,nsp-usb3-phy
+    then:
+      required:
+        - usb2-dmp-syscon
+    else:
+      properties:
+        usb2-dmp-syscon: false
+
 additionalProperties: false
 
 examples:
-- 
2.53.0



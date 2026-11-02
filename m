Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B12606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hXWvAJ0z;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifzXsDik
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KU09lcPWfaOUpjyqk/x7UZs5f9b0E6qGqba1GB7ws+M=; b=hXWvAJ0zW9EWza
	2OJv/8wk2N1vBerBaw9WKMrrgY8AOFmrzz/90jY4Zt38hPhct97O8895Is4UIcTdzIYp87vwMkkAU
	RuiFmSTM3zdywuRJ64B4iaCrRLA4ZcFRXM+YHL4Kesbg1e/FUi7/aaDfDdA+x/P+5kALlwBPV0gVP
	GQ4WaSLKRmPZ39ol8D6MkKwGnV1SDOG6ezi4VZ///0D76kCcPj2aH9sU/yCOJcqp6BFySjfH+Xe+3
	A+6rD+PmzwS93cyAmlSOTChSjAGMH/ZZ9mpePS3gSUIRNh0ZPA7Bp53mlZOEpKo/fAa674/PRr215
	/2MNTKFuMXmQrklrALGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0l-0000000FvYH-3FDb;
	Mon, 02 Nov 2026 09:07:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0i-0000000FvUt-1nNn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:07:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so30989095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610442; x=1794215242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KU09lcPWfaOUpjyqk/x7UZs5f9b0E6qGqba1GB7ws+M=;
        b=ifzXsDiksXhqCFF/TBVcyTxNJ+IQbgs8Usf5SSTZgKRob8C3ijYeDjT05roJjM9QCC
         yMxarIQQIWou1Q0FU9YaX0rvK1bNUoBRjYxhI7PwZKmY8hUzHVHnqlKjP3AVHqM2i3qM
         bzbILAaDH12znLoOsVUyPE+l5gK+T1TVopOFzj5fItWfbE0qIMEzwnmELxaf4MZ2eZ7p
         pPav3eY3XMOv1oOUMibnyWa6gWAsPiAkHOjC/ODZGyEJ+LO03iHgvy/9u6e54ClMTCdD
         lXYlsSckW6uWeAFDTOFS1vWfJ2mGC02UZdSaF6WtPeIfvvPsa0GuJxuiHuSvKuNSS2nu
         8JIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610442; x=1794215242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KU09lcPWfaOUpjyqk/x7UZs5f9b0E6qGqba1GB7ws+M=;
        b=EotmBvv/HfYJnI4RkDTknCKOPqcGSrA9zUfcOK0v6bTIeag/nhL0K0bXgPziv0wOyC
         OEV7tUwfQ0ufeqp9Lt9d9niDQgMWwcSfJvtyYbsykV4X+EdDumaPlr8Vml8uoCqdnPR3
         9qu1yJD/l8xeVhtVNTEkpgMqoOPC7Afxm1MAw3y6liUtIrv/ioKShVgnwr35GB6Ipgya
         kOUGf8O3FHgd/XTL3pcUXRo4SOqVtvONWBG676+24NzMzShsqNFXRr27xVxa5bmwKV2O
         zIA0TiH36KPVictlbR4Nh39r0fl1sWHTz7xf7C7X5uiY/rYqfUhKh+nBm9uF70jTQI/U
         SopQ==
X-Forwarded-Encrypted: i=1; AKwUvBziDzCIea9dq2zhANfmw7t54pbbXOPdg6vd7fbk6pZnlmpzx8RjSwn+5A2RsHCegeD5xlWn36TNeF4wJlJQaxvj@lists.infradead.org
X-Gm-Message-State: AFq9FYIRe77Itj2+H4RuOFZVLh6ZkGCdkxKu+F9EEMv9ScX+jmkF0YUv
	4ow5uBFPRCu3QwHslY7b7K5SGYFYYigxypkS7Hciuubg2vSnQH14Da6pw3thVA==
X-Gm-Gg: AYBFou0154qApgy38iHWk15mqavS1yYmDY9iMyL5VbKSYy7nI474lIOMYgpopMNdebw
	jmTEvkUtTpSGeZNMRU2XTHVeCgzEim8q5XREPoJXF46B0/o35HVLFt99/pM97NoZMrKmoZfNTQ/
	x6YWS2Bi4ri308n7vVbrYn5cxwlIsBIVQ5fcULDsSbydMFVtGAlBAz41lLbX2uod9tYZV+fqgB3
	KdJhRMTyOvqCNuQoWfpdtAWjCqRqzj05DDKAOJDmRehYILvynFzB4iBmbWar2Kke1gDT+OaolUi
	mjOMaAwRoEd/Lylg7FuNJn9MslCZ8ddmF4LVk2gsByDmEcGcX/ZjClcL8z2Tsmw5iP0UWtuvrgh
	ZhUN6flrt1l4nmJ/OeXtN5Q5SIr0EEzKiOmSaP+IrpzOM9P7xqZeHGTaIod55BEPSDJ7tzC9AS9
	lwE92lfZji3OCnWwtXgDY1QvC9RKf8PBiWWbfNj0gs8o8M9IB9XZp9k5VehqzK8rfdht4WvbZZP
	+kaRf3YA1x2HiYXbdX2nUC36EYNNz26MyYIenSvh1ZqzN1V/0n84pF4zRrea2SmnyguyH8DzcT7
	lrnptflxu+wqJQNzv6RWhrX9qoLPK5tbV+/VabjEX39eiE/CEMPC5LXdSgnqcSJowirEo4lmOUK
	OMgmxMGrLdV8137XQU+uJwjaaleAzcGXiA19+YeTrBg7IMkTdtmDjpUoDs3K/DiYexFDcpwlECO
	/X+9+xujWoFNjlC1gUtcW6ZzLYMxa+gR6/PA==
X-Received: by 2002:a05:600c:1d28:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4ac1793fb6bmr263102145e9.16.1793610441541;
        Mon, 02 Nov 2026 01:07:21 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:20 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
Date: Mon,  2 Nov 2026 09:06:51 +0000
Message-ID: <20261102090713.896324-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_010724_483295_B10829F2 
X-CRM114-Status: GOOD (  14.74  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add compatibles for the BCM2711 40-bit DMA4 channels, which are
described by a separate node covering channels 11-14, and for the
BCM2712 DMA controllers. The register address of a node identifies its
first channel, allowing a controller to be split across nodes.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>

---
 .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index c9b9a5490826c..31d97a10a0ea9 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -9,18 +9,27 @@ title: BCM2835 DMA controller
 maintainers:
   - Nicolas Saenz Julienne <nsaenz@kernel.org>
 
-description:
+description: |
   The BCM2835 DMA controller has 16 channels in total. Only the lower
   13 channels have an associated IRQ. Some arbitrary channels are used by the
   VideoCore firmware (1,3,6,7 in the current firmware version). The channels
   0, 2 and 3 have special functionality and should not be used by the driver.
 
+  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described by a
+  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
+  channels, with channels 6 to 11 being DMA4 channels. A controller may be
+  split across several nodes, the register address identifies the first
+  channel of a node.
+
 allOf:
   - $ref: dma-controller.yaml#
 
 properties:
   compatible:
-    const: brcm,bcm2835-dma
+    enum:
+      - brcm,bcm2835-dma
+      - brcm,bcm2711-dma
+      - brcm,bcm2712-dma
 
   reg:
     maxItems: 1
@@ -99,4 +108,22 @@ examples:
         brcm,dma-channel-mask = <0x7f35>;
     };
 
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dma-controller@7e007b00 {
+      compatible = "brcm,bcm2711-dma";
+      reg = <0x7e007b00 0x400>;
+      interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "dma11",
+                        "dma12",
+                        "dma13",
+                        "dma14";
+      #dma-cells = <1>;
+      brcm,dma-channel-mask = <0x7000>;
+    };
+
 ...
-- 
2.56.0



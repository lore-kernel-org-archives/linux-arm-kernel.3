Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD94606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bEj7dThd;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SwPSdbTP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xItqMuf2hx/dI3+KyoiZy/IYYq4i2pAiSjeOl4VY+ro=; b=bEj7dThd9L87JF
	M4m8xA0ga4It7Pipn79EaB0erLiKZ3Qf6ZFwOPgxx90OIWw9ub2ZocS+y+F8ioURpUMGi1XmYnL9g
	ic+ncag535j1Ny6HOZZ3m6VOCaoMEogyGwVXY7mifCqLHbhcSZSbksxnbiTKbazfdlu7P0QSnY479
	yXT67EJa2HTiDHoQVx2g3joWqZpPihNfPum+J7EuudXPl8Jkm9Y3daa1Ktp2KIryBVF5Esf4k+Gtp
	Y/hX/D6IO36MgyDr6hkNR5xHWLAiOhk7inS/pCQXdZ9dssWD/R/81dXitHogrX/HRGDKK3E4H1oQK
	3Brr258ak4x8WMovWBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXd4-0000000APbf-3Tad;
	Thu, 29 Oct 2026 21:25:46 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXcq-0000000APUV-1BwY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:25:33 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso31088a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309132; x=1793913932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xItqMuf2hx/dI3+KyoiZy/IYYq4i2pAiSjeOl4VY+ro=;
        b=NtSXp7xH/hw19/XYpJUqtPUabC1nNq7vAjLPmfMwCIqpYzuD4bdhmQstOSv40LJDEH
         vo+1OpBmR0QT2YcutsvSKmP2EEQm41rR0xEGz2O9NNQ2VgCpdj2e7CEtXbfi6GCwC0N5
         EYJSmOnoMRmeGjZxmda4dUid91159gbRNhN+ZxGxWhZEp5bGoPryDDMTubHkOAdDt1vc
         mrvJzRvFNd0P85EWb6sSdpxcyogzS7thwcL7wVccGTZElgqVLG7m8J6l+eI62LwqSFok
         a/bOyL5e5vkzmreq+gWinlAOaotTOHSz/PfQGodqPHDPYpA6l9l3waqKRaRE+u6NrQrn
         4Abw==
X-Forwarded-Encrypted: i=1; AKwUvByHZYm/zVWRQXMfbEoH8UHn2OKviM3fq+mv/tzhE2YQEElUjTpdPw79mWASBm8qyT2ZMqRtASjIn4f7qsws9HQl@lists.infradead.org
X-Gm-Message-State: AFq9FYKp+uI1JSZfkIJjGQZpPN5AuBClEm7bHG8ShkSBMr2TJRltC8MO
	Vs/uHj6c0HyRLbQs7v9NETcgN6iwCmOty1p9tSmZ6nXp/JKblJrQXYUfbx2+sYbdONlK5Lv8k0t
	oHGw+bqH546kCNMhgehrPqpLGZuaAXn+ZFHmdL/AvLTcr6oENQFPwKrUPSd9sbo+HaqdtwBrHX8
	vVuyuiSJbwU9KTFoz0CcaZUeeo+E+v9PyGcOfust3t01JO+FVlyC1IHg3osVFFMT/o4L/98st3f
	NggF6tDCyr5NdR/ai8QDlwcl8a51B9z6mZY+Q==
X-Gm-Gg: AYBFou062DmgzFdWZNHU2IB0cEMrUoSOJQP87ysX2jiU6opQeDPKG/aFAffo+5Mxu5E
	Tx9m7fvzUOx1dQh6SrAkcms2trHSKLe1BGtAowoGYwmSRaKLrFgKaqukNCwntgnLq7LF7/l4G/f
	Km2sH5Kqh8LwNMKCekr/29CJ/UiIRLT0hF4TtuLL8xo7oXHPo4RBk+i4BPPxJEb3Y39ZW8PYFEq
	FgLyFXCxtsKx5W0Cz1IstoGzZ4fnliuO0/h7p5S/P8v2ULSfZ1lcmdDrR+xSHGM/2rU6y2/cvjX
	5MPudFtoCkYrs5mYIa8fzwtVKEbXFZkvPPOF5BmqJDR8fIpwckq9wbzu+eqVqi8tgqz+HqZ1d3r
	8EoTBcZCN83shXy06YXnMmgazciOv6oHNzCe3I5vd1RAUudjXqflS5/cWnOGz5ZAA1sQ3/StanX
	4K7I8dgzNoyjukpJczfjHiG+DuB9FZQ5M40fBZT72B
X-Received: by 2002:a17:90b:33c9:b0:3ae:4dc8:3d3d with SMTP id 98e67ed59e1d1-3ae89865f87mr196569a91.58.1793309131555;
        Thu, 29 Oct 2026 14:25:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e874b16sm2792088a91.6.2026.10.29.14.25.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso581292785a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309130; x=1793913930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xItqMuf2hx/dI3+KyoiZy/IYYq4i2pAiSjeOl4VY+ro=;
        b=SwPSdbTPsII6AiFgOb0mZfzh31cpAmpctov+nShhrMp010b55OTm6Bhy5ksv35owrw
         btfC8mdK1CX8gb+Xqt81MVnwvGDc/pbgcwOcwstBMnZYZdInRdEyp5ZDiY2B4PNoL3UB
         7dvcK7xPzAyA36cSyEV+7nUiNyCed98HInBKk=
X-Forwarded-Encrypted: i=1; AKwUvBzto82pnDGcNl3h7OWChnLKfUHcrAxonk9TY84gD7aCuK87N57GZ97tlj+uI9glt7KXmzIjVLc7syc6+uphw1sf@lists.infradead.org
X-Received: by 2002:a05:620a:404d:b0:93e:c691:a1c with SMTP id af79cd13be357-94421850adbmr65335985a.76.1793309130090;
        Thu, 29 Oct 2026 14:25:30 -0700 (PDT)
X-Received: by 2002:a05:620a:404d:b0:93e:c691:a1c with SMTP id af79cd13be357-94421850adbmr65332385a.76.1793309129450;
        Thu, 29 Oct 2026 14:25:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:28 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v4 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
Date: Thu, 29 Oct 2026 14:25:09 -0700
Message-ID: <20261029212513.4126083-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_142532_365192_69EB395A 
X-CRM114-Status: GOOD (  10.91  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Northstar Plus uses the SATA IDM block to enable the interface clock and
deassert the core reset before accessing the controller registers.

Allow an optional third register region named "idm" for the NSP
controller. Keep other compatibles limited to their existing two
register regions and allow older NSP descriptions without the IDM.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/ata/brcm,sata-brcm.yaml          | 57 ++++++++++++-------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
index fe7f091e744f..9a48f7e36fcd 100644
--- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
+++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
@@ -13,9 +13,6 @@ description:
 maintainers:
   - Florian Fainelli <f.fainelli@gmail.com>
 
-allOf:
-  - $ref: ahci-common.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -30,32 +27,19 @@ properties:
           - const: brcm,bcm-nsp-ahci
 
   reg:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reg-names:
+    minItems: 2
     items:
       - const: ahci
       - const: top-ctrl
+      - const: idm
 
   interrupts:
     maxItems: 1
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - brcm,bcm7216-ahci
-          - brcm,bcm63138-ahci
-then:
-  properties:
-    resets:
-      maxItems: 1
-    reset-names:
-      enum:
-        - rescal
-        - ahci
-
 required:
   - compatible
   - reg
@@ -63,6 +47,39 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+allOf:
+  - $ref: ahci-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm-nsp-ahci
+    then:
+      properties:
+        reg:
+          description: AHCI, top control and optional IDM register regions
+    else:
+      properties:
+        reg:
+          maxItems: 2
+        reg-names:
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,bcm7216-ahci
+              - brcm,bcm63138-ahci
+    then:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          enum:
+            - rescal
+            - ahci
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0



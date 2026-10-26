Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A770E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BnQuDR/5;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=A8kM2ceU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=; b=BnQuDR/53JMMoN
	uWMDdKATwamV7SietawOfzqRBuued/awFWX1n3iGuPyzCIb1tuoGu60qZ2cAbI4wBhXrq37F60Gxf
	6nfo5rTftpjdjZCCFbkuF+uLoGhY2cvpQuhb7aqa/cuC0QP7G8HbyH3lmluZ4gCpKvPVheCQ2trAK
	Hteu26qS8Yl/v8QNhm9fCRJkPFQr7cdHfQ7kCHP2qHly5q6nVGLS3SEOOoa93awVf0JGJC9Lj62/9
	1b7GPfySDRGGdaRXcqwCY9epUNBiyciTIAcade4yg7K32qYRQoyN2nJ2+hXjfs40x9p2htqXiMDgg
	WKB99CVHoycbMDceVaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQCz-000000039Qk-2jY2;
	Mon, 26 Oct 2026 19:18:13 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQCv-000000039Nj-2OBN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:18:10 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1941230a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042288; x=1793647088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
        b=KT1ZiS/Sb/FKP1BafMXsaSyum9k5wpfOHYAuxDJqynXtpHwqxwuJP9Xsm38VSHGHnM
         67XQHm1qCwTmZeM0PI1KLiiD/toMVZJ/yFKL/enuuIdurnqrep9cA719eERD+AKollQB
         SZbsWYEuZK0KdoukrZrah6Ta/ShuEFCJrTi4GUSZtloJ5Us5IOPJk4JqEYMrj8QlZa3K
         +/lZKHV9f0QA9ab2w73cfj2TswSWY+SgeCQhjoLEi9mkkvemukzgt9FCvHi/W2aTb++a
         zykuZj64J39S3HhMboPup5BXJuBYQiqtgl7Un4aBkn9XBF71n1IWkhEdnpqnVOsUo16K
         0bZA==
X-Forwarded-Encrypted: i=1; AKwUvBxih9WTisFyTg+27AddaDDHVNu3nDhHSZ+kDLLv0EZkMNu7UxczmzsfacZAVC1N0Vkz7VkP3b2SLCUpuHkvQU2A@lists.infradead.org
X-Gm-Message-State: AFq9FYJZWAXYL7lq8cGgliKrIZ5DySJ2SZXxlsqeVkJz73e9BH58GMXa
	J7lfn5O0qvqPOcyRkmXv50jZwjTbN6PnT2GWrhHImNfiyjleJxjLCj0H/2hlLgSyo0xqBSPADKM
	ovAJhAWwFLbPc1sh0078GlBBMO0oOfSzcSeRe3qJlKL5ExxL9WcUiLHnJwsMmioy88HRRm5DLBJ
	0DGzYNZwi2pbGQixAdbMBnmIHpY4jJmLFbDuLU5wnfRhkeshDi7mBsVSQf6YxLAABgpTSAFNwWj
	G8RGXGOHHkBvKZj5zFMfPKXbJ8zzjpay7k=
X-Gm-Gg: AYBFou23jTnuFsi2petxUPxACIfwbQA7TJ6Xd0KmeKe0E/xMXv791w1z1J1Kb6rCg70
	i4xMpFDoljaw8I2WAXNEz4/o5CCwiGkr9qa1M/06xDXfZvhjAfxqO7QUSajfsOz9gIXfmsPFc+7
	oG9doD7XvbJJ8zLnebrfHSwRNe7c5mekP6emNiJo44gK8EWQs8OWn1T1pZOjLZrE9orf/kp/1wI
	0LjhQRQA78oSnhok0RoOgj93aZJK60v74wpvtYYsrO/2QOYfEccLmRoGJlEOvulbbWclDjwhUTI
	SRMpOgAOkTQGHyYQ4pMLRdxxw8vnj2KM2zZbUTv1n2fxYSqUoCJNuD8qFjihjJo8WS/QjrePDEC
	fLWNk5M5PniEr3kKcqXHEDFjDET4bMi05NZv8ezKjdTQWYES9olXGViJFRcy1pPvzmzuFZ58b1g
	vUJhyXnnDVNQS+LSiUTeJnWHtOdH1tpavIrN8Q6Pae
X-Received: by 2002:a17:90b:52cc:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3adeb13c0bemr7720813a91.66.1793042288354;
        Mon, 26 Oct 2026 12:18:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae405f13ecsm346326a91.4.2026.10.26.12.18.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b4bf686ceso65367116d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042287; x=1793647087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
        b=A8kM2ceUevZsO6mqcejA3+WycSAY5oqeTr/KMMQnVVpaieOyrM0bfHW1IUrRZaqVpo
         0cLSN/NkgLf8dhpQvZHyV15K4VcfH9j8pqWxHxe7pI3IGN/OZD3WBurHR4Eh3ajSEXJV
         3KeK+zAgVx0zkxmzcl7GyE06YPe8jBbFG9WVM=
X-Forwarded-Encrypted: i=1; AKwUvByczkqNKCv29KorERSC1zEMN1yvL6dbQOoUnhPfzLLpUgtQvQLEpVy1ww4g7kon2V7du3qNgG+LpiA9gt+5MCLv@lists.infradead.org
X-Received: by 2002:ad4:5f48:0:b0:91c:6983:8012 with SMTP id 6a1803df08f44-91c69839846mr35564746d6.4.1793042287066;
        Mon, 26 Oct 2026 12:18:07 -0700 (PDT)
X-Received: by 2002:ad4:5f48:0:b0:91c:6983:8012 with SMTP id 6a1803df08f44-91c69839846mr35564286d6.4.1793042286610;
        Mon, 26 Oct 2026 12:18:06 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:05 -0700 (PDT)
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
Subject: [PATCH v3 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
Date: Mon, 26 Oct 2026 12:16:14 -0700
Message-ID: <20261026191618.3178830-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121809_613554_53129A3E 
X-CRM114-Status: GOOD (  11.82  )
X-Spam-Score: -2.4 (--)
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

Northstar Plus uses the SATA IDM block to enable the interface clock and
deassert the core reset before accessing the controller registers.

Allow an optional third register region named "idm" for the NSP
controller. Keep other compatibles limited to their existing two
register regions and allow older NSP descriptions without the IDM.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/ata/brcm,sata-brcm.yaml          | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
index fe7f091e744f..98529784b1fa 100644
--- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
+++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
@@ -15,6 +15,21 @@ maintainers:
 
 allOf:
   - $ref: ahci-common.yaml#
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
 
 properties:
   compatible:
@@ -30,12 +45,15 @@ properties:
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
-- 
2.53.0



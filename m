Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02BF606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 18:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EJR5CUr/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=brec4sMJ;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XPDPjGZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=; b=EJR5CUr/AAy2nt
	y9GXLYRLfeADa6NNjMiGX+eRn3DEacLj7TD34idtk37al8lmMf/IlUR9cJZ9MTcgJd5pUrkbmEps3
	ZiSf8NaPQ8Tv7DtpGgr02iSFLxIG6+TcHNYaooMRWGq8ogibaJCvQkdN5NhockGd5YAHhjwpg/N2u
	Xm1+4S3bTMEKU9CONaFX7vRYFG/KVRa0rwd1AJQpqB4sArqXoRwyftj9PIsyHab06wwY/2B9EIIQO
	mYEddOXAmKmyaL6Mi3kt7IfysP+eiBD5ovkWbANFe4YaSIlUW0Q1367Zcbt/ew2kMtPdkOqNc7HwM
	C8I9ExS7Pcw5ydBTqiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPRw-000000034Z0-0MHo;
	Mon, 26 Oct 2026 18:29:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPRu-000000034XE-3Mtm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 26 Oct 2026 18:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=; b=brec4sMJ+csYKlEwWO7NItStW5
	cuHbFs8L7cSmwMdf/4T814181TIXLYfO2HLDg88kL1Tqnv2ezO6oNVO9BEaZXAOxDRBtwCHjJn6d7
	MJSRW2N6QiN7syOaS4e+DRd835MPZq2UkMYcebtajPTlbWZ+7WEfn1yuot5SFoFo1NdMfTFspbpOm
	Q1MBKCFs1NJaW5YUCpD4u73GUQeatVWTRPYfB8ZTZc7yMrwYiFbbQsZLOZR771RPxL0Bp8jVg8dF9
	vrcaRgW3B2Kr4I/ftebzRvAYFftaaUCXnxqOhsEJraNzvJjxvqcuiaGQ+VTUBNoTlVLrEa2HTjMio
	PyzlSzVQ==;
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPRr-0000000E6pG-2Rf1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 18:29:33 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso776035a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039369; x=1793644169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
        b=g5heluFWJDeKjE2HMxNApbCDw/O0AFG93nZluuO1m2RW0unbw9VAwuAkUSQwfEilWw
         EJOYN/g24QnOqrTQqC/OKoEMG1h8z06sa+zWkdBCu80n85DJ4q/p/DbXSfhOwz6ov+ka
         1WeJBgbB78OwFjiD+IfntjN+xTFivTKeuQqTKnQVqjxluBZxznrGB6A+7xABC4dLHIDv
         TS6KaMqF/EMy8PN7ylkX6zemBuqULJ6SfaoFBJWv6QYzlPjsgYyfbtC1BfiJnDtxUURN
         uEBKo53RkBHW32/jfwN9rJ+OiqfBE+ZpYNxJ5CDus3NmPedOZ8USqrS13VtW7zezkIhu
         g7uw==
X-Forwarded-Encrypted: i=1; AKwUvBxIqqDh9XzSUWiMiM7P5vBu0GpUYvzz1t8KyVlXdlYywreXGaCRAWTWC5Sa/IYSb9wCEVzgFbottS3/iVptPUTq@lists.infradead.org
X-Gm-Message-State: AFq9FYLMhbmz4WrbRl5DO9BT152XurjKNEu7Xj1no0PX5vPuv8Y7YDbc
	9T5cWm+kExKffk2er1M1Blfd3H8MVsL+rPTROzweSmyVePh0h+nQCJ3Gu8fjmgkotwu+TLtgwEr
	dZnAwQGCa5TuVm7j7e3ZiFHQ/s4M+tGL3qYfvl6nMZPnavTT7oa1EbefrKCssZy06pEhLN49ehK
	irms7Xs9svhwiMSuWqVZ/vj+cJu//pxUMXukWs2p2nWvii8D2bFt/8jFbgr7ITeymCX8ESiDEm+
	zDX4Q3jHvssBcuzyVlvIu0sYDaxKDmDDpKMqA==
X-Gm-Gg: AYBFou1L/eoIVxKmzFMJnmqv85ZcHdDDbpBo1CVxN69NOqZsZWMFunevln5YjZ5QXI7
	WUOanSslJA0lJXw7/oi5VxugT74g6177cl4tX4qPojKd7Ijg6F7yFfNUzt7DHJ2vCdPdNIfMfXt
	91T3moZMFtlKveXAvFJkMn7igPgsEAKRhKGO0bi4Vwfm0hQKktKkxG5Ro+IHwKY7B8+B/3TXBz6
	ju0HTHjaRf+E9saYoleZ27wdndWvQp/YrVRwYbNHF1aZ5+I4LJGWsfoUOg73HrtQK/uwKloH9r3
	7k3IzgmD8PScLaDoI10wnXU/daxW6FDc2axPh4bFOxYtwE98voaoo+LjuMszlo4hn7uwsCGDtf7
	+OmfC18h/jtvguxz9HWJP0VAJeB7+9K9VEfADCW8Jpe9CBZL8sx1ImZUr2ZQ0qpukWLLjZGL02K
	MfUD1jilhIxXpKCIGUMuhwdUwFBcg6WC1TLXbZqP7N
X-Received: by 2002:a17:90b:3d8e:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3adea8993a1mr6151763a91.15.1793039369329;
        Mon, 26 Oct 2026 11:29:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae405c32d4sm258470a91.0.2026.10.26.11.29.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36998507c13so2392782eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039368; x=1793644168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
        b=XPDPjGZX0G3/lUlU1kKs+Z6VHyaknODcXyBkvxak7Eoqlv3GYQT1x4+tkN3z8AXxSl
         F23scqms0oa/okGMBqpI4WxjOElSJklusaektuJzsqJf68gMsMqvbzsWLxvY4kOgb1Lz
         L/SPqp0HXV6l2DwTo9U5hJSsfsw1SInCRIEgw=
X-Forwarded-Encrypted: i=1; AKwUvBxEZBiZoegpAcksCo7SxgCN0eqTXv/Zh5rsQL0HXlRyNtjpPVadrJkXYsqqHyX9Uw5rAqZCyggIFXmraKAiA2Lv@lists.infradead.org
X-Received: by 2002:a05:7301:fa2:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-369e8455879mr10320927eec.14.1793039367400;
        Mon, 26 Oct 2026 11:29:27 -0700 (PDT)
X-Received: by 2002:a05:7301:fa2:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-369e8455879mr10320869eec.14.1793039366691;
        Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
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
Subject: [PATCH v2 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
Date: Mon, 26 Oct 2026 11:28:52 -0700
Message-ID: <20261026182856.3168686-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_182931_888574_D466B6DC 
X-CRM114-Status: GOOD (  12.65  )
X-Spam-Score: -0.5 (/)
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



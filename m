Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A150606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EOMXRdRn;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=D2q76FYF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=; b=EOMXRdRnIR7aA9
	Kh3lGGdSOX6ruAylQZIAHuvXJPsRBu6pu9B0kn1I32nMQjwW7w7a0015V0BL8pjF4P9uqQxRDluVK
	vSJG9ZA3tcpuA3FBS4/xm3EVXe+a7u6KUEzQlIN7ZI939ofVnjx+sf43fMzrdgOLYy18lf6uoGbjn
	axCl24zQTKrL5l0IEofk4ZXRShSGu+N+U4SWIdKi5e6FGFL56a81DTp3eJAe+VnGeLyVi3XtCmaBG
	S1t6NYvvPsGYrljod4fFY74YghUHnj+7x7mc9D4Q2YyAmsTKLriSVKC2Qn9M4TAZl1OgkC1S8SLFY
	MOdhC3vQlTVNn0T7Gi+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlKm-00000005V9e-2hm5;
	Tue, 27 Oct 2026 17:51:40 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlKh-00000005V7a-3oR8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 17:51:37 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-ccca948203aso106197a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123495; x=1793728295;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=FR6u9MounUPNobtmlycaKSa7ra/rC+rRnytIr4lkVjktCDDl4SmpxLD3sJmsoWwhJV
         YhJm5iaBj85oaWacdRD2Sfb39W3klgvMWg4p/alyzMhZUoSLSVj0k3TJdJJjP6uBGfox
         ga68cBpFQn3uX95tGgQ4yFVSxGrF0Asy/hAUQJhopS0nDmEm6wiQ6vjMEop3TnDSQKWu
         VYYg0tVoqTtTHtFDT/vJB2yIciYz1UlJRIiOv9pgtE6lkd5IUIaVxunMBpxDAD1LGL1v
         M35ShZZpcPsIGc/ONp70/pSKS5BulYoVWrvf81cV5LsVVYOx1a8RKnVvlAXMbsN4p/OZ
         6mvw==
X-Forwarded-Encrypted: i=1; AKwUvBwQO05hn20KoYdAPD849KRXYUaA/s8CyHFsyaWrqHsdPrq1dSKpHW2IiRYumTTaQmb27KI9eC0jJZaFTLbTr16p@lists.infradead.org
X-Gm-Message-State: AFq9FYI73TCtlUsyPBjJ/PvbfU8zVP0dMrc0ibrRn0nrhaMwzKeIdue0
	IqmXP5rgoWgq6350j5bhht0UNw9qKpgdp4B0KDR6AKVca6m1xIhVyvaThc16pE3L4cPtJOf0NMH
	acn7x86RmwKgBk5Bcwj0Ma5kyZDNXIDEN+GvJWqShtEu19zj6TBuk7keLp7v9b9dJ1VLaiqKCFG
	fiTNi7ZkDeh49t8h0v8vvmkt0Hzc6Sq6FP2qgxoexRTejxD+Jk4k+dxlJ97KtC1R89/gVuDPzqM
	mmBQykdeI5oZvZryRustQ5DsSZxdDKlvS6aGQ==
X-Gm-Gg: AYBFou0z4o+Zn1bPq9nJdLu9sOZVph55em0NQPWy2bqb7p66QEcpg8GIjQU7ESBceee
	HKgeZliHHgO0QMD5iwwMyLcf3jcdDg7Qc9LVZ6+7Ag7KJUEB5h7CAvN/W4eMtwZN/IOEy+pIl4q
	QoleRDlNIWkWZQg9CPTs21/DrtsnrVlf2R96yaPb3eLiatxzGPqP/wnLbL8jxg9WjQyRTvxzktb
	X1igQ+yYQ91rZSTDEeYQTbtArMtIOWcFjsASLejZU1ycrM+A/jK5U5bqgnIFeQXs3P1VT/ZzE71
	2C9qIM4IjrrOgzDZK2XpdvAFk8xgR358lxPXgOOKK9klOE9dZkbqVIdn8yYXapjRB4VqjPdIjb9
	BYc2H7Ec9n9q2WGk2TvXEsCRpFPC0z0xBw23t7kTi9LJVWbeV/Rp+Q24JRjsJxg0jBqrcl1fbK9
	V/CwC4GEmlqiMvGi+Z/QhAPF0R+PNMrIgjNAcGc5fbBHI=
X-Received: by 2002:a17:90b:2689:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3ade9b2d3a4mr8267929a91.1.1793123494834;
        Tue, 27 Oct 2026 10:51:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae55d5f3f8sm54510a91.3.2026.10.27.10.51.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:51:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5351f1b26e6so3302731cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123493; x=1793728293; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6OnP1vGWmb9YnZS8P9AwgUEc+BdAnjPfL2XGArdBN4=;
        b=D2q76FYFweIoEI9/enGrjrDydYL1LWNW/K/eyet9Ee3ZwVRav0YY9y4oLo5wvuQQ4m
         Y4XtjVNGDDyvrRktPpdOKqm75szNDPtAl3i9F3J4f+M4c/OvNktZBsPK/g7OlLaBkk0f
         mTfL6yfPUPyVHfLJl8tOxUaulBoTcuv4nx8JA=
X-Forwarded-Encrypted: i=1; AKwUvBzwg9fZoechJeJ/MIeNgPeUMD2CEDAtxRGxM8NIytbuZ7tIZ1PaQYB2xG60Xr9q6yu3eTex1dw5AGT8GbH0sF9m@lists.infradead.org
X-Received: by 2002:ac8:5712:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-53fcc9bfcbdmr21991cf.48.1793123493300;
        Tue, 27 Oct 2026 10:51:33 -0700 (PDT)
X-Received: by 2002:ac8:5712:0:b0:535:36d:dd97 with SMTP id d75a77b69052e-53fcc9bfcbdmr21461cf.48.1793123492818;
        Tue, 27 Oct 2026 10:51:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ab61sm83164511cf.17.2026.10.27.10.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:51:31 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v2 1/3] dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
Date: Tue, 27 Oct 2026 10:51:22 -0700
Message-ID: <20261027175124.3518239-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
References: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_105135_952190_B227F2B0 
X-CRM114-Status: GOOD (  18.14  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe one APB register window per AXI Trace Module. The counters are
have no overflow IRQ.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  | 43 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
new file mode 100644
index 000000000000..686b20d4cd29
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm5301x-axi-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM5301X AXI Trace Module performance monitor
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+
+description: |
+  The BCM5301X ARM subsystem contains three AXI Trace Modules, monitoring the
+  two PL310 AXI master interfaces and the Accelerator Coherency Port (ACP).
+  Each module has its own APB register window and fixed performance counters
+  for commands, data beats, channel activity and stalls, latency, and cycles
+  with outstanding commands. Counters support local start, stop, and clear
+  commands. No counter overflow interrupt is provided.
+
+  Each node describes one module. The separate ATB trace output and its
+  CoreSight connections are outside the scope of this binding. This block
+  is distinct from the BCM2835 family AXI bus-watcher performance monitor.
+
+properties:
+  compatible:
+    const: brcm,bcm5301x-axi-pmu
+
+  reg:
+    maxItems: 1
+    description: APB register window of one AXI Trace Module.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@19003000 {
+        compatible = "brcm,bcm5301x-axi-pmu";
+        reg = <0x19003000 0x1000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..b97f22107fbf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5220,6 +5220,7 @@ M:	Rafał Miłecki <zajec5@gmail.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 F:	arch/arm/boot/dts/broadcom/bcm-ns.dtsi
 F:	arch/arm/boot/dts/broadcom/bcm470*
 F:	arch/arm/boot/dts/broadcom/bcm5301*
-- 
2.53.0



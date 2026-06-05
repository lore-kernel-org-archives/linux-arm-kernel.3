Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508B6CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=; b=kSNP2Xn8+/MK+e5FnFFWs4f9Z5
	UI6ggdX4ciQ4AYQ8q3EG4LXCF/Hfx0amRsG7pX5BKksXNNWUtU5xRDgt4uUvTMujiBl2FkDhRJDya
	50i8zhAkRJo2sDrG1mP0xPTn0ryXcoODEyONWTKeuqcwaTItVA249T/CmERRfAQxaC7ogiWfD4NAo
	eavo/fDukmqGtxsNU32KbrPvyF/bRS8ltILMHZLVIha2Z9k3opi8lT+T+VsAgY7+pABdDTAaHKcEk
	w+0ZPo39nT7x/pZglddDHDC7dwOr+hU20DMWCX4oqpTqQOmI1wIB5wL1X5pceA3ucWsA23KIP88Vl
	NtJvgRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTX1-00000000bWQ-0gzf;
	Fri, 05 Jun 2026 12:20:11 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTWy-00000000bVG-1RM6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490b3637b90so16212125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662006; x=1781266806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=AW2ew4XVfmD7ddVNAhuU8p9zVCj5WIAaJOEMyepHT41afwYAa3vCEpMCUUuBkVSXxF
         nF2LRBrwfpEPjC3dmljKVhvpK4FeU8EM1FxHf+Q6oYhVFaT2+x+DWwFN9JhTyXH2aReu
         MbewP2fit4ZfsYPkbpfkl+aNcL68N2w/iyrl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662006; x=1781266806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=kwzvT1ZmaLe+RKZvGXNGiSWsU8s8j49byv5TDETT76eV9JGgKmDbhiHAYGAPw2DXVC
         gfJWqSkx1+it8FEjk4r7YC4ihOFBF4ooUzzDffLsDCpeRuFwt2W5wWFKygtmIz3ILtFS
         2NQD0MokHq4YYC9Qtmi1Zn4iDLwUqwXsbICJrwBDxL0BBp15yqX+1rCN/rVFtRpbgy4F
         /Xrkb5A/qRakzwworIbFILlQg4tusju2l2fV+e8iNIe0XZQjc/+TRdWIHrLAkn9VVnfi
         +waL4T/5OokL4sqigkFde3sA6Wto3IGqIQOxVKEyjvenE4NPoMbOPOV7KgxhIY3IH1cq
         ZD3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9SkH38sEnF9zzCPRCiMp10FDPlNK3QkevOHcw/VKACLVsR4hbsDgBCaqY2KJZWGSLh0381++CaroeZtkSLbwAt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2nZb0qtYC1aFkU0DVSwrU5bpPgYGhbxHN8vMXRqIke0wetrN7
	hRzMl8Sw0dDAhL+cGSMSGVBbzfVsYvUhiYs/DBlP+bXenJeLaJlBWATqjkUHZQ17oT8=
X-Gm-Gg: Acq92OEiDg5KQLToX6emb+21yv6SaaRxw+Zj9oM7PekrYXv+L7ApxuAz1pLPg5zPHb2
	VrjhGSJi/NGpyck/ERyjYOC6ACPIpyzh3cvYIASfgQUccAgIgIYx+JZM7VR2UXBC82TW5ixB+vE
	8ZLtXSPHKW67UqSE05FOsRw5wW0NG1yIld4XBl7qsyuFuMQkj5Zror9SMSoLWnnRHEuxa/S4yka
	CJhqIPq04c+EZ9pZagI6s9qYuWtq7Btn7f7zPcndU7wGGe5kbIfplBZ9aCuFQ0uG69WxLQXsjeP
	5bycL5+uAfcI1nGwGTgWJfhkuAfNQhOuUUka8/JOhRzXGEu1xh9I8QNtmo1fAUTZsRk+6ft3fzd
	37ZW3Fy6SVlbM2vUEEeUeB+hqf9xqtCnaD7ckDHRrE/Gdf2KGJQ0O9K78dsrcNmXpPOJPLXwJoi
	Jdm4STttLRTaTR/UayeDmIS11uoqcoaV/JbMcqCqIHvMFYLBRxrCNHrR1LCTSi6QCMAjBErXozD
	JGqJZCCrHi5gwsP51wtT29MtRvww6R1q/+32VyLs7FzTA2GUkNwux9A52hSVJd/ew/pa0tJCRQO
	BpWPc1ABBYlageW34qY7CAIOlUQQgjpypFQ=
X-Received: by 2002:a05:600c:4708:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-490c2602987mr50837865e9.25.1780662006287;
        Fri, 05 Jun 2026 05:20:06 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 01/14] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri,  5 Jun 2026 14:18:12 +0200
Message-ID: <20260605121957.78409-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052008_390861_C1F3D465 
X-CRM114-Status: UNSURE (   9.70  )
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

Add devicetree bindings for Engicam MicroGEA-STM32MP257-RMM board based
on the Engicam MicroGEA-STM32MP257 SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v2)

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364f..c5ce81e3ce45 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -203,6 +203,13 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: Engicam MicroGEA STM32MP257 SoM based Boards
+        items:
+          - enum:
+              - engicam,microgea-stm32mp257-rmm
+          - const: engicam,microgea-stm32mp257
+          - const: st,stm32mp257
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.43.0



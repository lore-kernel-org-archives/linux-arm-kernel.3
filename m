Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F3606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FDjWjHwp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P2s4QXRM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y0Zlmu99I73712v7dio42Q8sSfQByYjnANjrYzCm+Jk=; b=FDjWjHwpashLsK
	ffuHeN9VJVleJ4/Bc+M70s17KoLUvCMDXQtrrv3BM0RwgHNSVvAz1we/ChxeBpyvjkEhgmHZWnI+x
	w/uhZRZzL9mnyxbMDUf20hrPie8diSZd0YedWGqs/PRGBplaHgQRUWu856B8XCdR812NBBp4CbG0t
	+Cd9E3jqdnrbCoQ0Z9F5igOefE/qeWI4RilMR5m7MWHIuV6sawzGn3upK/VoTGtEASQsAh+V8+uSH
	bVN0BcC+ncpjBeeVxuADatN0+45OqJhGKW/uXQivPs8rXYF1v287xD29ZShp6dJIgbqhQR2WWXUM4
	XsWsb3WJ3EVTcQqzdlGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdsr-00000000KHL-48mJ;
	Sat, 24 Oct 2026 15:42:13 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdsn-00000000KEk-30A0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 15:42:11 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-3535a54bed9so2824845eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856529; x=1793461329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0Zlmu99I73712v7dio42Q8sSfQByYjnANjrYzCm+Jk=;
        b=P2s4QXRMG/WMB+TeMkoJj86QQAHT6Dzqyv9ktMbtTnJMWE/SU72Pk4Bp2i5xuewrrS
         97cYq8Zn8/4kGfwFAjqowakhWrHScCrUSpdYtOor43/DWt1Q4P5gOuX8a7jCpADi8YVj
         RG6Hly+g69WoYcPwo1WCx4gYYRGphOomH6kwuPOvkvIV2V9RIXp1hBto0uqcvtD9cSOY
         zR5BEtUxbxB9DsFXuce+rLrxWaIlgouYc1ooMRcPySLSzvCiFsN6OlZmYPPlf2QkymFG
         hxob74ERoqJ+tjZk85+ZhGoq0nU5umC4gycetBespeLloGC4kjLX1GpH0+6d5+3OFIOU
         t0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856529; x=1793461329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0Zlmu99I73712v7dio42Q8sSfQByYjnANjrYzCm+Jk=;
        b=SgTAQWMxpSPZyUS/LnptCeNcb2lZ2kIDLSEvnlBtvQ1zDn2yZJbBnaUqen6kw6Ye6M
         Zy8ylHs/8AO7S/qKNVA6or3vzfk4IeTV40uQkXDIih6JO70oHieNWR1sQ8edqQpH6BOY
         OqIL3l9ed3LfO5EXP55og9QcKfZEI1BdeiciMNwJgMpuaMiNxc9G2Zsfy6DuSghuFO35
         dH7Gub7NZveFUL9A2WGByZkqNuVoBOPPeJEv54jAI0+80WBh/CLAGcYJ/yCpyPSb2G/e
         xQiGdToy2sKFKvtMTcECGVFnjkapufWUiq1CPKOWI2qrVvhADkjyome192AtZ91HZJ9O
         NGcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyI19nVsFqQ1qPXUneGTZiyiBSFyebw46uWhMN5jun80qgVrFbTZX1OOv9QSt6zxILnp5AqXPyH1MLhV6RX1bW@lists.infradead.org
X-Gm-Message-State: AFq9FYIcdxFu0tZMIxM5uKJQ6rXBp5IngrmY81+RJMygUBHnUTI7LNSy
	JRf1WRSWlpPbhpESD2KYklhzBg/kmpRJ4NGQoykGG8TK5m+bSP+b0y2A
X-Gm-Gg: AYBFou2uSs9HUIlOdLoEwpOtuUgEQygAdyc8RO5Ndmr9FRnwHbBpIVaDAYRe8G56OfN
	x1yV4D81ktSiyctFXuDa3UJKIU3OOiBSiaEtSZdLrMEv0FrMF9VlSZtUBimNk1yhxAy1mt7oo4y
	ZOdFR7kvjWmszvCowMZ8WIPH1xYiNUmi9rjT+/coFWJWC5lGlf5R1KJORayPB2WuD2T9g9Gm1OK
	LeLwyHVj7MXQiD8bwPp8iyf6SPJ/iQn6LTjc4ugSS8ZkRA1v4fBCeofZMb1elOMVzWuOClrW/4/
	yfhc+P4dDiyaAI2ktw+psv36czxb0Ha80nOtbKZQVb2ItxGEmLSTP4/Dgx9vLdwr2B6WOWismGt
	Kjti0cdX4IBse4FXoWLYrbJcouFMtF21HIZlDOtKIUakJvtcUjT74f2WM24TqTjebmuHN7JdOqe
	G/pICbZlk+jby1cb4LQLq165h580lc4ocL/KqmH2BNONZzZCeKxlxbg7+TTzq+TqtfWgHWuuwzv
	oKxOkWeiLFPrhFlMZZxp3s4c3RTFf6mP7ktPGG1EGDaN0SGfSOVwecOIA==
X-Received: by 2002:a05:693c:80cd:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-369e842cbf2mr3808651eec.7.1792856528662;
        Sat, 24 Oct 2026 08:42:08 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200:aab8:e0ff:fe02:33c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm7766450eec.18.2026.10.24.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:42:08 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com,
	Chris Scott <gilroyscott1970@gmail.com>
Subject: [RFC net-next 1/3] dt-bindings: net: airoha: npu: add DMA pool memory region
Date: Sun, 25 Oct 2026 01:41:48 +1000
Message-ID: <20261024154150.45733-2-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024154150.45733-1-gilroyscott1970@gmail.com>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_084209_777045_27C08D4B 
X-CRM114-Status: GOOD (  10.58  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel Pawlik <pawlik.dan@gmail.com>

The EN7581 NPU can only address host DRAM at 0x80000000-0xbfffffff;
higher addresses alias the lower 1 GiB. Allow an optional shared DMA
pool, after the firmware region or after the WLAN regions, so coherent
buffers shared with the NPU can be kept inside that window. The
firmware region stays first for existing users.

The original version of this patch was written with Codex; it was
rebased onto net-next and its commit message rewritten with Claude
(Anthropic).

Link: https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Chris Scott <gilroyscott1970@gmail.com>
---
 .../bindings/net/airoha,en7581-npu.yaml       | 40 ++++++++++++-------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index aefa19c5b4..21a1a27500 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -42,22 +42,34 @@ properties:
       - description: wlan irq line5
 
   memory-region:
-    items:
-      - description: NPU firmware binary region
-      - description: NPU wlan offload RX buffers region
-      - description: NPU wlan offload TX buffers region
-      - description: NPU wlan offload TX packet identifiers region
-      - description: NPU wlan Block Ack buffers region
-    minItems: 1
+    oneOf:
+      - items:
+          - description: NPU firmware binary region
+          - description: Coherent DMA pool for buffers shared with the NPU
+        minItems: 1
+      - items:
+          - description: NPU firmware binary region
+          - description: NPU wlan offload RX buffers region
+          - description: NPU wlan offload TX buffers region
+          - description: NPU wlan offload TX packet identifiers region
+          - description: NPU wlan Block Ack buffers region
+          - description: Coherent DMA pool for buffers shared with the NPU
+        minItems: 4
 
   memory-region-names:
-    items:
-      - const: firmware
-      - const: pkt
-      - const: tx-pkt
-      - const: tx-bufid
-      - const: ba
-    minItems: 1
+    oneOf:
+      - items:
+          - const: firmware
+          - const: dma
+        minItems: 1
+      - items:
+          - const: firmware
+          - const: pkt
+          - const: tx-pkt
+          - const: tx-bufid
+          - const: ba
+          - const: dma
+        minItems: 4
 
   firmware-name:
     items:
-- 
2.53.0



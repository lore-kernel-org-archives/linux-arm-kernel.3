Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AB3606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MRwyHcnn;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=S8J0B0hA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mF0XBJwiryCyMPrZszn5OendoJ/4n7hQYYsJtVWvy4=; b=MRwyHcnn004/mF6Zti0rrcW1IM
	bVWVo02LN7vMwbUYWj78rVV4Y7kG58lZknF45SN9dsbe0L3O2h7BCtzKnU6CczeEO+2fvp3ETNA2Q
	/veLV8/PuIZJbGWyAazyZMBKC4A3bQQI6fy/47yj+UuABB8VJx6v2Ri6hEvavXHR3VD5Y+zZqY2FU
	mLbxOlH7eTmWaCoqG81e/tG/VdBgBNG03Nzny3RDwH9OIP1/3kBLCHfHisEE+RZZd6467X7biEr2i
	vR26RsB6puTUdKbS8G2Z1M0R10szrqgVe+YH4PlMW9vkbma8OUlE8+pTV5tC91ul4bQVm1/F1I8RM
	VsEZ8XcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3pV-00000008yRu-0bT7;
	Tue, 20 Oct 2026 07:00:13 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3pR-00000008yRJ-1eTA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 07:00:11 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261020070005epoutp014a45323bb7b0e5f3167b385663369701~gKrQ4K7Wg0150801508epoutp01v
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:00:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261020070005epoutp014a45323bb7b0e5f3167b385663369701~gKrQ4K7Wg0150801508epoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792479605;
	bh=/mF0XBJwiryCyMPrZszn5OendoJ/4n7hQYYsJtVWvy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S8J0B0hAWkkfVGrFmtnS9p3ji5Axjx8O51TuRslimSA7cOBQA6tICN7UriPVwRm6f
	 I6aZ4UO5MnFFN/Yq+hxJeVxpUPfvcXMKnCj8E10aJBNdzryJaZubEvyOR5CjaDWNm7
	 Qky0Jd74FhrXMtqKJPzTT79TnL6fYEFG3MjwAunY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261020070004epcas5p2b58ce68ee17c82fb357d402d9cd32497~gKrQYQ4gs2277522775epcas5p2Y;
	Tue, 20 Oct 2026 07:00:04 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j83Fc4Yb6z6B9m4; Tue, 20 Oct
	2026 07:00:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261020065549epcas5p4838c35bfe29c5a526c2fca12fbf3d1d2~gKnjKTOXn3267732677epcas5p4P;
	Tue, 20 Oct 2026 06:55:49 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020065547epsmtip1a310620e3e4f5224aca386398b376dc6~gKngkgShU1560915609epsmtip1M;
	Tue, 20 Oct 2026 06:55:47 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com, cpgs@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 03/14] dt-bindings: clock: exynos8855: add peris clock
 definitions
Date: Tue, 20 Oct 2026 12:43:44 +0530
Message-Id: <1771243284.81792479604624.JavaMail.epsvc@epcpadp1new>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020071346.1918640-1-raghav.s@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020065549epcas5p4838c35bfe29c5a526c2fca12fbf3d1d2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261020065549epcas5p4838c35bfe29c5a526c2fca12fbf3d1d2
References: <20261020071346.1918640-1-raghav.s@samsung.com>
	<CGME20261020065549epcas5p4838c35bfe29c5a526c2fca12fbf3d1d2@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_000010_105702_F63E2D77 
X-CRM114-Status: GOOD (  14.36  )
X-Spam-Score: -4.7 (----)
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

Add device tree clock binding definitions for CMU_PERIS

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    | 11 ++++++++++
 2 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 486b7347ad44..53fc8040e173 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -29,6 +29,7 @@ properties:
   compatible:
     enum:
       - samsung,exynos8855-cmu-peric
+      - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
 
   clocks:
@@ -73,6 +74,26 @@ allOf:
             - const: mmc_card
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-peris
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_PERIS GIC clock (from CMU_TOP)
+            - description: CMU_PERIS NOC clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gic
+            - const: bus
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index cd445bb45070..5d8b38a744b5 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -203,4 +203,15 @@
 #define CLK_GOUT_UART_DBG_PERIC            25
 #define CLK_GOUT_USI_PERIC                 26
 
+/* CMU_PERIS */
+#define CLK_MOUT_PERIS_NOC_USER            1
+#define CLK_MOUT_PERIS_GIC                 2
+#define CLK_MOUT_PERIS_GIC_USER            3
+#define CLK_DOUT_PERIS_NOCP                4
+#define CLK_DOUT_PERIS_OTP                 5
+#define CLK_GOUT_CMU_PERIS                 6
+#define CLK_GOUT_SYSREG_PERIS              7
+#define CLK_GOUT_WDT0_PERIS                8
+#define CLK_GOUT_WDT1_PERIS                9
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1




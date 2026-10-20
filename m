Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F0D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S+ApvYFQ;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=LB60c4Db
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhFh7zT1+bzubZ3GCKmZli8T8ugrkRfM7QpmtOWqwF8=; b=S+ApvYFQSYN42HagwtvHrZeI+/
	riOghLxEZ6VdY9GgaV8EFYgOmM/pWv8IT3clntnhaOnwmffgAKppCa9vjPL0J/caUfQfU55Pjygrc
	z4YhAsRgRF6p8vEIY9rk7jkC5HOKtYRFFw3eqrcjMIApyj051GkJueRzI4oUMa/oGKws6lfKxVNkG
	BcvQgyl8le3MDAdHgzKLNUc3cXg2X7giSq+Gw6HM5qqnYistW/XQnj1yrI1cZym2AyzmKQLNxa88E
	ILQY26tgkyorGVzsSyw8nOTLy06bidmN9R58AmyPKnH6YLPOTXxAeRUoKTJOB/lEDCD8jqp5rRT8N
	YqVfe9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3sW-00000008yiU-10Qy;
	Tue, 20 Oct 2026 07:03:20 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3sL-00000008yf3-0cZX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 07:03:11 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261020070305epoutp033d17854172cc8ca29c2101e91bf74943~gKt4jVqkC2086620866epoutp03K
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:03:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261020070305epoutp033d17854172cc8ca29c2101e91bf74943~gKt4jVqkC2086620866epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792479785;
	bh=qhFh7zT1+bzubZ3GCKmZli8T8ugrkRfM7QpmtOWqwF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LB60c4Dbh0EpkWpRUGkTcugt5S2qEmh0/3qhtzc2eLIKPjbBU4s7fIVj9+FXjZksv
	 FmW/DD6O2cBW680Psq+A8O7NGDv1t4ji7x5G1wY343iNozIuvOqDqtfwTCR1s/Bius
	 tKw4Tkd3NmHk85fmPbirGY2rGAZz2fIAZ7GLF2nM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261020070304epcas5p1c5e785723c85d884ff77d65018de206e~gKt3z522f0096800968epcas5p1M;
	Tue, 20 Oct 2026 07:03:04 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j83K432Nfz6B9mL; Tue, 20 Oct
	2026 07:03:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261020065556epcas5p22c45c425489dfa94cd8f729a38106737~gKnpFVULW2225722257epcas5p2y;
	Tue, 20 Oct 2026 06:55:56 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020065553epsmtip1a93cea274de4267621cfa6242e08785d~gKnmPDRZp1278912789epsmtip1y;
	Tue, 20 Oct 2026 06:55:53 +0000 (GMT)
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
Subject: [PATCH v3 05/14] dt-bindings: clock: exynos8855: add usb clock
 definitions
Date: Tue, 20 Oct 2026 12:43:46 +0530
Message-Id: <927327686.61792479784418.JavaMail.epsvc@epcpadp2new>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020071346.1918640-1-raghav.s@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020065556epcas5p22c45c425489dfa94cd8f729a38106737
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261020065556epcas5p22c45c425489dfa94cd8f729a38106737
References: <20261020071346.1918640-1-raghav.s@samsung.com>
	<CGME20261020065556epcas5p22c45c425489dfa94cd8f729a38106737@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_000309_513434_F2C22FEE 
X-CRM114-Status: GOOD (  12.04  )
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

Add device tree clock binding definitions for CMU_USB

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 21928235d131..c68a64eb35c5 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos8855-cmu-peric
       - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
+      - samsung,exynos8855-cmu-usb
 
   clocks:
     minItems: 1
@@ -143,6 +144,26 @@ allOf:
       required:
         - samsung,sysreg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-usb
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_USB NOC clock (from CMU_TOP)
+            - description: CMU_USB USB20DRD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: usb20drd
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index 67cd97d8fab8..f4261956ab4a 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -222,4 +222,12 @@
 #define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
 #define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
 
+/* CMU_USB */
+#define CLK_MOUT_USB_NOC_USER              1
+#define CLK_MOUT_USB_USB20DRD              2
+#define CLK_MOUT_USB_USB20DRD_USER         3
+#define CLK_DOUT_USB_NOC_DIV3              4
+#define CLK_GOUT_CMU_USB                   5
+#define CLK_GOUT_SYSREG_USB                6
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1




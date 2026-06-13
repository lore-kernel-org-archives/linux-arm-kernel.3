Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D3BCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 06:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZ66LcteqJ4QI9hjgF9HToSLQnhyQKu6uHIFWcsfYcU=; b=RJKRx8U2ibXWR7e2H6ofX+JafO
	HFFAwUqjnQpThsbonMos8SwzRYEiB8/wzYoFGB2fqvYCMOSYWQrnIDrcNAfkJmWBSgweKCQA/wWEc
	DWqrXWNA69WYSw7dZL06LUTU/NsJ4dUQcHAGiI/aCHfQ+AV7aJRdvDUxUitP8PBfLhPj9hQIEBuWK
	2oV1CKJq0o+fYNToBRzrZjLMnC9VikpGRnAzIw7zLhnWv9jEa7/YhHP+tiFY5OUfFz7JLYSklxOKj
	Ns6/Hzxu1dFrhVwAVb4Wh4WATutRcluyEfb/p7wG2mn6p0KzXJkab7UfnS6IQGfDTr9bfIqwYnscE
	ZMgNaClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKP-0000000C175-3q0y;
	Sat, 13 Jun 2026 06:58:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKH-0000000C0tm-0OSa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 06:58:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so11219095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 23:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333919; x=1781938719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZ66LcteqJ4QI9hjgF9HToSLQnhyQKu6uHIFWcsfYcU=;
        b=UV2enESGgTtKpXQdi9a6scjlmOucbp6hnFysPP92Wln1SWP2n0cHcyIAdvoS8bjg1r
         x7lVnO5RHLgZ1rjIxzkb2WiRWAkJwt0m+El7KV34plv+HCIMnZe0Rz0AjOcVzS01RHZl
         daqqEHu7VtllhpAolq3rmJeLZmZLWMM0EJDAyQn6AZCKOAYoowJF+nhlfCdryauiiQAY
         pzJINJbh8lX0kbPZYLGm8/1OPR1aigOk9W5usdetxX5h//6HsI0CPh3FtiQ6I2N0okk1
         O992xqkzwTLxm1fITQuqXadm2TqWFCjmPbuSBaNjfMTnwKfmw4kCy1h5VomYb2D+5mp0
         ws4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333919; x=1781938719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jZ66LcteqJ4QI9hjgF9HToSLQnhyQKu6uHIFWcsfYcU=;
        b=nQrWRd1dBmMae8xObfkbqhHW/GjD97drpgd1k5YkbxPHa4P9OG8icRReZHXVZKHvBz
         G00rwzOTXWtjj0dISA7zivHDA7TY1h8wfnWYuvZ2vh28v8T1pAOdPOBdDz9c95tZO0lD
         7Xoz03gEKsa+rBfkdgTRtR8ulvwi3F75LoopOPoFqHOMdZlJgWDCv6Ia1FNVZQFWvAz0
         uU4n9/2k2okGtztlw8na5aCtSdVL9u/fxDh/PGkiWYOy+VcfuNAb4txVpyt+tMqqL2Nw
         Cbyl8ax5R0AF/ErpvfVXRl/WEBNauBezbMgcqQbfKmKElTJOo7FSlTcRN/cOOgbwbgwi
         zjyg==
X-Forwarded-Encrypted: i=1; AFNElJ+ntW5iSMXcFOtqlCbe6fPDbaD2ur9b5epAgxEa5XaoHd4IGxhqSdRFp2YshnY1ADIk0WEKF1Ry44ybcKTdWedF@lists.infradead.org
X-Gm-Message-State: AOJu0YyiYQObIPfutw+tXCTVyYjE73eesHf1hQJVMqAZfhL30et11F9b
	ECpZqQPMHZrsTAvtKHunR2jnRC/KjUXRKVi/ItOvbPzpsqIo24/bNGuv
X-Gm-Gg: Acq92OE/Zlkqgqcuw5TwwBq6Tn+DN0Km0d610DxhzfYNGdixfmTjIyAx57bslViGDFu
	xy+VT5eMpFm1DBWSatsv0Zl9D/uaMBSGjXYgd+aw1BdipWpJCeg7s291qVGVFackj4iMTVpDfCf
	JiT+ITUaCi9G0C8UTejbIiFcdzwuEZFQq0yBxq2W/SK/2ehMKv/sKvhs+sq7/BksA/mDH2ugyf4
	+nXlHhVCXJnWxTHDIDugwc5M/EUWZMT8Op5z0uOCsvyx5Ac6Own4N69FJdkPRpOqR/I5HUGe40u
	bPf+ztPTQT+bpjLs4qI5jzNzU2jMrvkUUDYH0HeNwdv/WShY/kn5wYihdZbSX68oUAS+uymJngl
	nQzPz36ZhHdmr6wbGugymLcyqWh28Nhv3Ppxeh8uTNSC+Z5SXAdets0HqFtd6lzz2ZU3fDWc7Dt
	WWEyJbGyrbMLDMr5nu+O7rlIaoZraDEz0TXjdIWxjG+w==
X-Received: by 2002:a05:600c:4ed0:b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-4922008485fmr28715325e9.7.1781333919182;
        Fri, 12 Jun 2026 23:58:39 -0700 (PDT)
Received: from debian.tailb81abf.ts.net ([2a01:e0a:104a:4d80:14c0:9448:1c38:77df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm42917705e9.2.2026.06.12.23.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:58:38 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xxm@rock-chips.com,
	chaoyi.chen@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	jonas@kwiboo.se,
	Midgy BALON <midgy971@gmail.com>
Subject: [RFC PATCH v4 6/9] dt-bindings: npu: rockchip,rk3588-rknn-core: Add RK3568
Date: Sat, 13 Jun 2026 09:01:13 +0200
Message-Id: <20260613070116.438906-7-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260613070116.438906-1-midgy971@gmail.com>
References: <20260613070116.438906-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_235841_154414_C216F278 
X-CRM114-Status: GOOD (  10.63  )
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

From: Midgy BALON <midgy971@gmail.com>

The RK3568 carries a single core of the same NVDLA-derived NPU IP as the
RK3588.  Add its compatible.

On RK3568 the NPU NoC bus-idle and power gating are controlled through the
system PMU rather than a dedicated register block, so add a rockchip,pmu
phandle to that syscon.  The RK3568 NPU has no dedicated SRAM rail, so
sram-supply is required only on RK3588.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 .../npu/rockchip,rk3588-rknn-core.yaml        | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a4903cd1..e0b948ac47d45 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -21,6 +21,7 @@ properties:
 
   compatible:
     enum:
+      - rockchip,rk3568-rknn-core
       - rockchip,rk3588-rknn-core
 
   reg:
@@ -50,6 +51,13 @@ properties:
 
   npu-supply: true
 
+  rockchip,pmu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the PMU syscon.  On RK3568 the NPU's NoC bus-idle and
+      power gating are controlled through the PMU; this points to that
+      syscon so those registers can be reached.
+
   power-domains:
     maxItems: 1
 
@@ -75,7 +83,24 @@ required:
   - resets
   - reset-names
   - npu-supply
-  - sram-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-rknn-core
+    then:
+      required:
+        - sram-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-rknn-core
+    then:
+      required:
+        - rockchip,pmu
 
 additionalProperties: false
 
-- 
2.39.5



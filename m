Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D787AC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aLwuYc7It003bwysv0PNlwd8jw03NkQ5TfiWML6syFU=; b=rtJxtn9WCxJiJvoIFBTKsQzqFm
	jHkYyaFWJiFiRp7H8VvE6KGzstm4e/pirVhfrctEtXlPTr5TEQ1hniLFv3e4k6Up+TQ+sudei6QBh
	Nr4ZHEYP0e+g4md/Fychl52ES7YW2LEPLetsFWE+pGoEqfAQ6s7PsEaz5w3ZgYLY/NgzFNpi3IXES
	WJbHFEScByiE2txAtcTNG5QZf3Mou42FJckfU5VgtZI55d0A/fvxV79RrQuRl16G/sAJmbmgsemZf
	WXm2IjurKjPb/QpBmy9up18bZLm63Z1Fm2jU1sm6J3HNO9JSZP5iygLZQJS1+RTM5Bo1HJDUb4VZ8
	yPuW52lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVd1-0000000G3iK-1hDT;
	Thu, 01 May 2025 15:15:11 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVXl-0000000G2ue-1FuB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 15:09:46 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4769a9055e6so481851cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 08:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112184; x=1746716984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLwuYc7It003bwysv0PNlwd8jw03NkQ5TfiWML6syFU=;
        b=stl68lpq5QWaJ64x4UIxLeD7NQEkI6wawymfto/bkb+pKoURNUFdJ4bTa2dYDLUlrO
         QvV8GCvav/DQHkqwu0G0sS+0Q7X1+H64UT4IXYnzyFya9M82ibFNr6VqPXfxeR8j9fzV
         UXiWCD9NrWt7ekBv7q+giUXqJT7OGBAT/k3ngYi2j9rTVzOXnnkFat8ERD5X7/7jwinO
         /eY3oZ2M3NYsNBlX9ZA7fxx+qwbKaRmPInfEZQxGj0YR7k99Lujaynas383vNYCLgt3m
         kZabtehO6kEXpwuw8LYBzX67hX4rurn7n32bDmGlprjq1HCNc5T3trhDzYLwYUPyTVMj
         cdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112184; x=1746716984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLwuYc7It003bwysv0PNlwd8jw03NkQ5TfiWML6syFU=;
        b=xP3j6WfoAVnvCdRM3Te9FarFr7dNIpnp3kagbcCDpSwHN88D+nPlTTOQ43wH6SJv4q
         lxD7nT9zrwhTh4loOQtNecZvvju5rDSreQ3uXtdXaX8Sf2cjWECEXu3rSsn2yT1MGDXS
         K1DLDaXk7DYnWa1MMrHjgCNHrG1XcCme0VUnkbAiIsnqNE85B5/Jd9lKPGWovhd95uN+
         5iJXEnIlCQYrXzX+LrVBdrIcNP8cuOHiFwGtZF6tGd0KsvK3b9YTOrL69X885QcN1hU8
         P3YsA6mZ7dgsYw77eePkcHY4cVCgkQBAo5LFduHQbXp7/M0bpcJ3syOR/zvUnsW2FwLS
         sVsg==
X-Forwarded-Encrypted: i=1; AJvYcCXskkD5q/XO3yOHatjQL5i1k1CH85BMphLP3+aw91XUDyLHSFOgXYqcRc6bYUfRKZO40vb9TFVG37NMW14pfoL6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc7YCbpf8fWR9G+oDVGjaG9ujBVaKKm8fJBSVxyHVnDxSYMkGK
	Bq8nIBXPMFajkRVtr1CWKcJqgR5C2eOiDeeB5p4mZrer5KtyCFApHfgi/SWGlD0=
X-Gm-Gg: ASbGncv/+DV0iOWxtmSkwYbcRhBMi0+ASUews9KI8LXUKd8mFXMdhP0pQLPhm/ajlrb
	i488o/gbojsztn1hFnx3Ugkdcm/d19dD154I0Mpopzy2d8pt8iH9xVu4krmf2Fpl27PG1/L7eEf
	PRMDpkH32Q8CFc4JANpLS7PDs6SEn4P9DwSkxQ+aC2vsyHbYe2t31GrHrgAM6Dp46A3ZsB4JN+o
	kZlcwTS6s+YnDXLFloGofuZLyF+u8aoREGKMdUGlB32WdQ+zqQyRnj3rla1uK8V32cPAtoxu7RB
	GJrIau//aEbtKx8lmIyvYTrx1sm0wbBgu2tYeoc8jl9Y2tHqDw==
X-Google-Smtp-Source: AGHT+IFwzDvqjjYQbokpYoEpoOfxhemraL9OuZyJRAg02iJ46vQxTMMnmYAwRIcFYB/qENp7C1Sj5w==
X-Received: by 2002:ac8:5701:0:b0:472:1ee7:d2d with SMTP id d75a77b69052e-489e44a96bbmr41320511cf.1.1746112184011;
        Thu, 01 May 2025 08:09:44 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b960cf655sm4823621cf.12.2025.05.01.08.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 08:09:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: psci: change labels to lower-case in example
Date: Thu,  1 May 2025 17:09:35 +0200
Message-ID: <20250501150934.77317-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3146; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=o0mFM3KPvJj29b7OqZXgI3yIHXSqUjqJjdi9iKbTvSc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE46u+AUV/cMeTamwXDlrrGt9g14Off/ZwsEGc
 /72wcMiMHeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOOrgAKCRDBN2bmhouD
 122/D/0T1UN2DmvxbeprDE0n7AayOOT3RWXYKsZ6CF4EzLtW1IZlH84dWREalIV4nbVz8tH8Nur
 BFf2lMT/ZbXYhEXF2XQHMRV/T27zID53PZZ1k81Vtlb/uZ5AggOungzQ4TxSJjjPjHjBP52IQnY
 MtG9aWRD3WV12fzwXUIoEDY9UT5XCvcRaGksMMFoeIHtJ3uABYHK7n3mhl0dE8UU5emFZgmHE2n
 N6fc2KPYtM8u/ZZlBUSVFS/4sxEk2jDOYbF6DJ0F1BAfTw6DFNWdkVUb7r+HKzXJl2XiqT+5wy/
 7/xfniHEJneBSfqakxQMzkRFmFlFLDkfAYZByY7haUK7R1zlZD2guGv1VkNmJp7xG8ptTTLsK2H
 PGRdMyTgD/bW7+2NKQOexiC62NW05R8fA+mBqlZLM8jzHFjfXtSPeVVJ/jTr1xELhH2UiInUZ/u
 y9oouhCDsohhUpqFs/vGCFAtX4FhdaXKBH6WCbTxClEcY78D6lBQMVNSLkJ3B+hiU89Gknt6KI/
 8R6lrAulgLem8d6yedfmVnBC+d1+mFhTx73T2FuXNBpoQXlP9jkDtLwukLb2iNDcC+FGq1+7hv6
 yneVaGVPhn3y0evOLAPyVhpbInIW+GFBWDgovYnwvj6FdtI6wcMS+tAhUiESBQNUjmTkH4H651f nvp6i1D2Z/o7eyQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_080945_340000_A96CFD26 
X-CRM114-Status: GOOD (  10.44  )
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

DTS coding style expects labels to be lowercase, so adjust the example
code.  No functional impact.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

v2: Only Ack
---
 .../devicetree/bindings/arm/psci.yaml         | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index cbb012e217ab..7360a2849b5b 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -191,27 +191,27 @@ examples:
       #size-cells = <0>;
       #address-cells = <1>;
 
-      CPU0: cpu@0 {
+      cpu@0 {
         device_type = "cpu";
         compatible = "arm,cortex-a53";
         reg = <0x0>;
         enable-method = "psci";
-        power-domains = <&CPU_PD0>;
+        power-domains = <&cpu_pd0>;
         power-domain-names = "psci";
       };
 
-      CPU1: cpu@1 {
+      cpu@1 {
         device_type = "cpu";
         compatible = "arm,cortex-a53";
         reg = <0x100>;
         enable-method = "psci";
-        power-domains = <&CPU_PD1>;
+        power-domains = <&cpu_pd1>;
         power-domain-names = "psci";
       };
 
       idle-states {
 
-        CPU_PWRDN: cpu-power-down {
+        cpu_pwrdn: cpu-power-down {
           compatible = "arm,idle-state";
           arm,psci-suspend-param = <0x0000001>;
           entry-latency-us = <10>;
@@ -222,7 +222,7 @@ examples:
 
       domain-idle-states {
 
-        CLUSTER_RET: cluster-retention {
+        cluster_ret: cluster-retention {
           compatible = "domain-idle-state";
           arm,psci-suspend-param = <0x1000011>;
           entry-latency-us = <500>;
@@ -230,7 +230,7 @@ examples:
           min-residency-us = <2000>;
         };
 
-        CLUSTER_PWRDN: cluster-power-down {
+        cluster_pwrdn: cluster-power-down {
           compatible = "domain-idle-state";
           arm,psci-suspend-param = <0x1000031>;
           entry-latency-us = <2000>;
@@ -244,21 +244,21 @@ examples:
       compatible = "arm,psci-1.0";
       method = "smc";
 
-      CPU_PD0: power-domain-cpu0 {
+      cpu_pd0: power-domain-cpu0 {
         #power-domain-cells = <0>;
-        domain-idle-states = <&CPU_PWRDN>;
-        power-domains = <&CLUSTER_PD>;
+        domain-idle-states = <&cpu_pwrdn>;
+        power-domains = <&cluster_pd>;
       };
 
-      CPU_PD1: power-domain-cpu1 {
+      cpu_pd1: power-domain-cpu1 {
         #power-domain-cells = <0>;
-        domain-idle-states =  <&CPU_PWRDN>;
-        power-domains = <&CLUSTER_PD>;
+        domain-idle-states =  <&cpu_pwrdn>;
+        power-domains = <&cluster_pd>;
       };
 
-      CLUSTER_PD: power-domain-cluster {
+      cluster_pd: power-domain-cluster {
         #power-domain-cells = <0>;
-        domain-idle-states = <&CLUSTER_RET>, <&CLUSTER_PWRDN>;
+        domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
 ...
-- 
2.45.2



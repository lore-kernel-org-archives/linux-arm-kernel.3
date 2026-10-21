Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371E3606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zw0v2F43;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VCT7th2c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRVgmdt9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/Y1qpBLY6fko34laYatPIwnPDHGmqYN6KVu8T65y1g=; b=Zw0v2F43gEB6rvoy0U22sY0M4r
	+NIbziV9AVhEWwGBT/MRf0diEVpdwxrKoZoHo9jDK9yiV4QbNiW0vfeQ7RPwwXQ1XduX4n92aljyg
	WgsQ1TfxC3Su8r3Tfq0ZlhAAsM5Go0oaVkY+PH4lD4TSRUt603xuGWoH+jrYVPOykFT6Byz0myeyA
	s8LRH0RJMxukeq/r4u34o7HJIBG+XHFQDONV9vc70Yn3j1glUjz7PJWzuyEHqfMvFCHUipLAUoBoZ
	PtWli29WsR3rqoDHcMCc+cO7URUE+HVFjKKf8BhGVHml/4jufx20ymIpU4X6rYSx1D/aZLMRhiC/T
	lVyCIlug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY52-0000000CEQG-2fSr;
	Wed, 21 Oct 2026 15:18:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4y-0000000CEMa-3sqt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:18:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFkTR3994852
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/Y1qpBLY6fko34laYatPIwnPDHGmqYN6KVu8T65y1g=; b=VCT7th2cma/uVca/
	uojpbudS4KLgTuvw7R5iopML3QM7QRwHtf8I6Ykd84Pn4qC09tGEfgfHMwP2qcli
	QMdZ1eIDvq9SdQP7wbVCRX1pRADJZh2BNMSrAFKBOX/OO2hVw0a2P45RwPxDdhAC
	Mw94LACE9fis3ZKWXaM9M1ljFG8OMfklBpmxiUtUxOat6uH2ATTXFpUiSQUV8nVQ
	9LjV4kNh1a3YoCjQxytKFMPcmX4+JPjx+rsLKamIUeuEea1weRYmUh6a7LNZulbi
	V0Y5v+T5JhMPGqNLhiolFD2C/52TxULFuM8ETENnsWcIyF6esV5eNdPpM/NIsz/5
	HRNYQA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8j55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:18:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so1996749eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595890; x=1793200690; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/Y1qpBLY6fko34laYatPIwnPDHGmqYN6KVu8T65y1g=;
        b=IRVgmdt9zfvrZGlJlpIzpLnxS9toGB9QvVQEwDgm/Hgiye5gq0NzrOW/8e93rn4VEB
         cD4ttDD06JEJ4UmfM0oD34Oj9GSR1uYtbHBqWgm0Glt7EtKzhttuIAMVb9XmQxiSvaSi
         v/YDKilq+qL+B3OhIU4AuQfNosiv+wRTdCcvP3FMCLB+QNAHATy7+Nm566SxgJFvLEPU
         2YPIkKGj9fLdrdwVIEO+2nwdy/XTx2AJodd7sq6XmHjL307RcMIyKG8V1LQnWzica3pd
         5/32rUOBcIH90nrEzd4mdmLS+p6fbnrFDUgmPjd0VA1a7/YMj+zdejlkpAP13KjGZ0nu
         jJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595890; x=1793200690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/Y1qpBLY6fko34laYatPIwnPDHGmqYN6KVu8T65y1g=;
        b=ecJrpLg6Y4B7eBWkSDaFm7zoxsBKGvFmCqzCjNH67/Asa0ODL1l079WH3epMCzYyxk
         TXYdAykeh7VNAPRUf02aA6MPjJnuULN+nf6Sbttb9H4oVeyLXAISkIhbywoZw1tOBh9c
         1g1NUA0HFZYcd5CiJUX0ULqRtqdGXUYGglz5iQ3yHX+I6GhJBuFi388MbKeoK0z6igMQ
         UYxHjaxaqwnFSTSVOzjb3Lqcq5/aa/Faz6nEjel0jyi9WqLjhMdk1UIUc6U+0taTe45o
         IMQt364cOZ6H92kW23hsCGyVhdbFxj7CTti4tHdO5aVvackm0PCADGFe/jFlKSjKCKQQ
         pqlA==
X-Forwarded-Encrypted: i=1; AKwUvByB0zj0OXd0Rnh0tRFOKTzuDPuVFRoONn4ONGRvwlsYo07LeqvtzCMbtQmLtndZh9MckctlNhjmEorxbfHei18B@lists.infradead.org
X-Gm-Message-State: AFq9FYJ25lhs2lb8x2jodcEIksnmd5QJxJRgsFQjWELQBmUgvmozC99X
	f4iAJ04adajbg9PtNslj9qZKMSBKB/8Rg4WawV19pJo99ES70ydH2n5t5ZC0qo4DA/izd1F/gVc
	MwbgQXLEnukAOMOAYAy35zZ8HdVRemIh4NdxL7SwlbcmmtRX+WuCSc+GTgrmKWO9eC3So0m4zpv
	1ajw==
X-Gm-Gg: AYBFou3JhYUNSha7EgRiJEcsVnI4k9+93pvKsAyIeHroxZKMiQh4Od5d/yeCPAyn7lX
	YgBP3uexYas2rACm3vtbjss4jqp1J5uBF2sB/KDGtjPHSypTwINnc9+EbfCYS0mBoaKWxB3qzRK
	nbFjFJ8LFC3x356aeVJa8ctWx5QO8+Nu5j+7qGZYPmnxh7Y48aOo4q/MHsyvlnaGKWBJTy3RxG0
	G9eNb86f/KL5FLQsX6PVXK6lvob3c67wOY63bULHo/jb8KKv+yyXyexKJrDLH/LiLlUzHxQjQsK
	NavqRDOipnzMKa0ouvkAtyVFjPx3xXWINK2CSO6MmmiWuh8mNVVFBuZFLfehHhSWE2mv1SMz9bU
	rzcudiB9k9pGAcgUeK/myX6YwDMpTOorx
X-Received: by 2002:a05:693c:864e:20b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3674d047ca9mr4050836eec.23.1792595889920;
        Wed, 21 Oct 2026 08:18:09 -0700 (PDT)
X-Received: by 2002:a05:693c:864e:20b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3674d047ca9mr4050779eec.23.1792595889325;
        Wed, 21 Oct 2026 08:18:09 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:18:08 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 20:47:30 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
 LVDS panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261021-lyra-display-upstream-post-v1-6-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=5076;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=H8TzP8Dj675+nLSJdklFvA6bI8Vose0C+tpoATsgYZ0=;
 b=gjweYPGF24ry4jA6y8Z6u1TL36AQ/mMo/BMNOi42WJjw+p+cvuBIIelhqWQc4yeMFToRPzINU
 5h0j+QlRai6CLulxPqZaUoBOOZQB63dTFto5IYfcjf/nAdXTKISvadr
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXweyzbSiCfcEH
 8qRmT9WJJWKR4+aSi0nTAv7rV6rnTSzAAvlVndKZaZZWVyrtSGM78A15wum+8tD30basdIGL0CV
 0ln4fJ8WbzWKpFgh+BXbHZr94PAfRtQ=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8d7b3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IIR7FofeaqIF4eDoK2QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: gED9pOG6q30eVqHGOqw1IAhMNT5UHG6T
X-Proofpoint-ORIG-GUID: gED9pOG6q30eVqHGOqw1IAhMNT5UHG6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXwk1GT5JExbDw
 Z9zBoeShZuFbqSZLMMTYQhSR9SJKBAwFEZGIeM8I01bNbTTkyFUsAEP6gCEHUIbaXUv0rm7iHbX
 Er7QR9GR3ZJ2b1uw6XnSvm9S856Q5tmH8PUfXi1S+d9IRsFOE14vuwFbI7/JYQ09t+8FCUqxthl
 KZWZd78eTmcuFhLWGy/zxUmAk3KJSOnFRToGrnnUraWiyOp5jo7WmYSwAbIRlOUiISvKq+xOPDn
 BKmFaJI44SJO7YGC5UlSQfebKYH1ZdzXiX+GJ7N+6sGkqf3+zWM0eB52n1T94KOkK+J1k9/Hqy3
 G6PwiEx4xpYv0YOgTAAGpmFw5y/M+yH9gWNjHyktcYht9EuXa2oiIlXjMi8a/vf0z2KWRbwHSR2
 xyiH7pVdDqhd6usisnMvV4rK5rvRZgtePyME3rsZEdZ7pczMmsh0wh9k8KWbvFwm0vQAof4WZ1/
 ePM+Dd1whyoFWP62I2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_081813_151742_CCF985C9 
X-CRM114-Status: GOOD (  19.35  )
X-Spam-Score: -2.8 (--)
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

Add a DT overlay for Talos Lyra EVK, to enable LVDS interface when
LVDS daughter card is connected to DSI0_B2B on carrier card.

There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C5 with reset and interrupt connected to
GPIO61 and GPIO60. Backlight is driven by a generic clock-based PWM
using GCC_GP3 on TLMM GPIO59, with an additional backlight enable
GPIO on TLMM GPIO2.

Disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 134 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        |   1 +
 3 files changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 614152913cbb..f0551bd2d8e2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -473,6 +473,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
+talos-lyra-evk-lvds-auo,g133han01-dtbs := \
+	talos-lyra-evk.dtb talos-lyra-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-lvds-auo,g133han01.dtbo
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..3edb56937446
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-gcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	bklt_pwm: pwm {
+		compatible = "clk-pwm";
+		#pwm-cells = <2>;
+		assigned-clock-parents = <&rpmhcc RPMH_CXO_CLK>;
+		assigned-clocks = <&gcc GCC_GP3_CLK_SRC>;
+		clocks = <&gcc GCC_GP3_CLK>;
+		pinctrl-0 = <&bklt_pwm_default>;
+		pinctrl-names = "default";
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&bklt_pwm 0 100000>;
+		power-supply = <&vreg_disp_3p3>;
+		enable-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <128>;
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_disp_3p3>;
+		backlight = <&backlight>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* LVDS Channel A — odd pixels */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS Channel B — even pixels */
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				lvds_panel_out_b: endpoint {
+					remote-endpoint = <&sn65dsi84_out_b>;
+				};
+			};
+		};
+	};
+
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_s4a>;
+
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sn65dsi84_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				sn65dsi84_out_a: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&lvds_panel_out_a>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				sn65dsi84_out_b: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&lvds_panel_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&tlmm {
+	bklt_pwm_default: bklt-pwm-default-state {
+		pins = "gpio59";
+		function = "gcc_gp";
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+	data-lanes = <0 1 2 3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index ec5c10a40521..20967c294543 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		i2c2 = &i2c2;
+		i2c5 = &i2c5;
 	};
 
 	dp0-connector {

-- 
2.55.0



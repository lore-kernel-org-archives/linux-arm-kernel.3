Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA100606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xjz/y8Yw;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3rgTHgn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZG0lr5sr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=; b=Xjz/y8YwpL9x+c
	P4I7iEx75fiVxX0T6BI6tGDPWqs9B62DOGV5BI2e3tcULldhlCmKRefZIhs8DZpYvcFtvkF2g7bTe
	cvgl9Lv4ocwod9ULTybhmkdSAdBLaTEgq30DvhjtWRa+L2ct+rvXMcducvOcjdWTnzILqAlvmwRPZ
	UudIzl+8Y/UQhzO38CvqlQEpDSbnBcVol0PUR16R0WVcQ7/Hp5VdCp9bWWUhyJniPOTUUHE0cWLQn
	OmMW8KFujH2ZdS4NG7L5En50MyWlNJQk3TK8CWeq8xW2qLFYHtYfSPANcLjCSTAP0PXU+ACe6L7LR
	5J0B6uScwXhkXBXF/XCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj6h-0000000BGXw-26U3;
	Fri, 30 Oct 2026 09:41:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj6O-0000000BGJ6-1tCx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:40:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FhKQ3312061
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=; b=F3rgTHgni0gIhpe4
	f1Q0Zr0u9Nj4IUpUrGQrjOVgtwU2dLrDdLFzNhCfik+ko7FZFKRQgHgY/d1bkF+Z
	qKn0Rh3oKBt6j2bP8blcF6gG74MktCoIdOofa8KZGStz0TtHXa3r77hktP9Kzahl
	Qa3hVANHwEJD8FSJUUrBOAmQ14IeZxo24o1XNOpTcqV0z1xsYcA/FAFOI+LOHJ9D
	8GHsHgclT/XvHh4zYCOFeP/tna80QVcweSsH1yQJkrFU5RwV5X6sJbKgjaCyGafK
	Ybzssa/SNwR1TPaAOtH0fFGDrQ5Bz3B+268EpFgkunI9WkqoKJfpUqJRNHBuunp6
	ft6L+A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qt90m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36637676140so997193eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353246; x=1793958046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=;
        b=ZG0lr5srtCnPpmzXSfHr6z//8yeA2A2HEBOQp20SK0mZutDDIyOWz8mtKeguensmxr
         keXWMhFRcAoS2j7QktqAQRSs3N6Wg5mwVZ1DfFb1uP77GJ+dp6+NYRLZq78RmdWPBaUz
         eNNblM1jEqr26iRVdo3r8bUAuRrlAuPHOAYML7elCeJvkO66bW1vI82x3I3365dwf3Oi
         4vB+VhqJSIl8VyPe/qe7SXsnHY7OC5UqTr6jxAp8QDocq6spwr9aCjymVOmkP7RDX/C3
         doqK7st2gJLBJqJCM3QpcariVyiZqNeHw96ovbHpdctNBNFyVQh32DnvYF/8GRn4qVeq
         lJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353246; x=1793958046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=;
        b=KJcZ2Zpw5zezfRqMNlbYmkSTJyjfMgMKA2lIoQekrMjnsE6FZr8ON+1vfOKbnUFr7r
         MFTZMuPYR1HywztdwqKdB+OF1ry8fTVV5EvbzBUzj7gnOnLDqALVj8zM/7YDS/EjpIfw
         q8wg7T0coX1EVenYWBTnsJqZSzNljPkqD07BTsUDcEMl5WkbKTIFxLfMJkPaA9HazaUn
         zqbyCnjQi1t6bIEOPqkhmoKlGcqHrCTpJYRFfaavRLqbjOb0KG/40nTnrtSXBIypkNLz
         SgkwU5kXkZ79GI+jXNJ6ty2tOFo3W8jcNOvQIoFvdtj6YfvINdbVZv9KLigfQCEhKAEi
         3iGg==
X-Forwarded-Encrypted: i=1; AKwUvBySMNz/yvtYUjEYuajj+djLtowgntO7Ia3pSQjUPt7SrdMPNbSNRL8mwfZzAc10XAwOYOcnY7vrjUw9gIzfhXGT@lists.infradead.org
X-Gm-Message-State: AFq9FYJLz/Cz9y6yFBelmOnIqegow0twiNGgdGqAqHccnvxGfO918rFV
	i4eWhOZ3Edw3+Yn4w3D53NQgFNj0xlnqsHCLwIu+jR+gBqST376djHRdwe44Racfk+hjyFiBkKd
	pz7oSKUmVxROs9NuA6FHw+krayAl1drWjx7qU3ymY9r7fePE0zKd04HmxV4FHj2uDwxv/EZLN1j
	f3FA==
X-Gm-Gg: AYBFou0HLPlsQPEmqC+EJLm7ZFSs4s0ZIha7J5+XAHtmTifBQV0fFviZDSq8AOhA787
	TBg9LDWKeczH+jIkUoQDZ9Yw01qEgE9NYyCnwV0InTbC1A/Zg6NBPXOYnLJNH+DbqRvukcmRpU+
	mR7xHHaawBWH7SJ8Aj5agvjY5H+MOsjJRnpkYaRbl27YRZdMKvHIY5LvBxls6XI0xF/oY8RytHA
	Tfn3cDif4QQ+xPr4qRIYOzfdCT0tA1F6vd2D2sEMKZqevHCr9NrfzwGWCdmfK/AYOkMHusG9W2i
	TPw8dlIYOHy9yzFNpmrJ1fx8+ZEZuYlIh160rqWa1UP2ZAm7TqkaU2gSOA7jcb9e5swycITavdd
	5mwlUijGIVfOGkxTuuQOVxZUn/XaVkQnBYwmcpytnSMLkOfJFqftPJqjd8OqQNZjG1AuHOHac/W
	rI1U0D
X-Received: by 2002:a05:701b:4283:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1ac5cb1a303mr2508164c88.15.1793353246046;
        Fri, 30 Oct 2026 02:40:46 -0700 (PDT)
X-Received: by 2002:a05:701b:4283:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1ac5cb1a303mr2508124c88.15.1793353245491;
        Fri, 30 Oct 2026 02:40:45 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:45 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:10:10 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
 LVDS panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-lyra-display-upstream-post-v2-6-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
In-Reply-To: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=5139;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=CQGqhSxfLwiW9diGzvVCOt4ve1m0nZXLdRNBE6mgRxI=;
 b=n2ECvROy1GlU4o3TO7BU0WasQyEsMLsenhHIyPK6/66gfTnqxgh8lHELbxYQsRNXvUjhxCNBV
 r44LnuA86GYALZdnxupCxmCpuAZZ5gJpJ5KpNKOkxNvC4j8DSfkICpS
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: wRQzPW5SAV8IKBGXCYwg6Mt6tWf7OxbD
X-Proofpoint-ORIG-GUID: wRQzPW5SAV8IKBGXCYwg6Mt6tWf7OxbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX74zzea/aksmT
 QE9EICpY28lWcruC1aMRmg7VZpJSm7vay3fIUHyYIFxmlta6J2BlsDM5LDvvjLn/TPaJVQ0mX1Q
 Bk3II2+ETcPbu87hCoK+IN4f3ofd7ClaoU288g3DEU90Z26wAJtANF8sPq0h2yeN0HWN2Gw8MxM
 oKrzB24G97GQxyKUvdcGR/t6jz0E3/T6KAD8hIo5sqWt9QnwMZwKtZiE9tR3LLOmLNRuNI75ojH
 cC9NPkFstfLIvbl6NkU2+mkGV+GAiywx0DpaEOe80QCSnQSrilYo7mK7acQJNSy6CIAOnljKlUY
 PIiA8PeUIup9ybN/D5/DIzigMM9lgZl4BgHSsMpA1/22o/Yi3sJbfw/Taq5snd0ymcPHx2KVaBO
 LwobUhLy3cCEG8U8Q++c/1Q4USOav2Xz6cO9VFDPmwb6g3uzK07UIzawX9cPqVvl/zltg0rjxxC
 DlwB7d28dKve51zHzMQ==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4661f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IIR7FofeaqIF4eDoK2QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX6L9ELRs2IQcn
 SXDzlxmMWaNtKzIgBGhL5dQ7dgw0Jv3l2Yw7alIIKQI3CFuVn6FFj5+7j//yvU+2rCfngMyD3dg
 95ZC0lpcSaJoT0GbhGHJ0/IH0qrvIm8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_024048_609458_10891D2C 
X-CRM114-Status: GOOD (  19.25  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a DT overlay for Qualcomm Talos Lyra EVK, to enable LVDS interface
when LVDS daughter card is connected to DSI0_B2B on carrier card.

There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C5 with reset and interrupt connected to
GPIO61 and GPIO60. Backlight is driven by a generic clock-based PWM
using GCC_GP3 on TLMM GPIO59, with an additional backlight enable
GPIO on TLMM GPIO2.

Disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        |   1 +
 3 files changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b6a61339914d..012dee96f700 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -468,6 +468,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
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
index 000000000000..8c592e6317c3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,133 @@
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
+			/* LVDS Channel A - odd pixels */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS Channel B - even pixels */
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
index eeb8e903b03b..e5c2ea9e1e07 100644
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



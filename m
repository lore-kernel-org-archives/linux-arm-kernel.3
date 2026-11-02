Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33075606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UFeu73NX;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4TJtXi2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+u9j4FZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=td8wCtjvvOgkdY5q5Oj/grYDPcEyOg2GuFVcRDBK+gQ=; b=UFeu73NXJKK2E+
	lA2B9CxFmPX6CTsNthtOCd24wlHIQhRpZbZN+rCj0RCDMcdCLHr9dW6jY/AikH2do8IUgK01Agzgx
	noKSMyplL1PVSdSM2ROckBFrN1fDVEKNBPe+c1ZAr+wS1x02VUF8nWhl1DLmX1ivv7BkWDp/pfOyt
	pbhaqieee92l8PZIFePkptQHf0JMkSm8mOkuNXFQ8yF0mlLrQvtD+5KkJGbtC7szhGt1WOc/MxVmI
	hGdfnHSxwgajLm7Sz7w+jZrEnaF0XskQR0nYwfwPozeL5RURGBERxHkbvu1EfXHF6A9By0CKU2d3q
	VuGeYx7Fgb4MwFAE7IiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWp-0000000FlGm-3HyT;
	Mon, 02 Nov 2026 07:32:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWm-0000000FlDu-2Q04
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:32:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vHCf3324636
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 07:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	td8wCtjvvOgkdY5q5Oj/grYDPcEyOg2GuFVcRDBK+gQ=; b=Z4TJtXi23fB3mtOk
	EVaMT2OaMZOxoSqT5wwqRZQ9dYwFU7o2BhrqfD7axTCMHk3H/FIpaBXRqwGpDy97
	l7GAJdfLNkjaRrfQdqHqLZxQ5AwQQE+rYsaL7gmYAyrdgWzWhRoh5YJOkoUlypce
	SdOzgMCpvdx2FlTgJB6X7afDxo+act7VhTb8Ko7TzhuuCODd5ywADc16rRcQuvg4
	K9Ogg0D6K0ZpjrY4SNNJ/zwJlNX71PgFD7KLmUB/SZKRrPT00CIaD7l3LbOTuwxo
	i2PArnDaSdU2JlD9lfV8GSNG3CcSwP/64uCJMEe4K6hhnbr35tsfzknEhUiwuNL8
	OPWU+Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6nu5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 07:32:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e93f67358eso31234115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 23:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604742; x=1794209542; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=td8wCtjvvOgkdY5q5Oj/grYDPcEyOg2GuFVcRDBK+gQ=;
        b=X+u9j4FZCv1drrAsb3oIyTKBf2yD2Vp7rd1kVlNKSumRU7yaY8uJDAQKwkRuZxVJR9
         fVdNWSskgbnNIsoTON9JIxBMfcFeA6Pxs12qMXjEFcuCeniXdna07CBz5jMytekWdaMy
         REsww7Xo3KKl4AEbo3Z5RiuCl83SO3BzuXKfUn8xhhFoP1KnRbTNBBZhxmxg0C+9X0vn
         WfcF/BbMJMQVL9HZxYFmRwyhYRzVxQ45WeQkloJzSuDsok60OHgjefr2S8gKOkGTIEXt
         drIN/gMEA4/y46iUvbeQxRmtTKpS4BEo3D1wN5oTdmNt96jjGrAcEnFM3+coauLcFIZD
         mfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604742; x=1794209542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=td8wCtjvvOgkdY5q5Oj/grYDPcEyOg2GuFVcRDBK+gQ=;
        b=y3RMrSAUX0PWUCKpKH8wsUBCoX6l2epjhwgzSvXn8wntQd51Hh2Jo68FlEVIy3GFyp
         hsZ/Q5oR2PZarJUZkJKaZC1c6R4TV3cmMSsnLZGZYEo61I8mxKNm/Ys+zJ031aJdwtA9
         yyqY3hWb3ougur3Uitr3d09h7jfl1B3ODWdXpPUoBKPCxTUMyA9kgISVovUAi3MKSOtS
         8rxyLhWK/mfdd1nK2ry8I6HOKsYh1eaP6OiqHE8RDEm6fn+gV0HBKw88E5Umz5ykzR+g
         s45Nyr7pZs0chX2ya/FF9y9SA44WNm+BR8UvopSeQFFFYZ7wZOdlytR6b4UJKcN3zz1K
         xhCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdA86KOfK1mkVzbk471mtfDiA0r3lMFZcSpJLLobAKMxeJMjt0ncbpp3FW+j/yKMav6M65M/7Qcjj1nOxhBY2t@lists.infradead.org
X-Gm-Message-State: APuU4Z+C/RpFOSMR6C2JvCxYhgnerIPky6CNoeyZxLNR6IshmqDpx3+I
	kxH5wYj33X273kIWdCjFySeE2B1/YKKzS2oBbeinqlOJGk4PWJtq7QUTKGr2Hf3fKBeqLAsb+vk
	PUqCUVlIV/GvLLqQKHIuc8jAFwlc2ce/QdspL2ME6I70u2P2qm1b+/KpLevSsqPjVvDmqDGXtgf
	E0FA==
X-Gm-Gg: AYBFou3aAZcj7FM3fjMfNq24GGZ10kUprdOD8Xt+2+1GCnnVFUyOLi5kc9rhPoQ26xJ
	xPrljYdghFVr8f51eeXbOk7NU3OnDETgkPtu4dTjZ6mOtGtpt++0PXpCzsmvq7ahPIiqdlADpXT
	OJAbJvTWRsTb/5UZAAyEaUTnjTRwtJDsGZbT0PzIhmWj+DUdNoNQm6jiHXQ7zzOBCcA87jmgBQZ
	/1YfBbOBnlUUAXZbTQ3/WouTur+LG9BbBKouqQWVxRWKo/QV7C/LmhmeufHMeRNYpI7JJnHb7jo
	ryiS02M0t0zVI/7saDWl/Fj7buDJiygeYJ8jzwu62Zcj77CAcFp/ip73f5XiSopfUQ1IG36rooZ
	yMhiSx6hHy7yJ4scWQ/+qT/Opepooge4wa+VLdBq180f9ZIPZplNFMIqQu5HVnY+NftIpA6whId
	12Sf7r
X-Received: by 2002:a17:903:244a:b0:2e9:3dd2:a90c with SMTP id d9443c01a7336-2eb3648bec8mr81415315ad.20.1793604742442;
        Sun, 01 Nov 2026 23:32:22 -0800 (PST)
X-Received: by 2002:a17:903:244a:b0:2e9:3dd2:a90c with SMTP id d9443c01a7336-2eb3648bec8mr81414975ad.20.1793604741881;
        Sun, 01 Nov 2026 23:32:21 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:21 -0800 (PST)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:01:36 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
 LVDS panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-lyra-display-upstream-post-v3-6-7f660c3b622c@oss.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
In-Reply-To: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=5139;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ojiixm+Z7rL0jjhgkBVveTdyOydUNY4gQTixdiaiP3E=;
 b=Aix2nNQPOfy5ZeYn/EPBMR3K1vG0fC04lVEjLh5xv3AZ6891yFNM6j19Jj03hUY8JsznbDdLi
 oA9xEtsBL1FAGox1SKBORvO7M/9s0g14txBmfOw5DNwh8HIAx0297BY
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: X-A9O9roiFAZ67PNOVNxhbFptu7alcy2
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae83c87 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IIR7FofeaqIF4eDoK2QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: X-A9O9roiFAZ67PNOVNxhbFptu7alcy2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX4/EMRsuDWHSD
 ELGBmj7jMMDwH8vFwCz6zkOpRg5YY1gwKgXPy+HMwym215gqEenVG6Q7gVMtvd4RsBCK4PJfKll
 3Pikt1Ffe1aDat6/l4oSsbNuunnHzzU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXzGhLVbulXlSF
 f+zh/lbVCdLK20KXD5iYjIRIRB/n6z0X4JRgkbrA0188Edi93G3k3Zp1ePwYilV2esK5z3Vt1p4
 yUT0WI+CbzwwEsjN2NsdrVO5h6JJvW3soX5qMrTn7gkSFROUenX203W1+6KVR8kNHWFKZf9yvdB
 PAW2cI1U+j0Fa4muoNFV6jpx/1uqXTI4/jyTOQ+AiWE1f/y1bNFiTx4XohHiD3cL06+J2/lpD36
 A1fzJJ2u+MLq+Wr3+bAO86AAfJt333/b8cmFTKD3f54r2aGVbPMDPzyO71WgruMzK4hGl9DvEd7
 UDrrhXWeRGMYjYu5xoYVcdrWvVAZOBRH8wfH+y3Tv5sl6Lny4k76eAS7xXocWP76Sf/FXP70B/f
 FP4D5HiI/XvbluyjducTZ95/m6LN/TgJFj9MlirwnlDYF4iOfYS4VMJZt0Xp08yk+WXxVA1O8re
 r54uUDonKRId8ApjvKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_233225_059250_3E190BA6 
X-CRM114-Status: GOOD (  20.25  )
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
index 6a13f04a9055..69da5727df4d 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -14,6 +14,7 @@ / {
 
 	aliases {
 		i2c2 = &i2c2;
+		i2c5 = &i2c5;
 	};
 
 	dp0-connector {

-- 
2.55.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772EE60A262E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=emkADE25;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPnwdUPT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X4z5FtV+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=; b=emkADE2576rg+b
	uzCDH4Ic51aI84gEqRuEjz5iws/Oz3v31mn56ACOI01FHYW0w9sPNkHt9F71GsQv0L4Xw8FoxuiDE
	XB7CjF82aMNPD05sf9nlFsCkUeErXNkTpM05ZVLr8KdS5MLDyohDol3xk+CXiONEk+htzvONLpIRX
	5em+QDJqO4mebL0bfGfOzyAFAJgJ2T+dVv3LCHj8H+y6o/5he4qcBun7mzz2EF4eWxJcr1gzVIzlx
	TUZN6AOJOSUvAuNmmNri+AMThiDiauUKo5AVACngQFS4twuLzH8JznAUthC6GOuAkdIKFHa30TucM
	rowi9G5AzMS5mDZIPGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj6G-0000000BGBx-0jpv;
	Fri, 30 Oct 2026 09:40:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj68-0000000BG6L-1b2z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:40:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8Exqa3737811
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=; b=TPnwdUPTvrSZyHe4
	9qe2B/zst3/agevRcobSHi9mbKstLgy/smELrXCEhA7l1GfegGfdZXFV17VtLM4X
	h0Lzv39Frgi/TbaeDSjl1Ne0uN8dteoox6BrXLMZR2UA6jRZjDrA4jTmxyjotZhh
	X0/Lv6XC0Y0Fkhp6KJ0pBWQgk7pulxHj6v7iepQbQOMC2bEC3wJUniYDlhQxNABN
	iihdzzdAqRsw4iq96STv4sTuFCIy1lYkFsIdbMxXdLlPERtjYc/ObOfRc2+ACy2U
	9rlXUYsr31Ffz07heODAcm6Gjtai7XxJsutxc6lYl633OgjJgUXjytX0sOgDIJC7
	ag27KQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75276y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so682307c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353231; x=1793958031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=X4z5FtV++C4zRBIw/V5qzKI4bvxpStrrKlBULllG6DzwWGgLNlPcwc6lrT8EqoL8UB
         /QCwmmFERUQ1wIZo6AneRh1uoVllDkPciVyshdqeT/4hvCVPIhAQTlifAxP5X9H+8Oop
         aK4JYaVOaSGPD3YWFDIpbF5PWxzvtExwMjuuZwDzzka4QsNKU+L5FSlqDWHxQqiEJhWN
         Dn58NUGAR9OaMy1ESyCBcfA6WiolvgXfD41Olv9VsREtFYBdionX3b/t4Adlypy2QnyZ
         hASbAH7yb26ywbagKOEGXrgNbJSQNjI3j9bAYZGMYUKg7oYFhDRshIToOMy61bd4tzYT
         F0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353231; x=1793958031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=ewGJx58Z2Fzs4PMmnhsLsCAKK50AA4ukU9dmvE7Q2JGWCvHbRHOC+ZpLEfQfDngraD
         RjLqA+6cvG8UOK3mIcTyBv4mKV9FrCzyxNIRUmsT/QnBgbE2+5t5KOe05XX3AFhOhBEW
         UAaBzzNT+DQsOcYCQPbMrwvoC2qK6XIzB3cNwRNDX/r/67oLni03eVh8x1/HSz8A5Jts
         Ix++4Krq5QfYoCsL98+gRrWu9krDeS3WtgE1zEP4MB2HwQiyLWMjVmMWyJ8i4MAgG8Aj
         uvJyWe4FL0w9xJ5h9wcLayqO4XEv0jSGxlHsxDC3ltzPqtpenfZEEUIyDL0/lSEAUaOb
         KYuA==
X-Forwarded-Encrypted: i=1; AKwUvBy8kauNPsZzzRZ2bMntM4RZzVHCZr4ePTYdRnDAVMXBeGHER5/RhYrg4XF21KhzOA7Kkls0tOu7fAfKxrcrWsch@lists.infradead.org
X-Gm-Message-State: AFq9FYJUy/VnMvoMw0Vs4gNeU4LHTJepL7t5Pq9MDqfHAPrJ+LeWEba+
	KPOzYXuYzyHkptu7z0V+uwJ/ImH8bH+jYPEoEEI1JfWuxSxGHWvxyRh5o+ukbf6cCCWsqRKVoat
	GuHoWEUwbO+sx0o8nMq+1fNU8Ri4Tg4HGK9TNpk+Jfn/F0JaV293qJnvAGBW2m5PTTUo2X9BGN3
	hK8A==
X-Gm-Gg: AYBFou0tJOKmTYmNLVlf+DMqEhX+o1dWkEpMmOihB2Ee/LIqK4vy6LzGBz5IYQVnG0V
	swP92W7LLicz05NKgFOm6JfBFCbWPFby977khsc8FPnHl2WitY3P/xSRWtAjyT3/pdi3+1eIWOd
	azTFR0inGHiPhO6gbdO4QqKOs2Cf2a944EXjcdmcS3OQ3DCafkNbPKDX1uO38P5j3cy3QwC14WH
	ZNzIjHBDaPjiD19FtBJXqtUxmJVcGLnlsM+j2L1fYFkBxH5qPnqhsrKaewdiDknIOzgQnBAWd+W
	kHLU13TF1X/qbI9rlFreCi1W/IiX1uUbdTtuEysT5vpARI1E2CvCV4NmO0txckNEZFFZX0YVuxK
	MJnN295MpDIQfMA79MixvhIZsiICO5+OdcQamLrfokRQqkpXFSBVI2a8ro7rccQ9b3yio0MzCv/
	t9sNtv
X-Received: by 2002:a05:7022:258f:b0:165:dd90:1f54 with SMTP id a92af1059eb24-1ac5eea0384mr2993452c88.47.1793353231125;
        Fri, 30 Oct 2026 02:40:31 -0700 (PDT)
X-Received: by 2002:a05:7022:258f:b0:165:dd90:1f54 with SMTP id a92af1059eb24-1ac5eea0384mr2993413c88.47.1793353230555;
        Fri, 30 Oct 2026 02:40:30 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:30 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:07 +0530
Subject: [PATCH v2 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch
 DSI panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-lyra-display-upstream-post-v2-3-906302159392@oss.qualcomm.com>
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
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3988;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=khjAi2jQy1zq3snDT67UsqjsppVgIl1f7iUfWMD5fRY=;
 b=oPaCnw0FIwZwEoCmzsTOlsyiG+jqTmyH7lvMOWP7uVaFkpjeLV+4JWfJKIViZaugdrPrOdn+G
 Xxh6RS0ooMmBJj95c7hfY61ibdfjBlbReSgMcwYX3RS0FOifWgJ+OSe
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: gWK0vhG9LUpVaWig9dERTR6X_1EGRJYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX0t1Lg05lBJFw
 gqT5vgPIw1PtrOUjAGhjtvOy82GpsDhpmS3WncuzqPMEHt60wjgde2cqvkxT7y3rbnOuC0ne2lp
 K5SB/EOIUlqlK933ICa8Hy+AXtXcQDYsDw/iuOjZho2ta3IEsYYttBHAXd9VMCzg3hyhFlxaDAE
 p22cnUx1qAs+tn30/+xqzh3IFOoUGovPaSgHDSMis/yRcSvCovC4Q9EXZ8EMz6NOJDQU3Kigh4J
 fTNlf7F2958cRtebmW2MCiNQJyhGpbDYQeLnB7b/50lua8u2mb1VT/7Gq/0k4tlMeo6e0l/cHdb
 0WIij9IbqYzeO7Y1boD+W6U9eHM+GdLaBOCUU8Iz2rCZ3hrQecV/LEGvc2g1S2YETvxLkyPb4dn
 OPPu9n/Ejb1YhhNT4Wphm9+JEAedUt/RrR9Xlv3HdsHzUcsKjyT4pUEN6K1cZXsaFXjbGqcDyyE
 x6yyGo19SMcp2g8kJNw==
X-Proofpoint-ORIG-GUID: gWK0vhG9LUpVaWig9dERTR6X_1EGRJYu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX00cHzuj88BTt
 /4DUFAoNCC9AhyPcYBR26PeT4duYdcDWoF+k008L5opiN6vEXVESf4Skc/QFowN1HAFqYQh0m41
 irCpJs/iL79SFPMOroZU3LueGbaAejk=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae4660f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jdnGpsxoh38fhdhdbFoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_024032_458896_64D47A59 
X-CRM114-Status: GOOD (  16.30  )
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

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected
to DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON for enabling this 22pin connector.

Add the regulator and backlight controller at I2C2 address 0x45,
Goodix GT911 touch controller, panel power and reset control, and
a 2-lane DSI connection.

Disable the default HDMI bridge and connector in favour of the RPi
DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso | 88 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 709a96ece14e..298054f47046 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -480,6 +480,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
 talos-lyra-evk-dlc0697-dtbs := talos-lyra-evk.dtb talos-lyra-evk-dlc0697.dtbo
 dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtb
 dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtbo
+
+talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..6dafdbb87d3d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_display>;
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_display: regulator-display {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		enable-active-high;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mcu: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_dsi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_display>;
+		iovcc-supply = <&vreg_s4a>;
+		backlight = <&display_bl>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1>;
+};

-- 
2.55.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B433606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H8C10lpa;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l53BqFl+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jR/pQvkm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=; b=H8C10lpaca6fbL
	NA0YJeYOch73kyz2/NvYyTNkawXUrVG2VGB+Hy9bJF2noWwTcZO87N/LAePBeA1uQbRF6YZGkydhc
	MPcP9Mk5R6ym+YSaVz6L2Z+Xjh/7xh1gW+9L1aU15KqvN5D1dVwpz9vfAM4WSEHOGxCPKLBa0ER07
	id9jYE0I5tZUoziXj/svU16D1DpdqgCUCiG2qijGTe34x5/x2Ej5DYKuhA93I0shYzx74AJT0GxQj
	xwsmzrWkPPblIG16O9j88p7K151qz1sEwcwnGP2N7Qf59/SO4/ZMj+NTN931fwhsszk1obJa/A2KQ
	XueHmfC/pAk/fMxiDQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWY-0000000Fl24-2h1P;
	Mon, 02 Nov 2026 07:32:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWV-0000000Fl03-32qg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:32:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A25W3J53924346
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 07:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=; b=l53BqFl+lxJcsyoF
	jER9sTiiLtaCN0XwOhqhX+YSnU1hrgMdnhbgWnIBdjAYr9TvLIQtGe8PrVcdRbJp
	0B+WC9SIIq9jUodFBCfuTeOSiN+iH3m5UhklrCtK8IWvAHlIWzag8aqxgy6nWYWk
	nb3o4WPuvDmmuYePTbFTG0VguZFgI9WgzIkjdv3C0NmnmXr8gj/luc+9iUTfBzzf
	+0epvmRw67QXa8SAjbJ40kyVNaO/KW8YJQCV47vhPTlwOIUkS7IqdYaT2Mhvmcdx
	60wlRE44kc982fB35fCNUyP41q2u3M30cGbIrr9kglYtoP++iRQsYNwzwQe/JUGq
	49F2KQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1rd12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 07:32:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaae8d29e0so25040915ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 23:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604727; x=1794209527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=jR/pQvkmPzRzw+bHOLlqxStlET+AewVbqLxynSXBJIemoPfxIKBIMYZkAJvtR5eJA/
         3n4ZHo4sACOcLUvkzjzMHRvzp/CUNliWlV6NFaEQJn2G45iGdh8jg+scNhpu83NzQYGb
         fb4ltTnrGwjwOHIdqpogWyQVCJHLxpUSspxp47v58ma/lVvsa4qimkPdTr5zj6o0fIO6
         +pal0PKHbPx+tVK+n39vkpYX7gK2ffM5gX7Lw1Y1zc2sZBHN8e//Y5UKfa5oJAIISHzG
         DxpD+AelC9+oekM3JEZoQawmbZd1LR+HaukstNwWxgfXmX4Hw/3hTcoKXxulel7/lcxV
         SkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604727; x=1794209527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=iCK7AFq6881DxA7LemhsmY/ZZKCg4lfHOEfwj81VXxqgzAAKIm7fBxYUUotQzqUS1/
         5Zwx/cIWE8w0jnq+3GLeSa2WUhd54HPI39poNEUIz0cI0lV9PD0CPnu5L3QBhIN2kUo6
         23IXOxYUTw+A0gb7Pqtg4/0HOlsRFiT5JCJl1hY3VdTIWSCk0zK6fSUlQHbJg6yPrL5z
         aJo+rhxPQ5rt/+Kcvfev8wk3yk8519El97Ee7t51g6wvCdKYr8iZiy3QcEvQ17u1bLef
         pRuxbvnqXj70uWZ72KaR6mOcArSOaPh1/JxHX6oAuyHRit+T0RvPYiIpqGl66gNkwUVw
         SDwg==
X-Forwarded-Encrypted: i=1; AKwUvBzektNyoS7IqngeJeoVN2s44404IQvwUwBEywD1ngJavvAbztSI2GpMjZ6WkZH0DdnTVPRVLJCDVFz85NrHIlGF@lists.infradead.org
X-Gm-Message-State: APuU4Z8abWrn0WoTw/0MyHiG/D80gnnKMNZlB+UaTRYwOTA1PT+oIggw
	/nr+2m3NJDqXBqGTY2KAdHlmpHFhUyv4p1cOE4tuWZr9QY1d25F2fQgvMBH+Ys1D5UC470v9uYH
	61qJ2Wc/V/ZPhZWXpeqwSjwwXzF5LxIDjXK1fqlgY5q714F6wUzcxEEqyMO2ZGlPubtN+G0zq4J
	6dSQ==
X-Gm-Gg: AYBFou2p2cKsNiAewF3hiz4tKnk9j4llT3v/NSAdMVE4bHWsv3MgQMwRT28IuZ4zrv9
	LaEDDO4/nyTqx8yIDY5z1LC0GstgEQp1Rp/OPG5V0BXdtmcQLSn39gMP701kFZddoSG/xFf4YLZ
	S5ZraVxvBbl3nXTnt4PbLpnhKTkHzJDfCaxRUKEdLtlrAAub4UAXTtxx9A6PLuFw8cxvs42r06d
	tnw9uK2AFDBxAvqjPMyezK81cAf7NX4Eu2wwJcuGyN65Guy4oY6DPDQlRKAom4TH248DkZKAQMn
	Xd8XQRPVFrGKs5NECBTh367vDzbM2wo4rlHxTyzvZlQKQqBMCHmshi1GV6Qi0eL0A4LLjxnP/kD
	HjFj2YQpv5EzLCIrsa3C5TNrC73sSQnhWFqAHz5JcIWEE0LkTK2D+uB2fzoAgV0UimahjPhSecz
	Cya9ei
X-Received: by 2002:a17:902:dac2:b0:2e2:c84b:43e9 with SMTP id d9443c01a7336-2eb363965ccmr87850575ad.1.1793604726611;
        Sun, 01 Nov 2026 23:32:06 -0800 (PST)
X-Received: by 2002:a17:902:dac2:b0:2e2:c84b:43e9 with SMTP id d9443c01a7336-2eb363965ccmr87850375ad.1.1793604726101;
        Sun, 01 Nov 2026 23:32:06 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:05 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:33 +0530
Subject: [PATCH v3 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch
 DSI panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-lyra-display-upstream-post-v3-3-7f660c3b622c@oss.qualcomm.com>
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
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3988;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=khjAi2jQy1zq3snDT67UsqjsppVgIl1f7iUfWMD5fRY=;
 b=z4D5+XRjcELJZGY+Tqzuj93wKZjqBIYMC2aKMBQZ4dkyAeU26xSv+XfULfNgUug7LIVchm0GE
 6UF1aEhqUCvANDiY8kVUmIm5XAwGt1lJnoUvEi5JxJp/9MEECXUk1ni
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: w-xL1hkfiguGswkBJ3JixvRthXo20sCe
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae83c77 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jdnGpsxoh38fhdhdbFoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXyifrHJK9ZfWn
 iWWfYAXpjCuZM7Y6ujEKVBEuAVm4JtzIyza+hB/W/lK5X2i7/4AO3wvBf78oaaTUQ6M0v8idn02
 rd2Tohgutusbu7DrzVeXveWoSwH36GKa0la8aa2cx8nCvms7N5ZRrxnTEHtOZcvT/ZTasuwabDV
 2HAkTtNK64eTNSA3u6umwz8zGXXxI1IazGuL4Gbtk4ZfUzIKB6rrFc6fKaSBk6IXe76geY2SzSn
 19a8sPzGQLCLXHPdPYprloJ3kcqUe8+hU6d5tWKdwiZ+X3uZUVSrfgMgxfujgLplrrG1gjmcIPS
 oKE+1fJ5Iqh2hbw6sac8yPlytvx+DELf1S9CF68P4b9jLqLUb8YH0DpNv3OfGhq1pjxDHxMe20A
 mJNBETQMNHqJyLdfEVUUKlBGCC1M54v5iIU7NJuc9RoNM84XB/T8b03CFJ036nQpKAyUsKBUIrA
 JQieygmdKAsLfBjXbfQ==
X-Proofpoint-GUID: w-xL1hkfiguGswkBJ3JixvRthXo20sCe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX2+hXJjSmyIge
 VSulFQSYcNke9D8gRjF4NWCf/uZt+QlZEGDH8wYZJRypi0Cha15/YZ8hAtC4PPyIHuAPE1x02P9
 CVHLhwae0zXxKKWPQ0ESqUw9iXcTWkY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_233207_777201_DD2831E2 
X-CRM114-Status: GOOD (  17.53  )
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



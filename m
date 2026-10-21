Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DCB60A2639
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h9zc9wrN;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSUC5IQ2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rx1whIWK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=; b=h9zc9wrNPMXMUtj3sUetcW8lJB
	V2dfCyLaZyyixQfSZvFlDfkRSb5cdFFyqyTUl5kVRsk9on8dh3VUNU9Ta4TeMpmD7s/WSFNHJxjV1
	MgxdEuJWyCM9cYambPGBEaZJ86ClbPyB85SYcGa7KDGunSXrE5E6NVeLz6bWfuiI2x5xuN5EUPVPK
	eQQ4fXeFqtlDQQWhy9v5cSL6ekpVVcRl78/9VhG5j98f85+rs23p3T3Lpz3Z4IBc7ILRX4UIDanrf
	8D8wq3H2eGO7+ca1ZVHyrylBu4UHx9ZkpFF8+hKdZ1WS6lqayoahNp6bZ1u8oHIfewUm4HNSOkzys
	hXtuwWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXDO-0000000C5DW-40qC;
	Wed, 21 Oct 2026 14:22:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXDC-0000000C57n-1fE7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:22:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFFAB1314215
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=; b=lSUC5IQ2YWyvtHIT
	YVR47W/kO13pl5c7HMug+QaPEmjZPBsqjoO7eEl7mq+QBdURRHpGljlE6ShDKSGE
	HPqnjJ/4qSZwFO8f+JR9eSYG2bPPjSMfrUXLVEWlw8nWfgu1nzFZ2i5H3bsFXFzd
	AlA4MEKQg/dUuR3dQEOS/GfKtyG4hTFpMK5588sJtPgHa1Hb7D+h1SVgmcE+e58F
	RU7xQ9AEtSEcL/0ityWBSOR6v2m7nJhqFnd4zgZpw3U2U5efOjaXp7R7wSRUsLk2
	BphhloqLznPNTx0DvdsUv7H5Fk81J9r4oUBusNPEXnWMCxuk2R5NSmcWrgDYgE2+
	9fhXXw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03jxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:22:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34e650cff93so100407eec.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592555; x=1793197355; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=;
        b=Rx1whIWKPaj9uzRIzkXazQ356f4JgeJEZc04vSLzj7mIRCVl617m4jWAT2XDpEsls5
         Pc/uXAEycSTWzrDbMTc9Uu6j3gagB/EHJgYfEdoF4JgBldi50MaI8nfC7x+PuWvhNH4g
         yrk+rud7wJv9vKPs8FYUuglwJAeyKE3eUFSbVPm7llr3vPsOV/XWRX88WyAMWN1sQONA
         y4xTtjGJoJeUgUaN46D4vEvf/iyt2uiwkuXyNYa3DbBrptgOFcTwALxB9lqnhXUVSzO5
         htMBmuMRfzTyCGBj04srqy8yrPGH6UiGxv7adJWfETPLry60jylva1YVGTi1M2SMadjm
         ongA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592555; x=1793197355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=;
        b=seiUpS64u52nr61Qovmx5FEyZp91r7hrojV43D/qzVyv4u/aXBE+bCw9YjdUoMr++D
         5DBqJXIeVoJQCftUeO5KabZBxDdaRqQFy+xn2zBkmrfSfujFQUAhfy19KsZFsLj1z7Wf
         L7b7cQLzQdb3l7m6M68v6gDVynP86MS3FXTbEMXvSTYUqC4vfdTJFpUx3rElTtMIz5Gj
         +CXiQY1U8CAKZ9cmVWsKTtVUqunJwvvS3aEPopNxZlrQ+d4cA7093sJOEmwPkRvD7LwC
         0PqfiuqYAOS94lum4ysW2J6TKNxkjzx2j9tMa/1e4rC01GQN5B/1ksfg5RYFksiERS/N
         CQ3Q==
X-Forwarded-Encrypted: i=1; AKwUvByq6W+/ng7ZheebXeR/ChlFjd6DloQ3ORG70o3pSGtpcJTw9VdJqgJf1exjB/VXF0wBNd/Oewsd0/Jy7ryjNzqG@lists.infradead.org
X-Gm-Message-State: AFq9FYLVEzrdOgnXhEl5rbFH4wkTH2ddbHcK8biwQiC+A7AJG10m1YuQ
	+M02WVGKY0pSrfUrncCFJFwNpsdQ8SrTpw//ADqSSPQljKdW/1tcQELjjF99BE9MUy0OsIYR+uq
	oKEgqu0Qh3LuX9M+K6PicYYpyZkAitB3nwrzUWwc5mNss1xXzC0eGRMIELagZMenLOXAqYTfrOF
	Q9Eg==
X-Gm-Gg: AYBFou1TWSIJptV6HFoGjKpo8FJ0CnnshhPKL4zYEG6o2zEqGA4EDnpWAeOXh9t4DOL
	PxLMZtxBiJ48vPlSVPh00edh4r19q6IbZ5PFP9NZIjo67RnU7sNF/H027LpplUcHzvvA7Q/WRok
	w0TnJ3wu5kf30wHG4gjeBwSdOBxYOeZeyDEStIuRyqj5XnSFBq1G6R+hSnJeYtqGRdNZUaTijP8
	yA1v6Zc99WM1ELJy82J3eeuwIWiNjyLx1F/TJVDn2hpXmZEe1lOVdazJEo06W7WDgl1tSWS3ymJ
	pTnxGMJN0k+G8OsTUumtz/CTEjiRZ6CQV1y86RG4kwlsxd8oxtTonAiuRx9lhhYbGDo71dwY1et
	5RC9PlX9HF3FcPEaWGU2C7UgST/mx3yDRMb/CzUiEtqoLd+LX/ZrzSxd8VMVFjw7cnVoIV2C1yf
	W6ba+cy+eNSRL0XixbkHs8vxc8BNMqtQG69qLX5QdFq10ULimnTIs=
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id 5a478bee46e88-3674c43a7dfmr5185446eec.2.1792592555112;
        Wed, 21 Oct 2026 07:22:35 -0700 (PDT)
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id 5a478bee46e88-3674c43a7dfmr5185334eec.2.1792592553669;
        Wed, 21 Oct 2026 07:22:33 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:32 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:46 +0530
Subject: [PATCH 3/7] arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01
 LVDS panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-shikra_display_overlays-v1-3-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
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
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=4686;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=3QYmG8M/g7dpE66TWx0XSm8iu75RDCnzid41xacPU4s=;
 b=H3V/NOZ0N8Lj6BAB5JnGYIlkC5Wu4KDFgF744Z5TfTNoS0XYZi1tgn35KnMw8WlLb/uzo8h+8
 t331C5SfVmTC6r6LFlKRWf11kUNa2U6heea1agf6eDC40U7nacEqGz3
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8caad cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZKKiMLYMdhZ7-3cI3QcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX7RQcWGoXLnUQ
 Xb96ZWKNlgSVHu/g+6EuyT21nKZiPGR1dbjvP+nRr5G2LJ4CJOdMI6TnnZ2NvNs1I6Aq9k4YtlI
 NAEtsqRQjmSCiw5WUyTO77ONBbvnPQHTUWmDwQT9ymYiC/CJHH52ry3hNYVmaNzPRrtpxV9ZOC5
 YK2yvfEQfzLX4alE9uXvpYXTHxmiwYpojzhhrcmu4c3rXOU0gFXeY28R1zpZJuM17qhYXX9Wwyl
 t4PAwXHYtt+HOQF8Iao9DZ7AsgoajmTjTp+MFbOVC4BBf7W3ZvhH9bPKzyf07mzQICPVbX8pHpQ
 c9rXZIW/rE68wlII6oJYCMRUmicM2Wdvqkj0rbQH3YXf95SsGDKVifOZELtuc8esOReHjuCgjJA
 GoVJGulc47u3mlRb0K12fWp+kKi6OD7yJFtLfrvEsGuIeXNv+H4A18Fivw7ZTms2gwyLPu0lMbr
 QQgRyd27+uemFx8Qx4g==
X-Proofpoint-ORIG-GUID: kg-XotJ7M1aMvUKIVdRmRSWCt44by2y7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX3zXv85jtBQLJ
 jAR57HhCl8Ejv7BBUe5ZsU8Hu4D5iuRTXitCyD9xkecjG+vqTmx+0gB05pyCsCy/0BqgB9veW/k
 nAzZJFzKYF1x6+GUWTRdnOLEudFToM4=
X-Proofpoint-GUID: kg-XotJ7M1aMvUKIVdRmRSWCt44by2y7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_072238_558386_0FDDF8C9 
X-CRM114-Status: GOOD (  19.17  )
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

From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>

Add a DT overlay for IQS, to enable LVDS interface when LVDS daughter card
is connected to PDISP1 DSI0 on carrier card.
There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C3 with reset and interrupt connected to tlmm GPIO76
and GPIO85.
Backlight is connected to gpio87 with pdm_pwm functionality. Currently this
is not supported in linux-next yet, so pull the gpio high.
Enable support for AUO G133HAN01 LVDS panel connected to this daughter card
and disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso    | 127 +++++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0c5a7b7f694b..610fe640471b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -381,10 +381,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
+shikra-iqs-evk-lvds-auo,g133han01-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..80b9dcc92061
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
+		default-on;
+		pinctrl-0 = <&backlight_pwm>;
+		pinctrl-names = "default";
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_lvds_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
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
+	vreg_bridge_1p8: regulator-bridge-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bridge_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vreg_lvds_3p3: regulator-lvds-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_lvds_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
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
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_bridge_1p8>;
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
+					remote-endpoint = <&lvds_panel_out_a>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				sn65dsi84_out_b: endpoint {
+					remote-endpoint = <&lvds_panel_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+};
+
+&tlmm {
+	backlight_pwm: backlight-pwm-state {
+		pins = "gpio87";
+		function = "gpio";
+		bias-pull-up;
+	};
+};

-- 
2.34.1



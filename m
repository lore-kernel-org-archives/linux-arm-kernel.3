Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE49606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gc+E4zti;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzZVXZtl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNILc2sq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=; b=Gc+E4zticqXpJGOQ9mN4ZhBISR
	DhS/o/4zCqV0kmTouAxV10NQhksChfWl9/aoXpyjIGFC8A2hhimuwBl0M7Q7wFNGhSfeYWwptBV+d
	kTa3WykwdxGmUZYzDKCah/Y94OG5gaWfHFbV+46vfg3ri0h8q24mSkiudzRBl1WCp3tD4/59WEP6t
	L4whwqiSKDChr0d6DiMby8Qb+XukwMhlClnmkVY2lCCRuGsN88sLsi/nkTH0DD7GIqVSVKlIZZQsl
	OkWdDlWqyyw8sO/XxNHTPUIdTHCLdWZ+27ZWDZPsENiMSh+Ei8GQwDLv4LYel2vW4OSl+v6hnN1Jd
	22shH+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXCp-0000000C51H-3bki;
	Wed, 21 Oct 2026 14:22:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXCm-0000000C502-3bPN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:22:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF2kJ657566
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=; b=PzZVXZtl04DVgplZ
	kUqg5vamYY66wvnO9Br3zhrGL8JBMeOq1xXkW5fapBtOdLlmN2jS0RYLJRMcLFAc
	gihwnwVsWAX8mRlr/GkmxMvfzgBcvZYK9Gxggt3a/oOIci0gDcx6nyHHXJZAVqGV
	lMy56M5f6cpza4eYLl2rsD7oqBzEe8tk+KyRmw02iqbv+4DdKhoCPLyIc4jPbNjg
	eJMtZAoh9v48OdA8X7abIrvAiZz7+Gz9YLfBsjLRAJlYSC4W18G7apHC4TG2nRaI
	x5DO9pYU7GLRBNbvv4MprNE7+VaN5P+RyLHwJIzGdQuUNGbSggkilIT1Mee75M3l
	9JE4GA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v4ce5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:22:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313c7315becso117032eec.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592530; x=1793197330; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=;
        b=QNILc2sqWe+doNNsdZCMdpsCZnfhhMEqG+9CWAWgR2H1Sq+NQ79jc680+7S/LnBlug
         5JXkxhBXXwME2vrciq8I296x0b9F17iT+6X1vJxBOd12MrDlwDUjmuEThYHgvO9evXVk
         mY8XpXKfEf14Ao0i97x4LLiDBpHMcZ1PVAWlXiaLUydvAlnfra1uQMR9s3V+4KlQqTLs
         ty0E756/x5wrWENjiP6mF9yQHt/xBc/IGIC1J/5ulVIloWxX2U96qDal9wuYzzyF0O9V
         qB14WTNDykG0KO4SAshyxpVlVe8j9DgC2p12BKpZe5qwojRKWuc3grT8qLagzVWKTPNI
         G/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592530; x=1793197330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=;
        b=XcWZlKx5a+xajTI7eUczejA31rFA5lv7IEaej8bppI2w9gNkxmYljcozorE0yHR8rJ
         9TSXgBcIoSOnSTGewWiZdL49oHHS/Hu4mM3bpui9mQskBIZ/QfrUbQdpePhYQVTNEujk
         FYw+fFzXKgTLfwulEn2LdFFWFV1KkX6WdXXTwoqUSwZQ+rhlCPkh36vdr0zlxNh34U69
         R+HHuIelTzfDpv3YU4REthixcfMo9U/xBvOkFgDXp4MAKrAQeNfUtHuJKH398z6VsQPB
         cO0U5d1pGPRvJSmWBnB4WEXQKNnYineKWzxTKd0H6h3Bk6wbvk9VrmLisR4Zn9SHFf2Q
         s1XQ==
X-Forwarded-Encrypted: i=1; AKwUvByEYSr/OBaS288lJyZP1fZ5LMcY88sImQZgLEq8I984+HFQjea0FMzddGnaqpLRLeODa2wat64GEO9mA121MqQ/@lists.infradead.org
X-Gm-Message-State: AFq9FYJgFFndAJWfUkFfNL7bse5WivMaNXTovvomBd3fYe5/XTTnYPdE
	db5nhVMw7hH1KliA6LZXg0Z71+Rsys+UVvoTM4cwfkmHPIVM9V607c5dzA1Z8uU6/qdcvBF2vcn
	0ZgCEBLKyssHPPBqXfvnGnNPr7nWwfGLJ08HZwNiwUjsWfD0a1Ph+lTJiQKViZCD7KG+4yta1Ng
	+DVw==
X-Gm-Gg: AYBFou2Ulol8gR1Hvn/gDp1aMtZeYsYI48ni1rAMtnWcg9t0DoycsXuMZIOBI3VhIIa
	2daTtS6us/2hAmKebA/HMj5I+FxF3imJe2oBJ/pS2bvo9Ttc4IBgpQSf20VpqIHhYWAVgTcBy9Q
	QkExTb4JvdptMj+gJ9cwAc4Q/YO/1QGVcwlWPWf+fldx8gFzji1NQu9IWlkG6DnDz/4F1YPEPiQ
	8xBkTwADCSxv/PjqcU/PxpQcLi1qu3MI9TJ+XzOKfRyy3kOvN4UEAoY4uQ+H80U+eEi3pSWV4ov
	r0hXjTuod9WPtGpFBEspw1eq8uhnKEYM0T8nQMl9UAVZ6KZ2XfA66T2HrBXiLYa8+cO9QZiKMd3
	gW0ctqWj3qO8yfhtsPxI4gYSH7ACHSaamj2CJlUn2aEeskM5uViEa12PSpZO2b2rXRJl7VN3Ls1
	9cTZwnjH//e1Ctb392zJqfYrfhuek9kWy8ur0cPMoi2zffESG1UH0=
X-Received: by 2002:a05:7301:1a18:b0:351:7883:bf47 with SMTP id 5a478bee46e88-367473c9a92mr4748634eec.0.1792592528042;
        Wed, 21 Oct 2026 07:22:08 -0700 (PDT)
X-Received: by 2002:a05:7301:1a18:b0:351:7883:bf47 with SMTP id 5a478bee46e88-367473c9a92mr4748548eec.0.1792592526795;
        Wed, 21 Oct 2026 07:22:06 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:06 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:44 +0530
Subject: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk: Add
 HDMI overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
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
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3537;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=/cz9M5Mfy75zJF1P+GNbj7Mi9SYwOuHONvPOWhiMRBE=;
 b=kwifF9WcjORAuMnoI9aoon6ipo8Iz1mgElJsn6gltsHFBKq1IQQpnKarDVFKjV7aqjIPiK01m
 T3LfXaU9EAeD/HbXA3oBnHSJGOae+cZ6wnqpUWFpsVgYmLR7l3qKguj
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX7/FKhw08JnXc
 IcqfLQE9u+6jSZIglWUxrkphUeHh3ZBwmgXxuPi5wXE1coQalNzSoNeF2D/WVfOBmoZvzEztzUM
 pM++BlOwFOjSvAp3CIj9l7OA4F7Hdn4=
X-Proofpoint-ORIG-GUID: ylFvHk2Okv3lmXilByzKfwKS2Gcjd4q-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX36d11LpTQWeW
 OodNpUUgZNwhFgCAPyZe479noJBT03bmOy3mpsWcTR279NmIQIlcBUNJTnRzrNSd6j4iAR8K+Am
 Fg/LJvtqFvWkk5FEgg4+G8yH9Q2btco1XWRfYNeAvzFxTJ9Ta6ONtmtTkShXvfo8fqjBTBmpJFG
 sN9TSYyV6NQG/K/wa60St+irvBPiKdRtMS0G2TlpWvGfARcd8oi+LHvWYIon+yxvIO5aPUtUK85
 MqVXyEOLpWsvTZSqx8+rMVKcwuBb8NkU5cXUMqhF+LwvkQ/SbPhz6LNMwoi/T6LWCnWywSMswbN
 wcwSaeMghLKCuAdioYlobwiPY60LBHTo4a6xs6k5kW4X1k3Lf4lizts2Y83KOI4g0Jw1tWqnflo
 R+jy+fE0T34nZiHF8pKUO9Z4BMuzdISNQrDsO6pzbCfWnG4+/CcEBhvpDcn3EstEAGPJa/NoDUT
 Uz8q8DItry+qPrhk5Uw==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8ca93 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=U5hq_iVO10ORy946Z-kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ylFvHk2Okv3lmXilByzKfwKS2Gcjd4q-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_072213_012670_31CF046C 
X-CRM114-Status: GOOD (  16.92  )
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

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add a DT overlay for CQM and CQS, to enable HDMI output when LT9611UXD
DSI-to-HDMI daughter card connected to PDISP1 DSI0 on carrier card.
LT9611UXD is connected through I2C4, with reset and interrupt connected
to tlmm GPIO76 and GPIO85.

Disable the default DSI0 panel dt nodes and enable LT9611UXD
bridge for HDMI output.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso     | 90 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4e714251d5e6..c8907e77c893 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -377,6 +377,12 @@ shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-ca
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
+
+shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
+shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso
new file mode 100644
index 000000000000..a7b77114061a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso
@@ -0,0 +1,90 @@
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
+	model = "Qualcomm Technologies, Inc. Shikra CQM/S EVK HDMI";
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&lcd_bias>;
+		vdd-supply = <&pm4125_l15>;
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
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0 {
+	panel@0 {
+		status = "disabled";
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+};
+
+&tlmm {
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1



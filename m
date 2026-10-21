Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E8760A2635
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DOVJgcg1;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWXF9kr8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WSxUezix
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8mvLjpFiKhwACxuZd2mTQLn0cM29FEZO9k1hGlfJGs=; b=DOVJgcg1eHxL5LVopK/3WRqm3h
	1hIvoHfDYdgbsI5VZDuxnSNEfkqRFAGcWEYRQzPy9sLofvmjjGMvtJv+/erxF16gHbB6JMTajXNpC
	vFH4BNsy8w34IFXjtSAPLrD+H6ASKOdQRzcSj/1jqFBWvTCGcfBVeton0MzVfiGex4HfobG8O4AgD
	SH5L0boqqhs+StiuAEICwTo+a0X/+ecFULvgv9WYV6XL4HU/sr/YwJAA1xMbhag81HQYtNkQQQpkQ
	4VfbdrD2Y+uBtSN4rTbsxfQLyzM1zOzP+xZ+ZfNkxZ/wjYChHMSmznwBkvIG59urPreIas4wuPGsG
	kGO3Z7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4g-0000000CE9e-3lqZ;
	Wed, 21 Oct 2026 15:17:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4d-0000000CE82-2ZAS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:17:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFCig515960
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8mvLjpFiKhwACxuZd2mTQLn0cM29FEZO9k1hGlfJGs=; b=nWXF9kr8oA+yTivr
	ma2U2CZJpKddsci5ooepMzRHyby+gr/A1tOBKAnuLnS/9Vtt/Z43ngxytZyD/K7x
	Kvv9kHFlpLAFmxweu5Twoe8MOWBjYJB913Js4l5yLp82+Hy7qM1Q/BtiqvEupAMP
	C3dY2rSZ99ieoXIFfHvEfLjRQxfSSZ5Ube+2YzJmj+R55zi+CnN6Jj8pE4oo6rRJ
	b+rP5AjEvEnlq4/Oa9Ttms1BNHdZKnoAawvcNMHOfgDnXviq/y2N6FbwY2yNnzOk
	iqsfm12Dsp+l2WxvtW5hr6NVp1JR2bvSJFLY5T8O5t29UYcvk28R5fg4tVOre24E
	cfCUxA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vrhhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:17:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c902e0da2so2538969eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595868; x=1793200668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8mvLjpFiKhwACxuZd2mTQLn0cM29FEZO9k1hGlfJGs=;
        b=WSxUezixNghozcuOHB85ajDYqkrf+3gjlhHwdSGqz6WeHzBX9Y1obFTlSB/UnPPvRo
         3OFErsmzFEFaDXFrzorsiDqxvrbbCwr68SHZZSTuaUd6tDuHlOpnM3X5sXZi+BVcM21x
         nW4VroVHWR9uVvER6QmsPbxA/XbQ4SpeQnNIhxBDiKFbr/YcE75leqVcnQvEQFnhPnLV
         34ENIcfdH2uy32QTvbPC6NjqDGCeiKi2xPA+pwcOkAT9/HbjxqXRiP+WKXk3sdSjuPC9
         D3KvIqFMjLmkbJluD4yhrPRlYrg7/Shf8MDWGewj4HdXIW51uW5QYjYrWMeY4OEmlxNN
         snlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595868; x=1793200668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8mvLjpFiKhwACxuZd2mTQLn0cM29FEZO9k1hGlfJGs=;
        b=bGcVj7364t6R/Mxr7TZtfLTEfBfufbsLEhgS2hEzt74rS/ysR9gTWxrFZv9XpMvDwY
         FSTadZWTWK3xn5HwU0UDyJhg0wTTGzvo6HbEG9ilJEXCGRymxcrrEkq/dkweJfjTroXf
         rjfB3YrGSFHkqGzaMJjo2UTOfwNpcm3OakmU3OIoN9XQowk2kIb/YFv7mG1anGwX8Xwr
         QVO2AKbds/LwCAJ1l7yCmZ+TpfopmHMQDaezp9hHXceAye5RuM+312cckJlz1Qvpx8nx
         MUNJqIAvrRGoEJA5QGGjF/zoXnGptD+1AKpOlLbA/WcaAVFvN8YJLBFEXKQ6KLJBJdjx
         6v1A==
X-Forwarded-Encrypted: i=1; AKwUvBxKoZdyT60Ka2iYtEGHwWPKWqyBD2gOUnqi9xlirSBotYWw7vLivH0uuHgy8rNBzKv7o0GHAotjPD9qOxw/bgLO@lists.infradead.org
X-Gm-Message-State: AFq9FYJaG9Dau8CLpaQnsOSsDn0y1bByk/uLzEhJ5zAZ0p90vpnDnD7I
	yCqlsaYLcYDIFm69bcjtt0rHER2vCPlZ3jlmVXna88oU510ixAjaqDMmdONhYjKjxEazjwNMh2w
	kct31Nu5r5crwoU5gSEvaRkKoWN3QQ6aqEPfiHQGqPndzKI+fgoWlkrh7TkTSkAeMzeun72MI7r
	HJ/Q==
X-Gm-Gg: AYBFou1Jz06hERnqoPQ8SuRT25tO3/NcGbN8RHN8ZJU0Q0O1jdS25LlrlybYkTV8kbC
	BJLnMjG354usIHYh/3kwbXonJAaASTEtR2fjbg2LeP7LpwR4YgHkdWszYYk4fSaghELuzuZPB29
	og3tIGfS8DiGXSrnlTvFoQCI1bkZzGQBJCVv9dTZcpoOk/tiSvdWevF5n9sq8mVxskusq9OcxKG
	Mbm6OdwLLv60siVWXd5ijTbgwj39KSiI0J7ZIhCGo2s9XmTLpM9CxysZYdwlGaad7Unz5z35Eud
	genAV/p/vHsP0vcGZzLb+SGRLNdh1hLGu2SidydBbj5SXNCcFXWFErNo25ToPufRJk3Ay2W8u2S
	LyMPm7+L3QXZwM7nIYqkubVUExXm2IJwh
X-Received: by 2002:a05:701b:4584:b0:16f:1e21:7006 with SMTP id a92af1059eb24-18db7b92510mr5455188c88.1.1792595867722;
        Wed, 21 Oct 2026 08:17:47 -0700 (PDT)
X-Received: by 2002:a05:701b:4584:b0:16f:1e21:7006 with SMTP id a92af1059eb24-18db7b92510mr5455159c88.1.1792595867028;
        Wed, 21 Oct 2026 08:17:47 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:46 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:26 +0530
Subject: [PATCH 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
 panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
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
        venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3288;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ZudYNg8CD4HxKYEgSogCRb90bBVYSkxfqgXqPZwCo5M=;
 b=bsghKEbvyz7ciKB69n4zn4S3dYWFuw4gUQpzl2GH+AeVLRoGDiifcMZtjAVE8Z7A0J8EQ0JHs
 sh4OP5cl7HHAHznOX7sc3a+KBwY14XiLtyzfBGmdIhmougfgMgvhWsk
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: 71NBV1fjOStryXrcIp3gDxoB9S5wYYJy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX8WHaKkKkZY6J
 gV/rwN5vd7BfSf4Lc102Fic+9r/YVbPTCwQfFK9PslpHJYsvhABHX9AUgwyjn/Na0qFqVS2yczr
 Rjm/7uOM1yQ39nQglJSeWn3jEUJOnLg=
X-Proofpoint-GUID: 71NBV1fjOStryXrcIp3gDxoB9S5wYYJy
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8d79d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5_l1GLVmkw0F_C9TNj4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXyUQpYYsoJ5Fd
 vgFewo/NM9i6+7viMZqo8r0XT/ftdOyJUKvZdEycjUdd+VL15JhEn7pFypqRZQNKASFwbZkyBK/
 MlD9DbLkzQH0wlLTvjwixDRJZYz5lSTvjdm24zNBtNzPOPfXaIGEvxbVdXSFjqEIDw/RAlgpi03
 0TV6d1+R3BHQ2oy/Fro+PSh9SvTyhGBiwh7B2dOx/2lUXIdFqV82fvde9x3l1IMH+319V/koeMG
 Ap6j4u8dniGogOvtpiY8xBYNcS4TaM8n+MejCACsPK6gy2VAZUJWiKzj5l+nO6eLqY4v0p9riQp
 RDvv2A8RaWy7ScxHysyBwJ3NRSauHF2HkLPS4PxLsZ8ZdIV461vNelj4Y0tfFl0vfWrpCN7cJBf
 201lsQtAK+mxqdA823gGI6Dt4twyVVS7FdZ3cgS/np/E1uwPWXNoKG92/7vTDHyJ+XWgMTunPME
 O3sg30Bg3SAf0ZH/KBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_081752_508098_EA106234 
X-CRM114-Status: GOOD (  16.18  )
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

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay for Talos Lyra EVK, to enable DLC0697 panel when
DLC daughter card connected to DSI0_B2B on carrier card.

Configure DLC0697 reset GPIO, supplies, pinctrl states and GPIO
backlight controlled through TLMM GPIO 2.

Disable the default HDMI bridge and connector in favour of the DSI
panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      | 78 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4f8ca3112fed..5248b6be68f5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -476,6 +476,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
+
+talos-lyra-evk-dlc0697-dtbs := talos-lyra-evk.dtb talos-lyra-evk-dlc0697.dtbo
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtb
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
new file mode 100644
index 000000000000..e50bf69c7b37
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
@@ -0,0 +1,78 @@
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
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+		default-on;
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
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+
+		vddi-supply = <&vreg_s4a>;
+		avdd-supply = <&vreg_disp_3p3>;
+		avee-supply = <&vreg_disp_3p3>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
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
+};
+
+&tlmm {
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio98";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio118";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio118";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.55.0



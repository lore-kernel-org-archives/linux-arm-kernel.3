Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49A260A260A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SIYlC44U;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DfhG12Vg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=an+1O5Vd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=; b=SIYlC44UiTPTzm
	AXLwTcP2NGEs8Asies116U4/PKUfnoeC4fuiPPlfwSrdwwpCeve56k0CXO51MbuXiLYy8/38zRcUQ
	0SiJvrLmNZ7hhInzDa7Kw+fqqNAtEW1fCWslS8mI8rHDGjLyIOTLKZiI2VE71RdWDp8yPukiiSVcg
	H1oKpCPUv247XkopmzLcyIMx1NZlNO7mzoFVte47b0Fy7ddx+80fkCDjptZTBhvzy7z1kUdyDBzIl
	lHkwjZ3NM3/apQ3lTJzANLbojXOGQyTRc3MJJrYiNW7XI1rb/VB5iEPYoQ2S/gEDSCa564Ai5gaTa
	gBHrn7HfGfsH4a1F+sQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj6G-0000000BGBd-0Hq2;
	Fri, 30 Oct 2026 09:40:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj63-0000000BG4Z-2Frh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:40:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F1802682857
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=; b=DfhG12VgHhVEsYIJ
	41tDNrNdoiUIQxSLBIaz57GpLCfn0yPI2b8cMNSVC9Je5AmkJcnlV+ixwXBAzQql
	sUokMdjpSPOu/wZ1nUHXhiykoOItHkdKEnmePNcQdxlZmU9f1g1ZprUouPxBKutv
	eMgL5gTfVpn0SMkeFDgvC6BsTp96/4/HGticRqiLAuSCjPWpUmgL1xN+goYi6OZW
	MPL9z6ejlcA6I13oDJj/tH/dzfY1Djn+sw8R2tV99C/R75eRtfaylsQd4LLGGL3v
	JK19eyUcxgh4WqrM4Rm5k36qBFIQJTTVabM2kth9xDL0yOfeSCHoazhlnHTsAGqI
	0PJAfQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj9ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1194194eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 02:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353226; x=1793958026; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
        b=an+1O5VdB1hDiVCL8GbQaUyKo04rtgceh+YsftHRsIAMOPpk1RgWe2WExToFnFXY/K
         cIOebBS6Kn7ac5cTjtJCTVRuEooHBoZ5oKRtI4mXkFwemwQD1i7ngeW9a0DV3xUovcLS
         x3HOdb/vhnpsw22vYsWu5kcuT/fh3LYKkIe83/KI/do+P7g1IXftsMnHW4A9E9lNQR/+
         hd9pmFs15d0zJUok1Lgn3rVnODhbO2lSO8xiTmbDBf43dgMxnKWZ1s8Ob/kyxQaCGoWs
         1Pd/yBVtX1KgUHYRIHJj8rxvhUHH0yE+JMnCnTLreUmGGRhK3/jRBIGOHfSKKvNqmNUB
         6nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353226; x=1793958026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
        b=ML5xmB9HczRRV2RqND5qWpWA1oymBUg7sND5Lt97YeITUHUx6nVYjiEGmcif4Z0aCt
         VoCEegmj6lGcSqx6XKE5/kQwcAnv6j8yLPsPzIBDgUD52wpexAGwXi9ycy0wG0fqv9M9
         rkzfNZM/53Z+W2qIacsllikAU+Re231Ew1GzEjbfIkMvaqgOvpvcMpuwDieWV1wDt7QA
         lu2eoKiKsP56vzxeKwsY64K97FV+7RoeVyy3thhCFo5dnUorYSVo22rWr2bKVlUpWeJK
         aIqeC6Z83mwdgaNAwk368+0jccy24e7gZDLTCdSk2sUy0BbRO7wzX1+y59ChNAUSkoqu
         qzoQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/33yviWCMsEfHbZUWRClMehyyWxsyKKN8RVF9lKTGPOjrPYulQ7NL9Dz+0ZexWXeSASStZVhHc6cfH4sYKzfm@lists.infradead.org
X-Gm-Message-State: AFq9FYKWSAtB+P4u/9Pf9IK6dBANa6rkres113mUW2n7/E272UiBIn4t
	ONhCKWBGuftz+C3cwveBDbsZtLKEzVtZFgMfWx4fO3x68O2raasooZU+kXkKGqWOZTr4xXW0Cyj
	a72r1TUOGM7v3g5yad9XuBbaLuQLyO5RMR/2XK8GKgOxYt9WJC11k1EWz0iIc3wV1yUT7GSJxfw
	+vBA==
X-Gm-Gg: AYBFou3EL37++qKgxcsr8slU6yH/gTbD0R9l+dSHov/RpjnmMzagYQRwzNq0rIRgFDX
	P4BDZhYM6GO+Hy3SDhTTRquDxU64do3VasVvZlB1vTZYASD5B44mB6yUmzHGy8P3VoxhRWgOd6q
	IfH6wqQq79a/IWEM9LXV1aQ9j3XcBsijuhF8UHX8xQD4iqpiRVlwgDHK4aqI/+TlZK2SpTBLaWy
	evIzvogYPe3KeSmdICTR3qLZ5+Sz71aM/kYsfIo3+DhSudj97vGMs+q6g5uRvUl59mxbSlbNe2k
	4Qt41K3pvfOKILZPXIPF6bvDvRDd49yVepu0zZsBvHe6AYR2ycc96T4AKaN46QBsASfp/5syLHI
	9rBrzsKch+2fjek5AQ4LOag4lj+MWxr3IAA9D5byO4kP0QEvSKkoEBP8rdbVj9hGcf74q3kfvCq
	MSPVXN
X-Received: by 2002:a05:7022:120c:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1ac609808c6mr2274865c88.47.1793353225877;
        Fri, 30 Oct 2026 02:40:25 -0700 (PDT)
X-Received: by 2002:a05:7022:120c:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1ac609808c6mr2274832c88.47.1793353225307;
        Fri, 30 Oct 2026 02:40:25 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:24 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:06 +0530
Subject: [PATCH v2 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
 panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-lyra-display-upstream-post-v2-2-906302159392@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3295;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=SEdAsyTt418trjKLHtxucoXBRSy/JerrxkxW9XWhnj4=;
 b=IXaEY5OoYDtgULSmW+1nYXI6+wgFsyf/zw3WVKuG8m9x2DmbnTOJsZKR/yO8PR4kCVFGt35Gu
 ef1jZDhOuUGCdqDGb0F3iaKDwoxbKDI4yZvQnI9vEPN+wfEZ3kbKVl0
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: iRpD4vWT7oJ01AC7mJOhhAzsLnhWEEcR
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4660a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mwcz9oGRgcW5ZIR5_CEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX+M+ZVEBT7b9e
 5qPTv0lfQrczFCgYPyVTle+/Zp7swRrZ0SCvS118lFAHISyloS/5RSXX7RYpoOBkYA//mrExSQO
 x+fkZF53IP7i8dq0+UbooqL6b/fDj2//a9fdh223T/snhUoCO0/yQL+Sz6pGl8CK+0pH7PzN/TY
 K4C7jz4lIcGAFUGK8glQmnNLj5NiQ6WqnW2/ifSxlG6mkI+H1WKf6/8lChzV02zy3wH/BGeJxLp
 yD+Fo5euV0V7jJ0YNOsJ9eyOewapSmLJ5k1XVE4e5Y3e/E4Kq62ugISd2VlvVrd0KYIyjVjyTA3
 7wrGQ1fU/h7ZbePfZTkqV71Hb3CCrag6eoWmNsXjLdPm/K8ACgKSlDiC0fFRBYEpufP4LX4xNie
 DBDgSN+QjGb948HqftN5+Hbp85eoiPa6dgDoy9Fw530bDmcWuSfLD1sbx1TafjI4rZExdMeOjlc
 paztlfpWYfnCKsyDoSg==
X-Proofpoint-ORIG-GUID: iRpD4vWT7oJ01AC7mJOhhAzsLnhWEEcR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXyGqxSoFLmAM9
 wpiS9SEaLIztaiOVAWEVRuRprJ4d43HINL1vOFDtqUu7+qN1Nd0QgWzxVETk6T8udfKcU7VDPB4
 k+yUEcKNgI0Ja1NT8fhJsagDkr4Qyxc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_024027_594586_C15BD5B8 
X-CRM114-Status: GOOD (  15.87  )
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

Add a DT overlay for Qualcomm Talos Lyra EVK, to enable DLC0697 panel
when DLC daughter card connected to DSI0_B2B on carrier card.

Configure DLC0697 reset GPIO, supplies, pinctrl states and GPIO
backlight controlled through TLMM GPIO 2.

Disable the default HDMI bridge and connector in favour of the DSI
panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      | 77 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 243231692866..709a96ece14e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -476,6 +476,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
 talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
+
+talos-lyra-evk-dlc0697-dtbs := talos-lyra-evk.dtb talos-lyra-evk-dlc0697.dtbo
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtb
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
new file mode 100644
index 000000000000..b79e54459725
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
@@ -0,0 +1,77 @@
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



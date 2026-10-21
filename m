Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D8460A381A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O/NFYVzf;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pCFuecFO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JrSWlIQx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7giEH12KEq5TYG1CwffV+pNP+0+B1pDDeisStQqBfI=; b=O/NFYVzfA/iJM0Z96YOoveSFmC
	8nB+G2stQqKMVBySqs8oUfcHTv+HIXEjzxDcLR7+ir1Q7595xwqu2OsRX669LbQ/aw7/EP6lUJJTJ
	v7odqOvswxFcUCN0WXYNhFJABoNb/Xznc5it/emzBzH8Gxdil9sRsSzmnVkl/kyiZK2gKKlULwGN4
	U8fDMdZBKrGRXHzjKGQzpHbNREfENgkEACLHCl+NLazoerzczr8qbtuAzbUohTnibO3+zaM7+UZHH
	mAhCZGdmTYvQLyv/8fhPyrIP3DJmKGjVGhioS+SGfnP/6B1uR8T0jDmQNsAC8g7bVf5neLPTZgcmn
	Kj/thaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4m-0000000CED0-0eQW;
	Wed, 21 Oct 2026 15:18:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4i-0000000CEAN-0qRr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:17:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFkTP3994852
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7giEH12KEq5TYG1CwffV+pNP+0+B1pDDeisStQqBfI=; b=pCFuecFOB6cOvb0l
	vSC7Wk/vuvDYPbCiEMk8Z76nj441539lls1RhJcSc/TpLciS9tD/CoFf1wVks/A/
	UHgQ81Hjmhbe9KZQGWQPhBxZwMhCMC4QIuz8RRCwimalJK/tnSfMD9/BkH4v1cNI
	62zTr53kZLZbo5YkN6aksevEeowdaxnLjDoYV1h76BlE3Q2Q/U+H3HS+w8LiRXza
	VNzAab6oTjLCfj+7GPLtE6wUDV2GCD9I4Med+3MIwZRtbeOadvyDegRJ8AEn1W2w
	Gr8Wczky2jTp6M6Yk/TxMCzDg68ILfP6nQkVXhcOpT2h5dkMsmJu8dvR05OrijbB
	I28Tgw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8j3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:17:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso1332511eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595873; x=1793200673; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7giEH12KEq5TYG1CwffV+pNP+0+B1pDDeisStQqBfI=;
        b=JrSWlIQx9WWXbRqD6e9ytnBYpHT1ISwSitCVBGUCWlFzTjneGm561Ug0CLTxxyevzQ
         qldUrPL4MswpTjKv4FzGJuL6Hci9KLLp5lDGoeBu4y/OvGc7f8ImQaBiIzFHQClBUpdZ
         OD9QsBdYqe/OjST50H5i2CKpCk4IUkXo6Y5jQtm8fyEPoYdZUR14YE0CA+yowUksRhjG
         PJyrDkaXz1ARc+StxVB2IeyI1b7wfK67R66Vepp1iJ1Er6g+Oc86Ero9xqVuyHTI/ZFF
         4m3s3xQm3uIWXmWPhT97qBpv82TB8VzAyvzFTPvgscF5FHlyy+NcuigkKShm/JqetSgS
         xSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595873; x=1793200673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7giEH12KEq5TYG1CwffV+pNP+0+B1pDDeisStQqBfI=;
        b=jYeidx07pL1LN6XEyYdLi7ja/n3pcGHV8n34LRnHbQXAoS+EY6NVLqX5tncbVweF1m
         IUOEuoqGZ2BGnnAMLaDTAai1RUauEOCMJb0wlzIus0y41N8PWKMPzulLNN12JaMI67G5
         KY8o9Hi4JoY1JxkzD5DfT3tS/L6+raA9nRYE9Lk6pF6vhxIfQlYoh6jLUdL/O4H6e38A
         TRi6KeL5oJaz0QbjP2RNQEBx2rIY1TOSPnxg/VWAuj5W3M4kUZ5kz4/Y3gLfAM7Bb2Uz
         ZxOGuXAEu9iyRBnBGnKwY7ZNFbKvAlpMBj3YbjbGShE0HnkAu4tNk3oOyhiVKxFduu0d
         s/JA==
X-Forwarded-Encrypted: i=1; AKwUvBzyiOxDbW2v3HxIV2pY5FfE81E4RAEurkYFszfeOg81WrWFFtxNgBBGJCYTxyxIhUsykzX3mXUMSM5YrZ8WLiuJ@lists.infradead.org
X-Gm-Message-State: AFq9FYKmReHAP7auXISeBwmdtppYGMz3UhJS4cEenNdVSAgfsUPrLqLv
	lcj+i8Qt+V77DwZr+lGEStHwmhXSr5Q3WbFdr906/1Q7auVPHBWdPg9E48PByXA2BKtte0Wo8OT
	krt4497dtHj8hXwUUTOIbEzVLy+x3iKntGmtM/j8NPJ3nIHL69BfJzGjF55AMbk3yn/EOJ6mYgc
	kXOw==
X-Gm-Gg: AYBFou0BFKMLCMvbsbfqCnG4XaTrRObwf4ntsYEZhMyLiOFfitimDpxsxmSqnyVidkb
	t8qeIhausWFSEyMVMKkOwWCt6t6gP8dpNtn+BrVI2T+8UVP4gGW6Eptj73h2K2ZQYaHmBeW/ptn
	thFVwTvBL53woOK/kYeypKAljlKm8qqI940LTlPrueglTu+A6vW/aXjJhMSpw9smf5YSUHAm61j
	iZ0IXrPxo0NUEzrZwtY1PBXn4wZpaAIFjzTLukW4gHYnco88ltXR6ENk/1U3N4S0W5z4Corv06f
	Ml+ttnZSIRJLt4DIddIxQ4DRo4blIBs/a9ecM/hm8LZOmN9v4g2gUmmGAY08B9V1+u6H4tI8Ds6
	0qPwRPTMOABKI+aWAAOgtzoi4WUCbhWQf
X-Received: by 2002:a05:7301:6196:10b0:353:812a:f43b with SMTP id 5a478bee46e88-3674e164be7mr3408086eec.26.1792595873306;
        Wed, 21 Oct 2026 08:17:53 -0700 (PDT)
X-Received: by 2002:a05:7301:6196:10b0:353:812a:f43b with SMTP id 5a478bee46e88-3674e164be7mr3408050eec.26.1792595872699;
        Wed, 21 Oct 2026 08:17:52 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:52 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:27 +0530
Subject: [PATCH 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI
 panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-lyra-display-upstream-post-v1-3-585caa39cd7c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3917;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=gVQnglIBFyedTy+udwBpJ0Mhk/a9EY72RG42+aLXzgE=;
 b=+mKOq/xx1XOGyXNqxB0Bn5SlGA57RW67VnCvMltqD36O4+79V0TXGGskXbv7gPaLjv9K44uWx
 xYBlnHGAHG8BbpWbCS66UWanwVDAFvT+sfW/pAy/M18ikkQ+Iq+kM5i
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX5ZPMV7QlARjA
 4Wj3lPopzPUZGlo5BHq98Y83CWCoEmsdRPZATgWVUhVvEzz+/7igSnHK3iu72t7m7/KuijmGVTN
 1zbVOo/geTxm2qc+dvFQwaCu4aWUrZk=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8d7a3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ebtc9FoxabyLX6FnRrwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: KCs0jWt2X4wcTWIPOH78U-mFYcFzIv85
X-Proofpoint-ORIG-GUID: KCs0jWt2X4wcTWIPOH78U-mFYcFzIv85
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX9jxWg1DNmWP1
 0c+uvrZcSf+68r4JSXjxs8VGxwl5tQfVSAWzJPkRJPTVQpxyi91yzGGNo4Gw7WcI3t0EyQMHwW8
 22ZirPJzfovZplYwCdCkWvMngeko3yatpID92YEV2Rj9hQEeAekxPqL4zehOXt7rKxKA+eA5+zl
 VoxR7Ziz64Rrisl3oBK6P0mivebKa9b3Uzx945wiODuszhEMvD2YbFnb+qOikx9nWQr/Z9MQShb
 k+WH7XKabC8Mp0+cY4Ma9JXHYsvalHOC+DPXaMTCu7thqL0sOk8XIwbXIwnenBj5AWEdSa4tzhc
 FcliHBeM4ra5WP28RkFlvtFRCsdjfCuGm78sSDlvdvvwnJSAGV1+RVGLc4Ljubn1aDS6psMfKNA
 FRojcmNBu9fdVXyq66XeiNhzpm4cuUtFnR8erIiOyA64+mzrHfOXGRcwqimaJlWRwL5YA5XPZAd
 /dxWo4yrkG8tLISkxwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1011 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_081756_359350_AF50C98E 
X-CRM114-Status: GOOD (  17.00  )
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
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso | 88 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5248b6be68f5..a2a2ffbbce3a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -480,6 +480,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
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
index 000000000000..cee602a78322
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
+		compatible = "raspberrypi,dsi-7inch";
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



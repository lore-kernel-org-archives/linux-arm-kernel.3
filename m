Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC0606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zGEIS6NY;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O/M3bgE4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F4RCWxlj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=; b=zGEIS6NYOA4scBFCHF7+INB1mV
	dXyVM8Z3PHGi72YOH46RnVHoYDsVIEnzOYSt0APw/WB1gVI2ZWe0pZagcM5yX1+JgPsx5Xwyi0A+c
	r/oA8e1MX0eq/LPADGqH4pmytZV5s1fOHeOkxKmB4MuytdjX6j01DIfjuxAcPmBf3+wG6WOh97fmT
	HWdOKsbWHHGrrPQV1qfXu8lGofIyyivS9btG6dT+gTXAWejP4Y8bEu/OeH+Z9K2bv39J8am6AdcFH
	bgxDjy2VKyAtnL3rixQrb31VqFldeirTC5ghpeheZLOiRSy9fyXTx66G3FMCa5fZPq/Uw1n9D5Uhb
	jBERYARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4s-0000000CEHV-1MQq;
	Wed, 21 Oct 2026 15:18:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4o-0000000CEE9-0I8Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:18:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFJ3r3993405
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=; b=O/M3bgE47wpEgGvI
	b0k8gpmn4QLzEYy6YxCiUpGQz1ISMbSDy4sDGC9LWywIOHbvqSXqjw7N0XiobhTg
	P8zT1eb40VB6q0EJdjoVbRhQA0LC6WSlBzoNVb0b2pQienaNB+p9lNl++7I/i+9P
	62b5/vrS6SBGJybeyZ1P0+LGqxfzOrGsorpIP9lfZs0S1+z8+PIOcasEJVY6OT22
	F0WhUcMQEble0QQKA7u5pmvmVhn2vDzS/1Seg2C/+1gLe9DXGFV96a4NlKVQNxPr
	YxIqhddav16qZhXleYBjClaQ8S8zz+Ezgm4IZhBVKlUjCXzVClEa4j/g4l3HwlS5
	OJD/RQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8j4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:18:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36803927a49so1223303eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595879; x=1793200679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=;
        b=F4RCWxljXkS8Jy83MuxRhdAlKw8tBK3GYC3m2AtkpxQ26JIw7nmawIn8y2AYhR73BW
         4VgJG4FJlcy5hPuVB98gN/lQPSFUIeuP081a1Pp1AQ3bIZFaRdWaQw662QWbjj/wVBOo
         ypmLOasuod+FIfbFQV3NZ/MoZ7RVzNLgW5gAmz2I5JYQ8wXA10obAqAc0A1gWVSDJaEP
         4bDpoduJlETvfLXFKpvpvXTvqrkRAHuEco7j6qVf92EYhb0txpK8krVDvA9FRbcJQ/VI
         yJvS/oDv7nSmgILUfUZ8ol1Hf8aISWuMb0MI5m93pP9kCg0AN1RoovlLQq8fpMUaYx9g
         pmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595879; x=1793200679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=;
        b=DlqG2BGGSH+i4wGr1sjWpSzmtBuxmw1kUAC4m034hh+S034SIXRaGcKBHXJJFX9C8h
         6VZtVWMpkNO/DKi7lYzJPSCeFAfOG5Aq/4INcCNXaPTmikpjnnkl42oAMIWFQZBATIKO
         v8nikIlF3OhbYHhJPP9l3zGYseFnMYzQgYRt2njTbQnrB0NuPFMkbmxsdaZhMJEUIvjN
         VCXUVuNYgHuzlrH/5bDK5y6oZDoczv2Tesl0b7x4dnT+FofVT+lbkVfUTmtChIPHPv/p
         e6Ub9VyMdEUUVVzyyIur+1bY3UwUecSCldm8JjTv36HgIWUyF7d2KBblVr+cWWgyWXXr
         hBZw==
X-Forwarded-Encrypted: i=1; AKwUvBwN+7OFuD8+D/MNgp+QHSWNKuMrg1NSTv95swaOUrDQiAwpZusHKo8e1rS1C0Z8iild9mUIScm9cmmzoEQ2s53w@lists.infradead.org
X-Gm-Message-State: AFq9FYIkKqGjiirJPy35sjxi33WtApgDnQVHwsXwgz4YbswESjhcnUAc
	l/vkItzQ3C4bepgZ+t8dGQFP0QScLeWbRh5uq6TEphd0EZBvVWQKZ/HHDj/A1CXN/GkigIq5Khk
	vjEV6DwgqhcwuGmAykypGDn/7rCFZ2KHa1NsUDoMRjM9jeLOjRUhDyBpHzW24wMhd8xeT6zhXA3
	pkjVkDOXfsug==
X-Gm-Gg: AYBFou1GdpF6Q19YmHxjqzb5VhD7mmtObd+5fefvE4PwoOp3WwQEgE3tJZS7c8qJ7J8
	SS6Y3wKPKbC0OaNtVF84dSa+sauOpY6iSCtZjpx1tjMqgV6UUQ/TUavK4WwxKmf68HXTUCo62W0
	Xr3vWONyVpnl6Kbo/za4NNoWHz+Ud2/DnYJD3Snw30SqknElOTdrQ3pYL4+byH45Kqml2QzRfoB
	wC94EX9YjY+IHsLRNw6t0IhXK9JUQwpD8L69JXKsSjgjwwWmhDQO7Pq2SCkZnkeCTPpiOXrT/CC
	FE8wlW9cAojWMA/fQlpQXOpx4uY8CaFArdHzTezvfZ3REt/u6xVXL0vjCaKkmNOsPzb0T8R5JCs
	XrjZNAluRNFfSu3vqezMhrbuNJ/g7uUoy
X-Received: by 2002:a05:7300:2552:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-3674f215a14mr3926439eec.23.1792595879213;
        Wed, 21 Oct 2026 08:17:59 -0700 (PDT)
X-Received: by 2002:a05:7300:2552:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-3674f215a14mr3926392eec.23.1792595878378;
        Wed, 21 Oct 2026 08:17:58 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:58 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:28 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch
 DSI panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-lyra-display-upstream-post-v1-4-585caa39cd7c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3546;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=Uyeo1BIG7EK9froOsnvpJ61uq9tkb4cEvrpBTfRl3vg=;
 b=ltnv/UqKW7UUOPAU4GsTjxkHxne/i9paXx5gRdSfiIe92c3PzYA3HytEtQwgiY/dUBC8it1SN
 I+mzUGh+3+tCDraiCHf1epXL2mLfZOMmi4kbMHFL2cXGgWEdf9b67qy
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX/e2x/NLWXW1c
 PFtuSaiotkyaMgNKYQd6+h7qo/404aXOasOiA+Nw8wzJNRBNTFhG3lsHNCpVvlHADAGlzk4+7Di
 ru3KfaXYdP6qoHVqwnoQanmM69Q4bOk=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8d7a9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CsxVdn2IL-oTZ3OAgFMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 0ZTZmIrn4sD15eRz5cgY8KdVDhlP0eG0
X-Proofpoint-ORIG-GUID: 0ZTZmIrn4sD15eRz5cgY8KdVDhlP0eG0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX+3nMaIXXzHoX
 RmTwb/kbo8Z8DBkPjNmsqO8B7k+y6TdFwDK482ZOoOzg9Da4HbTlnQhx29je3emcyYYf1C+U5Da
 /8jaXxn95PSbLKLl6TbzfBhKD+F6UGMbB33IGgcqf4HxVfjKHj23G52C+ppv4Xf7oiqJWDRTzLs
 Q6uPNM3AM+BBkSQLcqHR3YgxNPKd/FHk2bw72hH0FCHp0zLFj00L1rzya3FPIPe3LutNR1ltJuc
 qCvCowaVZhP6IjYrm9mwgrFFj/OlQLYeQLhJGOwTZ27SVfSH9Y6cyBPt9vzb4G0OLAgPs7faVbe
 dEDZZTfi0fCJrR1GPvsivdeiX0YuFpeGHMgrzMMYwF9/+ws2PAwh9/O7l6bORcXkk75dyK0tcri
 v/eYW0gKO28cyZrzI8rep7QUQJuTAupXimzJbyRZuAMuLGY+c/r8qPd65gNjxMjpuQK+87xb90W
 ooB4qAmmAagfwFCRA7g==
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
X-CRM114-CacheID: sfid-20261021_081802_253697_DA062D80 
X-CRM114-Status: GOOD (  16.68  )
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

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON, for enabling this 22pin connector.

Add the JD9365DA-H3 panel, GPIO expander at I2C2 address 0x45 for
panel power, reset and backlight, and the Goodix GT9271 touch
controller.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   | 75 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a2a2ffbbce3a..614152913cbb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -485,6 +485,11 @@ talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
         talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+
+talos-lyra-evk-waveshare-dsi-8inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..e9a8fdf0c179
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,75 @@
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
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
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
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
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

-- 
2.55.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCEE606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m7NetiDW;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=INI+Hhly;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IUJZ7HaE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eb2MimSeo4rVu060OuE5fuONCdUdlKo2DfC0lcL8Cak=; b=m7NetiDWRy3A8Z
	E9iPdGavnXNdrDx0aRVZVz0rNxL6QeEQCIRJ1K7p/YKejuXAC2B7YSg17PQEkULC0NIoSFT7HPLLC
	aBPUVR0FAWQMSNcQ6AlflntiCSGZA8zZuYwnb1+3ncBAIuZqq1lLbpXc+cu5IRpyK9gZO264Aa3iT
	hxmukipWQFoVvCGsZ6ZpLR6j/OJNxZyy9yuDD9TxN312WZtJmgN+9DSFvBmp1CA6a9UM1z3FjHqST
	Yr5rZuSzyVVtu+GAvc+sW54TiajHyXRDO6ocAgJ9BcQtlEbFi4+nTEbL8xbU6xbC3s1ocx7qqiLHd
	GPEjigRie4eH1voYv6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM29-00000008nUz-3DTS;
	Thu, 29 Oct 2026 09:02:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM25-00000008nR3-1keD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:02:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vFhi3775305
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eb2MimSeo4rVu060OuE5fuONCdUdlKo2DfC0lcL8Cak=; b=INI+HhlylaLekBfD
	AD++3ms3aTzkMA7Ndo18GKoSpT60fl6A71cZbNsQADO4ETd1QZuflcURvK+bfYb9
	k0ScrJYxQOd53N84KwFaKrY270atDSOUoxOb/PBsWmp7jtfOMUOYeYVn/SGyI0f7
	VfdbFj9ZmD/36pigcZje21QvjQrn5fyGrP333wkgGs0myTPsgwpgRZSmxFRPkJii
	664kCYsGxyjhaAjvx+yoWrrntvH8siNY/YhExFCH9v3UNQOSTj1fCH3kDgb0PacI
	zCMsTAxlETRxpAeUCQgCD0ATwNJr9GCRhi0TxHVcVMp31/xGymW0zlECFKgri/bz
	herXgw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshrywt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:02:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac6795617aso1715241a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 02:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264567; x=1793869367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eb2MimSeo4rVu060OuE5fuONCdUdlKo2DfC0lcL8Cak=;
        b=IUJZ7HaEjeTIRJgZWp4qxBCo9t/NycD5au/fWAzZfnzxz+BBcTMk7SAwAsxuHRoiAb
         pt2VRCWGtOnwqfkVv788nunlmILuqZ5XL9/lMYyUMPAfG2IEm1C5h94re55Jh4PhalFD
         6JU4Y9/aomIzPJwAluJCiry3ylm2Rkzzdrber+LbS0Xq/q+daJcWHFPjNA/H8WAEkqF8
         tsGSEADq9YIVValPzItvwsVtxd6EvEPARj9L1t2jt87SXWuO+oWOuJCazkLkQs4Ud2Mb
         kr2wsjscgcMXbXgCmIizLiFI7oGYow8yQTVglBYhJ7p4+zYfLYWTAMI5rCggipa35E75
         kRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264567; x=1793869367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eb2MimSeo4rVu060OuE5fuONCdUdlKo2DfC0lcL8Cak=;
        b=H+dHei0qPFhklV2hspnrirP/BSmo1Ss10EWK9qhojCJsQ5FkIEvcYVyD8WJB4UtPli
         aaP5gtS/nlCLfYqOwBVW6gwdK3c2gtV5L3qNxCVNveRZG4mTi/q7UWUGrQnpGHzryzdy
         0dA2YvlEzvi6+PVt3dgSPRzjeRGpj0qk0ZaW7r+vAHilVlaLPg3Os4I0KVCOaAsN0zFx
         6duXFNPR6KXurpngvaF18v1h06ieuudEiUAXT8F7CBgos+jOX2gahouHxl8QFDFivg4t
         urT1rtTBwj+Sn2OqY0/TlpGYR9g28QtyoDMLT+UdnpM6lV+iXm2Dib3Xt8HID+NI2mzZ
         q3jw==
X-Forwarded-Encrypted: i=1; AKwUvBwah6KxH4TFg0RYrApOOBk2ELqp/AItRuEXjdb6XkPUDGc0ozzKMd1r1Txh0fgSJkChEkZFGrhfiFyuvs8T6BUE@lists.infradead.org
X-Gm-Message-State: AFq9FYLpvgfQUtHRGY1kUAdiL4eRUenN1Jdx2QNyDZOnjacv1U9xs52Z
	sdX3W7/uJSfG2mPHrazSi4jSKmsZRk1v5LElsPDSnGnGO1mocE66GdeoHAJoIvqrd2UyrjND6n0
	JYlN/G/uetRcM3Inj5/G593BpbF5HhM5GDePcrDDAu+OeBE9MlxfJrAQpzebMgo1cUPsXR6o2Qc
	iUDNYc8LjDGg==
X-Gm-Gg: AYBFou0/ik/Dvv/5QWiX4bpz2SEUPNZdgn4yfBXIR+lwVKNhwZw5LurH/RVxDYlA+rs
	IYYMMBUFfQPmdnjk8LozaIs1LUwqtAiI54KljZwIk693OnNzCBXCbVWUakbN2Lpre7ScOj7R7eM
	a7IrmKipb9UpPYJpBElnzJnyLgIJcnrKamsKJ7+S03VSXtP0gWMQQIRJwK2F4jpHYSHiPxMXNLO
	jrKoLFdehJwyMcBlcHABey867ER6+O+MiCJfF8esSVj8z4wyid6+kjImeViwDC/K2BCwdyhNTJm
	HpTWr+ebNdi1sJWqKqNpE6lGOfkTnYx08JXjpUuVrz/hPWp7Gh2C47imrik8S9Nd2UG9lKdNXtJ
	1iZ4KyiJFda7zpdVIgf1dZzxUwS3mBknQrMz1bjrMrT2ShqW0SK25jFguLMrQC3+6q3U9hi4wRy
	ci+s8J635x
X-Received: by 2002:a17:90b:1805:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3ae57f9abf3mr3412459a91.21.1793264567123;
        Thu, 29 Oct 2026 02:02:47 -0700 (PDT)
X-Received: by 2002:a17:90b:1805:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3ae57f9abf3mr3412412a91.21.1793264566602;
        Thu, 29 Oct 2026 02:02:46 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:46 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:03 +0530
Subject: [PATCH v27 09/10] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-9-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264459; l=2076;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=swFp0RJCSPHIA3uwc6pTKVW2KNCHZrJFvuYlsuhT0Q0=;
 b=T78rQDOulgfqlr7EEp9hcgO4PKMRQY/AElluM3yecob5l7BUxADUe3dKEXUi6GvmUFWhqud/o
 CB9oT+H9/wRCOmpCzC2h1FjtX1DMX10d4XVeyc4pDnRWmRusZxhNExm
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-GUID: ttq9Y8kqj1mC5_IcxcaOO-Ctx0nOsG-l
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae30bb8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX1ZQs6bQF0vYz
 KyMlGgW/MsGpos4gMgtyGmgXyP51uJY5tjByo6vUKkY3oEF0irKi7oQVPvxOj9dv+/lEliNRUKN
 jPKk/D5TURhaARdgrz2cjhq+0/DSy0I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXy9nGBmymxqN5
 0Fzi9lw2aapcLf8gPx1yh4CX+hDM0FithhXyDBYVtmGJMDWYrRo3sSeC8FMbB8JaV27VFNvcH1I
 u1gpWJNPqkjPYZ+B4+BWrg+ZmcKMdwCTtPmtL2cte7UQT2I4ICPSahlH1BmL5YcACWtN9Sq7hh2
 7LUzQ85mP71yUTHFOQHUBlrjvjXhabmlh9ghwI0k8E96yHlS2c4pr8IrDAo6i0EIW2uR/IVwACB
 quZG4vnOnd/RKdeHrTM2MfRjwfJhSJVPpSjjDL0uJ8zORtl2UPR/uCC8a4LYXET6yr/5UYQNzH5
 5wOp7t0DIiEcfZg1CA9TYMNZs9TnlyQd24XdDTuCWUT6P7iCDyp0loLkGkP5sGn5XO9OJTCiIud
 lV/9hbwYqFXzxRR9Vbb95f4L8SAG7HsX3O1DDo67GQawCQ1M5y3xTBljKgUpLVao+qbB3XSQN/M
 alYm/k1Uh2Q/14zDcwQ==
X-Proofpoint-ORIG-GUID: ttq9Y8kqj1mC5_IcxcaOO-Ctx0nOsG-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_020249_599378_6CC941CB 
X-CRM114-Status: GOOD (  16.34  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 539c9c80a808..074971d310ea 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -711,6 +711,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..9ce281f87a1b 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -654,7 +654,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index be850a23472f..abe21242d710 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1



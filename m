Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C815A60A2605
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=abbw5kn4;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NKqGF1Vv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0jduMf+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=; b=abbw5kn4QQDwEA
	GCt6iRXMo+qfTF21goylX4vEcvHU7mqFJ6rmQjlVzv6edyv+a8Hn1keDVwIwjkUPu76Ulv2tHaIV/
	Wb09tLBzlvTJfvn8Jm5Xx9RLcJO+ydbr54GImF5F7hYQkYg04twRGRGvlJaKxBKVQmnJZBk8hpk0x
	XHlt793CHD70QhJ93oCcZUNX4TNcyedppzPlU8cdMyQsP62C2iEeG2YQWb4n5xo9I0sXj1/eGsVZX
	enBgJkNNI4gzCNMCYulEiEZZXKkqAYTEyzwvgSIwSHfVji3Xi9WIk1glRbOonz6sidW2a4/Un28Dk
	n3fFGG7MPZt8692zU7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM23-00000008nPa-1VW3;
	Thu, 29 Oct 2026 09:02:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM1u-00000008nJZ-3KkS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:02:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vFhf3775305
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=; b=NKqGF1VvtwIDpwwr
	inzRuKWlzCHrLd3cZGadTm7aUbKkNOGuRoldTpmGOi7tTNYVDgUzDiXw5sSEv6ou
	RqJiH86IVenMFITE6Igdbzdgx4bZA2VSxNvgkfgm3xIt1f0IgKOVmZr53X8WI+4i
	zyVhx/RLgBhy8BL1zgiVPdpkuhAhYY29GMpWfmBZ9+vP+Dj06wg8FLlZ4MoumLBF
	XpVpWBzDJHSV/Zw2Dfo4GdYXouNxrTnlygj4YY4OETu7sh+lRlxsN0Cz5xhWWfKj
	JXmFhftlshy7o0dGiUODO3ycB32Qzj101OVfBAZ7XokoynyrQ4qkE8i7lyrqdmtL
	mHRQkg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshryw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:02:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so1591886a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264556; x=1793869356; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=;
        b=W0jduMf+ps5D71QuTII9Ni5bX4tnej8ZQ446rEXP1k8Y7seQCZOdVKHkPgows6F0Hf
         kQVLnAhuWZGS/GGky/b92AM1pemZkAV5+ojfDTY07N6uC44JS8V8Zp26NPKXU4NUjtAH
         8sIVxL+7KTIukvk1pLbpb035E46/SDAUEMoWjP9TCMT56IeEfQB+U11Akdr3wMeRAojj
         rP4rQf6A7InNcDZav9wMzFM3aGMZqAt2Vsl/70qTgVjcKijhxRGpbGH6EsZh0En52HfX
         Cov2x5rYRkMvQHRWOEP5n48vI7KOFGRLfLHvoZUDr8Js/VrsPgZPg+9+8VursHpGdxsd
         GcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264556; x=1793869356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xyY8g/VGApKF9cgdaL/Y1eXGytiYEzl1s5/AmnSa10=;
        b=l6lV7hetAImA+AhkiMzSd2DmvAsRNHnYTvSIVy9fWBLy6PlTAzIn4qoEq4etu3K7Mn
         +64KqNZ7Z52C25UEJ1ljyqjX1Hjr+rYWHNW1QGF+rdx3w5eLhldgP8qF4Yteckv8i5Cd
         mcG5GujOBXUyu7Ox3rwJCDt0ziJ6YZZVg+QPhGPtAZF1+C5lAv1JAj7jhuerhwMlSGbe
         TW+JmjEeP4O74WM5To4VZ8XeZbQQCEmgKu21LhH7fYZvn9ptgRgRfMYvUNFIGY8vedgf
         VqyuO88BD4HzoRmhk5D/NvQonBOvGuvvCmwiXv7SJnPnn7auaDDy8+RXxPHwPX9dKAH9
         oLsg==
X-Forwarded-Encrypted: i=1; AKwUvBxXKYGVch+qFdg2BQuOb3hZlmwrdy51ylUztdZp7tfr8Ynb0n5WAF3nqQk3AoKCbZBvxrQdKr3nh0v1R7c07bse@lists.infradead.org
X-Gm-Message-State: AFq9FYLFzwVyF/pIkM+8aghrcee1fwo7mdLFwKb1r+J7SYkay51feZsA
	PLUfzaYCde5lnsR+/DxhO3Za8ZyZtJ8zzK41Iw8VJjDNhm+mheZA3mhicza1UbflVcgdRf0t4q6
	QlNe1UM0Tm/GFOHgeEIUMgHhMdJH0ziuM9IqF0u9dI9bTpsxOm3tqh5HnBI1d4KEh4rJK9814e3
	20vQ==
X-Gm-Gg: AYBFou1MlRU7lfrfbwt6xfxa1vC0WDZll2h/8GP3e2lVtbNs6aov1Pkmnks3kT+Zx/b
	JCRUE4YQ/LbVU2MuvskEjYfAfFq8QM+y8WILCvnK372WK2Yrlkj4uzhtPZJRLX/H4DrccDvwv1U
	dxYyqrqk6W+Iqt2L3aH2uaooP+2pAL3Kl2ENcrtCzn3Pd/4kALEercRBqMJZ8ukzTMqkjuCiRVa
	mAtarUI6xOqV5JjgAoSuYZiZ3ZtZ8r4UwAik4vSNQ1TtT667qHP7sPTDYz8fVfzIKMQPYnEvJ00
	Be5w7DEkTJO2zbaulMQ1YcI9nocKWlO3RkMmmR6rMqI6ZhVDqAfDS6JZrLlfgWjw2xNMC9s+b33
	Fwgv2gKpj6RKVYDD7+cTEx/NW3GHL3ZCgDHhCx+klKBuhaBanx9Q60agcAQosvlLHlGatmFp69t
	kpvc5NkH9x
X-Received: by 2002:a17:90b:574b:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae580a82f3mr3666993a91.10.1793264556406;
        Thu, 29 Oct 2026 02:02:36 -0700 (PDT)
X-Received: by 2002:a17:90b:574b:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae580a82f3mr3666958a91.10.1793264555885;
        Thu, 29 Oct 2026 02:02:35 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:35 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:02 +0530
Subject: [PATCH v27 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-8-fa4b3ff1359b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264459; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=gUHmNfAuWSYEWCrqca1lth83sZOdzcZT7fFtab0nqZg=;
 b=tZ6kTFHVewvVVG6bopBgc2U27Y/TWood54vwPyEmvAH/mC5OZWsNPa1HWUamZvs/3iiJ8lujn
 d84JnSP8NaKAUic89Xwjwa9PH4byCgb0SIYM6OYeBNad6fJoaTHUdow
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-GUID: 2X8UtvpjSemmD6A3xGLu4tvn-ClA3bQ2
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae30bad cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXxphbs4D6HamQ
 jbFt6o9Vt9rkttD73O3m9uQfMH7Avz8/fKaL5Iu+WkEraafEt9AAYgLyuG1V8SQp/F8cpGuK528
 xWFO5Dd3TMtRF0VupNOnZ9CmE5PEvfc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX/YlAhj3KfBF+
 MShj21ATn8wtA6VtfBxfHOKTraEw2/pD11bqnjwIFZIOq3drpf8USB3zr3yJzARqa30DvRL1OMO
 W9rKcaKLb8EPAfrVpGQ7gMA7upJz319faQqX0fRWTxTtKngpOwuIAw8RGs7F/O8c8w76w+7NYij
 HN1HCM4izuYfa94bXASO84GLRX/q99kKy/LbpIX4xMj5NPbIHyzIF9D0ELZRkjEO4rujOlaxMBk
 BFivr3/xqPJTtRBf8gWPTa4CFjjNexY50cB76Jzwg9BHFL88mjFW+BkKG4X7cMM2YgT4Ak16oeL
 UgQbwbLsOl+2qFiO+5QC+Ha1mmTczHHsYAUAYHQaJ17or5SvgUeO06OiHGG1i/InqgDnHfqcrvu
 qUlQ3CEpZBP59P8wwOUk2DNBRUjBtoqGdPwlwOulUYvXMbhimlqrLkHhv2lGei0rq8ZeO7dhdye
 l4xC3LDcfyGvuQQr6hQ==
X-Proofpoint-ORIG-GUID: 2X8UtvpjSemmD6A3xGLu4tvn-ClA3bQ2
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
X-CRM114-CacheID: sfid-20261029_020239_169292_6D685F3E 
X-CRM114-Status: GOOD (  16.19  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 23cf20f9a178..4d5fa2ee1f88 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -912,6 +912,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 22f764b8d721..a530a363a9bf 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..6564eec6bbed 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -550,7 +550,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1



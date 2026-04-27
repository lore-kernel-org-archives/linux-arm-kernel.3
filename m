Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D303FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiKYNjR7tdA5pwtW1ikVn9/8qKjQhXp6ICOArgh9fU4=; b=ZSMDmx0QjEmkMrGH380L2MIkIl
	W81tQYjIwmmAEDx/oOcbXc5qYbxtDwjFbZ/S+PY2Zz9d375rdPud4wEKTW+Ov02aGtSPsxbv9Ytd/
	G1Q3eSIAmmfUUO++MCBT4s+BOwQBz4bxNdQNvaHnC4CxcgnvKyxtm4VFiHrg6PmFvDP388hpm8J4P
	6rmhVmkeOop5b4fnc1TzalyJRXTJhdnaC4FuqD/jl6htCkVJGq9nu/JaOMYAXxtl6K3+tV8vCMFwv
	9ZMCjjCeTjwxAjKfRnMN/WXoyXqSU+gSqUJJ6dJ7KSoZkKF2JfESmLK+4Sr15cucPXz/lFtDMpYWx
	GZO5W4VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPtP-0000000HUU1-3cJP;
	Mon, 27 Apr 2026 17:37:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPtO-0000000HUT1-1eJS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 17:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oiKYNjR7tdA5pwtW1ikVn9/8qKjQhXp6ICOArgh9fU4=; b=oSbhtiirc3dCgS/GUHCS0Nkvx8
	wzkOB/8UtHQIGagHNJTf57Hxab5MArcvKkUeLj17bzAzmr8oEn+JmwMFmY0dVoCmwTTCY5hcCNlQL
	hK4SnNNE+Xdh2qQDTmLJ93Svlmd5B8o6Yf85aMD9Zd8AddkdkfG1ymPtdFjBe1CLmA14dluyjcxe0
	dufSJyx99fEej4am3LDTezzpy0SQ5AvqK/uMIJ2psI3nBEJ7b8Dbhz02ZNsouOxlZjVBP7KpPnrqh
	nnOsV0KuW1YMLtqsmUTwVifziQw5d7gUmYU33kpaAMOPPHanWn3+y9aMWNiXZ3pDqkc0KaEFuMCkG
	8JDOmGlA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPtK-00000001Gdv-3wnn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:37:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHNYbJ662820
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oiKYNjR7tdA5pwtW1ikVn9/8qKjQhXp6ICOArgh9fU4=; b=SjH4Qx0/YBGE9Pkz
	+EvcyMX2J6ffdxIzk5k0z3txVMhYZ3+ebNnCGADmPm5bIzE5xeTMCJp1zEKWIvDb
	vguIHW/RwUljNF1tSJZXVOceMF1PCUxOhSjz/1r4WZflca10YE+566I4yRSdnBDH
	XdcdHI7V9sStsz+uplme0GiTWypJjVIp/10lVPmMKp+uLFhe+LUTK1fL9M973Lvw
	VUor2HQU5pADclP9Ja4sSDrl8AGF/7tNvWDtWNsBuQ5RK4TGw6GJrrau78FUUNad
	iwyQ2Lfe45gCYIkEspU6SW7l0Ja3GQjqQxlatAimPicyDc8T818zBvjF67Xrw+Qs
	igbFIg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n024m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:37:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249541063so93778485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311424; x=1777916224; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiKYNjR7tdA5pwtW1ikVn9/8qKjQhXp6ICOArgh9fU4=;
        b=Zo9gj3nqo4OZ53xB/cPOKigY4hvv8T6Uh33a6q7TmwvZ2aU4zmPll3sPJYLAcL0k6L
         JB1/BiaMuuYUBmEG3kC1jqd2giCQ1t5sHnCGXemszicoUgXZcDKgqgDcCP7VbKCIbHir
         epCvzQKPcX8NYcsUyvt6TfW3uVO24uXFSeZZVwo0EyFx/y3kGmJYMUcop3vrbvppaLrM
         O+ykGUnvkDTK9gI+vK27NZtWPWxcoW9zvgS3ILSoHtXJIA18eh/w6EKSENXFEOn6IPMz
         GJk706lBhdIDFmSLc7UtHQehRbmcl2w9QPT1yfuUBuC3+tlezztpgaqV2Ky68viTDA9P
         2RlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311424; x=1777916224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oiKYNjR7tdA5pwtW1ikVn9/8qKjQhXp6ICOArgh9fU4=;
        b=pqPudHfcnSw7Ao3O+/1IPKYFzNxq42oA6R9lcYEjqRaZGdayrrC11iUvXBVcFeabfQ
         bomtId7hd47OqkgwiYdrLu6ces+mjPVGci7ZXfkJlBFhZkQ9W6+YyCq/WmXUHn0zczIC
         69nB0yg5FbMtMhdnN3u6sl4GjzObdkAwsSPZMco8hZ4lHsN/cPqGRQkFrej3MvqcdCEj
         3e4K7WWLj4HXcrNzhHFlQf1B1Eh2mY2qGXAVLQPB0dArq0Jr76TzZXlXCZB5ldgiRJ+U
         qd/kuv/jxUcLn/LDiqLFbWx3oM84UQryKp4ijdP7NNgdoB6YmSfaGGJEvz7j5yr6W9de
         tzDg==
X-Forwarded-Encrypted: i=1; AFNElJ/l2/hAr7tczXMllG7UAj6YCzzWNS4OvE/OZ0jMY/Uhms2fC1P3PTP+HqJ9Wjgptlj51HAJ6T7G7Z5BHg7T5cR2@lists.infradead.org
X-Gm-Message-State: AOJu0YzqdDN7rE45NC/2+G6tS+d0zH3+g/ceQtQ0H2Q6yiPpfHI5mfOn
	63q1auCl6rlADvBsggjj1uWg5Y5I0zAuGN8bcoJewKg1tIXAgUEgP1fM3f7mlYvE0aX8aO6u/T8
	MV4VNSmSAtitU9081xAp+4sReMhLc9zHVxumOe5EAlhBJ78hf1FRj8WPUc/KbeyZA8VV0/lkUgi
	0pjQ==
X-Gm-Gg: AeBDievUjJfNuahNELzTdV/L5iUnPIOmJQ5Eoe/CGluIn0dH3jE52G7pUHHBDJrtmjZ
	Z6u06Q6MU7fYs1/T1Tn1HWAWpo8ctNouQH5sFIwv3ZxfX92nhLK/j+3q3oF8zpJcYyNB1sJ8y0S
	+yqR8sNxFAHkfFecKw6m5I3A07/vSdn9DlYRHhmK1ejy8yj4UTQkcqV+mGFM0ycbryg8vUanK9R
	TYyUI1u9YVt9W0cISDQ76vUk1Q18qHGABbkzsSkouQ1cgOSIP1M/dlMcsn72q5BKtEi/QudNskR
	00HO3kWuwLtwd9k9wlsacNZ7i8v1kfspgCkxBQxRuMs8ynfDv/xoR9OXyZrwrE8HiASUdns24ig
	wU6L7hDXLrVIAuJOpRcPi+5zpRS7AelcDS/RBA2NdbNT8xpkedJCr49nIrBB1K20g3+2o
X-Received: by 2002:a17:903:1a6f:b0:2b0:61c2:8e83 with SMTP id d9443c01a7336-2b97a924669mr1659885ad.20.1777311424482;
        Mon, 27 Apr 2026 10:37:04 -0700 (PDT)
X-Received: by 2002:a17:903:1a6f:b0:2b0:61c2:8e83 with SMTP id d9443c01a7336-2b97a924669mr1659515ad.20.1777311423818;
        Mon, 27 Apr 2026 10:37:03 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:37:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:51 +0530
Subject: [PATCH v21 11/13] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-11-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2273;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=h00z8eJrG9Om/PVeRuYJqWqHHclJ/SVVNDy0H5KfL9w=;
 b=Q35HP/J2vtbEzUDMZsMZbyjq9HYtQfZXXwSbRotBnbtk6hYnUlUP8WvO7OSd1uQ/nBxMl0dss
 ABpqvPjag7pDem3Sei7AtCm5F8E1ZQvfuNpYj2jLju6vlzV4BYHiHVt
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfXzt1RJJGOVhXX
 /ZLbU8iElAD5YqlNAyXli6ytA64Y4F+AHa1kQi1C3Bn0UZc+R+a/41435DDP8kL15xgB1MSHYQM
 Tx7invJLYX1MxP/NebQdCypoW+XTNwlVZJ9mH1JJov32kmNwxINQdAW1p4Vdr5t6Q0k3mBYqv/6
 MpgnPj490M+j8+nkUyIsEYUfqv9GBt6wz/Xta8CbdwWVS6UWVqEAHrP4tRbFEmvzxsyNWj5z3Mx
 slKs6mJ/naXArf1cNzsQlt/ap2bWgTW9wCa/l4GrN/SLJZc69VEhL4XTwEEJV0FdHx6lMSF/Lgt
 Dy2QSEPADyOKNSku+NcQ5oWFvdr8eq4uUgMnFAqyNT7lwzBC4dxhCy2gILtlSVuuLFwUePA6Mx5
 kLYkQkMsoSf230hGljqLRn+E0NNzYTVjZlkOV4hmL49RirSTznErB3Eo/LTAiKaAL5lUsTzgvhi
 0kJzzHJ0uf282Vn+QdA==
X-Proofpoint-GUID: zzN3obuv4OpHDdW2WE8KsxBfsYZ7Spsa
X-Proofpoint-ORIG-GUID: zzN3obuv4OpHDdW2WE8KsxBfsYZ7Spsa
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69ef9ec1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_183707_239573_C8F8F9A2 
X-CRM114-Status: GOOD (  16.09  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595cef441f4bd5ba21fe133652b97c6..8be0f50188839e6301e33a50948a523825fc5a6a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -758,6 +758,13 @@ usb2_id: usb2-id-state {
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
index 31bd00546d55f4e37f6dd8db58f0adc36336d873..ff01f71fad54dab735e799eeb25ce9d0938031c6 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -704,6 +704,13 @@ &pmm8654au_3_gpios {
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
index fe6e7635182307386c06b16a547b52e5bc4dc2ea..e3ba8a4b57df02687e1321e3df9f1e9856a8588c 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -559,7 +559,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1



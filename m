Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23759FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/yZ4bIJyOI7G4zqRHN1bsvi00G0rNpCoyBy2l1oBTs=; b=znvm4Di6l3p17UErHlZr07Bftc
	AjLy8PRFNrIAPnkovR7igcm3X/3ee6EfNErhbrr4AYHf7Q5LAHrwY3GlTdmmnstiUVQxsz1aGw9WB
	O3ZkGaSF+tnkAqodKg68hsmGYeN4IGm6Qxc6HH3YyFBEmleb7m/rkrlR7SmenivIQLCRNiRj9Xso7
	HkHs40r1BIMwUSkvSVi901LZewWTaUxc+LXoBKjnYMArr7lh9tEMTPSQAQLw5NjDaH7FKbwhWgRiR
	pKqt/NELTEK2u5eBFMwQMGsJpef1AUlrk+p9TCaQc1iglNqmw7mpVdnpgDo6Bmmi9pG60pjqur9iY
	ANUcECew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPtI-0000000HUPS-2AZX;
	Mon, 27 Apr 2026 17:37:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPtH-0000000HUOS-1oth
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 17:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=q/yZ4bIJyOI7G4zqRHN1bsvi00G0rNpCoyBy2l1oBTs=; b=bJd96eNRAkGC5zw9wDS4Wq+O5G
	gLOiHD3Y7wp930ZyJQ/o2OPbkOTReaUNh9sNuIY0exPoidSrERroqfSFKPURq0306CXsyYxlE0g+H
	MUTlrOExtkI4hN6uItne7Rth7Vn/fnKE0HED4mw4fWr3w/kkxR4xn/tfvjekT+WSc2Mjo4wWZfHeG
	TX93z1OBqYuAWzFZ1CS6csMMc3WHsRTzPUkaHyR2AyWex9s2//a7Zo0l8IexnjjRkhw+jGgZf8ILA
	wdhAjhixgVgMlLgg/49IeYUBiGbS2BKtS8TsgN8pN4kbchpubtO5U/3HL6hGcndlRzgErw0HfJM37
	DUNIyvzg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPtC-00000001Gbe-1iDY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:37:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RC5bUS2006196
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/yZ4bIJyOI7G4zqRHN1bsvi00G0rNpCoyBy2l1oBTs=; b=oNmIGO0/RbQPH5mY
	JAzuBa9qDcZ5+3btq1ypb+yXum2qudj6qLr/7W3ovxv71MyXPsqvLIaQX6+/tglJ
	7Yv/ed3eh84VHBS8J51wBfNertGUzw893ZTwItDPNZwWNAuXITblVhFsD1rGsrHr
	2n2Satt2oMFq5AxEDc0HgSF1z+rVFvdfmB9owAJAojCgfofdRqfqYZvYFd4QrhbZ
	+r9fayRmSH+2CkqgKYmypRQGy+V8eFWciJDGhQdjwwD5vU+B+w3l5IjC5Wlv0D3r
	3LfakyVZATidcLQxflcjm9rYRmb7cdz+tJBWpGNB2RIOG5K5KY+HPHVcr56O6nhN
	ARzzEg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkh8fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:36:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2d83e7461so179378665ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311414; x=1777916214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/yZ4bIJyOI7G4zqRHN1bsvi00G0rNpCoyBy2l1oBTs=;
        b=HZxEjWEcGDEKjkgup+0UNv/TsKjilvkzKNvlGYsvs4I41m7qmy66Vpp1SGLaZa4I0k
         wPJAtQgGnP6wQERNMEsJyVoURpaxYTPxPuhMUVXamiDAnJQsjbj+3EswNaCqpaw00zQK
         TERfQtg6tq6JZTOmfMBOpAba4UwZFOJAPZdoyIh2bL62S8x4HA67LXMjdgGM+iUvMHQK
         aixRK6BKbaIkG09+ieSKw5yBDOjfGhdjHphybQsPCE6QcJcnNGbsanZEkvSxWgCm5zIq
         EkO2pO0cy3/w83JsoyyivAn/JMlWVdhLCnPqjCfZVBhCUQ46AP/wJ9G7TLEwC3Dx42ue
         qq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311414; x=1777916214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q/yZ4bIJyOI7G4zqRHN1bsvi00G0rNpCoyBy2l1oBTs=;
        b=QpT2sASLtKe1qbf1Z6zvus6onnR2FA8KgvsdP/3pAoHesCl7zZR1SLFblyLUZh5C35
         Aaz76SqNKpLKiCTL8EwqPZcs6cdhnnetDm+CyTUFkT9KEhz+IHEqqiyObN9x0d2c6bQB
         wh7l/M4MOtph7hVxRGnrQjDwe5BTSz2/rPG9xUUeHR45o3Vx7OS+33FEM3ocIuQl8wEh
         IopTMxuBUXCzBVvkimrFGamsmYUb25hov1MnxFYvPX9sJwp36FOSBXsHhxgLHAWvdp7F
         B5e04vqtpGBzHL5zPv6WSYT7xj3Cpt/auauRTTZyo1/umzRzOWQsDuWi+V2EHm/VRdr1
         7SuA==
X-Forwarded-Encrypted: i=1; AFNElJ9aIVEQR6fXou7sLNkrKTlxvZj3ZS2lPP3VYRZHIK+xVWJqEQX3YDSO3oIF02RsqNYC6Lgaewz01iyCFvCc38EI@lists.infradead.org
X-Gm-Message-State: AOJu0YxX1qHclkVkvjcgalQEhak0dQSmiYFsOVOFUc3FY371DtSQlt5D
	G+3rwYXSe+BzU7iAihPYB0ol+I1/RuGlsqBMokfNVKcSn5dWQAgNOhlfzdPO2t3Up+8iqNVy0zP
	2lkOqHhcOT2E2lP0sO6+D9qXkERhBrjejxLA0+J2wGUQGVIfsNyBy2lczmCYPeMB9g/0Gew2SyY
	KlHA==
X-Gm-Gg: AeBDieu64ul1MVSX0ukXXp+1OCgoi3BrxFCJqCFdXcJjwmqMQxOKoI/RZAHjcGyHUPI
	vxPTtAAT2KowDtUKswRtpAizZr8sHZ30Vwe0rRSb4Zd2Kxie/YLYJfnf046umnNddDMWIOsr08g
	3hv4rpNsgocsydmCNM6PUri5rGSIoQ0OU0f3cB+3d77mK9UZydFPlITFVHddYt9D8oKnfwH/vcx
	9WvcA7pqQeAKgQQA4/NDNG6JklayceWyOLpdz6Bmq07YxzMBb8dfLlleAjZnVcfldXe+Z2llwmJ
	pJEjD8sAZMXB4buAB5LghlMg9rULfN8/Nh06OZoMXvKtvB5dbU5T/JauwOgpusRzIwnraJ6LWl/
	ayfHrzAJ67VwNes28AQneXY5rFSdi6CwWdQSjqxmiCd3jwhXwLJqDG9qtkvwyy6BjqBnf
X-Received: by 2002:a17:902:930b:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2b97a9498d1mr1240625ad.30.1777311414273;
        Mon, 27 Apr 2026 10:36:54 -0700 (PDT)
X-Received: by 2002:a17:902:930b:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2b97a9498d1mr1240115ad.30.1777311413824;
        Mon, 27 Apr 2026 10:36:53 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:53 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:50 +0530
Subject: [PATCH v21 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-10-dcf937775e73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2240;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=lzFmHffITL4MZ7Zhg3ubOyGGeoOeSnOg+B50ouxJsO0=;
 b=98cReqLFE1VvbI3WMdumayFbZvKuX+6jokI+ZbKawI/g6LlmRmm1VnxCiGnVLXZwxNIU5qBGG
 YfhdC626zMjAwn8yAogRwMIqB5/RL9mpWKk8xilVRkbwq7id7zsCDrI
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: 04X-EH5uThZuSBY6bRRCCRhEeuj5J7nl
X-Proofpoint-ORIG-GUID: 04X-EH5uThZuSBY6bRRCCRhEeuj5J7nl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfXyccDgu1HpDw8
 k5nxmurbeWoNkz0alN5qdCijCu/s11h4Dxj/DWxHzM9/bJGc0JCGW1SbnmCjXXjlfu+SMWQKfKe
 YBv9ehaGGvEZdwqqXx3BvpexyCah+ITi1U4BVVRKO+oMsIWyEPNyd160u/9MuvNk1VJou59hf1i
 xuq0KNyojLdoDBOOvaSCAFpaJladAE1crYZkj/Kf6XaqU2wz/yHqi81uEwyp37qNIG4NSKIFw4e
 CtogDLZvUpEI9geTHP27y9I0qdFbdmSfi8yje2hldrCg8bFMAhpliSayY2hihoIJxk2lVGPj6CN
 +YcDOAydNMgmfI9OtcKRV2zqlKSnes/uCoRu2NMZ2i6dlDRDZeeZej8SoQOBqxOnUFIFY5bhAyP
 0dw4E+XDMbFRHNJ2C3XKR5JBt/BqjTRsEnf8BRs8hDHt9ee2DGnxLZ9vsHQ/xRUAZTuqJXspy9V
 C6cdx84qx+CdfUKmEWQ==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69ef9eb8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_183658_823662_E7FEFEDF 
X-CRM114-Status: GOOD (  17.37  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0ec5196c88881f529236c321ad617..72bcc732ab7b64288e1848edb8a55e2c7fe34f98 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -863,7 +863,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902bd37242ba96b90a858ff091e0c80..b7a0b53476395c25f264f2808176588f5943c4c7 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
 	bias-disable;
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
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884afde7816739053d41ca789acfca91..ec614003bd83664b5485940edd366c9ddbd57340 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1088,6 +1088,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1



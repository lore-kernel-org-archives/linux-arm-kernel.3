Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2646606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=on0y9J1i;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C26XEd2C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QaxZU/ZC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ra0wkK0VOhs8mZ313296c7ydEzyM1zL9ytp50t1dNQM=; b=on0y9J1iFiDwnG
	h2Gx309VjHCi1986lYixP5w7/HYhwmHKnSntLXGOEouNlQb72B3/jFNv64uxU9Wc/lFXO1nIJC+12
	fKCERdLTUPkO9837MCRGXFXBOd/TaDQelpjIqzuB6XNd3O+uR1QiwoEY98YJG+Uw4ExVOgNCSK61A
	G69QJmu5UvSq1SM/DOS5/i4f11kC8PRU3m1mWZZrXaS4WanRuQii85i/RjxmbMaKQH8y1g8dIUyQX
	3hA7fcrLUiOCUabJvLplRm3TMCMZnU4FoF6LS3eNSeznwr6SdUSQPH3FwqBWPJ40X/84ML8Cc8wIK
	BlhTPqxphZIK+EInt1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM1u-00000008nJx-3Vx6;
	Thu, 29 Oct 2026 09:02:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM1k-00000008nEJ-1KDY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:02:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vQKo3457723
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ra0wkK0VOhs8mZ313296c7ydEzyM1zL9ytp50t1dNQM=; b=C26XEd2CcgRn4dkf
	3jQTT571CluA7sV2xEQK1/gtOdQEam4dkB41lT12hh33q1U3qncelaTHCd3WVUyO
	qPDjyOemwsMNbxO9U25lPqA74Ssgyg2BX6mkpIzWsLjj97Fc+PUGkFso6uhof+p+
	XnqOWgf2yYrnJbiGUedWjExUuntQP8XGdixAdf9eaDYt6r+VtlvJLP61glqTloq9
	uYKU3Sq0dO3wovB0LYQiyVFfmjwXktGpC6eGAB4F2VDCQk4psbSnibpHnPJ8aund
	n6iZP0saS3vAO4pz/naU157nua9o3V0Z3X/rw/w98R2WS4pqUUHFfI+ElbrYxjy9
	+SIRTw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpb2ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:02:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aca98f01c1so1601531a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264546; x=1793869346; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ra0wkK0VOhs8mZ313296c7ydEzyM1zL9ytp50t1dNQM=;
        b=QaxZU/ZCTufKvmLL2zvwbmq4Sv47h691ydgWH3SYuT02KW8XOabpqxHxxyF/UhguJJ
         +qKNgsuFmlDBoVTKhYMjcVer4ZynAAkCdMBkfKVlA0Eh1TZ+1TMRq74Rg+rgf6IXIBvM
         Y0Jo1xT58BZgdCTwC5E2Q7wpDqZlfurhMOTCtskbbnsB0v2B9zRmH+vhZ3CYgQonlJLT
         sxQ9Va2VqdnQf5QyDUGsn7t/FuQzWj8Wjo5FcZJyUmeLS4R+i+WpebHXem6wsD8QS3Aq
         p3UAaXBleuuJ85VjYJuT3allt9IKp9iWCKNrFo1UnW3LvFRYcgt0XMwfXLK1nu+xVDCU
         gccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264546; x=1793869346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ra0wkK0VOhs8mZ313296c7ydEzyM1zL9ytp50t1dNQM=;
        b=SbAx/V5hxHLM5O++IMQtVfF8lqYfyE7JIW5zDAe5FVcFpA7d5PWmDj6L83t1bKH3X4
         x8B5bTk1wW00vhu+h2tXLuLWwCIoDArk0RnWLly172Il/f3xRRw9tXFzuYjdunmTlIop
         KuOk5dJnvA7YbJMmbWxedEw1SHGRo0JUESnoQKjELf2eGgfUD3FrGBzKQPiBoc6ivptw
         AAo7V7r/Vx5aLEp+BmpsIeAQAOtC9udMhEkaEL+zTC3AuAy00myWYmTifz8zVt5lBTdB
         TETu38NfTD/nJvPzQwbW0CcFQzGOqXQUO12Lfy5V+QBNLhP4KQZFDvnOQ5MLqd7P8j+G
         aCIw==
X-Forwarded-Encrypted: i=1; AKwUvBxsf2CW0a0traXDQg+Wv6f9J2DHzE1zCKegf5XkDSUjzq4oxGQsudlT/+kftUby+CVTVCMMDmYWnS7EAFMKn3dG@lists.infradead.org
X-Gm-Message-State: AFq9FYLAqYPaASaJjrDp7x/nPti4fPhwKYKmtMeH268pnLuG51075GVo
	cn0B3FUiB2FOUCTeyzDsutdmQZFoaZcAfsvUVTPWBlJfusdZviZBDSKeDjxdl/3KS5y4gyZJWRJ
	GrXe6y2UvCqwPIv1JYhvLwqwT8kFxo9U6x9x5kFgzj8m5JP/AoGNd3SHg1OUfHiNI+RK+GQeXTA
	jK1Q==
X-Gm-Gg: AYBFou2lwJxpUqNHS/Xz5dw1hesOd2JkFZ5ep5h21m1Oefp4CfUz11A5JE8pf2mUoIU
	conQKbpsWFf0QE5QziI/UNf0l0YQiWwWe9EQc0CwP11v1/pSn/kta0ytRDfjf+QeRria4fc+AxX
	kCD/17vdziGDBuo8hOIY2PyEHtLqYNhLqcaIA2Qep4A01ph65qZNskLKxxznQXtVXSg6vqlS3+l
	FM1L5UDf02SmfG3kvQJHZraAYYhZVWUG7VJw59TFy4/uY9Up6kO8AlMpTMbNReLnLl556HDAorw
	5jEJou9EAaYV5Nlg6aV4u4dClh28kjjjTURIUi6jslxVTCy29hP4rhyqOo/eA1XYEiCIRicIVNG
	IFYgYmNZxPgvVM01cJsToviYEqGG8cBFeHwmdgRhR4aIdj9joKrQ+tUi4j3ByF/zWltCVN/qJ5K
	6NFUDQV/Kl
X-Received: by 2002:a17:90b:274c:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3ae580df4edmr3665041a91.47.1793264545651;
        Thu, 29 Oct 2026 02:02:25 -0700 (PDT)
X-Received: by 2002:a17:90b:274c:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3ae580df4edmr3664973a91.47.1793264545125;
        Thu, 29 Oct 2026 02:02:25 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:01 +0530
Subject: [PATCH v27 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-7-fa4b3ff1359b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=2150;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=mPj+QLGPnZnwXZyxbErfY3pN7hCQJuFpiu9YM0YUfhE=;
 b=Cqq6XXf1kv0NCylp7UGDtgQOM3peyD1cGQ4s9I1D7xhKF1GuKsTELxbtOUUYyagw5Rm4ch3ET
 Q6YJVJBmFmwDzewQbD9obZSG2A/e9W0Kn6Mp68NJkE+vEHkybMmG+5H
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae30ba2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Z3vNbbKKZu-1ezLWk0AIY8GxIxKJK0HZ
X-Proofpoint-GUID: Z3vNbbKKZu-1ezLWk0AIY8GxIxKJK0HZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX5PEddDUmp4cA
 gOpELJZuzUsCrDW0/NrxrL0xVowKfxAnfP7tdpnyJfuVJr0QA6pVbw4+csedAsPTp/WypWE3d4f
 wm38dVYjAd+H3thmzpt2iB7E4lXPSSk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX2x9pqMNmE1kb
 50Xj8WHzV2AQkM0/aIET6l2uvPFPas7JmH4GCLefbQgk5QzFN4Efq77Si1AkDORHralKgNH9cXc
 NeeqZiCRM1+deziKTyW9q1tkvLBJCzLshFIqs/WesAFYO2pqTlovQiWIxMhZndlVJRf+Oqx4x2G
 08OGWTfS5REvSa2EiYAzeEtEIx1o3Y40elmNThvdTG28VkuZ27GvlyDG+DoWo3H5eU9IP65C0Tm
 T9hmDjDh+meDf8n1qdhg5BTVG44/9AbdyAUy4g9MVZrLeSoOKBQX4SDRmScPnYXPMptWSfxgg2k
 mivDutywA+ZOj0EKqmX9w4/S+eubURZvrRsnlyBY+oa4AUEzLOW+Ha5zQP5R8oMmRa7tawZ/EWd
 wcDy84K5ndE7Wg6yWGktVGPySAVYZ69GLljivdg3lvAl7f6ym+JeTg5eaTafKTv78tLtfQ14Ykn
 WSq/bO6NakjMvMzjCFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_020229_975957_B2E25EA7 
X-CRM114-Status: GOOD (  17.52  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..d1b5eb9e86dd 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -867,7 +867,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index af7821e02fdb..3001ec050a5e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -792,6 +792,13 @@ &qup_uart7_tx {
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
index 909039816a21..82788a1516d5 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1107,6 +1107,13 @@ &qup_spi3_data_clk {
 	bias-disable;
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



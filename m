Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A54606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c7/eXqUV;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UGzuI/fB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QDShlvGy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W0iJhYwYFHxApioBxjUjHv9EZd+NjU0umTau3U6H/X4=; b=c7/eXqUVDzVFyj
	QnvXwanXrXKlJEatCsnUtD8CHDzu562DOiwp53EBjMv5yK5qC7ZYVVv2FEEmvFGeNjYSWpFHtICv/
	MoSTcxxvVbd7bSXo0z8Dy3oY2RToPlp8ObfWhRwe1O5oKEeGx4R3pbYHKJnNpKZdh9TB058YewnFv
	7Hr3WId8ucM3CnGXov7dEI/o5qyl9GUGgQKT1go0Aq6b5IbC40CEU10LkdlAb5OhOUk8yyblWuDRU
	FO351mh74E/ER72C5GYSZsA0edq4B0f9hVcKz5RolmMJqXNlj+7/IswTad0BigOVdtznUqq92WdqL
	OQ5HJbSHZ/BzOvMO/Ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM2L-00000008ndS-2JhY;
	Thu, 29 Oct 2026 09:03:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM2F-00000008nYz-1chy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:03:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8v8af2273140
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0iJhYwYFHxApioBxjUjHv9EZd+NjU0umTau3U6H/X4=; b=UGzuI/fBbzLudgIS
	gXr14iwDFjdzVTsZFGYigdgyuhuNl4dIWN4tkZxbHkqFlOdGYV5FD/wfbGCsLe8m
	5LbnXlm+FB9lTB4HzzK+MWPVUnvRybey86pXLOvGcM0Nu1RY5Rz11JBe7zUaGgOH
	FdX36c48cKPgTzqhwC3NR+TlESLZ/CNMZxHKc39P3KzUF9LE4wLBq7o5l4/NE2sU
	qF1luJhDxxIIZzKWk8s/DKfK6sbDO0PhVT6l0fy72a5J30ErkNG3/vlguxL7Axse
	m7PifjR8kQ2+P73kPBopA+kO5+x7eYyJG5dz0YrGkL6PpfVSBsNu5RD5wFRKLlAw
	fgWg/A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b01fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:02:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso343015a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264578; x=1793869378; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0iJhYwYFHxApioBxjUjHv9EZd+NjU0umTau3U6H/X4=;
        b=QDShlvGy2Dh3z0CWG9hXGjkuDP/rdV2MKTAnSvvzoOpArtmozPnAsiMTdx0ZKJ5ww3
         1UKsH/pTqH+nsSVPg2rF2LHjv+GwtDXNTZPBYMqN+zcNimG8sbnDWuw+Nev623AJrPVC
         iMwFOZziey2M7wdegNZBWl7l3y8s41xOpO27n3Dwa784njHmV3oMybfYAbkvkyRnqQDr
         F9UYodtCqsgrr4JYO5sbCA+Shc6YS+rNIlfM+6qsxkl1HYJ0JJ4oGlLUgCVtoZ1L1VPi
         68Ag7PK+EiIoUriwrwwaYhNlIUgn1BBmqJjgxRSSkV7YzlH6gb4kYeMPp8pWTTNm5KeB
         J8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264578; x=1793869378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0iJhYwYFHxApioBxjUjHv9EZd+NjU0umTau3U6H/X4=;
        b=Ry6lviAjzehKExS5Jy+ayEymTen0E81ZmZX0b1wY0EJBMGiG3EIZWMk8oKYOQVE23Y
         SoerNmKc5YNV14NgMyZrD1+7LduUzhFgwecSZUO2pWHPRVm8ndApCVsXUX1SVuJj6gcA
         ZGd+OnhbX0RJFKjbH1ualvHmQNcOL4q1xF1I3vGdW/zEY+HElb3E/ELXtZVR8wzvLSla
         Yge/nM4GrkeEGWztpPWzMyX0RvYLl+pplIO/5Pn6fD0RKgrKldCk2ZImVJKvqGWpyJAN
         pD8RwpapP9AsNBW1EYLygbpbzUU9r8VvnrBigxmMSrW6mZmSK4xVNe3L5AlEYAT/c+XR
         fYTw==
X-Forwarded-Encrypted: i=1; AKwUvBy2p+tsdbejg3gLQpOXK5pugR0y1k0/KSQHXTkRo4QbQdo4B4dljzER4IvNlGGlILci5bewIlUuVLfPQCbi5xLZ@lists.infradead.org
X-Gm-Message-State: AFq9FYKrSkGpRnFoPQKJ0a/ykqrQfzluHvGMJIo0iocwvmZJwgRFrhVF
	CGgheCtZI/p64Z4MwNfuVwtakTMAM1/7Ki++5stVvIFb3qhIzZ3R1i0DBF6Y8AS+2SMnc+vvZUH
	2PZRapu1wBkaQiJSSpFVfRYkxDLW1B/Bjvfv2B6qW3ogGkx8+Kpo/S4qPsPOCMFRVxfl5Q0x/hR
	5lpA==
X-Gm-Gg: AYBFou0FJE+jexjC4RYfiSioZppm4G296R4jws9eK1St3ExDpkFPmUPQCr847S5/jHM
	LWEnPD/pTiVJE31YHjkVBuI2gSro/GPRkCiJ4sgwM1BBKSY+dZUTRnMGj6+IXOxNrE523U0SGYn
	V6ZRpMrWkMjQ86cPnea2yjzZcdHMv7XOVed2llCYcFfPH/d2sGFl9cVn5qkC3eqRkrDHoOKImTx
	rQmQKCXPADXB2PbHjX9JieuLf/ETFPjPNOp8shr0SCoZye/B8ryysCT8DjNSICH0Z4LSL0y81DX
	zSGAY5PDb+tjtrqykKrHf4m4/feVOqumLbf4NgWed5aYV6BE3xqQaLCPon+OtH7zrYRXxruMKu/
	s/kTTJ8d1Sj62mRvOWJChSnxNmB0KvYWPY0STf4nqXAQe8lnCU404YdgSWjdBX/w06MxrL5wrex
	F90mQjRJnD
X-Received: by 2002:a17:90b:46:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ae5823c672mr3892927a91.56.1793264578084;
        Thu, 29 Oct 2026 02:02:58 -0700 (PDT)
X-Received: by 2002:a17:90b:46:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ae5823c672mr3892899a91.56.1793264577591;
        Thu, 29 Oct 2026 02:02:57 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:57 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:04 +0530
Subject: [PATCH v27 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-10-fa4b3ff1359b@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264459; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=WI51nMUK6qgMXe/JMYvx21HtG2tpC5q/6iKj1pJYETw=;
 b=gGvS3BpXvoO4+rAnmMB8gWe5F/jUrTtj0OtL+qKpMHz1TeSAYRy3TL5xGqfr7v91arFxZBUnY
 IUqkMdrzwNlAtyHZYqier3l3JTqGKtZc+5XnqRKZZeif4m/l9NQFXFW
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXwDNRx7Pt0efh
 qWlf+I2Ws2sdGgtg0rupXmQiqY5JQ5I6ODY2JWmyh5VKzG7WnfgT5P/WegRjzToX8yAq33+a324
 dYhk8KcrdWFyKeq9BFKjvMizQfO+pTI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXxlO7zFx7v6Eq
 KbjOYys089IesogRMRf+GHexW892nAxrjCV6/HXw1gDSWZ2KlZgV0L0DSQOvlvq9JpYPEHi2wQg
 Pt/JT88LnQNxZ0rfa1cDk39aYgR/V2FecnLed3Kh744Buur9YbRfQrQl0VL5kx1GKmVoK+48Tih
 +3NK7C0ACeF5Fzlh9liav2+AME2WLeCLj99lzsUxQglQN75IY3uAbzYd0fOftj0ssBaYl7A9GOG
 fD/vHhSIpbq/+eGvfmTZhjJvg6M8W2T7ts2UOUhfQYI6ZAzXCIQt5yAS4ZYu3vlcCSR53eYI5ED
 nQ3210fkd82dzWrr234Ad6MUMI30Vj4Mj5SfvvjYICVygU9OasFA8GNFcczJJDT6IOmkZObQHMT
 QZAmWF4KEmeBac1j37NwrawMeAOfV97OFM/GnN77om0pw5Tb4ds6h9pnwx0QQvKpBq5QzXLunuR
 QaQgO/p2k0ywUkPZsdw==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae30bc2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: U-ZWRRhkXzjjJs165KNUYYamp7cojFXZ
X-Proofpoint-ORIG-GUID: U-ZWRRhkXzjjJs165KNUYYamp7cojFXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_020259_663144_2546CF32 
X-CRM114-Status: GOOD (  17.05  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

  Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 142dafb04324..30e4cb642473 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -497,6 +497,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qspi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705..03da6400c5f2 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -581,7 +581,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1



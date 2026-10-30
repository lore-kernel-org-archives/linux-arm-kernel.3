Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA34F606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M8GC4wWR;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N61c8DdX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D9yaosNL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=; b=M8GC4wWRSA0Wch
	4v2ft0ZG47OLSxhBw0FU83be9xjidLZZNQPEudnleKzgU2N0coL4X6xxmjT7CTkm7wf//hfMWtuOO
	iD+CPkJXYtw/vQfNUopqPFOxyCLh75EyyAVkLaHEXjeKKrRZSIQWNZkuBKdyK14HNYx6XpgLZSZfV
	lv9ruXamQBhHDo/Sqg14PrfVXxEJGcrEY4OtEXi7XKGE7Y9yUPwzh/nILmqQjNmktiCAQlNI5QT45
	qDC8fOQmtUhiU5mY384DXwd9cczJbu4iZC9SmK4ibVARA732c8opbNl2rkZMEeCWheNhurNmu0RjF
	6I2CEkcqk19nlljwuj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfgd-0000000AsHe-2cvl;
	Fri, 30 Oct 2026 06:01:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfgZ-0000000AsEC-2UKZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 06:01:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FClH2337128
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=; b=N61c8DdXQWkt3ddf
	K7S+aCwGr7sMjMhFo3BRucsbhHwMRtHxx6r3YWa/PcUz860PivJt3066PqsqxjEt
	33B+BkvalMjKcH4QaR+Ov3XXPXV9zLrDWzrNqI6vE7Uk5JOb+GCMyHfpnpz6xdnc
	fUEOjxQtue81uZFHjxq4TdGDQkPpUlxIoaRnELZfK2qkc35eETusJ3HPInuQ6SEc
	AmLB3XhLA0cuLis25+6Q6Y4dVGtYiN6LvdSKO/CZFCxUXNynL3jn78CV01et/Utk
	YyK9XU9T6qbNaEMxrMEwTamDrF107If26e0TTD6bHNvlx5i/GStoqhHxpp5Zq4td
	X9+8qg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhevd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:01:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so332726b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 23:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340113; x=1793944913; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=;
        b=D9yaosNLeug9CoDCzmJfWhNvVQa14umVT2QktUA4GiYDLQI21ua9iWDhLvFF4qrf9z
         a4IFWfSqRw+D7MPrcRQoKY8nMfFdYlqaZReG+3njPNtzJQjQ868JnD0coiLluleq6V8b
         fLEEFqr3ydwXCFCR7ORV5NGB42SRhcQF2J8aBfkKugS39UQoqJIFpzdi/BRmdouZdaH9
         re4OHq3yeQmtJ1otJpc7v1YntOvUVv/iOut2+9EKMixAM99H2STuQtsRmrjpiU6az3aD
         wEAtBOa5oQFVwg3m2k7la390F7UPbOuy2azR2YLoI+8GUhnjcLLyatRrPd2kNF1xRsKF
         9c0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340113; x=1793944913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=;
        b=UlQWROxpBpv07KnEn/P+2/7E6dR1Hu5IcmG2qojbMRGQwb3RqZDweKHixSYdb964hA
         r8y1MhC6ftQmrlsLZMQx1ojWDKmevpiBcStohKlfrURIpasBc3zukpYUakXemXMuGDiy
         nihpGjLdijYSCM4PObeqkWehsIcNqpAFAd94TOW/QmUM9tms41UMGoNFCT+t4nRSdyKg
         xp1Bi4zCxFi60t9GdQVFQRETqjGo8evWSoKkp6GVtRuB14Mu6awQPhbXQL80ijM0I0nQ
         a/4Re3UfE8nKhgkGUXyaAPtGRKclrzTUXwjpCI61NazBKI5aDCiKvL5nQiaXYW1JM72r
         KH3w==
X-Forwarded-Encrypted: i=1; AKwUvBwO7307anXkAG5adHfWPO7P8Sylf8JfAb2+oSe7rL5bTcb2H6vS6RCdOc6RX4tPxhWlk7R3sMXtfNPgH3poE7/N@lists.infradead.org
X-Gm-Message-State: AFq9FYImljp6tbWilJ+N5sSfBHn8rlgOd4GKXOI2mV4A6JBwi9DZEeYz
	RJNbBvtwzOeog31U8fCxuhRXjurGbBn+ELOSwHPiQzBy+Un6vfvzoF5EhA2KmBgHRgx+BFcyfgO
	IKel5qItVLCAUUVkouVeeQDkNk/3GtJA0UADdyW6B37MLjCXNFgA4KYbmKWKiIv3tpsYc84s1ZP
	9lMg==
X-Gm-Gg: AYBFou3n6GUjZsEv9Dq+JDTgXPwIkMdvuS483yw/AAMiLZrCYqagR1D9ZeRqF8TV5ZD
	7nweUToe96f7/c711c8L07ef5CHAYngfFd1g/fjtdl9AJBUFMwX8iH8Wp36BztdZeDNPl6IIOoY
	V5/cJUZx5UdhCvUgdVSbc70W0gNgAfweTwSYwdNyhHMaDBOh1v82jOBPVCemnsTsgzwCWwBt9hM
	qIPJ2ErzQraS7dKF3Thh/yKC65b9cvFhVRuZKVFIg6wGQqmgE0pu/aPcRisl1AA+YAYrpKQxzk6
	lZg/MoN50IG98uf/Dci6TQ52IyM2ym5Zo7A0HSqSuOdBdXTTJoN+YLZp7+aY2v8fZ5DpttDFo8V
	7uG7rZ7nn8WSEkY+PzU34InTFNUYa4GAJi/oIVp2E5eQmWQpl8QpI1F5rMUbjfn6+OGkGY+jmfQ
	JaSiOFZ0KEA6Wp/Qg4jNQ/Z3R98pxvmIMFi7wK
X-Received: by 2002:a05:6300:398:b0:3e2:b482:ba2e with SMTP id adf61e73a8af0-3e928c9f58amr1101033637.14.1793340113186;
        Thu, 29 Oct 2026 23:01:53 -0700 (PDT)
X-Received: by 2002:a05:6300:398:b0:3e2:b482:ba2e with SMTP id adf61e73a8af0-3e928c9f58amr1100988637.14.1793340112695;
        Thu, 29 Oct 2026 23:01:52 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:29 +0800
Subject: [PATCH v20 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-5-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340077; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=VZwTP8q3VzOtW+jql1QO52SoMySYQJECUrbQXJatheo=;
 b=EEud5RknIhi9nBBQ9Ap+ON8z3v4WfMbmbWr2mlSA1hC2GfyWzIXCRFPxIGb24or5dmZbA2wdI
 LYWNA/Ywb2oAd6HA4/BPuj+3dioxkUBoi5/fux4bsfxpjTmDA2n+a9O
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: m39pmWQkprkF83VoeIgWCkbIF64H1GG1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX0fSrV5OPq9n/
 VVz896uKYQqVYl109t1wDn385nQOyEFVbpb4DvqfHwVrLjEOnMpyfvxHBCivVe7H0+jbOS9VD45
 usmVtOUFYRX3O5IaAFyfvEM3W+guiHg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX2T/Gb5JEtWpm
 EwMyyUo+8ap8Cl+vCUDfQ1Ruu/nPs9ME9wLiCL9RVidp5r7FOgaHM3GHidCi4D8GLC1jGi8P0Si
 rGefJNy49Tps6Eeqn/UL+NnjVwnsvB5VU+NyIVcMVNwQ7biPzm8uDpCsAYcZcxtQS8rdCRzzYCw
 Cm0ZHJVhMOSteGtfSUV8ZRYrfol//RPZ0jLQ0aVnsy4NyYnTHeSnQ3woOM10A+iOVNM6a61m1Pk
 tR3SGMI+kagyThXgo/LfjlGhOsEitPPTi0AVx2eHuehLqKrJxwGnwBLPmNeA4tBsIJXwMZ69Bb+
 toKnRMRvnr5xRO4MmdhnHARnFHJVTXVXexEWiuxNup0trJhnzUNTObbEnEZCH7f2lRArUjvOLjF
 amEO2b3Yw9FDQ/u3Lur/v7F5G/5iu99Wl1zac7GdA+bWFR0gJSgK1HE+7qQjaRtKptTyhdne9wd
 zvol+FarBt+Vlzgrj8Q==
X-Proofpoint-ORIG-GUID: m39pmWQkprkF83VoeIgWCkbIF64H1GG1
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae432d2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_230155_772873_18679CA9 
X-CRM114-Status: GOOD (  14.40  )
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

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1



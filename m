Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321F9606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QkZjxSH3;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGRk0PUw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O/EMdWKM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=QkZjxSH3TuzRGD
	MnxraKeaQ/MpeBRN7fZEXv9yMbwNQJRSL+aUJ4UJz+rEXb/7IryjRPDO4tzOEInEneqgX2qeB4MbA
	ZoMJWomOktcKdcZb1UMPJ3LptNZJ9a+rAjMUADMgAxL9JPnRpv8cyALuwKXn9Mjc6LQFk2HaHUyYi
	mkJGH+dcX/RQ7bqKVlff0OhXD/4UCtd67T+mzbIxmYtkelAvdnxNbojb/1570Y3FrIj1PGDEWeA1y
	eQILkcoAZtGSARMgklm20jrfhfH6uDaWJGF4fmwVH9RHhOLAZZ2Tn0MCOlx6XYtLCRHwS5GZ11ASQ
	tTl3gs4v4u8+3HQXXP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoeG-0000000G4f7-3RRO;
	Mon, 02 Nov 2026 09:48:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoe6-0000000G4Ty-1ATc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:48:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1Ll3430320
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 09:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=EGRk0PUwlYLATkc6
	inuDWGTCv+5a7aJVbA4ChuyMdjE/YZYmbLyR6AE5kDMoE9BOj/Bw8UzdIpfR88EK
	iH1A4N5ZRWPTO1lgS559yHa/F40mAQiI/mJV0wTVQZRSVT/EgQ0XCepjm2pVC4PH
	gUhiN3hw9SDr3udADTbD2yqtc3jilFY0K0EW4rjPyPwzvXTpZnuUsGxCfZd8sgBd
	f9u4/yoNRwvmxnkn81tqokqBrtjtDdT1djJHIo3faDQle598G1apcTxHfaYCURUQ
	9PVk2szIsp1sJVkDkbMPS88R6oSfplZhAaibVnp6uBFM6Xvk3LTZCCLuNMLXPoTD
	DGoUYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmerpms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:48:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso196545a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612884; x=1794217684; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=O/EMdWKMjtzmRv/Ld2legq5tWw/JEJ14+ylVRGdtrRhrUr3U6bjJ8HJ/J9L6w3+pmT
         IyRvBaQ2t0AthKrCsAELJV1krwyhVLqdT4e6Z8uRcfybu7IEvw3vqZmVRLF+s/ISkB2x
         RbOGjlqCKm8pV12aIHczJBqzOPhlVdYZNwcp2jBgu83XAoMd1gcY4cTEwc3DZLH15QSF
         CfqT4hpfay0shY796y6xWprSTD6B8zEHHK+ip9deo16CXOQIdGRmH9E1v2imLAqmhCZr
         Xo1ZioyZXjlxRXzo6UiJ0iv9SNm8NGDp+XM/AjtNFtY7o45digX4ZoJQuvkzDhk9mtJt
         ujiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612884; x=1794217684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=wbe37sDk+lFv7Okx8sTwGSVjd8zmHyILw1Ugthb7u4RxtKjAg/2L9bya2TEHshAPQA
         lLgycn+QdPeA4H/gjLFCpo8uupSzPmg0pEHbqCxNmojPQ2qyTpaLMxOnJ776KqIow2qg
         ueUBDCjgjf+alDjN+6JVXUP3V81nY9CRU8f2XC2mhzjWljobqdMvMPWMdAV6GzUpK93s
         E/mCFBfJbZ+oEMM3KRU1hQAiklK5hiGV2ooB+jaCLk5EZuNZD5iN8JE6Me5ZZAH9VUip
         V5NMCDsSkZUMgrpt/+KLlngn/hr4y73AHQ9hqtCkydFXj7OO65J4RKvu7tWBK7XWyc8W
         lOWw==
X-Forwarded-Encrypted: i=1; AKwUvBza1RIjXKKI3YVcsMReOE1G3iNFKCYSdbo2kDOAwHXGGWFDVfEZl1IuYqnhXZ9JdEe7DMmHzGWte56r7acdyKZG@lists.infradead.org
X-Gm-Message-State: APuU4Z9ManYcB6ytDTrwa7K2H9Karg5I4ZRPQog9zbCjKkqe2I+VhCeo
	FWiSvDNRCrN1N5Gp3P4EYGRGevVDR+kvOyHnT+3mubFAJvZQv/36WNnfjYoagPluM/6275ES6XD
	qYAbuIvFM1VZ1owsMEQ1gkCpEkOv5WuhoC7dw5MzfW6FJCmnj1m+tzpIo0dAgpapcwJowndO+qN
	x/7g==
X-Gm-Gg: AYBFou1/cBzA2s2tesYEw9ZuGxi36/2nvsmz640rYWqZsTtN3m6Pf7utjDlFZP+stZV
	Z6ZajAwKGqhDu6JfCY6PQghy5ZFdt0kO5aDBSQn1rD84Jt+8QRaY4fuaXygjzB20bBkhnfp19RG
	ApUCinO5OwwduFffY4fSUoWu06CDhjS1CP+iHyEkvbQOuOeJr6KFGpD9H91R3ezcFIFQAiZ5AUI
	tjSsDsH7Xzc/ZDyJj/uIZtDYLLP8v1P0o24qs0HsoXmvjcSLtU28J1k1dI4+9P1AHSYzFoW80QO
	LoJ/GBdaR9kiVIpu8vUJfi70O6eEZpTWGH2RPGr8kg0rAPEYmJ+DxSLGoi2B/IPMiaAgXWzxf8l
	x/k4JfosWvR+I0ia8i7ksZ2v6m8vblAd5Y+Vm4dYf0x748sMBCqnpIEsFrurw8ZqYgGoDQY0Pvc
	7W43toXR9rMhZf2jL3X8CJXkpG5TE82divbx8=
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr5382317a91.26.1793612884093;
        Mon, 02 Nov 2026 01:48:04 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr5382305a91.26.1793612883592;
        Mon, 02 Nov 2026 01:48:03 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:48:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:36 +0800
Subject: [PATCH v21 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-8-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
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
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612831; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=YVXq7+0T5BuSCdV213rRQvJ4+GN2bAvUYub9zWuGive23qGSHFZbkQDtYyZzBpQgtwIIHF/Td
 +35EmNPqL5PApKkGK0WqAbW5yI7cW0wAAWzpo5mZfP4G68dKcWDZtIX
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae85c55 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX46nflvmfWoto
 +5dKLJ782XTu2bXmKjhVRVMtMtvXDb6KKUmpFznlrvZpv74tR6fke1QyOHk6/F4BZ0pQbJM7qyK
 ZgJ5WnNMchNvXvnwFo33dd4aDH2eMqN8KmlSW++IHiHbZQFjDZ71J0+RVUosqKQoMzNDkdacFEw
 qyr2FSm0VXA4QtWVmIbpnvE+8gKqRUunodCUA+r+35CsHWbswUl0dcTMmHKp1qWSKKEd38FUzm0
 VhkBCW+V+Ar5lLP+Fd0G/tSr+XXM/3ZMMWh4+ggJfzfd21QORoMha9MYf3UhZj/lSuKtBvkmE2g
 lEoWWhkv8YZLcQyo7wEKg1vUo908zrc31fYGq9ohpMgu7q+OkVuotLs0uiShSqNO+nv5a9jfnTi
 Ysvu/7NPlWpXuXV5athqNtPZpXdSyMUnVT6MCf7vj6r6FIqx9jayzjioE8SmUZJVEAyXs0ysJK2
 c+RNqaOTCyf6f09s/yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX5k2z3N5gegS6
 cItuJZHqRx4LlwtJz7eaGH/DgM5BO4bDz/Sd3S10A96wEk8TDRfc0wni8e52OeoUuKwFDjHmaOP
 Ti3zX6hOVtRixRID2aX1g3Rq7UKes2I=
X-Proofpoint-ORIG-GUID: LNAANy7UDZ4XJPDqcjJmXOruFSi-avjr
X-Proofpoint-GUID: LNAANy7UDZ4XJPDqcjJmXOruFSi-avjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014806_445663_9BB7BE02 
X-CRM114-Status: GOOD (  12.89  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1



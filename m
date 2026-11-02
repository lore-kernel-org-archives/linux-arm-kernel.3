Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C31B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nBOBZ9cw;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c60ltpkN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XIb+kmd4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=nBOBZ9cwbMrWVf
	xSze7JK5w3id0wB7H+PZirUxvwYnJOTpPGkECpwq4q4E47tGDqXflqkmlS62dZvsxuimfl6h7sgp1
	yNWroaoiYIX7QzqKA69RV8IxAfIAV+sVLm4Y1aA+r05iYJgySLAKSRPvItE6aSgq+DxR963ur+Iiz
	Zs6535LzezeaslceDNRzIw3CS7gWC5OK1XJw19azoTHw8QtRxP6PIy75ZBQ08NO9VdZm1JiJgRn1S
	JqkotHF3oawaNmxBb3uyx8x8BDgWI/Ouh7KFMk7OLmVyLCwyVBtkG2bZoJiAz7eDLQxXgn2O62deS
	IuT4/XeVhvNeT+vUppLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNodv-0000000G4IY-3evX;
	Mon, 02 Nov 2026 09:47:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNodt-0000000G4GA-0sWO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:47:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ASk92880918
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 09:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=c60ltpkN2CjgXaiR
	LE/HImbNGg1TmZ6HFXIpg06HGEsPeMxmTEnciQ6RPcaq9NZHq5O0SW5H31VDrjir
	cnbafERiEa+nKkKhhZGqvnTS72Ie/3b1eqVH3jar5nGiUOGk3j2idwTV5s3ZwzyQ
	6xFmMM/2KTgTUzyrn0Y3PUUZbvrgnz/NPu15AT1+R7Lk3UCaf8oJmNuUvOBOAvcm
	hH+5XLguFWFIW0OjBeBUHfBH1xnrXTi2mFaQ9ASdWnO2XDtoErgvrjnoHXFA9tCH
	OyrGtodN6qZAIqyfMujRxMI1QDoRvcJGRRsYeB8/hSKirlrO2hU1kn5SzQ2EpvJM
	mVlrSA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrg716-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:47:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so6267022a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612872; x=1794217672; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=XIb+kmd4poHAmy1SOjuppIilwrSwuy0PzJvPV/NhX0CpFC9SqATR+ialYD7a49CEyO
         ziPsFMlyJpCZmAvfFBFAPuUnlAxalSnEzxhpttUYFlD0889yhkmhJVQUKSA6kqoHMQhY
         N0epMfw467nIJv4OQp3z9rcmUBQrVlNoLFWo9z8QzqF+e2qXWu2SIRV1DLnoqx5CSqkX
         hJll7C8lVnCGLrww4YjoKp3Pc70fD3hBkW3juNnOfeoOWpcDzhHFxqq2vBJ6MVoEL++q
         wgpQj3kCx8omq1I0CUkE882TQVtVZ/cFBnt5w8oieibXv/OP7pBH/GEY//OaASB7Q2f4
         N8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612872; x=1794217672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=dHX9BM2tU2Fb5LilUd7FY0G3chSCHcfQeKHrTm0wNvqI8B8tnBg5eE8sVgo5nUEbNY
         JwE15JxbphuW/NIr+aKPekImsuHsXtdjW0zh15+M1b1/mR80IpD5uv+k8V0uov6li8sg
         erB8unqgxlADRjdTfIX+KPUQ9fHBp2JMyeJtV3TNcmdL/bA/fBTh0YQwLsF7iCIhe9BY
         eDYjDNLhwhzhn7P18rR6ZLeN6nnq8Kcr/H9HYZBbHM5tU7LbwX+ykxGVL144bxP1tFQ+
         g19wTYJXcBOthdjNUiygMzzhVSTLtVQy1XK3KfAndI1Zmdh9tIhkdn4ezuF8hErmSSE3
         khDw==
X-Forwarded-Encrypted: i=1; AKwUvBy2W+QWnRtJfdTObmQiRf8i3+PfdXp4Jax8dI/HHas3wZS/eE04iqbpoOMKs3fT3Xc1GXWd4x/OgQSlKynrNRYz@lists.infradead.org
X-Gm-Message-State: APuU4Z+LDeCQwYbtb9xT5/QtOAzWnfkLIdEf/ku2TlJOQ7AOCfm+I8Nq
	OuVOvuR7uikSg08JiRkSHhrDWbMYerjASbvYmXf271sV2udjJX5hLQ8FU9oT2RKCT0N3KKl4gFU
	H5aOvuHDNvpgIfdPFapWIeb+OJX97t0xJ/ypUCuWnucND2ACO2dYqSPBgQcZB2CcVYh9g+4jZq0
	9zIQ==
X-Gm-Gg: AYBFou1qy5SdY6Dk7juVgGiqNhCJnKH/+4e7acxsuUjPruy8h7u5C855AhiEhkSljq/
	ev9ZiNT/pyp6lhS6FKBWBu1dMl+IQdSL1ebdWXYpYtkXpgvSXy5bMKJBEcEUXsVM5v9db//4hTe
	IynK4UAfReH12eB2hLu4SX/yRGfK8dE24DvApgzBMupGmePU9dc0quRQps4lp8WG1MEAnHb0yCg
	8y3t6hLLFeKqwsR5X3TIgRBELFjZupWIvy29qbheNUp+6/XvABlmZVZp6fasg/JJFkAvk7BtlVy
	dYKU9Xpt8sZDwkY9UJrQaTTuigU89KwaD5uHyErAjlnuM1MWnOwwVvY/1ZHPhkPhagWPSMrQG4U
	0dTO6+nYrT9xWWG87/UYkgSqpTDTxBg7HB9e60iZgglofm4krq3IMSNxhMxohaCVtJQC6oUEW+g
	eb0tZoYUkFVp68eKxP3PupxNFS9IkDqGOz3s8=
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr8208558a91.37.1793612872016;
        Mon, 02 Nov 2026 01:47:52 -0800 (PST)
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr8208536a91.37.1793612871588;
        Mon, 02 Nov 2026 01:47:51 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:50 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:34 +0800
Subject: [PATCH v21 6/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-6-231e069b7853@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612830; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=o45iHlSF0WsHgk3PyUkFhRrk//RjLVAmKOrTibXwQpYiryy5lYFSxxkpsFXbsQNmRGSrSi+cq
 xRm9Iigb9M6CDBxuhsa/PC45EBycsR0Aro0FtYcSqhPCkYw7xmvRxHR
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae85c48 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: OBsP_uJ7gju4dESMCURmXklQc0HLhqtr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXzqqnuaxPqufm
 dzWO71ieuzwiSrkIh+sg0HFELsGp4zpPQAZR4qQMYNCnMGoQ2oJ66Z3TAsdPoR/kLhYESVzAicr
 pBHdKpp6mBboXLBj1ScvpwCINbAXShE=
X-Proofpoint-ORIG-GUID: OBsP_uJ7gju4dESMCURmXklQc0HLhqtr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX2jYQ7K+XraTG
 fB7yWnhuYLPnIR1NyvziDWgooV4NyDSVk3zVfaeiQRWyRtpIYUWL/aSTAYmiDvUoPX86YvgQ2qb
 ckeHPN52InAGg73WhT2TdbJUYut/X5/IrWalM7/wlR4xvsMphC4WIsVxBHeJ054lSSjZ0DhpJkN
 qU7j+KNE44nZSixBCGEbL/6zkY6KovwDg9sAecYK2uPe/Tr1vYMBFgnHg50pj/dt3OvmfJ0jweg
 ahpI2fw2z3GG2JLnGW1gefBXkIxbiQRlRPA7XjKST+GC9LB8DkK4a/sIMlYb7tzAYOeC+T4dnbS
 AWVaAe9SY7xN4Vpcc69xJ1Z5i7uDP+FFDDrfJ91qxW2u8ZL7jPEQGe276pmPAzm9Quo5QZgrDCO
 NUNjrvsZuuR0EUe5eNJoKw7YofS91AO2It0sNU3jmYxq7G8Mw9kX9pJ2gMZTIkBvtxpMjicjDGF
 yt6Ykd2D9uJfAQutmtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014753_275775_3E550D9F 
X-CRM114-Status: GOOD (  14.89  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
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



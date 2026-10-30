Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC812606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 22:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w4ACH+Ik;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HnQz40G3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QDgexD5d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RBQYFH9qY/8wfFZRkj4H/m6BfoRm9sVnmTawEHfr+ek=; b=w4ACH+IkSgK9B3
	lwztbs7ALWVWWSS7Ey1fVRSpbaGHJ1NgR1+3hCfwMtHVTMW4e2wqnj2ipc9u6Dfa0AJSvMcmsl5Na
	GA1ms56NejKr4jxnXA1G4wBZGVpE4BEQG4PKKE+RyF7mlzKOBECCtxweq1XnacP6Q9Fn0LWtvwII1
	jMEKFWwrCXVzZaCqwD23kcwxCM4TweYNpgXYuiK9HsDaHNHt35SymslR2PFfQ2DLnn325gYK2DM8c
	/g4ND0whkQDqRMhg+Bdmiy4VVR9BBbi/6JD5J5wJhvdEVs8PvuzSzL8UC4FIlRQlWzE28B4iHw3Lb
	9dQD59l12gNZc9Jg2H6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMujA-0000000Ceao-3YBW;
	Fri, 30 Oct 2026 22:05:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuj1-0000000CeXz-3TKl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 22:05:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtHcT4185860
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 22:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBQYFH9qY/8wfFZRkj4H/m6BfoRm9sVnmTawEHfr+ek=; b=HnQz40G3QjylPR5R
	yig72MUD6M490+bCaOkbfMQyo2euaiC6V9IBBLWMSQjVqN00Jk9LFZneG2rtog9U
	QKSLhqoJ+6f3nVhKorUsrVWT7npCkjxmnP/l+wiYxOTu95C0Rxb0RdF0/QxdN3au
	xRXLJpm8hWEJtZ6hRy6Xfn6wZkDQH/kcXuruMnsDDTmMnDVJt7k65vmISDCpkvnI
	5aniU08RbgmWIwA2kDu2uAxANg1M+Nx25OgBko7hsOkggb5cQqkwx5Zl0nydM7Fx
	GOoZoXI6Gj10IFxKHEuVLUbV3n4Hmap2Zh0YTqYriUyRCj0yYQzpfZdlEhFYYtgg
	hlDW3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x10786-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 22:05:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so111178085a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 15:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793397926; x=1794002726; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBQYFH9qY/8wfFZRkj4H/m6BfoRm9sVnmTawEHfr+ek=;
        b=QDgexD5dQpOoVZaeXi6qy4UUTIlpkTO6uR5YKlxlnFcCiQ5FdU2CP92cuOWwqpZEST
         pgtbAAfojZ0K7rszA+5YlPVr/9EQBoAm3scXMJMcX1hlnIs3EjOkbCwDXSkpWBvuu1CE
         1er9vQmNKwzRTO1WqqyN+BrgKGo2cCtOhVay3bs2sRBeB8eLDUSMXOrBqo1KueckHaCH
         UPcMOjQFRTjxJ0kDqJcPGBkLjNlaoowewKKqsIRaagNXJ+rFt27y9Tt0Ch8qBAXT/1xd
         U7XwrxKFIqMejFlqqPoET60OhZshlTOkpkddPaK/gqz8/rXiBR2HBk537ypO5a7nxzLc
         pMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397926; x=1794002726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBQYFH9qY/8wfFZRkj4H/m6BfoRm9sVnmTawEHfr+ek=;
        b=P8t7iIGLzHepjcANmzkk0HG8m+vqzZ5gl9WdRmyNTDKLSbrMdKTvWQqpLFoJVbfmbA
         rWL62Oo95kI/efb8Xao2FOHd+9Gq5S6pke2VEDHvXv90dbYTaO/EXKFyck6DyYE/k2xF
         YEyczsHxZexIkK4rXT2Isf64tzVSlM0A3BjKkfy1uCVD9vPiHZXwkTeLJU3qOrX9RycG
         PR/HftrQlLEQ+SYWB7SGDjYdunhhSfqdQqYSTePiBQL0CUcQw7ajV75UQybY7qUxJxt/
         AcTPj/ejVbOoZQlZaX635me5pPRy0afveY7JVinz73FW79HbWnZCWjWpCDK4gQ808v3Y
         h19A==
X-Forwarded-Encrypted: i=1; AKwUvBzkDd27a7Hq9ey05JpPyAXB1k3iTI2fYBIrS7rgw7cDglJAn+oC2/23BlVqXn52xcLfgLW18GQ5uwiX6J6yZDWP@lists.infradead.org
X-Gm-Message-State: AFq9FYKoXCU8ebK0XL7Hix8DJfJfua6xEgZ++bNHwqTRRh6JZOOqwq+B
	zW9lqvlsyqRBsfVhr1EeYWNF1ogpykjI+xpxgOE9oFr0RFPpDMK8OmlKfPMyOWoaMb7+uh9mYQc
	N2TSNnIr+wyRAZerk1+ZgSENTcMI8mzUycUnn28GTT+81joUn9j6WPwt/Um0h5ml4X/FL49yDqz
	4vyl7qgM9PsA==
X-Gm-Gg: AYBFou1lYRHjzV5J3NRz7/wE5H5PM5nqxohbiESawuU1TuLyBQ/p/iF1t+fZJz+01Ps
	qLLRGsG+hYv7U/8uoUgfvdA+FLIH1q3e1ViJOxMogG/2uPBas2uIz1/Ox3qtlWL60ZqRRvasXxG
	snXqxvyMZJCZW4OIRfk6hubhxw8Jc1/52xlAHICoAJM77F3+CW6xpIjEes03x3JlyJQjLG+Ex2m
	xOwE+dpmGoP8bxpyrVlPrzXxRlbyT1iXu6sONjKHWSF2W9HztxxEQfbvGXjHw2truhENbG13KUT
	h44t8i517QAKMHCSryVhykkga0D4EmAadhX9Q+ioWJyT40zPiiF1+ez9H+2bd2/nPAVaMgONoPG
	cvLQ5s/TTO6fgApK2lH1oF/a7d97OSzkuMhhiv4CpHCCHDC5TTDWGSV4btTvA7JSb70/FcaENKs
	7S1WqGjNZefOhmHMvHVqAoLTl9bw5Ne+6EQRXF2+3X/9lfFvRyWBtetKjw20q33A==
X-Received: by 2002:a05:620a:6cc4:b0:93f:34c9:9259 with SMTP id af79cd13be357-94421739a72mr652257285a.50.1793397926059;
        Fri, 30 Oct 2026 15:05:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc4:b0:93f:34c9:9259 with SMTP id af79cd13be357-94421739a72mr652253385a.50.1793397925571;
        Fri, 30 Oct 2026 15:05:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd7dsm243930e87.6.2026.10.30.15.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:05:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 00:04:59 +0200
Subject: [PATCH 3/3] iommu/arm-smmu-qcom: Use identity default domains for
 MDP5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lLouI/bTmjXpgte/SazsuwobLVMNh7dfXWGAG7Gi6io=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5RSazf2fJ+5mBp4xuH6MvlX8NsIWizZkVogDf
 HSlZFoW9geJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauUUmgAKCRCLPIo+Aiko
 1SSoB/wIW+hEwcrwG5R4YcMUL1kBGVFaXiqV5T01kWY39CxgAlb17URcSVuExa5xChycU9gLYNZ
 bc5wDh9hG0nd5BOnfNuyflAbWRpYX77ysC5FN7YmLxrLir1sb4tnk1bESZBJHeSdU5pKV6NcnnV
 IixfdDOsfEhc424rQeuMmHrNaTINCAvuz6P68LFcU1IvyLWZpnuOsqvA5xW/hBJ+tqYcMl5Hd4G
 2nT1aWAVW2bn9PBrz0z/n/UU92wibmG1jUvCFRNXE+rsI7Gg9tYInEYd8OMKhWYHDyaiuY6lEVu
 6H6TNxngELa9cIj3bCS8y/R8ZIZLZaDlU0c/2u9RZMZ4fi/Z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: m4jvIwhgtTEaET8s3aDpPM-P8yTLBAT5
X-Proofpoint-ORIG-GUID: m4jvIwhgtTEaET8s3aDpPM-P8yTLBAT5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfX+YjxsInyRK3m
 OYZh+O3b+t0y95tBB66QPlK2bmMn5kaivOFdBIF3IzNHrxcK4frGFdwnfvhSywCp5h9gMkC7U99
 GJbKpE+jUQydwRqBy1LTtbPOUplzZLQ=
X-Authority-Analysis: v=2.4 cv=abD0Dhot c=1 sm=1 tr=0 ts=6ae514a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rLj9A8cDlUUE0Zp7hZ8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfX5hebmRYGV26H
 RP2IKxqKECqh+9C6VJSYPCtXwfmZ7JS87fHHfVQaBMW1CrvhtQypJ8m6r2DU3DzmvrzzJTdJLlK
 hLdzHjX0Wan+Hspte9hhzxRAPmP5WL83CpuAOWjX4Vrx+aAmwN+FLfffn2cPsFgTxpcpkZWEHAO
 LS7etyMEGMF9G+Adg6MPN/iVsNBM+uYiX/bq/AcdDZ+fC3EH44/AypJf3kQ0wXFuZdcmUlTnuAj
 2/RCb28bF4gOMdNLZKb1Lf+7gCzTTtl5C3hwNHdkeVQHa2kz2rMcs0IKNgenwRRalVxmCSDDLdW
 n65q2vc3W3Ed/2tF6YM81ZaGQ1sfxyQ8u/cjg/r9SHyxsdtlQaT4IrgJTXA2QN5F8alQJ3oc2DG
 K+NKlfUO4r9HtyLXPjbhUhyOfyCr052EC8rnjtqcZxADppPO1bxyRRas3fIJLiAkKjqLjxi3fgq
 FCsDlsfstky7vq2GdmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_150528_052238_67AC57AF 
X-CRM114-Status: GOOD (  15.93  )
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

drm/msm writes the addresses dma_map_sgtable() returns for the DRM
device into its own page tables, so they have to be physical addresses,
i.e. the device must not use iommu-dma. On MDP5 platforms the DRM
device is the "qcom,mdp5" node, which is missing from the client list,
and the msm8996 MMSS SMMUs have no qcom impl at all, so the device gets
iommu-dma. On db820c the SoC then resets as soon as the GPU starts.

Add "qcom,mdp5" to the list, which also covers sdm630/660, and give
msm8996 an impl with just def_domain_type, keeping the bypass emulation
out of it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..addba9074217 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -408,6 +408,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno-gmu" },
 	{ .compatible = "qcom,glymur-mdss" },
 	{ .compatible = "qcom,mdp4" },
+	{ .compatible = "qcom,mdp5" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
 	{ .compatible = "qcom,sar2130p-mdss" },
@@ -642,6 +643,10 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
 #endif
 };
 
+static const struct arm_smmu_impl msm8996_smmu_impl = {
+	.def_domain_type = qcom_smmu_def_domain_type,
+};
+
 static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.init_context = qcom_adreno_smmu_init_context,
 	.cfg_probe = qcom_adreno_smmuv2_cfg_probe,
@@ -711,7 +716,7 @@ static const struct qcom_smmu_config qcom_smmu_impl0_cfg = {
  * there are not enough context banks.
  */
 static const struct qcom_smmu_match_data msm8996_smmu_data = {
-	.impl = NULL,
+	.impl = &msm8996_smmu_impl,
 	.adreno_impl = &qcom_adreno_smmu_v2_impl,
 };
 

-- 
2.47.3



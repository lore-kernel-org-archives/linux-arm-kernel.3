Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE777606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 22:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pr3o5jgD;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BxWAEqB6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=igqaHoe6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ldJHLqNPYA21kCRrsUkyNCbzh8KMiC3m/wDt/0CLW4U=; b=pr3o5jgDYSROYs
	V6W300MhidBMq61Oa5CzzgToF5YDaOffwMZJNUiQNzXOVKNaDfkOlMXCTgi2BcJl6ep0RGcdb0CGL
	qA8VATp9tI7E1RvLGGrJbXuntZj7ahCBUd8jrNE5I7nv1ckNzQpx1FvFc00/Ys/Z8hQYcrwCH3NoS
	Mvub57Q5NuNeY4MXp3fuvaZncNt8f6TK6WOCpBDhc0wlRDTDZm15JoMTmkwmqVl0rCtyZy9ybN0Kp
	uzZA8m6lQNRq9bQDn9lnTq+GcYaa3JfxSqLn3/0rgxLC3xvGvO18Efnjz3lVmYaOSYFxSpNYff+cC
	3721tW0H04g+/L6BvFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuiy-0000000CeWd-2Eri;
	Fri, 30 Oct 2026 22:05:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuiw-0000000CeVu-1Ha7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 22:05:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtedL925418
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 22:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ldJHLqNPYA21kCRrsUkyNCbzh8KMiC3m/wDt/0CLW4U=; b=BxWAEqB6WtHoP7jf
	2dDMxfDD61mBAnDl2X9HO8BQDcjwwbqYm2ImVArwCd+yQQMel+luu6COS87efL/l
	oZPWKgiMorDUdGPDxFPD4YwvfacTEWleJTz7zl6iD6kJvH2jQtXsCNPqyZu60sWT
	ox0C4nNPLlxLe73MdDNQwYi6jLTqm0Y/omxqp9rz5/vL1gF46A3pnXshKmomkvwD
	xekR2kkG83T3nx31G16mPrWH+WOr3fhvjOtK1ppJnQfxzPr4t9ZxFWRHusowgH2V
	3RdE7K2VEQQBmiZj8AGt2wzJlIEKcWDUhBc/iOS20ygg5mWAklgPxlb5KrYNGIdT
	rdJx6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x087r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 22:05:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so283102085a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 15:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793397921; x=1794002721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldJHLqNPYA21kCRrsUkyNCbzh8KMiC3m/wDt/0CLW4U=;
        b=igqaHoe632kkaHDCYYX3wSumarOWiAiYC19HCALPHcAIWlSbpx0czWHzsn8okIumx1
         EofCMzMBcQrSkjAceIVRdhNUUS+kyhcpJXt8GZRhjR37mC5LwgnusDFItzlKch0iQe1n
         iNYPUevBhWRF1j9TetkHeIsp8S0gzUKTz0ULpRh2cwbmY+0gt/OeIg7V7Yv2b8DvTugB
         1ole9h9Cgc3WIXNH9nDGZe17ZaVWPTiQgdG/A8MvI8Od9WPRTbT12FSQYw60dIRVVtiI
         El/5qjBsnWbOIlYXK4mLzchlIhZUiKBmcKFwnfqXgEDqR5i8tsJmS1yErCa9+/LTBw0s
         r5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397921; x=1794002721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldJHLqNPYA21kCRrsUkyNCbzh8KMiC3m/wDt/0CLW4U=;
        b=NBIFAntnSWNopMkGBmKsigEf/QxjSBVt4vd56GUUTQdFClhl3b0BI9qvIOm3MMhqmX
         +IONz1wRPUFUskayiWR5/3sgSm/k5RXLwES7graUBZRfvF4kEXhmr79/6FTQ0jyC7HJg
         aTsjpGmPLsYuds85C7TeiwKzLlNVM71VqstbRVthN8fFKqhq2wOpBhOPP4UwTnm6Rhob
         PRc2ZB2iemlT+LSFNh129TjBmPdDQrYq72nqrI39+Z80hViNc4hIS9Dy8c4NiDkT5SW8
         TW2QO40Ya/o3nh7o3MPCmmELGZyjVNR0AWciCnh5aV9CvUBUjbS3Ej2khvwmaPGbUYWo
         bUzQ==
X-Forwarded-Encrypted: i=1; AKwUvByhTSRTDiGeI560WTdZMfbaiwS3b1yx/GJiDeU0p5HwBPUZwhAUKCv7alinS4HKSoR7LqDWfxc9L2MCkpMykz0o@lists.infradead.org
X-Gm-Message-State: AFq9FYIRwWyQb/g92vVMhu6XYws+ZQsVDD4MDnlYx9PA3Cje2sVaqNKq
	Y+WfcV6Ayj1MTpXwvkxxvOLQW2QNaCAoFKK0nhueBozX5D6PhyAtia2++Y3zx3ZiHvmf+O7CsbF
	vO6/k307+vSov56XStmFLgkKqlTKfTPKzeuTtgXwdOUDk3k9mUUVy1ZNn0TOsJ/gUlzcSPd+bWE
	MbQg==
X-Gm-Gg: AYBFou2eSwYcATXh+v7HYMcnpkN0xNxJOXAJvS+Ca64mpkA1itR2rqPWq7e7ZJgOEJo
	GnUwEdaL1OrjtDAXgR5sqbB+fadhQtF7+jPNMXIpNKcOG+pV35agJbJotwk5jD+sb91HWZueSnN
	b+EXx3ggXQX1DIXDhakxrr0zbAO/b4lvNDNeLVVIXh2xVqlIT3+t6EEVfeaWztTlLDAS8bdzN20
	EAuQzdZWMZ5osiIVvu7aX2ca4iFS5/nyNNMAWBvoRlXyQU8E+QBtL4PbpnN2QpQEvnoxZWKL2BU
	dFopenwJYnawK6zv37lGzzRZr7Ny877ynzV7BlQGKRJGMI0H+Ev0XIq/ViZNDV0wAGHOMWy0cxT
	lYtemIoGdoxUin65Gsf/qaofoadI48nCpwYHs5DEgTNxc44fe04204hVBiHqvOhPwK5OZkZUdPd
	kLI2T/hnU+QaHPykxff2YBiPgZmgHbQo3zrW55YIF2UKnEB0GFmuFsUW3ZfDu0cA==
X-Received: by 2002:a05:620a:1793:b0:93c:c96c:a592 with SMTP id af79cd13be357-944216964edmr668715885a.36.1793397920589;
        Fri, 30 Oct 2026 15:05:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93c:c96c:a592 with SMTP id af79cd13be357-944216964edmr668711285a.36.1793397920090;
        Fri, 30 Oct 2026 15:05:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd7dsm243930e87.6.2026.10.30.15.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:05:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 00:04:57 +0200
Subject: [PATCH 1/3] iommu/qcom: Invalidate the TLB in flush_iotlb_all
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LQSeEnZeJwLPjMHD6yS/rY03vuD1dC+sPugd4ceeFj4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5RSWvF4Ibiecr2lXXJ61ZULZ+El0+25rk6uqh
 DEvzO0k4f6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauUUlgAKCRCLPIo+Aiko
 1XnrCACbcBLnbtrnjqWfI3ofMBee5ZVbwNaEdA00rUry7tWHK7wx7qu8a8mLT5cWfbQrJxqwxOQ
 7i6yVmfkJQFaySlcalzPLtlP88jf8A3hnAzX5ZHysbCk2TCX6SiYhUP2QjUhz1k2KWx/nxbbMi6
 25OyO0MwxZYyeQeirCNqIJw+jd4GjIYU0hqp6VwJWmcCaPmzN11UUMPgvyabVhFkG41BtDkyM/G
 uuvyvE6Cvdj37X6ugVN5dYce8dVlhPI9KU1ZMqrYhYqX91HVRfXj8APEAEwrV5+hVmwoE5jZpq5
 H6UgKNAeREwuWzcCbth9Y/W+HmkWYCOZt1tBvBNoGF5BHCzK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JmZPLQ_hSMzchdpBo2YGHRFm4_qFB6xw
X-Authority-Analysis: v=2.4 cv=Z6N5j3RA c=1 sm=1 tr=0 ts=6ae514a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=brFVVzKzgM8PounSOcIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfXx77M0WoQz5s7
 W4jhVcCkKx0JP9ht8VXM7EmLyPbVQv6nnNMwA7nD8W6hWV7q5liVCE1/BJm0RMbF2WPO9xAGhdY
 sxKWrHD0VpmekIhiTcpQT9RrVL3IShw7nk/CZoGcyrTikTApnMcb6hDdWcT1DVtckQVRaxuwizU
 W7Nnx7oikBlgz+3Fqfa6lm5hTXjhYEUD1z+7CjepxmaAIqp2Tqz7NqNFoyy+ogcVTh+eLL1fujd
 uA/f2F/3qLq1tLbqhiyQZVja9PxKC08CMNByOriwtXjd6ZgqPCDA+oLDSLej4EvY4UvIVcF3GZU
 PwWC9EsGca2O2x5ngnHj2D7Dh7z79KBxorNzJs1dKuB9PLGIjaF80Xou44B2Ep/gHjfWTaoJ58z
 7z633vQSWVejjfgiEN4kbNsFrfUqnXZoMXYCEwbMEzsWoJtpbr9x1EE0h8RRsM5KirJxbGplj4R
 omz/Q4WRPeGB7B3KIyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfXxAtaRuKoMmmR
 o2g2cRE6hzfpTqUBpjj4B9YTKUGYYvLrxZeWdqfJQyOeiWjehhaeNTfdZHRpkapifpmZFKlcIW8
 euVtU0WVvJRKFyT323eHrJ6/CPJO158=
X-Proofpoint-ORIG-GUID: JmZPLQ_hSMzchdpBo2YGHRFm4_qFB6xw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_150522_465228_33580A1B 
X-CRM114-Status: GOOD (  14.54  )
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

qcom_iommu_flush_iotlb_all() only waits for a TLB sync and never
invalidates anything. iommu_unmap() users do not notice, since
io-pgtable invalidates each page through the gather, but drm/msm unmaps
with a NULL gather and relies on flush_iotlb_all. On db410c the GPU then
hangs on stale TLB entries as soon as another process reuses the IOVAs.

Invalidate the whole context, as arm-smmu does, and keep iotlb_sync a
plain sync.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 21d18ce67b98..54130c32056a 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -479,14 +479,22 @@ static void qcom_iommu_flush_iotlb_all(struct iommu_domain *domain)
 		return;
 
 	pm_runtime_get_sync(qcom_domain->iommu->dev);
-	qcom_iommu_tlb_sync(pgtable->cookie);
+	qcom_iommu_tlb_inv_context(pgtable->cookie);
 	pm_runtime_put_sync(qcom_domain->iommu->dev);
 }
 
 static void qcom_iommu_iotlb_sync(struct iommu_domain *domain,
 				  struct iommu_iotlb_gather *gather)
 {
-	qcom_iommu_flush_iotlb_all(domain);
+	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
+	struct io_pgtable *pgtable = container_of(qcom_domain->pgtbl_ops,
+						  struct io_pgtable, ops);
+	if (!qcom_domain->pgtbl_ops)
+		return;
+
+	pm_runtime_get_sync(qcom_domain->iommu->dev);
+	qcom_iommu_tlb_sync(pgtable->cookie);
+	pm_runtime_put_sync(qcom_domain->iommu->dev);
 }
 
 static phys_addr_t qcom_iommu_iova_to_phys(struct iommu_domain *domain,

-- 
2.47.3



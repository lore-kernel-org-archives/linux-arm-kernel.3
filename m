Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADE7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 22:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aHxRR2n3;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R57Jl92B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RaAfbCKE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=An7OiTnlc5rBNDs1sp5uq2115ZCBsqObQUTQud4yMUo=; b=aHxRR2n3r+3tNp
	mF6O3vz9/76dWJ+GnycsZu34DGduG61DCGeF1Qs4BzNcmmhYOAyjN1KIzfhbyhTc82hnyVcmXenO7
	JC2yeddJ+4WdjbBbntEp6s2ilCyfV8trktysauLYx9zjjpq9NWzzwQnOkw0vBWhJE8+vEjq1X2Ldi
	94+A1M+WO3ryV7XunDHCXbnONIu4BDnff2KDoeenDjIkvtpLr6hDogzF3z991bBAe3sBulZJAABxq
	hSh3ZQ9/Vo/ifUO8FZpJ8lFhWr6T2Fwpv71MOqAmOakisFpT2Tlv3dnEuWNvJEf9HfJvS01/E72FL
	wx+blCoRfRitbSv/ubog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMujA-0000000CeaU-37xU;
	Fri, 30 Oct 2026 22:05:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuiy-0000000CeWZ-38X9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 22:05:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtTun905702
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 22:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	An7OiTnlc5rBNDs1sp5uq2115ZCBsqObQUTQud4yMUo=; b=R57Jl92B9rMbKq05
	z/298LSgaT9g4VoRCVs+DSDF6R7HUvAC62cd6WVRoVHbesIhBQQjBjA4F6DPY2xv
	MhYThqYSbgCS17mnuQXT+XokUrE4QL1/09vMDuL4ktLDfdawMlflCgkyHA/ywi8u
	nAql5LEF7E7AWoZPNlNadov1mQ+LtYBnrNIahKYg9f4/pwVe/SX0UCv/70uCQ4Xk
	YE3a3Ic/gOxd4eZU5qb3e7lMOBoBj3bdnakl/iC1cuqZN8ZsS2NN69MUPYqTL8ZU
	gbdZ5CLpXR0VZeGLMLyeNqaONFXKiTFeD7qKTnvTSTfJfPb31PJTRqF5Zd1CW5eD
	GMv1Qg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x10a7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 22:05:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943e8ff02d0so109882785a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 15:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793397923; x=1794002723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=An7OiTnlc5rBNDs1sp5uq2115ZCBsqObQUTQud4yMUo=;
        b=RaAfbCKESzLvm/hDG2ovg+NIILzphidRCYsouNg3gt2obmaiptiadeoZfv4MGByKQs
         3bvpGc9htuuy63oIOj6UV2vcF811co7wduAaJAhMNt3T+qAg9m3rH7/3drwT+mZAvFZX
         +k0DJWD24zq1eJYy8u7s3kg5Disi7zOf+TUwSfgKxIMHsNrgE7WauMuistMvKGJFlyDq
         whs/IlMkDtTgze9z7RlIzAkq8ABta57dz7I5eDF8/5rHHP1kFIqG9iNhoounV2Vzh6M4
         PdQkg0ogjw57LXI7hDu/pziLbW4T1DOADOeyOFpoRLFR4EhnHulnosmf/bMWAfopHTkl
         RTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397923; x=1794002723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=An7OiTnlc5rBNDs1sp5uq2115ZCBsqObQUTQud4yMUo=;
        b=IiQVbkjtykuWu7TjCSZui3noh1rO2YM9NYt+Z5q466/+kgA9wb4zzLt8/dcHWBZmFF
         UI/Ij0EPEOSsdV8n/DUFixortoZ05nEmtjoHrkCZtzNT5d7M75gRmR0Bjc9cGAvyumNa
         RYlWZnPXzk2J0ne7jLP4J5t4xg2cECOJOMk8ZR0+33/IiiqibavH84kOeiu5RZZO+LfH
         +1j7TjCdmYnhNnIaYF+zJX3j0SADJWbCr2rV0eNgGO5bROrq8FD+2vf8q3XDVHPKX5DH
         nxDOxws1aRz3FCa9XfZse3uztRcUSrfMsHq+fMPHDk2lGsp1M8j5ugjx0LrGNRA9pYFB
         LLoQ==
X-Forwarded-Encrypted: i=1; AKwUvByiup7j0I/nDEKHYEDb3zDPhrIkrNudMnqxjvSmDfieWlbqKZlBC4UdEehZXb8xGhE0+ovGl84k2ht57mbNo4fI@lists.infradead.org
X-Gm-Message-State: AFq9FYKjvatV/ueda2SAHYg442nFk+ZbL29L173Qse6bsIEFSnxGi+a2
	YBnZISxbZb4lhtYqEy8BcmB5tX1yzQSPHOZOa03sfJ+d58/+M4M5I9TYX0DPF8/VgRLtc8RHulk
	b3eQROI949iZzFpKk2TYFBa00RpGmAz3/tGXS7N8tp1nqs5lHnz9PfHYBBxH8VCm7GZGDkH08IZ
	LCHw==
X-Gm-Gg: AYBFou0AYojbuc5bKnvEGhBBsFW30sKJfIrUUR4tZNFSJhDBEBxf3Wg/PE7sYJCU5dX
	HqEwfDp9kzxRvD4ZpqMuSieiaaXuKtjrm4Y56GxDDdQ2toh8kBlO1PujFPK93QWRdp+1qFTkMqc
	6xbRQA07708d4UTW093LBKr6t8TfD07FZ/t9qwwKxlC3ZB3e9FlkJv9d0eWYGB7KvUPYIvTnerP
	7XnyDfJZp5Q4VYZ2ETh9tk0amYczYpcIKa/2yRcPJ1P9f8Vqw16IL9lsR48de3mUA7PCzIYEfug
	Jel1H8+EEw646fvtjIR0EyOdc3IamAXyZwAFx3bJxn02OScNDb/reXGW2wCoLl7OOOqjHlBttTU
	HZdcL7ewzjO2u4cYeFtHSemzc43g86sYt0ZZ1wPZht+y+StvGvJxJlAOmyjNjV97/x7w/kcpQNE
	MsuG6p+6jUgnEvNSsS2+wexBoJAB0eur4YDHhXX6ki8d3o95814jED1xQ5jABv7A==
X-Received: by 2002:a05:620a:170a:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-94421541cddmr602237385a.12.1793397923066;
        Fri, 30 Oct 2026 15:05:23 -0700 (PDT)
X-Received: by 2002:a05:620a:170a:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-94421541cddmr602233685a.12.1793397922535;
        Fri, 30 Oct 2026 15:05:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd7dsm243930e87.6.2026.10.30.15.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:05:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 00:04:58 +0200
Subject: [PATCH 2/3] iommu/qcom: Use identity default domains for the MSM
 GPU and display
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hIUS4OCCIduN5c9WA/I6hlxnzxJqYrD6RjEBkMJ6o8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5RSYzsCzXM1EEMZVjFupenR1Egu10IvqTfPn3
 5AyWZ2VVEqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauUUmAAKCRCLPIo+Aiko
 1RapCACKPnyD1GJeL8YSN6rJSnnQyuOTq1+5XOsKmmvnSGcAS/w/BfGCNi6I7J0TFUvkzTOFkJw
 Ss8qVwVjoHb+cBnAlRT+18w3DWvrfUEA9kZkdZjYbXfwFREvR0iN1kLqj5OOlQUCNQmtp95Wcf8
 nLwfJz/gg4KEDKueKS9zV/aL5weYMgDq3mYZf9iu+n9hOWVBpBpR9AhPV4uUXhWYWOERaAuT1qV
 SkBFbC4AJJ2pWCZdMVVXgHlFRkItKZ66MTePBiU7foVnOnoCdfwKlVOfkZMNBLS4cYRlVK2q76v
 Qd2ff3PfoZTdZEIK4BXm5Xkb3zQld3i/b2hspp4U2STey+xc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfX226tPFYB7PDV
 JdvVq47LmuKR+B9GR2MuB1AuUTWAssOiQNAXN+Zf40K+Z2CaWDbPcb+UKwyjuOhZnFkEznNFmYY
 GDmxxtY6++BNs51YvD/dZuyWWUtD/s6iKn3UbXSKn61hRuMUY9VeD7aFsfZZ+BtU8z1sm1GtEhB
 mUnCJpGFpzs9OVlX+pCu5rw9LmesexDM1mWeTvTZQNwaOyOj/PbrNg4elkki5Pi7tlGupFzw0gm
 QjwJtwMlckb/AvNJkjYWvZ1/zCMEYeH4tpboXug8qaPbWiAbUjYnVt+Lk4erwsridiW2G/NANAw
 sqtu/995gptocCZFI6lO6rrzcAIEi895Pzy+RLpfCljdxqFHC24Wu54JsGt+rzxk98tAa1isrBw
 U/tKQbSr0BPyPdEghTCPWSViQ/+1NfCnjm7R7hPQMHblwxIIEcmIhiwE/NDbi4S2lWoWJihOkUQ
 2BIA7rTNp3GiBXss22A==
X-Authority-Analysis: v=2.4 cv=CLG/zhrD c=1 sm=1 tr=0 ts=6ae514a3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=9k9QU7PkdAG4pGQKEAsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfX57C6uc0ncgtv
 R4q+Q4eaP9+IzqdJrG6u30aWNFRhvzyj3PxYpqAd91R8wfHRFjMj0hlTVNuWq06gawNhi/3fbIA
 mF2uMFm1xz8NfXMFaxnwQi14dftTo4M=
X-Proofpoint-GUID: 3LmPb-nnLnArAnCjgRCXumLZ4Qo7-HsN
X-Proofpoint-ORIG-GUID: 3LmPb-nnLnArAnCjgRCXumLZ4Qo7-HsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_150524_926288_E6C101D7 
X-CRM114-Status: GOOD (  15.43  )
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
i.e. the device must not use iommu-dma. qcom_iommu has no
def_domain_type, so the MDP5 and Adreno devices do get iommu-dma, the
buffers end up mapped at IOVAs of the unused default domain and the
db410c GPU fails to start.

Use identity default domains for these devices, as arm-smmu-qcom does.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 54130c32056a..4a9c4cf63724 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -22,6 +22,7 @@
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
@@ -531,6 +532,18 @@ static bool qcom_iommu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
+static const struct of_device_id qcom_iommu_client_of_match[] = {
+	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,mdp5" },
+	{ }
+};
+
+static int qcom_iommu_def_domain_type(struct device *dev)
+{
+	return of_match_device(qcom_iommu_client_of_match, dev) ?
+		IOMMU_DOMAIN_IDENTITY : 0;
+}
+
 static struct iommu_device *qcom_iommu_probe_device(struct device *dev)
 {
 	struct qcom_iommu_dev *qcom_iommu = dev_iommu_priv_get(dev);
@@ -602,6 +615,7 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.capable	= qcom_iommu_capable,
 	.domain_alloc_paging = qcom_iommu_domain_alloc_paging,
 	.probe_device	= qcom_iommu_probe_device,
+	.def_domain_type = qcom_iommu_def_domain_type,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {

-- 
2.47.3



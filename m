Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D141606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dtiJy56b;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJCZg4Pz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CeWs3Ys7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TzzXFuNiq+DOToFpekJQ4MBDEjsWCEdNN/aJK57pRJ4=; b=dtiJy56bdAzryi
	mEboApIgY//yaaZB5YyopCGHHEM2QO+zdaGAnazmgeLMNWfkwt8ozZaKUtDt4V2BG6XjE1uknhGU7
	aLUaJB/Ckf8K5h9uy6yljQ/iFLA+VDKdFltePILP9OWE9Zx7YSReREBjqCD/MhB92fqTll/C6hKF3
	P6kg2KNqsUxsYB8ycStpIp5oVFvH8QcMsb2AOaxP6DP+tQLMw2R5jc2MtTPG91f/Zf5oSDWSBNaBU
	n880ZFoXs0IuHhmoq1nWKPJzR58GF7K1DcxCXQgu/VsC2uqK4nraMZGGS9D2jl/9AxKR4oqryWLM/
	ZFSuFJ9QkB0Ag9p5TObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXbG-0000000APFx-0pVf;
	Thu, 29 Oct 2026 21:23:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXbE-0000000APFE-04Uh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:23:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJkAhL775231
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 21:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TzzXFuNiq+D
	OToFpekJQ4MBDEjsWCEdNN/aJK57pRJ4=; b=TJCZg4Pzwyuj+Fp2/ydS72faFti
	vP3k7bkoejYpzXKZpeGpYDqEV4YMyXzaaKVT86aBPvF35VGulkxcpcMEB5UwKxEg
	v87XtV9m78Vj2ruauEckOTuF4xWrSax0/sG43AyBEhSH6hdlW5xatfGpSnL15t4k
	51m7V5nt9RqDjGSRsoqXZLsFcXDSDgMOPN2JJHtUYK2mY2oy7WqWvjTbckkBcMaK
	sBdhNG7YJkszATsByXuaYbQdH67t1yrhnsyllTN/Rz+6X5TRUql/hUWHnNiNNDeT
	wyks8KMLfBOl8FsI+xy6A/+KVKmPpT2EwZ2XjraoQda5vDmT5469CjodvAA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmchhrc8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 21:23:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so12231a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793309030; x=1793913830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzzXFuNiq+DOToFpekJQ4MBDEjsWCEdNN/aJK57pRJ4=;
        b=CeWs3Ys74lRSmGg6SV7Qs1W5HcDIs2nlUjfvPtojj1F1RY+/1rmW7huQG3DU8DmTI+
         wLlwvwsYX+gfFxfMVtnjJiw7c2xfo1aAkJneqV7Q2xXUQ+AQPaUdMskBluUKmbUSCg/a
         xitc3voCbZtk/3k0ORBZsp9ku5lsiaAE2kFhvx+M8Fvx/dO1ALM5oeCBi07zKqnDKEiz
         kUTjU6a/697jJiHI1daahL8WjuI3PgWoZNcvytXATxflSQGKaFIQrb1KB9uB8CDqPskX
         F/nILKbMeXR9+1+H+kF6EmaIOJAmRUykeUEUbMzYBIEdr+0WjTy44cKsA7k6FcP4BOML
         x+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309030; x=1793913830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzzXFuNiq+DOToFpekJQ4MBDEjsWCEdNN/aJK57pRJ4=;
        b=oX+7gaZ/ZDSB+dSVg5BPp1/By9iXujwYed0JZozFFxb8vpnlpbtoNEyjqzthipR6ms
         bR1ulxbMSr5HSX0Ayo1xLLIdXMx+h/Xx+Dgkq7XksxdsAEPsHtCs5l7NkxX4OfqhGp0e
         6mcs7R6peNx+e5n2+0DJFTfMo+K5UHv0jaYVlzZJ93nXmcyv+n9FdHSdFjazJtB7OOLD
         31DjYS1y4I8jm7ZkKfAzMwKtIHJMjJtlKr/a8DqJ1EYvMknX5VVoSe7ZdYmnavr1dZIh
         MXAJ4enWyAyGguwjRb/KHg2ZakOU2vbhq5Qxj8Lg9Rsd+xe7bSiwebnM5THUViiA950G
         GKUQ==
X-Forwarded-Encrypted: i=1; AKwUvByPGwLaDfeGBc02J14Gsb5g/MuOmOwmB+smwSclNQjDwjlnfpjoe6YmHgHoBYF1STY4rkOXpjxjg40WAj+QN+N3@lists.infradead.org
X-Gm-Message-State: AFq9FYJfaEO4bm9SvkCxDDsA4iFENUCCz2Rq75ONDTfWASbfu5tH98h4
	C1/rd6E4blf0D5K8BXyqx9CzJ/bEP4cf3IBmZ2LZjoVWKkLdm441N4ms3Dj/tPDdCkxcnIsqmiw
	MypU7hB9CGF/uyPXodfw0x7yf2BBGRFDHrsQ9bEFvCE/rbAavsPGIpDprvVxHfPDw1xnDzMPurJ
	YCtg==
X-Gm-Gg: AYBFou33bTHltvvHwY0fEL2Uj3UgiYVqJL6H6io340amnH75ycoUn6pUo/CdWntdHmQ
	DcMHq9b2R2xgunhGK9mizIjqftC8nQhkQH1DYf4E19Jd5IhaVgXeN1YeygFjnN1xWItlgq7SbO4
	MyQSJLakqIfH9vm5QKz2G/SBaPHVaAGg0H1qxRu81dXg2jAHe70fVqS1jsuo373cTLiKgoQJpmk
	Z8FPrAPLmDV1IRVvlBgkq+UBTPpZG13/XUsZFwlLD9Q9Ur8uoId6GKv73bnMA3JG5tE+PMaXJeE
	Xo1/yajGACHIh6AEQC2tB+FsvaEKGOcoszEOBQOmik32TS0FtmcbUrnCyjK/Y3HwMDXMzN/E0Hw
	5QRP3l+dXdg7mtSLs/n871E9aXuAyY9QD0JrAwUWBDhtC44XUb0SPcrw1EIwOdMaYeT+XmPbGoJ
	KzSdbeibtzRk3jJtqaK9YSDg==
X-Received: by 2002:a17:90b:57cb:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3ae89744ca2mr193127a91.25.1793309029921;
        Thu, 29 Oct 2026 14:23:49 -0700 (PDT)
X-Received: by 2002:a17:90b:57cb:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3ae89744ca2mr193115a91.25.1793309029488;
        Thu, 29 Oct 2026 14:23:49 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845aa27esm1054544a91.11.2026.10.29.14.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:23:49 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] iommu/qcom: Use identity domain for GPU and display
Date: Thu, 29 Oct 2026 14:23:42 -0700
Message-ID: <20261029212344.346069-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX9UX1IbQ1kPtB
 oig/FhA3oWPuypeFbixQkCeitU5Gu6Mg5P6o9RbLwasch78KKsnzKtrxiIAlUnUE+vmjl7LWX8v
 dl1Dp3OKdQughdshnxhQURSsjlLrjzQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX4El0zWrIVwMk
 c1B5d6TqTaQmz7lan9UiApv6Syd+f8QgVTa53ZPNiZEGwK9HrTpoqcY2JUeKUkvAnzk7wG2Vfp1
 7dtBZyGYJsumntTctJtFAwBq/csjuHomIZniL0lqFGQl571A+LQeaGIpbtlYB4+per8lt3glDxh
 eCzifEBlYK++L0cN0uRYJRS4iDCTlIf/J0V0e3v5ByH34J4BrA2WCc7vvNIYYf7uXT7N9zeqaWe
 tkTRQgwJcba0G6EbgBD3maOrOfMCdyATMVvp5sx9S6JRkzv4OaKndyZvwy8cRqzmGMCtQEC82sY
 FtOf/TcH9eIIJ8zMD4wqc5NGe9TzfdACm4ps7OEXZDbrDg+e/0dY9U2h0OkhxPGdNAsUOawsJiM
 3lFS7vUHbhhlqsBcfm51jroIXu10BRF+vhCZkAl7CDCIkrNfd42FiNbQHYtz+yf3+nKOjdXsiU+
 Fra4SDdpaKL/y5ZPdWQ==
X-Proofpoint-ORIG-GUID: ia2EDZpnMFqZTTBCXbZCfjGyYkpWAdWa
X-Authority-Analysis: v=2.4 cv=ffc4WEQF c=1 sm=1 tr=0 ts=6ae3b966 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=554yuftmPdPD4gaTNL8A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ia2EDZpnMFqZTTBCXbZCfjGyYkpWAdWa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_142352_172572_D9532B6A 
X-CRM114-Status: GOOD (  14.45  )
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

Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to
select direct mapping") for arm-smmu-qcom, match GPU and display compat
strings to pick identity domain time.

The drm/msm driver attaches it's own domain, which it manages directly,
so we don't want an iommu managed domain interfering.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 21d18ce67b98..5b10feb419d8 100644
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
@@ -589,6 +590,22 @@ static int qcom_iommu_of_xlate(struct device *dev,
 	return iommu_fwspec_add_ids(dev, &asid, 1);
 }
 
+static const struct of_device_id qcom_iommu_client_of_match[] = {
+	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,mdp4" },
+	{ .compatible = "qcom,mdp5" },
+	{ .compatible = "qcom,mdss" },
+	{ }
+};
+
+static int qcom_iommu_def_domain_type(struct device *dev)
+{
+	const struct of_device_id *match =
+		of_match_device(qcom_iommu_client_of_match, dev);
+
+	return match ? IOMMU_DOMAIN_IDENTITY : 0;
+}
+
 static const struct iommu_ops qcom_iommu_ops = {
 	.identity_domain = &qcom_iommu_identity_domain,
 	.capable	= qcom_iommu_capable,
@@ -596,6 +613,7 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.probe_device	= qcom_iommu_probe_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
+	.def_domain_type = qcom_iommu_def_domain_type,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= qcom_iommu_attach_dev,
 		.map_pages	= qcom_iommu_map,
-- 
2.56.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77453FA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DZfhIgqMaihcSk7F0bvXWQ7mJhxuzZv9ZWKaeLwNCbY=; b=uGI2LUR7bKuVi7IYGY+XhFM9g8
	V3QDM+8YpRM/W24CB27SBsUu2Vj64rbtfv3+LfyLEsR5EJ3UWHjSR43ISSooVUAA7BwdyHTREJYU4
	tQD4ZUEFvjOI0U2D551VkkyNKhfRlf7DjDgglvi3QoQ2AUKa5Hdj67sw3QXDUJoFwJm9UaWKEldHm
	b6eDReaSA+O1AbWpL9KCpbLEtOclZ+/pTlwNY9EQo0TLQyyJjCPOAjt8Bpk5TXo6qZ9lcv9DSy3i9
	XQH05hOxsPMdv2mSUwWgZmIa6g0TTTnQYp2MEzRIrCZmLJfEOQHqw+a7p8RuzsBmq6XogmXVSu8II
	wWrTMlbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebj-00000008Euh-1NDI;
	Fri, 02 Jan 2026 12:50:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebh-00000008EtF-2xgW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Jan 2026 12:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DZfhIgqMaihcSk7F0bvXWQ7mJhxuzZv9ZWKaeLwNCbY=; b=eD368++d0mAohXI9ZqChM4T/j4
	i6xNnlqh+wYoBAzHppoR8e3Qxpvg0N75QgAo5eX5RZMYE3/+pxXCQ0QGfm//W+/deAwarul0864sM
	4JnDtgXDoR8l7KngRr+JzjCakTdSCHqkoVI60vIpRF3zmnH56KLqhEfP9E+gO0HGd4oEpnJLpARKf
	8K+wGzIpKfLKptfvfsAf+E/Izc2UqCqd6bArS1XmCyQBI58++/vpUdGQnRhIQc2mM+zfFxDfmd7n5
	BqyIk2BKWZXaeRKPcwaa5b8qhp7YVVhvc8EL/8TK8wwr6nrFHvzYnuB+8rBbLs/VLfJy3VSsB3SlY
	0SARi++Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbebe-00000005qr5-0vMM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:50:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W3sd426888
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DZfhIgqMaihcSk7F0bvXWQ7mJhxuzZv9ZWK
	aeLwNCbY=; b=G7ZPQnuicD7TCrqX+36FFvKDSA1U0y0gZh8PDVrBhL3xj/yJhyh
	zNEveQq40Q0qXl+BMsePEER2txjQXHImPe7Gm9JqZDc1Sp2LAz18LlqrwVRt9fdE
	xFAuypL4FPALAt7forQPXjeYP1gCdCS+VUTGaTZpFiOdF15WHpqYOo+h8VFTBNOk
	Ryyea6PvnsgfdhvB0dqpwVEEMsO5djqZlSNOwhMQerQ78UryonDu93xPVihufoM6
	9TaFGIDaqJL9Fl6pgjOBO10BdEFSujvd9SxWkuNRfkRMJdOk+rTnA1DEMXyYesqO
	ar1OxCtc2rCCaxHF7P2ztwHchXjIikwm3Sw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjrxrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:50:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d2aa793fso323030491cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358209; x=1767963009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZfhIgqMaihcSk7F0bvXWQ7mJhxuzZv9ZWKaeLwNCbY=;
        b=MYN/ody3i5KlFCF58+JZaIJWzDQ6qzhfXQBi+MG+n3igea5ga3uSL4AWzqykELg6Vy
         3xRWJcP1bAQEb7hFM85E0OF0CCsqMUAnZooiRSOQ0JKSeDtZR5oGGC1Xa84AQyyRWt6Y
         B5nLjj6LAwtDfNkRNlQrltFIlXCFxSaW1CwXhIu7T0arZUoz1jNuRl7v2G6/PRGFb/AX
         vV/x4D1vvX2wXuKAxnfmpt4PoadgG1eoVsuPs21/AOOIflr27IzBLXCd8VDCJci2VXqG
         9ZMu/AU1zOWhI2uVsK14kPsYFPrrVJdlCWEnWdNzvC/7YOsfaLmnuBISyjmcYQUgmnTJ
         U6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358209; x=1767963009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZfhIgqMaihcSk7F0bvXWQ7mJhxuzZv9ZWKaeLwNCbY=;
        b=rSfYMPlIVuMTBmq5yRjcsPuaK7zxGhhGBwWF59pOnOSSNiHSUhggkzU5MMW2/HBNCe
         +Z6YZ7hiIsOLfrtDBq67QNW+PdVoxaTkhZQ1J6qFaKQxTCazZjdXGKU7WvjldB6Y/+fY
         /wEzhQlxcO2Y344u+4duG1DVPV93gtU+zCc5J3ZG4yZh9ENk0sgiC1x6sjw7sJrAaAff
         idsOycGtucjPAQ7zWsYgU3YfVj/luWpMDheKYER+hkM0qlq3KJKZmFCLMc98lUNg15IG
         evfH3lHWZdkaK68zyuA4SyQjCT/dAuz0f/vDvXW825Ai820KICl81T1kDwluRLf7ztNB
         XnEg==
X-Forwarded-Encrypted: i=1; AJvYcCXhDXTldduD42H/sPFDVAeP7KJAeF0Jllh79OA/US8ePEwGShQx6s2HCCSBhZarS8aWPV8s6zdOOuX2hTMgYH/A@lists.infradead.org
X-Gm-Message-State: AOJu0YyDmpfCsvNwB+sKFwM9vQIsCQ97nrQHdGrwmNiqLNiAMPuwXkdf
	LC3SsaQ3S/i9519odhEopRFdNsHgywsruRomsP/hGyqRonbXSWud/YOHEPAGsbUXXYb9DROvQ8V
	5wF+SjcQcqEsFXqLvYQFLZ0kVN+GUfcQAUO28o09e+1T7ubDqIgD45AtODCfg67/4QGNLpE5GzJ
	cz6g==
X-Gm-Gg: AY/fxX44Afa20/zX2au+txjCZnemGFtIlMAXRPEEm2vb7fMt2UpH6m2iID0RzuIw7iB
	jTNmLqj1eIW9wJjkdGp5Eac0e5DlsbHZ9R0NG7cn3SVM0DqH1hEuIz1IgJdXG8jQUsWLOjDvxWD
	vQiGxixn9X6cdlJOVPNilqw8lOZSV6QkDi7TDwHHXj7GI4xxxWLGvqvKjxmj7qPua2RWRSZz/j+
	jYaozSRAFgH9aQvyTj22t8DQ4CQvSEVX2PHjy2vY/Ozeu0DbrXyckLcVV7l6UZwp4qsdgLjnMql
	2enfZf4+m5H7606LvNPF6FGVbX92dfJd9JNlxJLHRMhaqWOc/IQFNBrTNX+MKbSduToPVaY7kpK
	+wuuUiqFEX/fu04RNn68AO6zsoA==
X-Received: by 2002:ac8:46c8:0:b0:4f4:c7c0:bd15 with SMTP id d75a77b69052e-4f4c7c0c07bmr435981821cf.12.1767358208814;
        Fri, 02 Jan 2026 04:50:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaibJGKRcufVQsFtoFkkLusGl1EteIcRijgF1eum1S0BpyBUz176ZDnEeSiz3Y7Vi4Imr58w==
X-Received: by 2002:ac8:46c8:0:b0:4f4:c7c0:bd15 with SMTP id d75a77b69052e-4f4c7c0c07bmr435981571cf.12.1767358208430;
        Fri, 02 Jan 2026 04:50:08 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3964226sm340423585e9.0.2026.01.02.04.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] iommu: arm-smmu: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:50:04 +0100
Message-ID: <20260102125003.64962-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=f0tamSSSQFETd/BZgOeOBR45ekM+X1VWM1B3+8zR7G4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV777jI8tCOET4TbjC+HPZB2dgMi2DF44wcwnd
 7brPjPkQ0+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe++wAKCRDBN2bmhouD
 14dLD/9dX7/M267GN7byFB1WBkxv5LFfVDmSjqOu8wDOq/vbys5RDZBtmo7t46mLBieqJl4ivae
 j+2eaRVbXnSe//gLWSK12TcZ96tvCg5QVi3itFmmv7/acBweHB60ZQn2xje0chv70QcD5BbCAfJ
 zU/N9NWfFipg19oPKvJUB5jwbUDk8B5pc8rK8ay1Wv2SuoDsz8HRki+Y38RBiZjyotJ+wJRVqXZ
 n8AIApW0sJFoNNZ18SCw4LH9qZ+ZpjBBdVdrrOrKdqMDz+iZkvK2QZEQVr6q7SbL52N8Hd0Jxj4
 EPkUfezX2iSykBXPwLjA+CQZx4WmeMXZKzgTjfQj4QrD10fA189YWUriQ8D2llQFQO3Kw6RyZRc
 WaqU9VKpNglcQsSdb0NRzAhS2kPyHwnDhHQSxqHsdYuFPO/L0xhF30LV/lz1p17D71jwUWC4O5L
 lXSZDRw3YyWJc3mQ81kGEt+eTZccennc/rXx5fnoV8xqO4fbEjwXqzV0+I5OFiJjthjEGMNrUdB
 X+Om0XFx3BVsxiYBaIxkjJJ1YJDlgH94hbRz7z5x8Kxh0RiIV3isDQjU9pxsJkzpvfreP2mHeuB
 pxNuMg7fIBfqDLiY+4JEM/r8LPajA58BR27l0SpqoglqsnsnIPtQqa7JljTi2jwiZzQ7ioYFUgi sbGPVJLBsihEYiw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=6957bf01 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DNxOUMVqX5WKlv-K9SsA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: oyQZlB41fFUgsonlGqzjb8vsQHR2Q4Bv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX8YHO8XfVz1zN
 fqYahSzgEWG1x+gN+vhV5PE5o6ZpJOCWEMXabBtNy4ZDQ7IM1jmy+OjFWQWQ5QZt92jOjS5xZII
 IcY7N7SufoE0TdOr3okDgTUH6GawqWqWdqShcNDjZKABUo+qb5R8cDtU/oYj/GvMdLYbyTrr1Ce
 //hrHNND0pQ8Q+rGDES+dH2/6YDKvLz6V3k4SDJ+BgWALq2KeO3u43UsgVCBm+rOgDIQ+nUEAtI
 udhGuwxflqZ/H0qzsz3N2Qpk+xvaLZgBSnyi0IcUrDjLagzOVRWTiUhZ/cT8MmgWVWQ+SqfniLo
 aQjKDESKUHw7WgXPJiErKKQArg+DJ54MBkQuZHmAdN54wQV3yd6VqJG2DreYFTgnawwN1hSFLS+
 E2jAh/t6IXB4YZlyivzGWPZS6Ds3PhhvHun1zCNhnNbqxKtm+eTGsGK5uswx2kVkg4kLk4fAWbb
 +S9uNQ60rHbkSgZFMuw==
X-Proofpoint-GUID: oyQZlB41fFUgsonlGqzjb8vsQHR2Q4Bv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_125014_801598_050056EF 
X-CRM114-Status: GOOD (  14.89  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index f69d9276dc55..c98bed38c58a 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -761,14 +761,10 @@ static struct platform_driver qcom_iommu_ctx_driver = {
 
 static bool qcom_iommu_has_secure_context(struct qcom_iommu_dev *qcom_iommu)
 {
-	struct device_node *child;
-
-	for_each_child_of_node(qcom_iommu->dev->of_node, child) {
+	for_each_child_of_node_scoped(qcom_iommu->dev->of_node, child) {
 		if (of_device_is_compatible(child, "qcom,msm-iommu-v1-sec") ||
-		    of_device_is_compatible(child, "qcom,msm-iommu-v2-sec")) {
-			of_node_put(child);
+		    of_device_is_compatible(child, "qcom,msm-iommu-v2-sec"))
 			return true;
-		}
 	}
 
 	return false;
-- 
2.51.0



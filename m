Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A5560A2604
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ohsiuN8A;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mHk190Vv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P7s8HtWq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=; b=ohsiuN8AJrAQ6M
	aXWJx1UxYvM3H+vFJXkJVrexBLLUyLYxmV+gYQZ6rzhnlaJON0D6Y27qphfqkJxXnaf10SveOG+JY
	lUPPvJu9luxHByBdsxdCWwNCAysAlMJYucN06Op0KAhohCdxJpd6xixfkZ3CANA4PPyVBSiOuYJIt
	ehIeNyFFuEVbiV5LNsth9b4PjeWJwqjH/n7A3aOfQ6cxFNR0r3R0ZoIwlFJO8iy/DbXEvwf+7MOcC
	e9zuJgINZRdn15JKZE/O5cxC1LOFrDU/M/eE0BgpF+uQWlb7rSY6VBbAqcacmYfD+XDwPHX+oh/e+
	zC6OhOqOJWLwBw2qaU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNodp-0000000G4D4-36gL;
	Mon, 02 Nov 2026 09:47:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNodn-0000000G4Ay-1xyH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:47:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AM9K1821156
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 09:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=; b=mHk190VvNDxCyjAU
	jOxW7DpEW2RjomncdQIKanJwYxnrHQJMQY9UmATTa0BDsg3mWuIOfYG061G6MVS+
	XejDBe+qkRtwJaoNrE7wd4SAwzIbtf6XuxD48nHNNa0aS/4ckAUgNhrYWLqMdvv0
	bi7qbkUGHA46QmGRANwLgMS/VN2AXkpYoHQNVOqo25kZR+mnApoM7z2cxK0XgWx2
	7s9EAhF3BXl8jJ25WV6ppjLBA9AcShdez45U/fdIBEHFEo220B7frMKWCN7Fm6W1
	2LHEUU5+NDs+VRF7f7+951XxvHmVJl5PaxG5Vx8PA8SJc2wC2AihKqig823GhfXq
	E/ANcg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h27s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:47:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso196314a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612866; x=1794217666; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=;
        b=P7s8HtWqOudQD1gXkypapF91eePJquTwwDRTgK+CFDjqnYIUv/Fwngm4uHpiLySxc5
         /0W0a9o2PubyB6Frhui2l7vPL0wgUNu31jjoYmJ26gsBjzzpFxJuZz4TnzKhIRfCkSA1
         27kSbGDaQjpLOLzHJNqoeUXbUwkmBsKJiFM+O1oiUM+WJJXy0k7TaTFbNotRMrtCc8i4
         yEa5q7fYtlyjGLkIMZXOPwH9B177lBk3y6Da3febY6/1y7Lq3/TjtFo88H+Xa1MKI5TT
         oGogRcvTy+iZLPCygojRcSpKowRPtxq9GtY4NYUEUkUbynGRo4L8+Ns3AJYUgF/dZhmT
         BdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612866; x=1794217666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EopcEXVJlshc6fFdssRRk7Nmikd8/mCpBz6B8w6T8bU=;
        b=0y86mPIh4lt9UvqTNmRig9OSwNLZdF8te5K9X8Y+lAQqn5fuAAL69jcMA/0b/MCXEb
         GdPMtJVv//a64K+DV4ssmQnUWfgaXVksu/S4uNYQol63QDZyfZ8gTDLLzGTJAk0+Hkx5
         FjHlbKD3j0krDWWdLAQcKlh6YYkeijyB1EoPNK2J8vHwNbOjdTKvslAdMhnPtMolxTaq
         cWnUZPJiQNd7MiyMk6x1F/E3ZL0oKJC8P969RbNo/Z6HjZ9gDXnT2mQxEnDmhREQNnuw
         Uy8y0flJ9aNkjsaqeLtdVTfqNFj+/V1iDGHprBv52rPU3Qs/gJeQPw5I7Q6MSjB3K5hF
         b4Gw==
X-Forwarded-Encrypted: i=1; AKwUvBwk8JoDpKBjcwZHkCFi0Xo85i1ON4ktOg0o7AcUgHmBsfTMbmYmvKzJfeV07AmlXMmnjya7V6Xeq15fT3hfGIaZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/iCGdTBfFF1m4xMGil8S4O7BOPxV0wu4Z1MWjq0ApevmAHhX7j
	L7zz6JcCzuQjvKYOrrmAF93rxHeD2uGTakt8cW9xrcMhd+h3jKbQ/ZoP0rJ3xxnzVePhC9dfaqq
	xXMUaPwB5xFl8e8rVrhDGYsPFniyQSOY3Zdt76RrMFO2PzM/9UosRiJTUPlrvE56zbGjzX9RpFr
	EQIw==
X-Gm-Gg: AYBFou1BFxU0/SZrqW/YMfTwbIg1c5J+LrRQhYqyNCUIHyt0VGCtq0oNr83hXvYHnO6
	3ua9gBKNKJp2BrpIXY2IQL1/Y6K2gCTDpMjz9/t7d6nacmt4rQyDS8ZK13H5l189FO8KhaGXxxs
	jcfUfy7bpeNMvj7sp0poPVx6J2Zaytled8ZCN/ie626wXRp9fhU6F+C/vKcQ3ZLWJZlApVeWOJB
	zw5+i0vBhUyoO0GnIDR+j1KBj6HiUUOo7dnUVrvq9k5oQNuYdIpTbmFFbtIrolF2gW5XiAO43gA
	ZQV5OM3OwKTpiIDRjJkBqTTfyMm6GSq4D2QkXnWbDER/3HpHN/sTrHPCJuY5+tG6OLJlgByy2wt
	bEZJTtIEDdDdhB3Zkx3GaHbiO8VLajNgPh1shwxJMsMKzAwKEpM2bZHSD/x65xU8Fjkz+6MrdtI
	4Po2V+cPO+0uj9TpPzpqsrJVn6lM+cKfFOHtE=
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr5341889a91.18.1793612866202;
        Mon, 02 Nov 2026 01:47:46 -0800 (PST)
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr5341870a91.18.1793612865710;
        Mon, 02 Nov 2026 01:47:45 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:45 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:33 +0800
Subject: [PATCH v21 5/8] coresight: etr: add a new function to retrieve the
 CTCU device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-5-231e069b7853@oss.qualcomm.com>
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
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612830; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xCitoVuPyJdwSq/nLCm3rX+LYZy3JMTxp5Mg/VzmuLM=;
 b=5p2RYwhfoSCqZkty7pDs+7dTH+BH8Bgud1+7pW8gEyNinxJ/eqvEgnmt/bmLvWqgYdKb3BUd6
 JCRfQNfi86lDp2fsgLmxn7w0iJoIR3bLMMjDDYxd22InIfHVOXchugo
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: LSickPeBwZY9ptIFdjcJKOr34pkUKSZM
X-Proofpoint-GUID: LSickPeBwZY9ptIFdjcJKOr34pkUKSZM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX8QzFn0LiYw+R
 QaCyQcoQO+Y1w5s/1HJzd0/aDpFxujVX/4LAZrYF+QsBR+lkDRRuoR4eqiYzyC7srT3oIcx8OWK
 M8EJcfyC9CMkqK2u0GICvWLjA+9Yahg=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae85c42 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXzklTh6Ea8RQE
 aUnlkFoZ5XehjiOL8fU8m0wWcn3XFruFRc/gutMjiycQEOFw86xH6Q3PX2fFRuoFw8oqHvD6SIz
 Nryo9kQ8IzKcVC2hyUloOdjr1A9AXvin5xYyatb5ATm1+v7FusGlzd3kWT6bdDXwX5iysooJ2hF
 fbF1gNY6LXr8fvDJykg3GfSNspBFXwPQJxsWjoSUxKQQcRLPtVGh8JhKJC5rGmltKUriYPo1Qn8
 kvkL0JOoZTAwXTBW0sm9mfAYZuUNXFV81VgDmtdz6I9DSxvEwSjCamAOH8pBnGDm26mIh7g4Ih8
 rT84z4/EkWqu747jyf7iVvhC5pAhha8iA39ybarIxF9AEtPY1cCnf+x1CjGTJ/1+Sme7Fguy8Pp
 flePHvbCvEiZZecEQrCm9dJThsWjNGR0aVDWGylImTP0cTAOxVWyJ98oW2JQzmJuHT32lcuTLmY
 Mmvi4OQ/jfSB33mA+ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014747_532337_4E9DCAD7 
X-CRM114-Status: GOOD (  17.73  )
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

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 2de31d73a4b4..bf4c1d8f7b2e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 36c80918958f..2345bdbb0b9d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -474,6 +474,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1



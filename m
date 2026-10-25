Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7303606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 06:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FoBk+MKU;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=hf5M66vb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V+HvE9QnqA10mngcxh5K4uhaL32+pv8FcAiS3KEQuaU=; b=FoBk+MKUMiik7hShIHKtLlQv3n
	42pdXFpHFqaITCPwg0F3o/8gDU335oV8WH4ROZryQlt2tIhGcCdOx/8jgii63s4AJmPAl7aAQ7CwO
	11/PXHZsTbI5+RGxZbvM9cMPfVFvYPavINB4X3L5NBTDCSsr7XFpQw0Q/YidQfFW+m27iVmMpD0cl
	FjUqg0bz/JLuu3DMHkVghRi9dmxW23tFRHy+oucfv3Ia69aDQSPaYsefjhCVEeTGvQuGJdhmB06iW
	Lis6z4g9X/mHRUFA6Lt7lFBg1WborhikDWTj+OIIMKFvXt+YYPW6aD9llsawERfSG5fVNEGRURD+d
	0dPOHFHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrte-00000000nt3-0oyW;
	Sun, 25 Oct 2026 06:39:58 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrtE-00000000njG-1e7O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 06:39:33 +0000
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4tB1r462968;
	Sat, 24 Oct 2026 23:39:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=V+HvE9QnqA10mngcxh5K4uhaL32+pv8FcAiS3
	KEQuaU=; b=hf5M66vb9U4zAtd+iHbYZxasfFLJNZNg0antvPNV36/bDS4EukSse
	AFckWI3Eh0RrE/PadaXPxmHSIoxmp70SXSb/EgdkhQbve0KdH0Nes0hP3sYI61v6
	qXXZM2wmDg7+mTTol6IIwlNxiE2jIpJkgu4VhYP+DMDAMWtwENf24g0VQI0Q1zLy
	hpaEqfFAVDOdZsct9Zu0XyihGraYvrBeN0MwZ0xwRI9rRQAgt4UTgMIrjavXzwY3
	yGpDhWYPTB4UDWAxqyNZRgy0CCaUw69bRsybWCwzx5IIV93EkicAbtnCOnamOTtt
	u+dK/HjYGcNxdjcHvZ8hOa1GYEOWbdcCQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hh8a48qt9-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Oct 2026 23:39:16 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::150d) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Sun, 25 Oct
 2026 06:39:16 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel
 Pereira <danielmaraboo@gmail.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/7] coresight: syscfg: Match feature capabilities separately from device class
Date: Sat, 24 Oct 2026 23:39:03 -0700
Message-ID: <6fd94860b3c13c0ddc1a5184d5d9331edc27d9f0.1792907333.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1792907332.git.aaupov@fb.com>
References: <20261012230527.750567-1-aaupov@fb.com> <cover.1792907332.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=J9A/fwnS c=1 sm=1 tr=0 ts=6adda415 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=U_y8lYiYyhHBU5rMqhb2:22 a=FOH2dFAWAAAA:8 a=mif2P4nyd6mfzKxTjdEA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX5D3F9lxodm6n
 DoXD/f8UMtPpeF0RdIxpcXJ0K9q5h4VxTBTsVaIySJXcKmqkMKJVTJZP3N9674bKE6gaVo21Q5y
 CMYzoBXdnVpl2ZMvWmGGBE/yygYIiu9w0YvsWbDDkWOp5pkUwFmsjSHMs709ZgY7D1H+p5YALNx
 /Q/0oZksNLupD/Yws4jl6j0R9LXL4XIUGGwZ53UTTpfH1VfokLLJhxQ52kUz2j/SgA76wO0xsQT
 nuNULELIgdrAdsrJ2aYTZMBhngAPSygerM1omeErivNrPLfjfYxn4V1j8Xn8DOWEQZqVwZaxSXX
 3mKFpKS15dElsolXAkaRh6UvFQPEnVV7VdXiSEIjTVuh5p1JqUF1Zk3lWHCIrStYhOcvPATyVAl
 vPm7UDK/TN1rFD+x9hnvWt2884RQlSwNmUpWgpGwXU5TytLIjQyRQ2J1a0hVTBcoG7HcoxEUw7e
 9016gNDxj6Ucl36bYgw==
X-Proofpoint-ORIG-GUID: TK5f8ywl0i7V9ZmuzhjJzrT2OcVLtrgZ
X-Proofpoint-GUID: TK5f8ywl0i7V9ZmuzhjJzrT2OcVLtrgZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX+rSMbB/DPWbR
 PCdlrBiwSHwl2XgPTiJ6OpXCDJHE4MJweubAuA4jR/B0uwtwdVmDuXWEEzvOKTaL7YE5eBedfLa
 JhCpXYP+FR6QC533yoGkbGq1PXw7fDI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_233932_453150_9D3B745C 
X-CRM114-Status: GOOD (  19.01  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A feature loads on a device when the two share any match flag. That works
for device classes, where a feature wants any one of them, but not for
capabilities a device may or may not have: a feature that sets a class
and a capability would still load on a device of that class without the
capability.

Split the match flags into CS_CFG_MATCH_CLASS_MASK for device classes and
CS_CFG_MATCH_CAP_MASK for capabilities. A feature now loads on a device
that shares one of its classes and has all of its capabilities. Check
this once in cscfg_load_feat_csdev(), which both the feature and the
device registration paths call. No capability flags are defined yet, so
matching is unchanged.

Assisted-by: Devmate:Opus-5.5
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../hwtracing/coresight/coresight-config.h    |  8 ++++
 .../hwtracing/coresight/coresight-syscfg.c    | 37 +++++++++++++------
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
index ae6295e308131..f04e73b91d9a6 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -7,6 +7,7 @@
 #ifndef _CORESIGHT_CORESIGHT_CONFIG_H
 #define _CORESIGHT_CORESIGHT_CONFIG_H
 
+#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/coresight.h>
 #include <linux/types.h>
@@ -30,6 +31,13 @@
  */
 #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
 #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
+#define CS_CFG_MATCH_CLASS_MASK		GENMASK_U32(7, 0)
+
+/*
+ * flags defining device capabilities a feature can require. A feature loads on
+ * a device that matches one of its classes and has all of its capabilities.
+ */
+#define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
 
 /* flags defining device instance matching - used in config match desc data. */
 #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index a816c22c87bc8..3ee104e94a4cd 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -171,8 +171,22 @@ cscfg_alloc_csdev_feat(struct coresight_device *csdev, struct cscfg_feature_desc
 	return feat_csdev;
 }
 
-/* load one feature into one coresight device */
+static bool cscfg_match_feat_csdev(u32 feat_flags, u32 csdev_flags)
+{
+	/* The device must be in one of the feature's classes */
+	if (!(feat_flags & csdev_flags & CS_CFG_MATCH_CLASS_MASK))
+		return false;
+
+	/* The device must have every capability the feature requires */
+	if (feat_flags & ~csdev_flags & CS_CFG_MATCH_CAP_MASK)
+		return false;
+
+	return true;
+}
+
+/* Load the feature into the device if it matches, otherwise skip it. */
 static int cscfg_load_feat_csdev(struct coresight_device *csdev,
+				 u32 match_flags,
 				 struct cscfg_feature_desc *feat_desc,
 				 struct cscfg_csdev_feat_ops *ops)
 {
@@ -183,6 +197,9 @@ static int cscfg_load_feat_csdev(struct coresight_device *csdev,
 	if (!ops->load_feat)
 		return -EINVAL;
 
+	if (!cscfg_match_feat_csdev(feat_desc->match_flags, match_flags))
+		return 0;
+
 	feat_csdev = cscfg_alloc_csdev_feat(csdev, feat_desc);
 	if (!feat_csdev)
 		return -ENOMEM;
@@ -212,11 +229,11 @@ static int cscfg_add_feat_to_csdevs(struct cscfg_feature_desc *feat_desc)
 	int err;
 
 	list_for_each_entry(csdev_item, &cscfg_mgr->csdev_desc_list, item) {
-		if (csdev_item->match_flags & feat_desc->match_flags) {
-			err = cscfg_load_feat_csdev(csdev_item->csdev, feat_desc, &csdev_item->ops);
-			if (err)
-				return err;
-		}
+		err = cscfg_load_feat_csdev(csdev_item->csdev,
+					    csdev_item->match_flags, feat_desc,
+					    &csdev_item->ops);
+		if (err)
+			return err;
 	}
 	return 0;
 }
@@ -739,11 +756,9 @@ static int cscfg_add_feats_csdev(struct coresight_device *csdev,
 		return -EINVAL;
 
 	list_for_each_entry(feat_desc, &cscfg_mgr->feat_desc_list, item) {
-		if (feat_desc->match_flags & match_flags) {
-			err = cscfg_load_feat_csdev(csdev, feat_desc, ops);
-			if (err)
-				break;
-		}
+		err = cscfg_load_feat_csdev(csdev, match_flags, feat_desc, ops);
+		if (err)
+			break;
 	}
 	return err;
 }
-- 
2.52.0



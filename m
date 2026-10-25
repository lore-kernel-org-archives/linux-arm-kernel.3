Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C574606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 06:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wZdNfntZ;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=jBxiR8xc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h5CPtsW845wIg8XT+7IjY3h0UyBjrJLt9Tps+aPI7oM=; b=wZdNfntZdCTRQmRzepm8iCZrG0
	tJBk/IFmrdBNF4omspQiwpPY8B77sVrFy15BdHffnSvBdb6owb7cJFghIZuc7NOTdZ31YblRfPj5Y
	hKMGDqle48yC4F95UTumsNjSIKnsu52JjRslapIZxqU+l7QF7N9bLZ2XTp3vUI0bimDB0aK2bsq9+
	xepStEHZ7wRPxJr3xT5yxTR/NJG4s07d9y366HYs0jV0zhepJYZUnzh42kUpKJYOTP1dy5IkZN+4+
	umL3pow+mqQlgJvb67x7hhplJWAVuaNstffhG8w1kOxPfDEOFNj+CoXxaRjcDogEsxgI027rQY7Oc
	ALmBKViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrtD-00000000niQ-3DUT;
	Sun, 25 Oct 2026 06:39:31 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrtB-00000000ngj-2jLm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 06:39:30 +0000
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4sXJ23859554;
	Sat, 24 Oct 2026 23:39:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=h5CPtsW845wIg8XT+7IjY3h0UyBjrJLt9Tps+
	aPI7oM=; b=jBxiR8xcyDCJVIts4SXq8y7jVC444UPckSmMbsu9J9+ULY7p6lHEV
	qSs5HfzzDJuwmDCrqIlPpnwcmv67lsExpUjnt/d988pBLsCIzzdW98ew/Xz+19Vn
	oiOUw5Y6qsuavRPMw1EUyo8/G8shdW9gdU48VQd3ohv3AvfiwPOrNL3QKUl90W8i
	mXoRMchheYVc2Ly50Y7/y3kdjGfMkVCqpgeitAgVb8wqL+XcNjKEwwAMtGFMj8lp
	8huQ3nHFtMyIvKmmtAy3aLIAxRtBbPbGJlOH3gSjCLFs5njMEbcHaiMSPzKluZ4m
	ktgRTZBnbF+dpaeOH3q3MTwU/al1z8tDA==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hh7ucrreq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Oct 2026 23:39:17 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Sun, 25 Oct
 2026 06:39:15 +0000
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
Subject: [PATCH v3 2/7] coresight: syscfg: Fail to enable a configuration not loaded on the device
Date: Sat, 24 Oct 2026 23:39:02 -0700
Message-ID: <cc6b083f1ece4625e5bed0aa13b1eac7e4d1e274.1792907332.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1792907332.git.aaupov@fb.com>
References: <20261012230527.750567-1-aaupov@fb.com> <cover.1792907332.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: eU3vB3WLfXZqCIKVkUQDQPn0d30lVQ9l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX6E0cdc/hTyyY
 a6RB6yuOtrV4gpgWYL7g8FqqNarxMbOGZp9EWGtt281lA4noF6kGp5N3rjEf2UvvBiyJ3D4irOp
 IadlJ6viM1c9LeTQwqFNayMJowtRp819AhqB89QRk0XfBBaGfZ5CKT9vCA8aBJVVtFYQgFz9zF6
 RkxoqpRCILg19M1YWi1ktUYv8FJib41n8ypiaLl6v1Wedy8vkFFJwSA7KSNolEGPSbOsbeYAn18
 /5pKjzio0Ll7awEoR5sl9L3YUsOW/rtuJ2NR4Pk8cKiBmwJ57qWb1b/fsk83lmFKzOA9fN0T3/A
 QOlPW2geLPkOqUHALjVJNvonCWN9k9rjj5qJ1bumd9a4eYwsDg8NRjnr+fb6cUWyQCv4egc02GP
 7pGPSDBmQQ0b7fjwHRe74Puiboe+Y9c+FF1PPS7HypA5SM7L/deiT/t0uZwJi2XljHME2jcCv6c
 3ZBmgL46Bv2uM4svTWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX7SdXJPkxnHWa
 w3zVd85r3DuAz0AOHv9wj6pbDDGrmdQZDH3CNBEHzh/GmNGbr1vJDKNS7jiHUKDJ5kagjYO2aDj
 HqbPU2nZWFkqFTBmfRxw9F/kYy3Kbg4=
X-Proofpoint-ORIG-GUID: eU3vB3WLfXZqCIKVkUQDQPn0d30lVQ9l
X-Authority-Analysis: v=2.4 cv=SN3Xx+vH c=1 sm=1 tr=0 ts=6adda415 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=jCddH8ec0KUNCymVuxII:22 a=FOH2dFAWAAAA:8 a=7CQSdrXTAAAA:8
 a=HF-2DHWplcuDzBJEMXoA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_233929_806048_6DE813DD 
X-CRM114-Status: GOOD (  19.60  )
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

cscfg_csdev_enable_active_config() looks up the selected configuration in
the device's loaded configurations, and returns success when it is not
there. A configuration is only loaded on devices that match at least one
of its features, so a perf session or sysfs enable that selects it on any
other device runs without the configuration, with no error.

Return -EINVAL instead, so enabling the source fails on that device. The
function is only called with a non-zero configuration hash, so sources
enabled without a configuration are unaffected.

Fixes: f8cce2ff3c04 ("coresight: syscfg: Add API to activate and enable configurations")
Assisted-by: Devmate:Opus-5.5
Signed-off-by: Amir Ayupov <aaupov@fb.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
 .../hwtracing/coresight/coresight-syscfg.c    | 53 ++++++++++---------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49c..a816c22c87bc8 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1088,36 +1088,39 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 
 	/*
-	 * If found, attempt to enable
+	 * The configuration is active but not loaded on this device, because
+	 * none of its features match the device. Fail rather than trace
+	 * without it.
 	 */
-	if (config_csdev_active) {
+	if (!config_csdev_active)
+		return -EINVAL;
+
+	/*
+	 * Call the generic routine that will program up the internal
+	 * driver structures prior to programming up the hardware.
+	 * This routine takes the driver spinlock saved in the configs.
+	 */
+	err = cscfg_csdev_enable_config(config_csdev_active, preset);
+	if (!err) {
 		/*
-		 * Call the generic routine that will program up the internal
-		 * driver structures prior to programming up the hardware.
-		 * This routine takes the driver spinlock saved in the configs.
+		 * Successful programming. Check the active_cscfg_ctxt
+		 * pointer to ensure no pre-emption disabled it via
+		 * cscfg_csdev_disable_active_config() before
+		 * we could start.
+		 *
+		 * Set enabled if OK, err if not.
 		 */
-		err = cscfg_csdev_enable_config(config_csdev_active, preset);
-		if (!err) {
-			/*
-			 * Successful programming. Check the active_cscfg_ctxt
-			 * pointer to ensure no pre-emption disabled it via
-			 * cscfg_csdev_disable_active_config() before
-			 * we could start.
-			 *
-			 * Set enabled if OK, err if not.
-			 */
-			raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
-			if (csdev->active_cscfg_ctxt)
-				config_csdev_active->enabled = true;
-			else
-				err = -EBUSY;
-			raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
-		}
-
-		if (err)
-			cscfg_config_desc_put(config_desc);
+		raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
+		if (csdev->active_cscfg_ctxt)
+			config_csdev_active->enabled = true;
+		else
+			err = -EBUSY;
+		raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 	}
 
+	if (err)
+		cscfg_config_desc_put(config_desc);
+
 	return err;
 }
 EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
-- 
2.52.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CF6606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 05:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OKn8A0q8;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=sPklDkqo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i2QrinkU+yR8MbSvKb5Nl4SmWTgXlkF2S8BMMSrGkmE=; b=OKn8A0q87udPC2kK3bF6XUi4Ck
	2vHi8dPsKKk3z1fuS47I2ygT/b09SRFabp1J16zqn9cKbBz1bsb/2zS3mi2IjVGm7gBoTMk9uo2tx
	PujxQuPOeJEDyhv5nF/8qXreBBKr8AkUpw9jf8UAR6sHh9fAB9HPg+pNyeUL1nr69DVS5WVqPnPGU
	bjLbvlZv+UTVoIRLsovdxfsNHwre+n3a10sPejnMKzIi2Ph9afs1N28UjWAXv3sqAdx2+Vylt+aLr
	jhvN86vFGCoiN3KwWqteDKHmvLDSkQGtBKbJVLK6CPsYLKq85Wguv5qZKwr6ZD8TrHnne6Bkboi/j
	NUB4Qb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDa5-00000001kz7-1vFg;
	Mon, 26 Oct 2026 05:49:13 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDZg-00000001kqo-1pq2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 05:48:50 +0000
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q38eQK2161310;
	Sun, 25 Oct 2026 22:48:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=i2QrinkU+yR8MbSvKb5Nl4SmWTgXlkF2S8BMM
	SrGkmE=; b=sPklDkqoimkWAy3v6AzfX2hmpJbyEvx4x2rd0Vr6rhzVPj30l6uwQ
	9Oiw+OEnKTJ0iwkfz1jdUFqYBuOkLWKaSnwxdxCxSq/W06tCjyY5TOu/HXeL8+OS
	3tJwSFWqEKKrxQ8Pjm5j3ZiXN1FsVFKJSXocYAidt4jz8pVTUSkO3RMQytRMPSSe
	3jpRXpNspcUMqI0UZZEkq8BoxiNd4c8MxovZ6TnrPPmGIAat7uL8jCEeBdlS1M7v
	X4i8RCk91mE2BLAQikR/gbTfj8vv34VdeFf0Blor18g7PfHVvVxC2cGOZryO1DrK
	clxq68yJx6umx/9+Gej3CgkuAwquWPrOg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hhe8h3bgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 25 Oct 2026 22:48:31 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::8e35) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 26 Oct
 2026 05:48:31 +0000
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
Subject: [PATCH v4 1/7] coresight: etm4x: Fix event count decoding
Date: Sun, 25 Oct 2026 22:48:21 -0700
Message-ID: <4d45171946cf41751215e8c1cd9a8b14d38d3159.1792989860.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1792989860.git.aaupov@fb.com>
References: <cover.1792907332.git.aaupov@fb.com> <cover.1792989860.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IAQOOmHtbXtxyY9YiqNhswxvkqJr6OAG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfX5j7tw+MaSaqH
 iB+aoKS4JMhLl9bCyOHG/e3gt3TBnembiV+MzEoCVDlFEmYKMqbm5YOfEA20s7ySyNFqFyti/ZP
 FBpbvVYocLkN8ePUrlaxlIBcplH+bm8=
X-Authority-Analysis: v=2.4 cv=MbD5KJ/f c=1 sm=1 tr=0 ts=6adee9af cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=jCddH8ec0KUNCymVuxII:22 a=7CQSdrXTAAAA:8 a=nO7UQp2L8s1CClaFxKwA:9
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfX9sZmDLLfWYzk
 2Z1FAJYhS3RWQR1ushzKoVfhsvJEUxUHvZ+AdLdmrbXzDElyptYfxyafwiNbUF/pfUsD5345Qpi
 3c0NcpIdQbpfM9qkXlY7bOZfZl/Bzd0N0Vj81QynpfnjyvJF4podoSt8I0koN50mb1PBqZ+B5Eo
 nl555h8D9G31oZ7zMJfKugYWlOMn6V0thypJhalFX1V3NiUw5rqk88ahMDeL5b/S+Eo7Rf3ojTK
 xkkR0gWFUk6/qANwSFJW647IkgY0ODbCmilBI+MpbYQvESot1bvo+iz+FXtow842qpXNqG3k/ys
 ICuxrUKmrfYxFCnhWB7WqOLO3hVk9EgG+asSH0q7LNzP46pJCmuvKupMubNWIaHIm3dfT4gDWn6
 CvMhDElk2E96dNSkSQwoVZYAY0WV68OVKAKWlx/Eb+LigjmHM5pJ4KHoSjsdBBHoJB8WyOIpVkB
 vUYLR4cQc2J+dWjyu8g==
X-Proofpoint-ORIG-GUID: IAQOOmHtbXtxyY9YiqNhswxvkqJr6OAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_224848_593038_07C81B57 
X-CRM114-Status: GOOD (  19.02  )
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

From: Leo Yan <leo.yan@arm.com>

TRCIDR0.NUMEVENT normally encodes the number of events minus one.
From ETMv4.3 onwards, including ETE, a zero TRCIDR4.NUMRSPAIR instead
means that no events are implemented and NUMEVENT is zero. The sysfs
event controls currently interpret this combination as one event and
allow writes to unsupported event fields.

Decode NUMEVENT after NUMRSPAIR and store the actual number of events
in nr_event. Use the decoded resource count so that older ETM versions,
where a zero NUMRSPAIR represents one resource pair, still report at
least one event. Update both sysfs event controls to use the actual
count and clear their event fields when no events are implemented.

Also correct the instruction event enable mask for the single-event
case to use INSTEN[0]. The existing mask uses INSTEN[1], preventing
event 0 from being enabled.

This change depends on the recent driver refactoring. With no reported
failures, it is not intended for stable backporting.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../coresight/coresight-etm4x-core.c          | 13 +++++++--
 .../coresight/coresight-etm4x-sysfs.c         | 29 ++++++++++---------
 2 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index e21be6468e954..af017bd8a5477 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1451,8 +1451,6 @@ static void etm4_init_arch_data(void *info)
 	caps->trccci = !!(etmidr0 & TRCIDR0_TRCCCI);
 	/* RETSTACK, bit[9] Return stack bit */
 	caps->retstack = !!(etmidr0 & TRCIDR0_RETSTACK);
-	/* NUMEVENT, bits[11:10] Number of events field */
-	caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0);
 	/* QSUPP, bits[16:15] Q element support field */
 	caps->q_support = FIELD_GET(TRCIDR0_QSUPP_MASK, etmidr0);
 	if (caps->q_support)
@@ -1519,6 +1517,17 @@ static void etm4_init_arch_data(void *info)
 	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
 	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
 		caps->nr_resource += 1;
+
+	/*
+	 * NUMEVENT encodes the number of events minus one. From ETMv4.3,
+	 * including ETE, NUMRSPAIR == 0 means no events are implemented.
+	 * nr_resource already accounts for the pre-ETMv4.3 encoding.
+	 */
+	if (caps->nr_resource)
+		caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0) + 1;
+	else
+		caps->nr_event = 0;
+
 	/*
 	 * NUMSSCC, bits[23:20] the number of single-shot
 	 * comparator control for tracing. Read any status regs as these
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index db9e603f97ba8..fb38f0102290a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -513,19 +513,22 @@ static ssize_t event_store(struct device *dev,
 
 	raw_spin_lock(&drvdata->spinlock);
 	switch (caps->nr_event) {
-	case 0x0:
+	case 0:
+		sysfs_config->eventctrl0 = 0;
+		break;
+	case 1:
 		/* EVENT0, bits[7:0] */
 		sysfs_config->eventctrl0 = val & 0xFF;
 		break;
-	case 0x1:
-		 /* EVENT1, bits[15:8] */
+	case 2:
+		/* EVENT1, bits[15:8] */
 		sysfs_config->eventctrl0 = val & 0xFFFF;
 		break;
-	case 0x2:
+	case 3:
 		/* EVENT2, bits[23:16] */
 		sysfs_config->eventctrl0 = val & 0xFFFFFF;
 		break;
-	case 0x3:
+	case 4:
 		/* EVENT3, bits[31:24] */
 		sysfs_config->eventctrl0 = val;
 		break;
@@ -565,22 +568,22 @@ static ssize_t event_instren_store(struct device *dev,
 	/* start by clearing all instruction event enable bits */
 	sysfs_config->eventctrl1 &= ~TRCEVENTCTL1R_INSTEN_MASK;
 	switch (caps->nr_event) {
-	case 0x0:
-		/* generate Event element for event 1 */
-		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_1;
+	case 1:
+		/* generate Event element for event 0 */
+		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_0;
 		break;
-	case 0x1:
-		/* generate Event element for event 1 and 2 */
+	case 2:
+		/* generate Event element for events 0 and 1 */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 						   TRCEVENTCTL1R_INSTEN_1);
 		break;
-	case 0x2:
-		/* generate Event element for event 1, 2 and 3 */
+	case 3:
+		/* generate Event element for events 0, 1 and 2 */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 					     TRCEVENTCTL1R_INSTEN_1 |
 					     TRCEVENTCTL1R_INSTEN_2);
 		break;
-	case 0x3:
+	case 4:
 		/* generate Event element for all 4 events */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 					     TRCEVENTCTL1R_INSTEN_1 |
-- 
2.52.0



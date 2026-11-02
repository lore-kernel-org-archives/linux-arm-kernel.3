Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06260A2603
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VxGSFycq;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNJUqfs1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZSokb0qE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=VxGSFycqe8w+77
	M5V+rXdmUHb+7dR0xmT80ohZMaS+kKoAVcI6XsRVFb3+V1BiT+MUeEjWgdFeCkpzGU0jly3hAk8Q6
	7xGlUjCkmi+djNFvLdpR1NhpMU2QrOn0qdgOd5QRMmW/elRMA3soY2SHnemn+xwH+qaWgIpOlAYRL
	3mHpAlJKhmuPPOrvRArayaa277o7GhZH6r0pHWWNqwPF0d4ipkcmRbdSf5X9xjYsmKryL4SFMg50k
	dMkAIzTOiOPwX9qy8j4oXE5W/eAMXX/GUeyPgCqErJMIjH/aiGGUA8fOoPMLaa04lC+bDYp0fIDZm
	AT6G2WTNs2kQQpSceAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNodl-0000000G48u-1agd;
	Mon, 02 Nov 2026 09:47:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNodi-0000000G45t-3HlR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:47:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B1BA4015085
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 09:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=RNJUqfs19Sr+WHph
	sG8GJEuoIorB6oTdHRYnBL3CjwaUyMsTwJHoCk1DHgyOqlP3ep0vCNun1HXt/lww
	jd5BNpC4MWd68Qypmu+xgNPMzNGKQS+Wgu0I3O/XPf5r87btGZAcgvVeJaP4IKac
	VevRDpWMi4p3HI6prsN0ddgVJ27OMzjD1gpfkrGf3N7d6DcCHjF2Ee5j7Deu7R+Q
	m2SrraJCCpZFl2NB9L/XBTzM9jCRMMchfUL/WCX5ld6qmtgmN/6/u4geiIM91K33
	V/hAcQ8hPAATebK/O1mhDj6g0XBD1lTQvKYlQ2YxcUqh95l0BstczvPCv67e2Kmj
	CQyQgw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pddq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:47:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso3496138a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612861; x=1794217661; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=ZSokb0qEhpnHZcMNNXcGuy8opfIPaiiAVbKPl7187vIuWS/O+W4RoR8dOU2NumM/+5
         NbntYoNo2Gcyp7am/kxUEFWMWsU8JQQiqeS5Bx5+MI/O4dBBv7I05L6N3HIUkMFemMkj
         0Izw5Q/PTBNh5I0v9CsIE61gu9dtZuOzjaSnQEERdEvToVFgKOu18CjOLhQ5izmOMjgQ
         iZa9bTfJnKlrfTIcS1rQPcb2IUgG7c3MP0hJeUZE68fT8prpE9JwI3JIId7IZ0LrCvOp
         5/nkNf3uB4VwhdIVx0S5zxrUmZvw3gFOQN7o7/OEn10P12BfF8nzlZCth77dXSRVyI7f
         2QWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612861; x=1794217661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=YrUB9Z005mQshvdTJD4OJ2dHEn/zA4Fkm8Gw6Hs+D9FvdPEGn4mxodqjebVZD65iyw
         qie6b6IHT1fMFw3r32GFHs++kSAcmnffyDkoW+LmwugWNIXxL/3Km6l+8RIcoyIulcb/
         tej/sq0WRfQy4inziN/kcjgel6rP2paHFEZ45edjDwj8z6n6TPHjnpGYWNY7z8VGwOAN
         2K+P30yasoFCAghHhX/PASU2ODS19O6NZWCsGpMKEmwfZx7agTanTwjEOTTaJvqsfwSD
         PUwKWM5MtrPcKBOa8IDw1UjPERkCOoIFmn3YruuMo2x95M0c43K2wYq0YL0edeqTqxPy
         4WpA==
X-Forwarded-Encrypted: i=1; AKwUvByahwfBvNqpn2i7qPeHEs7JMIpr+WPkF3dWE3Gbh9qsbvRTY7xaIjkNetTX6jFhoLHHfYt7pfmROO6MdnwXi4nS@lists.infradead.org
X-Gm-Message-State: APuU4Z9aw974JwEJ6R8dJTeKT2AVmm/BXfGa3ytZUkWQtxR3qZQ7ZWZe
	h2GwIH7rK7eBKjXoEq7A45ObBLgAEwpGy8N9N4/eNAE60Y793wgYWBogaSfFDtfRw+S2OF0qE63
	8fufTlcpSKrSUacOAcd5JiR9CEF90iLYwVlC6+Jk+D4Rnn7sAqje6oNEoIhkLiW/gplONEVsjXx
	4IoA==
X-Gm-Gg: AYBFou210FCKaRx32k9EZxjYgjYHcWa4KL3gj/V+eG/18eefwuYCs/X7suKwnF1NT7k
	l6H9LA+/BFlhmBHXQqlwIQrei4mUdCY9S/KOQXFcL94KR9q0zE7fAtUbM6bcTcjUfp/vFWGaYOC
	dfiHu0HFEjUgb7l03D0D5WUyanKbvZwRLilTqxVQdTkN09xAFkjDRkk1r9EDtwMEQXWI96bKyNr
	k2ikYUYZX1gxJ4QJlbqP70bhQZDLYL27xXN9et0h8Q2O9xFQ1qoqSnl8NSFvq/C5PnkuMoDeQdm
	NUVodOHMqbkqIAW516apYKdeTjrZp3pL8o6DXZtpg07lyeRzhx+K5PxL+h5Q3lukyIh+dtmB0CV
	4vouPx8y/XYFcPRr6CBkPrZlvEQ++CS0cWdBLUp1TmMPCEV3aNlPXVnx0L33nMF0zCjpSS6wnRP
	ZJQ9qmL3RJXEfP3C2GhABuaqBDKNIyqqwNEMk=
X-Received: by 2002:a17:90b:1cc5:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ae89879e16mr8145680a91.62.1793612860644;
        Mon, 02 Nov 2026 01:47:40 -0800 (PST)
X-Received: by 2002:a17:90b:1cc5:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3ae89879e16mr8145657a91.62.1793612860131;
        Mon, 02 Nov 2026 01:47:40 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:32 +0800
Subject: [PATCH v21 4/8] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-4-231e069b7853@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612830; l=5197;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Zyx/d9oIgPkQ60/304aFUQUx4sMlZWIw6sxJoMobPBo=;
 b=XOtbNXnqwviiXVD8GZTLVAet/X/Y4w+n5WKiPSE7hWjDS/8H+PbLlGjs1lIIlzUiBsF3QkomK
 sZNwCEDZXiZCRBkij9CKD0mQfXzZzsdGowRUGPYmnHp/M6nIMEmQ+/Z
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: ereCQSRwzomf4hLbmW-sLHGWMbo8ADNE
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae85c3d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: ereCQSRwzomf4hLbmW-sLHGWMbo8ADNE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX4ILDyErbjDxS
 Z5sYEUI/omTk53r8XZCc50ffoMVI4JA0m7AAeT1f4wBZc7aXiPWWPEow5LSabbckO1F5ucD9vcj
 /mB0WZdSAd11Jkb32qWoAbTcpZG4nzI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXw+3CuXPnSiAI
 Zm7XgNuVcQmAQMTEUTHRzZwkRRpNgqrv+7ZbDMxcIhKV+gRLFUCuq2JsKSl4LC7TkxdOTChGUlq
 PfgESJlmnc/nYRG8s3VQUaoS7OwqbaRAsxhud0d43KkUFQjs9KXzaHQW/Uh1XpSsFZJmBFC3B08
 qEkH2OmpJcqyOorYvKkyILiC3Xyqi0PpJMHA8ttsMBuydGeqQ5ApTJo/lLg8T9sLsCGSjswZ4Vz
 i7pwY1y/BGeUOcTbDkGtyrzOYBTqt6DuauLJbV4vxjyYmiNJpBsIgPu1ZTD/pkjsOxpYdbPtenF
 vlSV8/QfrPFVkXkIIimrvfV/m8oZtAER1sXP5dgelUR4542UgvaBqs36XCl18Id6adZ3Ujzrha1
 4d1uqsbNyu9V9IdkCMkOcFz0I4qlGsXIyKJFFa9o7APSsN1mAjnJoxKdLBUefQWgs1WWXdRJoZs
 TaeWPRSbNsPMwYHIoUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014742_950192_B0E74D51 
X-CRM114-Status: GOOD (  18.30  )
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

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc7dd676da47..4b40b692be4d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 30b15c38b080..36c80918958f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -263,6 +263,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -294,6 +295,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CB9606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4lGbeqUs;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AO31bISq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0ZcmFBd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kVbZfBH2UwULzm0do1pgyVFKiUnR86x3CT+qhi2HHvY=; b=4lGbeqUsP3ewF/
	qcKksm0xrcoUH/fXvoIelg3ZYSHEq8UMD7zeKj6Ch2J5z+Ivm7ZruPzCEPhzj1JZubCjd7kQy66um
	7lyEEShDxGjg2+3reAUEUVp3H9B0O2JQTeNtW8MTN3sDEhvfzrfYNjki8E6MqSqCpMtPuWWwUUfX+
	+qIWpI4AMtWnFvNUSx6q0P+PUeM8XtSnptBBeUeeeItBeqhHfM4C0KNcqzE4sz1d5iyWslAX5cTEy
	csH9gMKLuBSRrcuXU2BXq8pSQrYhMPYG0Ag2Jn2RQzvjjUeUSMMokCGceGlO15qFq2j6j0q8krNI7
	gUQS4IIxWErpUDGdRYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfgK-0000000As9Y-1KC3;
	Fri, 30 Oct 2026 06:01:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfgC-0000000As7f-3UGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 06:01:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FCXM2337142
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVbZfBH2UwULzm0do1pgyVFKiUnR86x3CT+qhi2HHvY=; b=AO31bISqWDTdEryq
	zN8b8GyaY/3STo7U1oIXf12PruIHkJakOnW/dA2KST1L+1oK4qADOFInp/dic4vd
	RF/RdJm8dyB3APWjcffZvoxf5DqZkAi3/CjZYK0xB5tokomGRN//wGgaRgI8IzRk
	afNabYgOqAKzfWraEtlYkDxUgEnmC4kZtYV2PKvqSMkIezQI2ev1cutI3vKoeAGu
	VN4L5HuXth8ISEBXYi7PRngcq/dy9R3WwqYyjJ3Tm8cCv6NWQPzOUwYNHhpMbXel
	lYuIgnKkG5fGe2/IotSDA0vIki5bxfUPwIV5OfRC8cbGO3f7ekRfEVO8TMDmOrlW
	fePkWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhetm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:01:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso336372a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 23:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340091; x=1793944891; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVbZfBH2UwULzm0do1pgyVFKiUnR86x3CT+qhi2HHvY=;
        b=a0ZcmFBdoBpXwE6UHWsASyagJYa6TT472u01xRl1F3K1Wy/BcfiKHq7ZdAY9cJzE82
         sFL+MGH/JUFxlkcjxDx0uUoan8wPl3VOE+tB6iYqTOtDWe10UoPs9xn/taYqhhoBHE3h
         WFDXaPWZDzpRuLXcanV71aakctWRXKxlu7Nkh6lPEJdBg9gODJ4bOp2zbSjkPniC2IGn
         h6yfCKdYYja4crzrqCiZrn4/m5fjA6QCe57IGmvfeedRUp+gHLC+3bDJB/83Qf9AD33k
         QNHxatrVT27jZMoAGgqL/nUSRJvTzP56acS6TnZhIUYnZywiyV004WLoKcIAeoqUDX06
         bsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340091; x=1793944891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVbZfBH2UwULzm0do1pgyVFKiUnR86x3CT+qhi2HHvY=;
        b=qGk1PeZnoOa89fuk4e13nTwcb3uCZ2NYab5MviIxuDxtI7EeUrGsHlK68qgGu+LQIA
         mZd3A9wyhRsddAITn7TnYizUqZd05IN3b55PHOQ8PsR3cHC/g+ilSps3jxIK5uQcSXRv
         8ywRNcnA7b2nXgIZoaIQe3TwTbQqbC2xdGhp/9MDak2bvEv/pEW1jGc9giw0MC7mSkhl
         zEgzpCvoCOt4sZxil8miNtqWXv7bDNul5XKJFLnsfKjOXOTlobpzVccDB3ca4KgBac+Y
         hEnmVY/nap+n4x3NM6i0cwB7oNqHVflTPIs206kdzJ4xmDJFfgwV9UHUkmvhPuIhEunE
         2XtA==
X-Forwarded-Encrypted: i=1; AKwUvBzftJavqdsJMGSIML+KsuXnx2CZKsqyIL04PJbDc7pkeGzAQlj4OM7xTNtFbzGWH9yPDXclFEO+XLfWRHg2Sfv6@lists.infradead.org
X-Gm-Message-State: AFq9FYJpk9jN42HL97PANHPdbvA2+m8gzDYRHMoIcLWBEkZJdhk7JD/u
	0TOpM3FYlfttnueZbHQ+hXzPmOQ0krDdE76QyPV1O7i8WSg5VBvpPI1fLwN3Jh4c+iIM0yu4GN0
	pMB433t1aRTv9r7V8poTrBeFghyJqBr5vAyEAE0lnSYZ6aiikDqAszCH6AwP9nxyQohrLVz7E5l
	y5HA==
X-Gm-Gg: AYBFou3Kr0p8YDfpAQ52Wa/6OC45UDBj6z+Nk2DjUVwxwEc/muvYO9VSDZLBm5P6weV
	juGCVZW6TGvpYYpvL8cWdS5W1cLqOkUhmjHeM0veRldw5DGFnvG1qEH+/5vDimAVRf2TSwQWtom
	pPecoESBFDhYzNb7hfwCzBb/SnDjkPDSXtT8HKQAEdOVs//TNonYoBuYyQk6tdgK6z8uIxMNmWY
	UxUV2gV5uHKhGbvE6Y8UTJ6HV+3zAbRPqj2SpMxzmEu/i+gUE9AdJEsfr/fwf5+mVYpxwA49a3Z
	BgABKUiB/gJUFS+v7gEw2u8jZm/qPUmpRBJhfY3eR8FcN1dIvyt6JJ+/3j02Rsn35jm0rdCsZBr
	/XuZaIKSXb+YzaUAUeIctWXCHKR41m6b3SQMRyEoTaqPaf8rtR4t5TQmQoi8vhACSIbu9F7/Ve2
	HJINWphYarCbUuLpwupJW2laOlmVuO6m9cy3Ao
X-Received: by 2002:a17:90b:268a:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3ae897ddd43mr983235a91.60.1793340090568;
        Thu, 29 Oct 2026 23:01:30 -0700 (PDT)
X-Received: by 2002:a17:90b:268a:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3ae897ddd43mr983210a91.60.1793340089953;
        Thu, 29 Oct 2026 23:01:29 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:29 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:25 +0800
Subject: [PATCH v20 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-1-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340075; l=3918;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xakx5gZ5wZelc/TfakR5ZpnBjhyve9fD5siK/ePXlDY=;
 b=kcwepGFTpzUaWnwqy/D0qsQ5aK32oiSB3+OPWiP1AbcI40opizt6GW0S2L5PclWTDMT8ac/ij
 0RZyDMzd7AVBdtB7SV+kHdpUxYKQlX9N5aUbcyqStMLUOTTDlnB475p
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: DIAHJFZ1izXKs36eQi7qeJpFFRekpWhT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX13DE7Ru3nhho
 BF3hzstWgqo+7zn09xbB0tieCiSX/2OiJED/TRZs2+d6kvwySNUiN+zseXERMqI/zXwSH1Yrsvu
 xmBFWSq1oRBBozQeDZ7T9GwTft0x8B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXwEnZtSyvQ00C
 2SJV6Ah33LgQ4pvfLKDu7Xqz8zv87nJm1Z5YBNVnMSY013BAP4up/Go9mZ5Ne74ym6ZneP7NTPj
 LleF1pW3blTgBOMJ0nQzJ8Zgq609MsJYXPvuy0N548zeQ99v+pymaIUo0KYPYo2dWXRX7u495m6
 /q3GVbw5uevDvcMZnLyVGwiQHJTm7neYUQan822BHFTbNI+J59OR9z5+HDoNjFln95WLyIYGJsc
 8ohgE75vBIA+gvKQ8txuWn2y3lJSqWCdVJe4qtINpg+ejYSiI7hRNaHxdQnLDvHvr+Z3yngQ07b
 gwC3OKk2ynsimBP/AtujVAh+90GI9lExmMb5hBWHutz3rwdQv6X9XOybdVqlQNw6bKk1zURgJ0w
 XqGNl59F7MHEQlXS7j80o23tDvK0R+JEud2fA6G6upkBChpk303PyKFcWi9jMJ7dKUr+hfWo9EQ
 Ive4FMREexDNCdGkEdQ==
X-Proofpoint-ORIG-GUID: DIAHJFZ1izXKs36eQi7qeJpFFRekpWhT
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae432bb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_230133_132314_DC80D083 
X-CRM114-Status: GOOD (  22.74  )
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

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 21 ++----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..32e8b3e51519 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (!pdata->in_conns[i])
+			continue;
+
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..739105acb0a1 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,8 +128,8 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
-	if (port_num < 0)
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0 || port_num >= ETR_MAX_NUM)
 		return -EINVAL;
 
 	dev_dbg(&csdev->dev, "traceid is %d\n", traceid);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..854c0a3cb080 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1



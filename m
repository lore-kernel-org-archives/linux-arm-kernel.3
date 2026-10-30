Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAF6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yJrwP0PQ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aYR70t5J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XI9SRGLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=; b=yJrwP0PQZzJgeR
	a8C4f/Q0ifwsp+Kml6gbMynY5hcRIDm7cYGyA1//aVS5S8RZWbS/EeAashiCO+GPJH9YFqRjfRqmE
	9lKrER672Uf2Xg9s90WsHAngLKv1MKVIe9xx3WZszwDadlRsnRbEHc3OAUbpR2lhXykRVOz62bA0J
	ymFWjb+I+aWki66IVP3aVVpxH4aC8AZbKfLVpe0p+TwZCINQzsRvwqJ/Jm3EvZNSWfah3rp3G1cLM
	I9nQQKCIhocDwfetyL98zmgghFMCfxVL6+p/5BwCiOsd79iujAruMW1SfuLOXW/nZ5Me6k1PDnAUo
	42py7F3IZFN6Omp732Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfgQ-0000000AsBQ-3O2w;
	Fri, 30 Oct 2026 06:01:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfgO-0000000AsAJ-0sRT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 06:01:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F0901266519
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=; b=aYR70t5JduIjjGKK
	G5+PjIsWekmlPVo13zV0JqgAhuKErTeN826gNYJAI4srNX/dVGIKAmYIBb44cHoV
	KyfINgEFGYRzlsJce/Iti0eMQ1foMfaKd3Z0yDZIQJjezL4UvVtTN8mmTfz33+RG
	gwjI4SX8uCtjW8dt66oBg1FeFNmd146psQ4DFdBh2kTMxf6a6cJa8owg6jqF5BV5
	44Zp2KJqyTBf2DO1K9cw4c7/dXHayNAfnfWAteHq/pdgDkVSk4gGeGt7nkBWIU9u
	CaR9q3bnkBNHaLYZbKpgHq7pLEyqHswcbP0wLw2mxKD8gAVCCocVS6zjJY3xTmnj
	GuqgmQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p1gj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:01:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso442849a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 23:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340102; x=1793944902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
        b=XI9SRGLRz+IBo3FnT5JEcMWi0TArwZdzEofH4jxA+KuxuQrfURmGe9Nx8XN7zU6Hzo
         4/w93z/s6yqWvbKu6pOk7gIdks7Hp8f8+Ha9PZlRlYh3nwpUgsTZWwXcC9+B6wa2s1MK
         O8NtQvgWOtu+dEIXe3HjVDN1q/zasRd+JSIrkEg7xhruOYvIdx3cQTXMOpTY7A8pe8TS
         atZq/Vwd9Nd/5GgF+LOLMD2SY4Ic3/oB2PNiorI8Ee1dwBsDvYFigne45AkgSEDElFYK
         MLxYuKF1lBCV/iCtaUXmzgvHbN9GTdRxfPxX8yQKtx58LTyO0PZ+UV0p/1zUc0GdqpMF
         E4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340102; x=1793944902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
        b=2Ezk5cccfOhIec6EUcE4OJ8JANio6AcF1wq4F2ipFwC4a8ncuupcu+Eq9TQYjEHFiH
         bav1CyC9clVPiGdI1jQlMEFoDKFP3Pft94yI4OMZaKw7GkIVJBAJJxFmiKi25RYd2meo
         6V/SRHUZ11q4YkAlrOlck2XDZtzYQk5kSJyM4yIDqIQoeqbiu8GVtFgHPk62T5V5DZja
         hsn6SuW5Sm1GFbht7odHiijSdWuVzv2pgmUqZTY+p7wEhheCDom7QhD0I+jg0ymTbjAd
         DupEED3AdL/wND2Zoe5EOnijQHGjXkEwOKrpYPLl/E6Uwd2JzhgSoFr+cfJYu//Cnu7u
         oAWw==
X-Forwarded-Encrypted: i=1; AKwUvBypne0iwqJgVhR82gy8kmdFHxCEXvtBdUKD1nqgjDUKOEaseyCNTvlhKj0DIU5Eum/W1hcyqZfVzAI8nFnUK6bZ@lists.infradead.org
X-Gm-Message-State: AFq9FYL31/1S80koMI1qRdR9HMlXXo9QtaLplhSBuFI4jD7M7aoFCMWO
	+m5la2KQN9s5wSmBtF9nuJ1DY9DxX3yf7Sl4yDrPlV1trIqb47DbrmfQvkDu8MCMS1B1tgNSNz6
	t+5ppqGxDtVb9lYGxxyKhKyyYnS85wHw4Zlw5lkVIjd4RsTMadcm02MOdxil0oczSdAHTO2TsXi
	3TGg==
X-Gm-Gg: AYBFou2ps2h8qxWgpBG30ZTg+t/yOhTwm1SmiF/PAsUAvqMvfO+n1YZIaxjSXhiWTxY
	sUKo5W3Sv0KIjcFXAvyjAvxJSEKLtEiSkisL9zv/G4ti2813o9ubpn5MDwyQI3oVDzMOxhdeEEC
	yZIrRQWFI7+MJt/IqU5CG6GKAJp+vErdz8GJqk9M0dTLU9YO3alGuXV6Cmp90+4oUURUHeigsO1
	w7AHHsLD7y2NT/u+nUoa/VBDoEsyF5B9cMhi3n5atg9q9oWtHGjbx7h5v0t71qiriRtB43KSZaF
	nGG1slj3PdUXuDCfdAc+1mRmWyuzW0AWA1Zr8FJFfDrcOcbsNA6dkaZR0sLSnRfz7q0SIbX2WPO
	E+7w80TLf3rIJsV24H2lx6czKFe5dY+1cKOxQQxBKXdlBU6aLBb2Wub6LBCZuci0mwcQFqhi3Xi
	gt/OvDRIeSkB7EM/59uMjxYRpy683jGMAQKld6
X-Received: by 2002:a05:6300:49:b0:3de:7dd6:ff8f with SMTP id adf61e73a8af0-3e928a07d14mr1355927637.50.1793340101766;
        Thu, 29 Oct 2026 23:01:41 -0700 (PDT)
X-Received: by 2002:a05:6300:49:b0:3de:7dd6:ff8f with SMTP id adf61e73a8af0-3e928a07d14mr1355893637.50.1793340101300;
        Thu, 29 Oct 2026 23:01:41 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:40 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:27 +0800
Subject: [PATCH v20 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-3-bd5c3ac9f916@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340076; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tijaxrXD7Cb53GGSRhRGBOVQmb2AQTa3/Hi3VM9v7z0=;
 b=lcngeArK+hG1HE06QC4drcK1PNcAswiCJ2SXbCLp9OlqC78DzI/2TEz7Ri65PNIFWhwa9GhsR
 vWpbYYov41RBSFEu0fHHTijKJIDfJdQCcRv37gOuFV4U6Moqa3kcLpt
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX5SANHIDC79mE
 IAJVZINjmq/TphaWSeLYOpAX0pxohNOX0bUZJZ9xVXBJxMcXblBI7eanNmaU9VedokISnyxGeOa
 woHdiPreojOxSk/G0QmMyKiAbIW7ccthCpD1PN5k/k42BeaBR5oAHtOl+OF1QxcUU2o9zfdGxdF
 V16//JhyirZ9ZAxImiw8WSJaA7PW9kryR5c92zqCK3oDTZPYpT3kVzPoJvyrAXkGCfad0thFupr
 2k4MmRPzXchBePrGajeNLYC2DPifPivK7jRbv/YDo8SYKgubV0DuyhinsQxOpxhV5lELHI0/3fH
 wkXprAhRyhdZhOj04QNfgr+agijzltvaLFrBaJIidgg4eb4CvbuvmOOz0NDR2+BPs0NdunieE3D
 cmRiCNFiQql638xiCI+KJjkkC1avqJJAHaI8xRXMpQJUO0XJPYkjeOK6RaJKxmpUVJDDnWQmuW2
 1skJ1Etr2lRhZCo/ZRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX9MWthxsgagbu
 2iTkADcmU5l/GGsDa/eyprTvW89zK6FPnhMA0Nu2tPCMamSngwM3HxFakSO9MZRIY9dRD+5V7Mk
 NhAAlTbm27oKu86otGevx0OlQJVZIqc=
X-Proofpoint-ORIG-GUID: 9--OFdOi8C2eavyvNw7Rlz5DHyHwMZ6v
X-Proofpoint-GUID: 9--OFdOi8C2eavyvNw7Rlz5DHyHwMZ6v
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae432c6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_230144_398668_118CDE4E 
X-CRM114-Status: GOOD (  17.77  )
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

Reviewed-by: Mike Leach <mike.leach@linaro.org>
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
index 6e994678f926..a14645b04624 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
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



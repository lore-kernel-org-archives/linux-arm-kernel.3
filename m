Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9608E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KypdGnyKgLl4nhvMId8FZobhUoEfqEaVUPzgI6v5dkk=; b=PGmv9FMKysQCthkw+FTUgLmj2a
	QAVSLU62DXkU3hBmT6LFPZzsvciSfbygIzv8+Oa5z8z8aoOl1JIlYtl4CQLGE5T7Z0ylUuogZNe10
	b+F22BHybtLLLMfJdfhvgj3UgTDP2aJ+DKLulpu0uB3wlOfu7+qQoIoDDxT+NY1axjLVBbfd5PKCH
	faT2RPounUEobCociGFIgAK0b5vYLnfvQ4e3TlgwleM0r9rhtWfM/FexKx9rz4VW0nIR/JhJwkH4r
	wbUeg2tkdcl6VqWsgckuBL15y7TVvN2/ZsCl2VdeK9GiiqsyxkQvjZQWMaoqUgz71OMD07aHli1Y2
	7wu/hX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGZt-00000004ZPl-0ypS;
	Mon, 13 Jan 2025 09:17:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJH-00000004Vjm-2ixy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jan 2025 09:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KypdGnyKgLl4nhvMId8FZobhUoEfqEaVUPzgI6v5dkk=; b=rHq24IbaCflfkC9AjJRJRt9/IS
	S13UnU2T6qadP/CX4woOYoSneAjc6TydHdUI650AY72qBEBWY6WZw4Te6XmUH/CHq1Hp+8j1snV+B
	Uv0GpRL+R0LDZR0qOHaE40MeqRAlSF2d1st5OM2Pi0pdV21neoyhSgW2VJNifnjjBeCICSXVDQFcw
	ViOy65Egg7k0Q74qYrSdoN7/CLbDn3TGT2Ex/3cZuVa14bA8dqsYo2Ut72XKSD/Sdb31P2y9Brepr
	+wwc/z5u7qs9FwSdlRcJoWAGzjIPyqub6Sr7/dDMxiFZkjPZ3Icd1WC4vdj6Tf4eAKuh0a5WYw4t6
	1jejx3Xw==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJC-0000000AGov-3Kem
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:00:34 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5k9ow011600;
	Mon, 13 Jan 2025 10:00:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	KypdGnyKgLl4nhvMId8FZobhUoEfqEaVUPzgI6v5dkk=; b=A9pi8rD/xuS6zIbI
	8sQi74j/gCgQfE5poZ6YnvUxU0KC8iHddc1lCNn8iPrQ/lUGXk/fudBmhCwwhG/P
	NbgXomEt1wlok6K7KSTEUBqo4nXssYQM7MZ5O3dOzyLA/fWJrRcdVcsqaYbwv4/3
	JnFXgcXynmU/4kkrMyiJc4GxncyUUAb+DHCZD31nddfouOiAESuo1ISO53o5kIwt
	kzn2UIudsSiwSs1eXKyhYHvtFA5YPr2MhRID4eqaoBosT5oon6B+bRwTmlpb5wJB
	yXG8h4CbCSb8t4UqXNKKX4ELx+0bEvD6DKd6syrs0vgBUf2yh7yf1u7was8WkHs6
	sf9xqA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444vyr0pah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:00:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7DAE940049;
	Mon, 13 Jan 2025 09:59:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4443234C27;
	Mon, 13 Jan 2025 09:58:14 +0100 (CET)
Received: from localhost (10.129.178.39) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:58:14 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 13 Jan 2025 09:57:54 +0100
Subject: [PATCH v3 4/9] media: stm32: csi: register subdev only at end of
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-csi_dcmipp_mp25_enhancements-v3-4-33b96744df46@foss.st.com>
References: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
In-Reply-To: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.129.178.39]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_090031_064286_DA7E481D 
X-CRM114-Status: GOOD (  13.12  )
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

Call v4l2_async_register_subdev only whenever all initialization
are completed at the end of the probe function.
Remove as well useless err_free_priv label by returning directly
upon error.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index e2f63bb47d33..89fcd7d07904 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -991,11 +991,11 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 	ret = stm32_csi_get_resources(csidev, pdev);
 	if (ret)
-		goto err_free_priv;
+		return ret;
 
 	ret = stm32_csi_parse_dt(csidev);
 	if (ret)
-		goto err_free_priv;
+		return ret;
 
 	csidev->sd.owner = THIS_MODULE;
 	csidev->sd.dev = &pdev->dev;
@@ -1020,10 +1020,6 @@ static int stm32_csi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_cleanup;
 
-	ret = v4l2_async_register_subdev(&csidev->sd);
-	if (ret < 0)
-		goto err_cleanup;
-
 	/* Reset device */
 	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc)) {
@@ -1050,6 +1046,10 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	ret = v4l2_async_register_subdev(&csidev->sd);
+	if (ret < 0)
+		goto err_cleanup;
+
 	dev_info(&pdev->dev,
 		 "Probed CSI with %u lanes\n", csidev->num_lanes);
 
@@ -1057,7 +1057,6 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 err_cleanup:
 	v4l2_async_nf_cleanup(&csidev->notifier);
-err_free_priv:
 	return ret;
 }
 

-- 
2.34.1



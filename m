Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF67ACC6B3F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37FTNICNHCEbZbleh34LldopVFeJEOpx2/mQKFn/W30=; b=Kb1xvaTImN+/SdXws7DpBXciGt
	EBDfcevS0DJV9jM/j4lxEvtDM5icxxAG3K/DZ10/FtEHyLtrY7Kfmt0il2cafGtuATgkwyBbpk5ck
	XkwTL7CP8z2iLRQRDZbH7fWa48wERu9e/UyHSH2+FGVaSzhMQ8XWiCMif1iiBnI7IzeEn0cY36czO
	h4jS5DwYWYjVZcOveJv2RnW7fnwR8wRvc7/t70mcolIu7nh06Tv3cVkqAQQBvciGTpBKm2oP+KfSq
	vI9T6dA+2tVnC24aoCG0Eihcyd/FkN4xPUHJU+3CNOYm6lL2dQig/SI5S8Le6v8Tpiw+fI9gJBWHL
	buB3qqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JT3-00000000OFQ-42HH;
	Thu, 02 Apr 2026 14:56:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JT2-00000000OCy-2wwh
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=37FTNICNHCEbZbleh34LldopVFeJEOpx2/mQKFn/W30=; b=rBSgNaVANLuUCvJQ3/JIL6VnwZ
	Gjrwe4cqCkGpDbMBgDn4lxQlXrV6dADgM+O0qRbA7Fymw+R/6717aIqVdfYPs/7AHBuqZbubPB71B
	55YpNzEpjO1TVQuB8LbIbD0hcprqs3c403fzVaMfok6icc5hfIW+NtDiFEJMbb+CZm3sBpwtVphvz
	gV1gNhJ/4usCQ7yPloU2ht7DvIvYSe46Zeb47QeoMAmgXTPeqqh14U1zC5etzmXFa+zdiNAHYG8lD
	PIrcSso6h1mHJAaoMgrS+OeXs5/XWtCWVaKJF7DmNr5lNleWoojNXK/BHEM9LrJYM4uZ72x6fF1gh
	YZpbBxlA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSy-00000002jFJ-3uAO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:56:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CMnYq1128979
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37FTNICNHCEbZbleh34LldopVFeJEOpx2/mQKFn/W30=; b=O0imsMf3s8UXpbz4
	wzgmd1j4wyZRZ8mgBmBmm5nfx3j5oGINXTLEks+ACqgD3bb/ZuzNrU0eAs1dVNS8
	gIMKzDNUtV/Uegb4++tlu0VtsmEeAwObpRK2CMfZeXbHIIA0HihOtxyO0t14a/DH
	raKnZOCxlHtHZ/b3//GzCwnIhPYfDXXaUo9k6n4FLsrL3aRHR672fltxz3wJBsK2
	b7pMwlgtLc5Aou2r7nwg8GCwgni2I/rGaB0dll82Xzj1o20hYvC+7b/pdRxXhLwS
	bq89CxgPkcoBDzewLAk7TLuooTn9spLfgIU1OyKp+GYpeHtgSw+G5VuySOITNPul
	vb6wvQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9cn77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:56:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso13600731cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141775; x=1775746575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37FTNICNHCEbZbleh34LldopVFeJEOpx2/mQKFn/W30=;
        b=eTQTQd018TdMosIsnep+J1e161Bue35YCIQdHnQ7wGq/Ho7J0RXrjfFRdE7J4KR0cX
         hkHf9rT/zg2Xmj7AVD8KNn59oC2i8GOALDJSHL/SGBg3PGJduvSYoijkRBorHhMv4JR0
         JDW9Rfs8nkK5/tXBEDhTiAAZU7HghnzX0jSLmyYDBSAqqNW7PkhiVq8GDjjFzQknKX+w
         ICPkf5UrAwGPvVTaETuaxBG/Tm/FLqgHhAvbewp48vw5zeuZPJk04FKS7bRBoyqTkDaS
         ux2CriRM7v1gR2uPFcQbEXrCuaAFJtLMdmHBGumiuwnEyUWJg1U7igMgZzu6it1iBeQ3
         0k1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141775; x=1775746575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=37FTNICNHCEbZbleh34LldopVFeJEOpx2/mQKFn/W30=;
        b=LplDsW8B3ypDYbV7agREajSi08knI0YPSuqBnAVWLMgEdD3iwwUzNH1/lRgDisLhkx
         WNCE2l+1J4vZtNv3nvH1f+GSgFcvbmhG+fa45MDbKHh85F+DgTaf/riTafgr04SmHiaT
         CRMgNqdNvi4cbS+bRcpG26AxNjWPZaUzOt6E8fzNR64xTe7XezGVkVZLKbWAuVXrETI9
         SSJDdNCBUlBt1qz2+eLnRgiqgd0doXQ6D4lzW9sctrROrMl9Eb52pvuW/0li/JFxBoTv
         /46QX3r4bmVekZ29I8wErZlZzv7uAX79PjdGfc+zeA+HWahugHvAvHvsx2r5o4oJfwHw
         2pTw==
X-Forwarded-Encrypted: i=1; AJvYcCXCLrIh7ocilTjfFRi625w12xULhA5BAFPyOINvy2dEugAooey3Z75xYmIL4+QwHXKxKW6bS70M5cIHyEcQTz2y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6aqmgeDeXDpjR2Qc/L3fwd8tllv+/YTDZ5CXrrEsua5CpRgWr
	rwIU0xipGjQlg63KW7zrs/3DXmleym9+0FKTz/t6hL5Ieg8aCzW+bv/nDjkt2l51Ai7SeEtN3QE
	7Tfcr/NfzmI7fkDDsFTEIAJLgKMjEpkdkTFEznS6K5hrzGrib45s3qxi2HfGoYKWzNQdX7dVFI8
	xSRA==
X-Gm-Gg: ATEYQzxzCWqd0DzIwp6RBF3SYlis6r4DJBtwQO1comMpni3+YnUAorfgIrBHUVgKcGq
	qEC0IdcNmazCT1Mk+fwob06XnHF7L+hkUMcp+CkHuWd/dMKK2+cToXnKQzRsOxjkVH3dUKo/2BO
	+ASvYfL1+gZQOB0OGyxNjyNKgg2nTl86AdnOP0ILJuCocWEYGARgrvpNXMoDKS7YpATRnG2pom/
	axrQg/AKD5PuMbt2578kdQOshNYuaKhxbGzrAM4HKdSjwiZbg0kbgbMgXNqB4tl/rIx3nZBdWox
	E8GWaojPYAioIe2C2cH90jpAv8q8cLwyIDC5mzm4cWn5tOHUia4pt4irqlDFI4W6Ky4EfWv6Pvl
	ad0ioOKltVhii6U5/BsLeiYn47BZzFPXRtq4VMMJV6PmO8eY+IqGp
X-Received: by 2002:a05:622a:310:b0:50b:6fbe:62b9 with SMTP id d75a77b69052e-50d4fc81a69mr29681361cf.28.1775141774694;
        Thu, 02 Apr 2026 07:56:14 -0700 (PDT)
X-Received: by 2002:a05:622a:310:b0:50b:6fbe:62b9 with SMTP id d75a77b69052e-50d4fc81a69mr29681071cf.28.1775141774280;
        Thu, 02 Apr 2026 07:56:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:56:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:23 +0200
Subject: [PATCH v15 12/12] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-12-98b5361f7ed7@oss.qualcomm.com>
References: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
In-Reply-To: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NAle46u/5avuxsi8hpP/66pIOLqvOoFx5eK4UUbxdwQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoN1rL94PjnofpbfnmY9zW3YhDG0gLJ6WcfBN
 VwpH6fx3+eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DdQAKCRAFnS7L/zaE
 wyzCD/4qBTYL9xjoSE4Nu12ZWiccYQZk369fh1ufLC778tY8l97gBhcQNTuH0sAqanMIqyLPJWB
 PLl6fEZBBKJF4Rd4OqERxB6kv4Rm1/kDg9rxtW4mp5qrJwDCpTBcJ1KVSy4Lzf2W1xXafHSHgvj
 4ZmSF4rb/jXfL5KpHjoiIhIILZi4meKncS+g3M8C4FsLVm37zWiwCfVUga3rTNy/evEKjLR/ks0
 ohBtsZVB9Prwm6fgTa3Y9VXCO2RsT+mmDuXnSJbjNyijxf4Lwm0rVj5cLwkus8/X5+YLjdFAI4l
 pxPAnEsxN36HsK+8EzZuddZ5nToYDdiaW3XBKv9LcjiQsvIenxG44QLK6L3x+zoZoXGjQG8rbUu
 2ITGUH1jWhAXZ1JW3HOUb3TfA03rHbB0fn1CT/hfEe2QzYZCZYa/o14MK89zc5LFhaeKtrF5jUI
 SlOfynmMX8vdDtdG3R6cWd79LsdSZT6qsHghAiwW6M4NCerMO/sXiktcpt95KMw4OJPclmImo0q
 IH3kRVe6ChDLEmulFuHZ4XuppilSA4oMbsunrAVxIt7fW88Po3J/IOKRSQVFHInkqS6IqDmNj4V
 mTDi0rWDjmjaPxur4wyuVf+GB8CXip0J/9IOYbc/toHkAaH8mcw+0jBjWOtFL/c68pepGzmd25F
 Zc3yS3si1TqgG4Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce838f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: bpe--XJ73cK42wzp2rxIvu87gDJg0OsH
X-Proofpoint-GUID: bpe--XJ73cK42wzp2rxIvu87gDJg0OsH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX99PHaHhXFOcb
 ZxSy5wVx/IjKCninaAhyw7MjrqAEzdCbQBeg6zVE+aPmp7buNBqpE5h2KWV+lvNxx+OpsYkwbLW
 SdApMaXh6j3EFH6Pq4iOH5XyvhN5V7jzefk+xXsBgOPbSRkHJm+/tHv6ReIBSqRfImkHiDTQEk/
 WqFEmubTqTu0N9tSO5dsIS2BMvSEeSDNbY1hF2/ZfHtXTReCUHaJaEP0bTkPkPCky9B7YDFYKOM
 iBwz26kdwt6foxsHG5SlHGwS0sgc+TQB+CEkNL5o0d9hVUwYVN1W4Khrv4tW9rADxRBQV/7usxl
 IZ4WdKxu7PCsnf6N04RGW1RyPgTI3yVMm827J/A+cHv1Y2PHnSXVhDBrTL3gB9trneXhL8A+Lxs
 GmaDC61sjt3D5tQnBULzPCpFkkvQhPlCP5/mbq6eofzdBMdEqjDoWsYIqhbrDslS33S1dvQrd1E
 DuoRMNAvYpJc6kZ1+fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_155617_251845_E2E3BEFC 
X-CRM114-Status: GOOD (  15.51  )
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

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 5c42fc7ddf01e11a6562d272ba7c90c906e0e312..7d214ed6f703e6ea0c8b6dbb1d7620fcaf4d5163 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -43,6 +44,10 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 
 int qce_submit_cmd_desc(struct qce_device *qce)
 {
+	struct bam_desc_metadata meta = {
+		.scratchpad_addr = qce->base_phys + REG_VERSION,
+		.direction = DMA_MEM_TO_DEV,
+	};
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -64,6 +69,12 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		return -ENOMEM;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, 0);
+	if (ret) {
+		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+		return ret;
+	}
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 

-- 
2.47.3



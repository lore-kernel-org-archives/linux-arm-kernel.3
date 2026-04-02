Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4E1CC6B02
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=aTZDMyYCK+vo6dabA/Nr6jSMNZ
	idLqzfXb+xCW66KFe5z/aYBIeuN8NUUANSMqp5LMNX38C3Ag9+gyR78xexRImxvguiyeOLpwVf1MI
	MMu7ASXWXKUBEZS7lVKI8sdaWuLpk26dm8d3Zc13Hn0pIMyc1iJwEKwezVzv41N69nrm6oB+2ef8b
	T9tIRG/HtLFh3K/38H6y/+8xm40Fsxj7gBZF7cyAQN1QSHCB79ikkChmNVwCpnXBAkz0gkK/gyHFq
	QOR3W9KPeTl/KAoYnGw7MFuPNbA1MBXL02Y5piZ4FIAlQhVu1fMihlmClgE8Zu4wbUB3/nCk8sd7k
	qrreIjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSu-00000000O2o-3uJ5;
	Thu, 02 Apr 2026 14:56:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSq-00000000Nyc-1tHC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=qwvEw8g/XDvyu0x67Bka6G1QtW
	WcjnbZIEqAGqwPLEvv7rZj+HdDmgTUwS1sS2we3YsbM/SdJr10dqP1tv/SfCPyvZo4nnwxQRk+1RQ
	WFCTjnQ6kyPvV6iwrtkFN0iDnSkquqyVkFE+BFnXWMK+szoZAS3lymbR+aNo7tMWUdb8kC36jgIYj
	SIUJcri9M5OikEJtFTHV7qZaeaBJXLSjtqdGjVkKH3VaAcA1CuQfH3PTFbrtOtA8kz5qOFSGytX3X
	UzMrOyy02xTO+e1ENMMKwEGmrauEMo2cG+D75dvEsc+gMuDikNdL1Sa5cIqT89a6W6xjeFo3uKAkQ
	KL7Jsvlg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSn-00000002jDN-0aKx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:56:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CaxCu3956078
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=hhm/Q+NjHhrDco77
	6f8Ze5n4yZZP+l0GvEJS7/dD1ZPaYsAXrJTVWMwXuiE3+ebDLntYbEnTXgGrmDxn
	db4xD1p9lS0B/suY53jKBX9FlIVuUa44RcTAjubtXx5xZPU1CZg9NUlL7bZ6Bsm6
	nT+IH8JlCmug39KX4UPdpWlV0QoMWog+WoXL8nqbrjisPhCJIV2QcxIBVkU5BO6W
	XPw0mnxeOGunILCIdsLFHFsiKCDN9B7hzcjslY0xXoq8NzD3VDU1fIca0nHzEiYb
	HkmB1iRyRMhcvNB6/qagH4PNMLvLx/suZ2lAWWrmdEYV2MwvYvHbvsbodC+SmhwK
	vLWU8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5ks5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:56:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b220c72bbso31816861cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141763; x=1775746563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=awJyVwO2vXyCYhlnm8TJmEqgWR1Har5klOpDfVGoD9peq3J6LZCeSMLRgmgZPrsYby
         y/QqTjDKK2qMJlYgqBphRPsGYonZIPZp6Ki8zIPMwMWwVKG0Ngm6Il7G0cVtBnu6qP28
         VPNXsbyjL4dxfroE1V/7oieHtaTZpeig5UzvTkMZ5gWdYWI8IjnahoYQXAKRxkHclsOU
         7A4cX8GKH8SN4YzvKVPcoxRDsShTxs825Yskk2Phbx23H7xEZ/WlcznPTrwoWmszU/vm
         ofPdeHcdnCFVvVhBWryLKq1NVWp98wUvL0IHrjxZRLTmJ7Oxus5u7IW0dOqXeNf0SWS3
         VXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141763; x=1775746563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=mISdDxotGJ7wvrrgvaJxfIZwSOARzkKPesBkmj/O5KmIy846iCutlX89oub+YkDBau
         /kjBEtc1rkEYmWljPy7eVq/7S6xrb02ZFm7fkY0W+AAhEoA0w5/RvYrnl3hsyCnmiLRg
         hlBbf9IuuPtSfLrRWzq+HkidiAz85EY1kuFflog/Z5xFGw6dPRowaMEbpKarrHuN29jr
         AQhLrQZMvAyhHE7ICQjIYsHztDmhoPK1u99ceWvdlGLRfpu1zc8fQ10a+P7eF5tLKUKu
         3F51b889Ngjcq7pefuP071/iyP9aiRwot7598f9LbKjoU+Uw7+jxmoJYHNWjCZ82DlxC
         mQlA==
X-Forwarded-Encrypted: i=1; AJvYcCVfxszNTkXwIlHkKM9cnOchgDlGNN8ZuqvNEpOykH1u7wMAbpo0AekZ/Ig+3TI/F6vz64DabTkMLfDs+TyZ5yGj@lists.infradead.org
X-Gm-Message-State: AOJu0YzB7IHn2l+W23zHLo+4PIXcgoJ65arE2radM/F0hdAL0n8Ug9Or
	JA9O/025hAACtYwHNhdGH/qgwRxo7uzd64gEY7dlBh+8J+P4duTrZCz1ERpmcZibVe2LZDQgBio
	54Yp9gx7MtmnhTC/yBx6I8Z5cjb2X6GmAjinqobrix14OGrSsT3+ly/FODLNkBs/N5+0688m904
	4CAg==
X-Gm-Gg: ATEYQzw8QAndElvlzm4aa562JB3PaxCTwFevy+nzZm2DQcruCfnIQpT+4YSzbfNPvDT
	0bpNWSd9h4Q2ZugEJua2vZgdFz4fWDTC/fwAO21LBA/WTtn0gYZhDRh1THg32spGSNEy/WAmXUR
	JQ9NyFYMeacUc9v17OSS3s4aqUVzOz0XczYuHArC9/D4XnCwDZ915Z98Owo9uSPEkpVin1M2Kkj
	o2kZJytdHSsLhJOUTVyRQUx9ifkJxmEbLTyffsXKGiSI+iMoSVnS9RBjzu3nO62d4aiFMJF7RjY
	RlZ5jrAwBiXCCr15ouUT19PL1WoKrUA36t1Zj7fMWBSU1dmu4u/In8naz366J41nkagUj1GuAbD
	e9mHlYaEM8Z6dT3w5MGffWX5zo5peEmHn96ruayDKWsl5qPd8ZK9f
X-Received: by 2002:ac8:584c:0:b0:50d:3a3d:425 with SMTP id d75a77b69052e-50d3bcee735mr111226191cf.50.1775141763256;
        Thu, 02 Apr 2026 07:56:03 -0700 (PDT)
X-Received: by 2002:ac8:584c:0:b0:50d:3a3d:425 with SMTP id d75a77b69052e-50d3bcee735mr111225641cf.50.1775141762799;
        Thu, 02 Apr 2026 07:56:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:56:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:17 +0200
Subject: [PATCH v15 06/12] crypto: qce - Include algapi.h in the core.h
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-6-98b5361f7ed7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SMWOwwGJxSzHnqJ7yBoaojvGxwV6GTuJEaiwl2WXaqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNxGfIiDAsunI8yEQv2dTMgafI9KDud+u6uY
 Z9EOTwuZLCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DcQAKCRAFnS7L/zaE
 w6oxD/9yby24fgmJblPwc+DaP6ygv8XanMom0FqM2s+v228aXwkVpuyN5FBuNWQCeGnbjlX/ZaY
 4YrJNNmnLEUh+QqJGWauvTQRl4zWc085RXGDYn3P1kC2rrXBrmDgRMGrVbtJbnkvXRIcEzuSBzQ
 MQUM4/UDW9HjMTWjw8fHLfCU7KZoWJemyyV7XK5Kla3GkPuOcTs8NGIsi25vIfZKYLDXp6fGBMZ
 j1bQgZSFTRxq/ko1u/x5qywVyi7DX9x8EpLRUkoURrcPkb+6+lgB8DMYt5+dir3bsyTViQCB5yD
 J9vblBfKuB5z5E3EpHRASIfzKPcFcVY3IYXy8dX9Defg46axje2sP5/7SqMBpi+EvDiUj74rEXG
 NLxOpx20lwxV+xxdQM2jzJ1ND58pPgxE/X+bDj+CMB6zt6jrkbSeljO6fYNaZu6TUxTNIO6V2QT
 EsB6KXtMTdQCyUu6+RklRbDZRGhsGfovviFIODqy27D+0kICbdM/LSMX2zkf6wCIgEECBXXyGk3
 NI/nucGzvlZcNLQ/H9obOyWrEkOq89+G9kKbDayNxw2KPxMz6SMHcSpNWxrxOBoXwVnZpLUc7zT
 SshWVro1XoNq4nhzpOUst2ip+iJU/VefYxcClkUSN+xyIzHwFnGal/nFAwzhwTeQ4eWZrGTq9SG
 i+vVfSKWmwcYMcg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69ce8383 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PHrqSGG1HCB-ytLbWSv45Tv8lX-Yp736
X-Proofpoint-ORIG-GUID: PHrqSGG1HCB-ytLbWSv45Tv8lX-Yp736
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX+DK77N6CjJ7k
 nF6Z/b04ASeaRGicoyTRGVR7cWAlYcAlYEyAiRs2PD8OfsTRNRzNaFnqt/IJd/coB/0/U7nb+Eq
 hhVMLL0YTt4T065OjFe38zwIttDdOjJDyELiT3QgdRU7JS7Juv5UMB15qIKG19BjBx7ltsKyIdX
 jQz2Dw6PLGHWe5Y8ifMQeYY2bYUf+uhmF5+F9nQBmBbh67hamKhdvavEYtkxXCdS7gmUIBMklq7
 tD7Dg3kvWbu31vaEq5VaEszYuzuYbdrYEE3mh4t8Fiek4AKyOEjbn8LLBl6W/R8VfnzXG9I7v7X
 AjrWIQN65M7iV0pIgDScGT/W/MjH7fqQW9uzcnRMn26BRs3KjAqFJ9tPEXaGdhhF+yehEy8pTj6
 W1OJbyYetVJjUQ/jcFn/346kkgLilUK3FTmrTCFAyRUWvg4kPdlCmRBPpKJ+hMrHpaCjQrVQmEx
 ovOz15TFe+7pDkRZ4RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_155605_457319_2F0C9BBE 
X-CRM114-Status: GOOD (  14.26  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..65205100c3df961ffaa4b7bc9e217e8d3e08ed57 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3



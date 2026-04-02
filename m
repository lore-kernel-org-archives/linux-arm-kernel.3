Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F95AD3943C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=Aqtzcd0aul4GQiSTZ13Lhq3ecb
	eAcUA/DaqBj+MGPVLwg45HvN2jFKCaQER64f1KOgB5v40WVCiXITJp1eDpyJQGuddINps0Ufhkyqt
	Y5ifau++CnrydcKnwX9aHRkKN82ZWrFCVQOvTLgMQIC3EyrQAv+NXRVn819bek/ZP6Qt3ejAaoQu+
	NGyfzIFfQjxAZQIKcu9qmO2e8TNN44RX7M3yCzNZCvR+P+gDeaFDeOuPpMwZp7LcJ+90Er07dcnzw
	nzaUaD+mHzOixYAmGtWL8Tdf+qbnf37arRv+Kc36uhu85BMw2UAxoDd/UgurwYYt72eO9i58LbEsl
	SRTeJmdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSv-00000000O3U-1YSA;
	Thu, 02 Apr 2026 14:56:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSt-00000000O0q-21Bh
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=Ydljv+hViEaQAdrjm98BH0cO7h
	sYpiPoflt3ixG6T+M1cUIiPExz4RkcYHiOb2JdtvF/gyxDjU5GRImhhMV6VE5PsYB3Jth8+wRuOVe
	WMWTB1EEH6flhoxrO9nLOtBEdpvkLC59IJI+0+hWTjj71ngoVDqlAnNsrkx6iIVD+5gkECNX59nbg
	0IYLgJQKnWUKTMm8ANUid3TPKHwcq2MpR+ZvUUVUA/mDGG7WgJi1eMHzLw0i2/jJgrMjYt/t7pQYn
	QF53aUsb1SzwVRVovFziUJLigZ1Q7yT7kKMwtXCTEvexOaafkjtBZdS65Tyek2QmG2Rwt+OO6J0iL
	7tdjCcIA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSq-00000002jDm-1TNw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:56:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632EjdHK1249633
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=fnAEDssyNLp3ghhD
	f25/maqd1A+1r1IMow5HxZz/DPatB5OjSKm/mmd+91kbOhUstS22Az8SuZPumI1v
	1vsfNL9zjpt9rK/2Qf9OIsVS8nbFK+ZbMk3UfgPu+tafBQ9zDZSFlzedv0egIWD1
	XaXCo/gr54EU1KiqKRlDIut2Ecf91D3q//fnIIB8LkyZDsij2K8D44LGT7x3mMl3
	B1L8IqZdBb01hikGg6BM4UbmqrF3YqyP6A04or+xKwyjek+MgimeDG2wG3g3+iK4
	GRquod6DN6hSJavBLdBwhrbQ5j/1goF/2ZfhxaaYy37iNkzIdWYATZ7nx5pikEKB
	Bc7thA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t1ghf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:56:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfcfa72765so226665485a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141765; x=1775746565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=i60QuzaKnFVZQ1XCaq10N7u+NHdsMr3o3JASBFOFKZhrL149kELdi1YcNfrA8LmX9z
         9MIVLhUWi5GatP8qhLIOzMZVnmob65VeJ52JW4Kw4PHoZFnNwBmaEfVgQ2b1Khch2p9n
         LAeIwXm6Ex7Rpd5lMxponBouqMy3GnIajTan/Gi/YjcV1YSSyk4HGSZKujONlI52YV+I
         JH3SJy6d8TsW3Ip8mCgZsWMjXWvxYE4EA50lIfV//NwAqO2UGCAhsH758m/MpJghmFDf
         ueSdSfB2Kj3nJMys5wLuG50iINMeOIPfclqORPPaKumIglR5hLhmExj5GOCnPi8ouu+I
         tp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141765; x=1775746565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=FbYuH8LGqI/XbGY+NaL6qc9azEluPiF4nsSBl1TTXzbIughqA8UMbAEAUOXayXfpC8
         0qk1vDS2CJ9z8EdE7veBow7E+L6utRDSA/IuJcY2nPCgNyN96r6D1FUycYhmsFXA+AEe
         MqhKycgeHYzC2YhQs3lLy2dnVKTy6sFn6Q78vChuyPg45LOpni2ZreTB1GMGHXSA3l8M
         Ltpk2eemwW7RMxp3SZ1ItucaqQmQEHLdgoc57yReJxTXZSQ2c1dStUrfSb4VRaKGOpVr
         QeqTcR8hHN1qqbDwJteRrX5bETl6kFfujlZ5EN5l7aw62FIGyZjWh6i1RVpo0Rv0Q5Bl
         Vlfg==
X-Forwarded-Encrypted: i=1; AJvYcCVVEbUIfiQAXk0jalBzeuGxaSgGxGc50KhX7cMJIYHox1gwARO1TqyBFraAaUxMtuAAIUnu+aPPiAK092wFWH+I@lists.infradead.org
X-Gm-Message-State: AOJu0YzfiUR+OmtKxCHYbReXSVeGiqWmG3tDUlsRmJTiShEy2t2JqVoA
	CZd/bJJeKk6IUuhNvhF769UGXDVbTALVOL4s6G2SHg7exfH5TDf76C4KVS7HGCRG6eJSEs8JQOy
	yuRvNXkQ8AYnxKURq+CPe+cJotiTP6M1W6rNGYtjIgRq5wa85Q2FD+iAoPJjinmxwWp7hoWuZVk
	M3Cw==
X-Gm-Gg: ATEYQzz8uGEBSnluNdnYrsN570CG0tEjEa4lgu2r6ZvhBRVRWQG7rxUJwLyfW4/GMe3
	bF+BiekCJp+cfW13nYUNwg4wVO2dnrGv0V3rwhgIrX4uX2veGLLwdjVBLwbkiSrE2KhatbiMaq8
	ANrch901/XCsPd+4YW8VEVW3V9sr2FVT81mDr55FETHL91nllzkrvoz1Uq5ERrsFBE2oe91NZhS
	pW+XC0wNNc3A1rlDb7q+uLOwXlJAhj1tUeX/lyej/E4UxPtljyZ3dw5b9tmpKBj0SySReTVCgKu
	PJROyPjiOTfid5//tMuXdEYKqHLUQa2zWAY2JuGm6k/2ZQQQeCMmaSpZJf23Y0GcRNHak77t2Du
	VYRp6c/4OGk/KL3OEMJdgyACURqXot9sFrsqi+SIpPC9g1AMut4/l
X-Received: by 2002:ac8:580c:0:b0:509:3cd:b243 with SMTP id d75a77b69052e-50d3bbddfecmr105597371cf.21.1775141765111;
        Thu, 02 Apr 2026 07:56:05 -0700 (PDT)
X-Received: by 2002:ac8:580c:0:b0:509:3cd:b243 with SMTP id d75a77b69052e-50d3bbddfecmr105596981cf.21.1775141764680;
        Thu, 02 Apr 2026 07:56:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:56:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:18 +0200
Subject: [PATCH v15 07/12] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-7-98b5361f7ed7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNyFx0Etnu2/7Xen0gWpBFZ1ieiULMMRmf0H
 dTMlK6qKdeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DcgAKCRAFnS7L/zaE
 wxcyD/4hXcbTkC8LIp/lwCB+yEZJEm/+U6CMtxj0z5MXytldDhzObBweDdkesDvi2TH0bZnhx/M
 QAEDeB7fy3n4n97BktwVseoItXlZ2bj9ipNnLEymN9G6ze2aZKXIkQ3ANRQpc271S/pz4R8pD1U
 XMip2W2kAz8R5+2cygpnjwYHhCIjXYuK7piExHs53IaUtpqWgdpUYsbQr7h6bu/Kjsu/jMUpiEJ
 TnnF0JEkuAGezCa5beyxU6YL8kMaFVT7h7Vg7x0RYQKu4G97cZAVX/zMY5rJVWsj+EDoao+lUvM
 wD+nv8o+kyD3Ikj2lfUVY2AzLMMANjOQWZuUaUihp0iVfh5uX3Oy1gBAT25PWFcUGX4n2C6oD9d
 o49niLg3vR2qIVQCtghh2fx2Wl/palGRNaDucuTAzrXIS6taZ6WBx160n5jodW+R2AqO86pnudI
 tUqBye1okP3/9ucTEBmRQsu3W2WpNCWHpjvLZH3qYVEXveiWZ58AfRRdrpmopJ6wb1z4aKMpq+z
 94a45xjHW/dO6ffUlFz1HLxAi4BvPiWd9n5Bo83Y9eY/W1wwQsSjUpRRLhtkgK2A8AI7hIVzYzA
 +pLL16n9HNqW5r9ginpaVJg1RR1v9VIk1mWRFnaQ+skPc3e+DMDwSqO2BSRLREqo4qXE5S+4GHs
 BjTGf2SKCagZs/g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: G3FmTD7KgZIrDMQciAzvKGhiqGqi185e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfXzAFDaVH8EpT8
 NgvdavKFQfIEe96k7jmJmanbLgC6vuEj4dLdNPtqlJWgL4uuNWqSuBRX44UCnfGLdxoUPDqvTCw
 uNnfz3/GRkHLm8UX1jFjbTxUWWrxf7hQc0vxp5fPldrmfFB6fRKtQsJaRRBu+PjHZnxNr/WYLO5
 NMFozWLVioSx8dPuR66NnveiUZ6v6Hh0wcTlez+c/+3Vc915n3XOD1L4mAaqnw3gKtH4M9WKXv5
 VCHfNfM9i8P7IJSgwO7s5ZToP3stl3T6pWivbSF3Zqwic6sWedlvIRUj2YQLbmosTeBQwP6mhx8
 lKSY8GDw0u8zhcGCHKwMY43xImOQ9J50U+5QiOui3h4V+kH8g5b0Y7e+SrHnKfEy7rFe4c7dpkA
 QdEWJU4Xb+Q8qy8nOQ5Xad5jaaLFFoWxXVh0uq3IqjkkJerj85jm6OLmxIQ4ESNUSU3AwaBgEVt
 pUN4nwIo9vy+5ky4ycA==
X-Proofpoint-GUID: G3FmTD7KgZIrDMQciAzvKGhiqGqi185e
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ce8386 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_155608_803402_266B5D40 
X-CRM114-Status: GOOD (  18.49  )
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

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..08bf3e8ec12433c1a8ee17003f3487e41b7329e4 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -41,8 +43,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3



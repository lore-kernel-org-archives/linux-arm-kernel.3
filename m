Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46C9606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xql8Mzzf;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cpKPonqr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgh9o+xr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+BFi12bWqcTOJ6sEqLJK0xoOgxMvabXiHoqzjLlrk80=; b=xql8MzzfyPucIjWlzMVit3l1nI
	hNLozAiOmrRYd46IeHAU0kqHsUQFs18h2EZjW4xXXqqtEIRSbDcmMZ3oiYVgK2g4GPBRUKWeVKZ1K
	HEIr5kc0SpWUPOo02j8GBkELPa/U5PLSNJ7RfXRzXFbCWWeuY0DQeUeiJMShObnaZjDn4M1oqwxtj
	1nXjytVKZjlEVlBBXKkjb87VAIuhuVaBZLBMg1s2pn3ovFjBXTCWgT9EFG+EwKGFuU49u1Roubcau
	01oEFNq+RbGAG22hN5x68PUOTcAexb0Bh/+BezeKu4bS5O5/cye4EFoLNWuyVgja9EYNlojDbsWRl
	PT5nn9Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOERW-00000002Wmx-3zbb;
	Tue, 03 Nov 2026 13:20:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOERU-00000002WmJ-1SzC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:20:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClRNE2547111
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 13:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+BFi12bWqcTOJ6sEqLJK0x
	oOgxMvabXiHoqzjLlrk80=; b=cpKPonqr34zxijPWKwDHvqw2T4RXbsW/1AacZi
	4Qnxdvf6K+AKzwHKTc1uu65mtNmT2di07rdrugCPBD5AksTVGF/jQjLzjIqrixOM
	GL6jTnPrrlQgU8DZThQO24b7HyrViN0xWHkeExpJeOTgGZcJZz2dLV+xuWoiLH0O
	86a0Uq3VPJ4e3n0iNg/9Tc9WvCduY1iE7tqYydxR5DbTgTAmbDJFwGWAQVDkar83
	NHKCSLWan728eQqFBGhlyL+BjCC2OVinSm7NFfef4HigDUvX5VjCGHojEYk5g/79
	I7bB/AA6BO+iBOnTH1tA8okhpxMakMp2jeZ9hCPlhyPj7jrg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3wds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:20:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc37ee6562so644696137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712047; x=1794316847; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+BFi12bWqcTOJ6sEqLJK0xoOgxMvabXiHoqzjLlrk80=;
        b=jgh9o+xrBrnKq8voEdoCBfvCvAXGPhGEkGJmxT2Myxlj0WfH7RwB9DC/un3EFveCOo
         Y/HrjxvhpQAnG9QsR3Ukb+tvxqo2sRlzWyQRtg3CoNyczQFsmdDsSogIJZORljWJepFV
         dVoCLE4Q+DhqNm6qBQbKDu3mmK8YijRVIck9sL2LB3yGMD7gwLKz9A9srTk385i3mLli
         9JLYIN54HxwtLC2b9kBw+kz2hyS5d+VnyYzQ/ELlW9ZFbK7zKzR8DpG1HZkT/x8NLzNs
         MLETuFdXLVHWRKKsAcuG+7u5BasNZHyduuSXCk+/RxjlQx1TimE3+3f8ngwztE9I4j8b
         t3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712047; x=1794316847;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+BFi12bWqcTOJ6sEqLJK0xoOgxMvabXiHoqzjLlrk80=;
        b=Lky289W/LbkdYBQa6Fu/3q/FwadetZ4UH/2ehINiaT9ml8l6AYycK6fNVl5yOLAMcQ
         0jz7aad2+1MGC4+P5I/yEXM58D3IbUUsB6BSpOQR2W40OcUtI0OfqNxH3MdXfRPV5xCa
         vNkCrEPbOCqNYwdfpphiCFhNC1zeLNZwZDjDxQx8Jse4tPGBRbR/BEPdCazQUtFhm4W+
         h+ZR/bPKEHMCoIUl9JLPZrSY4X/dSLR+bWavmfPJyM/oS8Yeceg+hSdJOVMNxdu/1ppC
         P43Zlp7FIGnevq9J+mWMv6yZe70jiGgdLMXo3oEdfflsZ32M+7Jff7wX6r2hSJaUhga3
         WCpw==
X-Forwarded-Encrypted: i=1; AKwUvByOsw4WLkeUbuIFrIObbEBC1p750DSHC6du60/Hd1M7EYNDfHdPz4vdlg+fOmnbd4xEun/uP2ptzcWxKNP/a8M8@lists.infradead.org
X-Gm-Message-State: APuU4Z9Ms1UGB98V9egAe3YsPv3D1HqexVDoalHkqsl8KF1p5HKmIaNA
	7fz5e00zjz0YKEEBtiQKoLDqq6LpSnt+l1+HF9uim0fGq72z35keX8IHtJgSwkSOywJmEIgNFOQ
	PRUtgghjXOsD+x7EqlO29W1qksdkkVjDm/01oc57a58X6bj2o2V6kNlZjSdAH6HMlp4sg4zNHDW
	s5Fg==
X-Gm-Gg: AYBFou1uDCk1/Ku9JATa1UsN2PY/yC3nQvee5MVPDfGp+GtrtKmuXcXKPAu8LEmB4DF
	1UUwz8tmZBybS84BKLxW2WUutqslN5Sg6/FvfkpfXkDD/qLzJzi8BahjFRpQCdCq8u9IJzwDji5
	oVhvGOhoAkMnJwM0fxB0DA5TfIBjEHEjvLG2jZCcyNg0HOV2ADTD3SglzrwUKciy/8OE0TJzh+a
	/XcX2NtP0xiKNFIJzg/3rShbfkKyclZS8ovOo7CRh10KLwy8XLtTn8l6N9XeUyImPnMPHDC6nAQ
	t/AYeVhFnWU+Ojt4VCdJ92evwZ67Ue6yTnwQab3I9WVQ4JqyU8eBwtSwX2eVocureDolC1DTDmi
	156oXhOAEDaEQGba6fMmgxiyScSUO0HMN1MtaE8BCXFpCVTITf18SS81q5Uu5jnIwOli17ifpGh
	91Vw==
X-Received: by 2002:a05:6102:c13:b0:7ce:a69d:b020 with SMTP id ada2fe7eead31-7d072232e7dmr4404429137.5.1793712046587;
        Tue, 03 Nov 2026 05:20:46 -0800 (PST)
X-Received: by 2002:a05:6102:c13:b0:7ce:a69d:b020 with SMTP id ada2fe7eead31-7d072232e7dmr4404421137.5.1793712046016;
        Tue, 03 Nov 2026 05:20:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm25028605f8f.43.2026.11.03.05.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:20:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:20:42 +0100
Subject: [PATCH] fsi: aspeed: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-fsi-aspeed-gpio-nonexclusive-v1-1-1fb040c59386@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKnf6WoC/x3MQQqDMBAF0KvIrDtglKatVykugvO1AyUJGRRBv
 LvB5du8gwxFYTQ0BxVsappihXs0NP1CXMAq1dS1nXeu7Xk25WAZEF6yJo4pYp/+q+kG7kWCF/d
 6fvybapELZt3v/jue5wWazr8fbgAAAA==
X-Change-ID: 20261103-fsi-aspeed-gpio-nonexclusive-3dda6d175968
To: Eddie James <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-fsi@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JM4hxUuDHFTKWRhWdb7Y0Uxm9PMGHQj200nKYHyrYSQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6d+sehilbkXKePTpQgQLuD9189WQlF28F6T9I
 V48CXFl2ACJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunfrAAKCRAFnS7L/zaE
 wzsLD/sF/61Ts6Vl9U1VcfUV+7ggD61FAlUXLtBKNyTjHiX0HkjN9eP0cHAw5zg8n7GuNyHt+EF
 iEDpgCrXHP2zr1ihPlySUvhY+FOuCrc7v0+hz/R7vNRwRfyWIagRxUs3Ie12UDY8W0JSsN3TtHH
 vvJtFquRlw0DDk2ZR6vWYyfKiacbSqogBp+mMRkTr05O5go/cr/al/FBc+wsK36UxBGhUkS1fBX
 moOhqrXCaYRIVRf54qMYOGg0TLG4jwd54NKTzaLQp1ANQ3ipb2sgY+9M7f9pmwuRmAdE8EIKkKP
 w6uNzCdV7u6AZ970yxsacAuTjjFShmP653M4ycK73dFsNyaQU95EOjZXC8Uzgo6qCm8gCBoSFbR
 BWiv4AdasEoDL5fmCDHORU9APEAggAxy1EbL0mAgS5byGLCZf72WAF9qh05Mea2lMgrEYhThLbT
 nWm+3D1EJb4JjDEojVo5evlfAc67c2Ttb8m7xrG+ziXIYKrOTdOPFTNsdPJH2V/f3aun4mU1zyU
 BOCBxw0sb6pOYfGQCojViGgWxZ8P+QtzUtsbQ+5S3tNSYRFqDsJsPCjRUqJe0rgHd3PAQib8Y6f
 qXL6cHYOKZu/Trd0DLQyCk9stc3brh8bf1rQo9iDFoHm/xNSOObDWOoTy14uhNpveFCSI4lvwqB
 6Z6tJwa+9K/jT/A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: sCOL2qIqeZ1Y9Lk_qgv-5Re2q4L-Bykk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX9xxWizUveY3H
 5jTAJ8+TQHvkECSmr7Vtl4DWnHZIXlxnHyg6BG3YtnFoqy99r8WeHcJon5Gkx/vchFB8A3Wchq6
 E94ZU9HglGmmcgNePXtmCgdAitB/7akM1RkG0ee0/+020ApNXzyMXbsAS32SqSQK7wWiRSr9lau
 +HNkCxV6csqEzjS3xUivSvf9UHHiKnUJSegDosYpY1mlWZNIKnnvYHk8vngy5IBq1X6OD+WD5EM
 QcPZvKbp92iSnP1M1IE09e4it7HNjlaDC7CTBXCuyHd15j2mscZuW0lYU7o5miGLq1VFHPx4vgB
 11ewMzlJl3/8WPgJDv3CQ8fHQnO1hKXEs7JJFPECoY0nkQ0MQnaUd6Z/jdiTyvvK7j7MMkKEgxv
 uLRU6EvJ3kgWRs5T9tsnJoQH6zt5l4SzwKGXVg/OsTU4MMdefGyYJN8mwtI3XbUuSD2MiJg3oVa
 GHwIxdC66VFe5Of+xvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX1ijzmBVUw9Ny
 pY/EfdVsw6p8kiqRVs+do41IVF0RDA4KSn0DHA4zqx3bdzm0/g2tDQxv5VH5R7ViWpS1ver/DQ+
 Oy6H9/PKRzzfC6znyRmGtd761S3l8lE=
X-Proofpoint-GUID: sCOL2qIqeZ1Y9Lk_qgv-5Re2q4L-Bykk
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9dfaf cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=FqAFu7yXOSDO3m4w5aYA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_052048_511760_E0C220A8 
X-CRM114-Status: GOOD (  14.87  )
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

There are no users that share fsi-routing-gpios in any of the upstream
DT sources. Even if there were, the right thing to do would be enable
HAVE_SHARED_GPIOS for the aspeed platform as this is the preferred way
of sharing GPIO pins. Don't request the GPIO as non-exclusive as this
flag is now deprecated and will be removed.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index aa1380cdff338dfef7caa8d516322e6bf90371cd..88a3a90abef9cd22cae03f5666936ef7eced8a7d 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -496,8 +496,7 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
 	 * The routing GPIO is a jumper indicating we should mux for the
 	 * externally connected FSI cable.
 	 */
-	routing_gpio = devm_gpiod_get_optional(dev, "fsi-routing",
-			GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	routing_gpio = devm_gpiod_get_optional(dev, "fsi-routing", GPIOD_IN);
 	if (IS_ERR(routing_gpio))
 		return PTR_ERR(routing_gpio);
 	if (!routing_gpio)

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-fsi-aspeed-gpio-nonexclusive-3dda6d175968

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>



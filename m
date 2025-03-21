Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0DFC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LptmSOduTXZdmxLfabby/f0qYD+OOd89CLB3+Homj/E=; b=oZaQksHY5Vl667QG2xj6MRXnjy
	5P/B8KVw/jPxUnsaFKYwtJ6QkX+D+wODMFUpiZ/CySergqRnl8Dj8E/BeO/4uuqCTt4jgRnRJr4me
	jnkJJUdVI9UNLC3ETx6h2567afuCiriHinbbfDVUoQe1ZyDaK1PwCEpMoURZw4m/zXNHilVHIIBoU
	/JQxCsWAXAxht+rJqkzEX8rIItRrAEkFLvhRYB++23cwNjjwB6iQ+2oQC41jXr2mzvOeI1UiuYpso
	KSiRKQxPPT3HS4o9lMQLfUGwTREYPEe4/7PLaquwjwxS+UILvesl8Vk9XvOcndOR3q+oB+yE6HtqJ
	czu/Kkzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvekm-0000000FNwp-0xj7;
	Fri, 21 Mar 2025 15:57:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvegs-0000000FN9K-2TPt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 15:53:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATUxX003145
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 15:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LptmSOduTXZdmxLfabby/f0q
	YD+OOd89CLB3+Homj/E=; b=XwOqSwMLn6z4nHVnDSkjrjKFlzyirWWCntc4tipp
	mdieX75XroXRDdyorNmXzvbcciaq9pQf0LkT+vPXhl1tTisgbArrLN6Ph6XSZ44v
	PHwfbPbgHbs5PX8XZVoXC4/+yhO7XBakxe3gIuCGR3htwRDz22CgcWUycxORItcW
	pA2ZMdE3ZJxmcxw750xmNfalecsyaLy8KbhYk5suDi2RT6GD2cPITOt0xOrs6PIl
	xU5BZUQZ/bZ1e/a+8lfPk4uJljvvUX/DmuetZz8cAPTpO4klaZJdCdxxPAbl7H1x
	QrAzjuAtzNmsEZ/dSBZICyAlxmsNm6/Nc10mLWvE0EK2KQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4p118cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 15:53:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fae3e448so39933686d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 08:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572424; x=1743177224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LptmSOduTXZdmxLfabby/f0qYD+OOd89CLB3+Homj/E=;
        b=nUXh4BbU5IOp1A8sbJxWXwQHeOhDVe55AKVTNtfD+qdd3Gz3dZnP9bY4tmoFpLFFPi
         6bxtqpfsPmNboWImVxw5gGxLJWTaYj/TRpXUUSaPYly1NjDAdD1zSFseaZNGpXO3Xz+A
         NkuTVLZWZFQTboE1njGrZeM8NSRuLtMxIEfqiwJ8SAHNwjHdjEsI9iboxYL5VSUrG2Ol
         r+fPdCQmEjInqX1u069QqPGHs/HlGncSlwtf+utZNj+c7Q+qRMubV5QvaiokthbzAzsz
         smcjIEPXid632qAij7YBjl/eg1tO8mSCFXjUCL0iQ9um7ZluO/ZHecu3XjD9WUFJQhKF
         FDvA==
X-Forwarded-Encrypted: i=1; AJvYcCVCS1oj+SXTg04oE8jvStPArGbRnXlyiBAAhovhqMv4mAizzQqv11BldSDpKpJrSbuRFuAxR0lLoxXgL/AHBnH/@lists.infradead.org
X-Gm-Message-State: AOJu0YwHjpy2Me2mFlrUIxfyHT10dmADNrfJgXtpbWhoUYrzRpQhSIEj
	mP3yauxfIMtgJzCWFAuXeFjAAPDLRRLPvR2EzfpnUnSIPEm+f2sg2nEh2XOAY5xcG0K53D56gAM
	bROYKY8xEh9fwH3DxgnTVe9ITSvdIR90DAaJ6sQ4twgrXoELFf/ZrtTasUERAqcwDRQzPe0hnBQ
	==
X-Gm-Gg: ASbGnctYV/hYsCylbn/Wi/CxUXeGPKKxqsY6PgQvOVjZU11+s09qqTXnFsGE+RV3G7O
	VK7bVxTuxu6CKLInL1w9HEtowHDKe3xMyB5QEtPvFLPZ3hszBvrgP4KdT370pkT/JtgC+LHTKIX
	rAgvqDEtU4FESnrJtuFvxJ/oJ0Y+aPQLWwyH+LdMd253AfcXcuHMrB5b5CUFIRHf7APeXVtPGfy
	BctiRqTUeBQw0lwwQvlgHvlInjXx58qFKPrmcVGsKLWiXdAx9dTQWqvAApiZxFOTaFl0SrSLYgN
	kqLnDPv7JoQ1iyrNNSkwG7D68y6HZZKYkRhgcmr2DTNSm8PD8GeNcTbo8SMZXiMKj6cH1R0SRnE
	AtC4=
X-Received: by 2002:ad4:5de7:0:b0:6e8:ea17:8587 with SMTP id 6a1803df08f44-6eb3f3b7b50mr46274746d6.42.1742572424181;
        Fri, 21 Mar 2025 08:53:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNM19+y0wvr0/rSNbRv08Ya/wFMH3feSKKK/Zb7YMAXHSS6ZMZj7DV4uHlqvystkp4UnLvjQ==
X-Received: by 2002:ad4:5de7:0:b0:6e8:ea17:8587 with SMTP id 6a1803df08f44-6eb3f3b7b50mr46274196d6.42.1742572423624;
        Fri, 21 Mar 2025 08:53:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad651237fsm209084e87.242.2025.03.21.08.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:53:41 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:53:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 09/10] phy: phy-snps-eusb2: add support for exynos2200
Message-ID: <wwvjm4576r437tf2thbqseca5fobedgrhjk52iegwz5qnlhfv4@pnsl3pvsefwq>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-10-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-10-ivo.ivanov.ivanov1@gmail.com>
X-Proofpoint-GUID: sljr3iz8xSzzjV-SNgO_YBwRbRqnOrq4
X-Proofpoint-ORIG-GUID: sljr3iz8xSzzjV-SNgO_YBwRbRqnOrq4
X-Authority-Analysis: v=2.4 cv=NZjm13D4 c=1 sm=1 tr=0 ts=67dd8b89 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VxB2ctdoYg6PJSLCJaAA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=718
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_085346_625137_4AE6322D 
X-CRM114-Status: GOOD (  15.93  )
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

On Fri, Mar 21, 2025 at 03:58:53PM +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC reuses the Synopsis eUSB2 PHY IP, alongside an
> external repeater, for USB 2.0. Add support for it to the existing
> driver, while keeping in mind that it requires enabled more than the
> reference clock.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/Kconfig          |   2 +-
>  drivers/phy/phy-snps-eusb2.c | 162 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 159 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


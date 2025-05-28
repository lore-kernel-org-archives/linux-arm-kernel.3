Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AD3C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjdekBqq9jQ1YXFhfk1E8WK4nJD05A+u1nrX/oJj5mo=; b=qCKEMstzXzZXgBhf2aTtbgsW63
	Gp6W2sH5w/3v8YRY6/6xU4u0LLxlRkrQXj4AwQcowsHLRx+2q5dZcq1hYUriQb43uoE0q38L+BRzm
	o82bHmkUEuCkG0wWLvx8/56qSh7IaCRDCeUuf9V+LjZlBFmPS0wDed1AJuUMpKWtSB/m9GEDKex3f
	DPE7o+gVaAoaEfrUnR3AEgRPO0NxCdJb2GEj1nJ/zQGHmktBBJDmG+prC/MPyJ89qhPYwJyr46ygD
	whnF92O7xfTEv7okHGEmghrxBzVJAzOJYct1oqoQuKvZsBgY+0kZT9g224Evwhn2q02yTtb2dWnMA
	UG1DojtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFpR-0000000D6Wy-0bqf;
	Wed, 28 May 2025 12:24:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFg6-0000000D4gh-1AZn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 12:14:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SAC1iJ018828
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cjdekBqq9jQ1YXFhfk1E8WK4
	nJD05A+u1nrX/oJj5mo=; b=OBe5zTmCx9eNzb6Gr9pjOGgX4nz68VzF4PYfCXmb
	kpSlphATodbmzpK4/CcmXm9Ry/OB5hR90fIcgX6j1WoovJYM43uH1nX733aVpOQN
	Cq9cPEMS2NVqazTry1eX2iKI42IF5KOYjgz+IsesBw2FW7JekOVJ8BhuYYIEHT1p
	EiVFoQ4KHnUy6uI7KMqFJe+IjQCz+1plpvlL5/MLzg4wPFOsGIHzZaeDzVmD80EU
	jyHDUXcAXCKtCvZq2Jsy7jzeZc2De6XBjm3sTzq3JvHSBui/ACCfmv73YbCN712T
	SmCSMiVLwjIz+D4FPCgRGtqat5McrFV5FvRmWhpkaTgYJQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcxkdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:14:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fab1b8d379so22030776d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 05:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434476; x=1749039276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjdekBqq9jQ1YXFhfk1E8WK4nJD05A+u1nrX/oJj5mo=;
        b=WhOs4InGTgglclM8ij9pfKnssLo7tkA4iWp/Zv34zm6EqFAERMryiGuE+s9gM7Wjch
         uKc+ZzxaPHz7x3ltEuutGCUIl1lQbopq2GYNQWn/9OEKvNJwXlcfltsOgvSa+Tayggca
         RDOOfj8PhiXdv+KZdVCDvR3JnHwPtgwCGD4VpBrsXfosldh7/4bzsPuXUEyIKDR7Hnxg
         tu5x6nIumQ/vsazkiLx53476bbHUy9045tigdwCUU7uvuK9rzUl18wqcf69SH6QeW+qa
         0ZskXTRvgAj7tyBFBOE2ZSlTb7p48xrCARmqtg2hVcHbf6KkcpL8FwC9x8i5GQVdj6ad
         v6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq5W0jCBFsffPKukCulfUD+1KzSQaK8Dl2vwd5raY69bUiixl0Zt152QoUknU4rhdpSsziMNVTOhUKjSfC/CTQ@lists.infradead.org
X-Gm-Message-State: AOJu0YySMrbWIepAhTUgrUDbn5+LOVgbJvIQfy2F0cr/tHiPGbUVA6kb
	Tzw3zHSlEObUQoVqWZcIaEsjnadkWap/MzKJVPUF3xcBjQc5cazcgRHsrXCn7LxZOMniWxiXrgl
	3l+tkkfUrxdinYIjyr9zZOYrADTeG0tDbxYg1Lp8U60zYl/U4TrmAvSn0h7Wke17Q9avd45LYfP
	LHQQ==
X-Gm-Gg: ASbGncuGBILjwwM51jJYVeA/KBAHmmoDAR4Oqm5q0C46V+lIS4DpN6Jq3lb9DnMlOT+
	nR7/z2hjOAR5Da1Ay7jO1GVolp6q9X/JMcOs+NOBdY2Kt3nl2brqHZMlO/DoKyHF9BKwxUmQGQk
	V7I/jAicND96Jhh4LQagwhrTk8E27W628hIZLfIp3OhE9SmY/50LDrmyanbjxtqeWEJLY0gI+1o
	+4c556ZPSK16LSAoPQ6SDHSvfuadlFAGJjT9fbOFgOPeGolZAM0Olc/CfBPiK3zJ/QcajdfO9R+
	TCrZW1VOjXA6eX0E4CoB7VENOlv5Aegy5M7Ezhi2pCG8uNOYNxjhxNVkNw3X3PJluU9XNOf9eaA
	=
X-Received: by 2002:a05:6214:21ce:b0:6fa:c2d5:b3a4 with SMTP id 6a1803df08f44-6fac2d5b470mr14195066d6.5.1748434476051;
        Wed, 28 May 2025 05:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2p2VwJWOXtJEGL/fYyqmZpdkmAOdMF5Qq25nUD3joqlGl9qIwB9aKQH/bANxFtWon8zcbtA==
X-Received: by 2002:a05:6214:21ce:b0:6fa:c2d5:b3a4 with SMTP id 6a1803df08f44-6fac2d5b470mr14194596d6.5.1748434475626;
        Wed, 28 May 2025 05:14:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb688esm2323591fa.24.2025.05.28.05.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:14:34 -0700 (PDT)
Date: Wed, 28 May 2025 15:14:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 03/10] dt-bindings: usb: qcom,dwc3: Correct the SM8750
 compatible
Message-ID: <ari3245mwglxyelcpbct2dnclmp7xtgj6jwrkopb7t77rzdmio@zkpzkyzydig2>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
 <20250527-sm8750_usb_master-v6-3-d58de3b41d34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sm8750_usb_master-v6-3-d58de3b41d34@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Y3wJslB3aUnGXMUNterxnRjZW9eIV04r
X-Proofpoint-GUID: Y3wJslB3aUnGXMUNterxnRjZW9eIV04r
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6836fe2c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zrS0zEH8eRrj_hfGFQMA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwNiBTYWx0ZWRfX47POGeuHr6ih
 OuBp8mwZ6bwPVAelX01hWeZ7B2CkIfUGwYUM4dRHNIq6AZYqtYMttew1934TGKbnksKjWbQF9kF
 EcbJMa8A206nyGYPv2MYaJQzwsrsi7tss5lVSLiqjiNMB1JZ9utow7kWuxhjoTlRScvNFkSTdcA
 Sp6ySQ/vwxFNQ6TFHxtLcseKHJ8P6D2hZJo6cg5WNizCe8Lq8KZ1DEkXeYgX7+BwNDvsWVXzGli
 p6tBBI0o8VruiDHLwCRwWFJBUcx8LJ4JeWlE0J8ElfjnfKvMFinnxr4i2TZ/Fckx+eCy1PwWVaM
 o3fpnGqHYf5uSuLh3lQmfi+eeFxdrkxt2O4Dma4Qaim4CNekfmgPnJ8NX7EotGzuPOyer2qln3+
 DxKDtDGaGe3PRh9H6ZqLHbTRHoGD2btRU9ZsfGUep5/9jp1BOMbQZaK7MbwwFyhEi2xiM22d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=599 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_051438_449027_375B4095 
X-CRM114-Status: GOOD (  22.67  )
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

On Tue, May 27, 2025 at 02:04:39PM -0700, Melody Olvera wrote:
> SM8750 does not require an XO clock in the dt as it is the
> parent of the TCSR refclk_src, so move the compatible to a section
> where the XO clock is not required.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index a792434c59db2e6ba2b9b3b8498ca43f0f8d1ec4..298b1472ccbc4cfeb04927da29ea40b9883d03eb 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -227,6 +227,7 @@ allOf:
>                - qcom,sdx65-dwc3
>                - qcom,sdx75-dwc3
>                - qcom,sm6350-dwc3
> +              - qcom,sm8750-dwc3
>      then:
>        properties:
>          clocks:
> @@ -366,7 +367,6 @@ allOf:
>                - qcom,sm8450-dwc3
>                - qcom,sm8550-dwc3
>                - qcom,sm8650-dwc3

I can't stop but notice that SM8650 also uses TCSR clock as XO. Should
the clock also be dropped from DT?

> -              - qcom,sm8750-dwc3
>      then:
>        properties:
>          clocks:
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry


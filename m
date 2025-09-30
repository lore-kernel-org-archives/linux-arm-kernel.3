Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC39CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 18:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGmiFBtk8zoxCM+T4HUw6+ZD+jra215LvynAxpP5vgk=; b=KK/XtS8n0qcMU5zQCSPniUpLPn
	qy4aaNcTdsXj/KiffqECQu9C8FCQGINEUytm6KvaUxHNtFeg2QAgRvmEYzsBm61aGz8zGFBDE0qSI
	s4b0vk51ed0yipQWw2I7ZsesVVFmLt9dj8dManOkSL3Jo1U70OuzCg+8+kEsDkRcvZ9+R0zAg1/Dc
	yjb8eDc3qSLlc4kik1W7ztUHuV0ff8as9Lqj4uT4ZOAd4km8vEylhS4AqZunnaKdVrJ7yOv8sp42f
	4h5552OI6hoQEqDwuR3FM0Ufs9pJltjDNpVHdk9lfAW9MSza18MkVhCXQkKkbWULml8y6jRHkYOXy
	FeYLustg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fKE-00000005zi3-25tK;
	Tue, 30 Sep 2025 18:43:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fKC-00000005zgl-0zLm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 18:43:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBrBrn016891
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 18:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yGmiFBtk8zoxCM+T4HUw6+ZD
	+jra215LvynAxpP5vgk=; b=bfTmvrZJra+/oQZi7uhdBmbERNSFcTLqisqpazM1
	wiudlbDafBQKYQ6pepOJctTKpmrQZLScq2Ie2N7USskXBRMWD61lwlErIgXOMJN1
	qmq79ohKTxUDoPGobDLWT5bGi+/L34X/W9bxBGDsNwKUp93UaBDrvGqMjJxwddVv
	twZAAp/AyQzDTi9fCjHWxV2d2jpJzcZmPHSum5dzsj1p5zNaGphdjbtvdj3uGbsl
	syJVbQRAxIaMzySx/jd27fn8v+vpXiG3HM7OTe6rWRUwrdTQbojn/tGpr7OocZTK
	QsbqQ25r2ltFmYQHFm4C318tKfN+YNZeJSWJg4psEJRt3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hhtwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 18:43:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-86835654255so976169985a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 11:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759257822; x=1759862622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGmiFBtk8zoxCM+T4HUw6+ZD+jra215LvynAxpP5vgk=;
        b=ujkCzzTnCPUtcAXmm3kaPeFSzpPW8BRfru/vXjmSGhKzqFqiB4CEQRlKkzvpY3tXgh
         LeGV7twf7PVi2z5uivwmjJ8vYQI84yG1jNATnWyUENiGYF7VN1kUb1zss9dJIRfvOqCh
         Xn3jkU02qUX06K2Y/6/RtXFp2TZABW9saXVY6KvbWq2KtiElxqNFT4hGXuqmPBuO5CVC
         K1WszaVbwbS9qReYUJf9WrTNSLoxjOlNItP0HGRJziw4LjSOjZ/bkg5A21R1/gLs6Ep8
         G2MI9ChcQ783Y3fnJ2miW+wIR5/4i7xMsQnK/pGG/y1rQ004iuJtE+3WJhOC9zgPzlvD
         /dBw==
X-Forwarded-Encrypted: i=1; AJvYcCXG3NQuuh7kTlpRk3Lc06xzi5jnSrV2PORjOmZk7oVhBiV6Yak0xpORhKWJL3ferSDWXmYbOifOxpClukBxoW7Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxCHSzDTrIRurlfUAe14faduojI9aYAd598llOPaadn9NcZIRZE
	TRVejHYb/ZeqgnIll9xKCfvQlhz8M6eqCVAq80BQXpVdre4ZJ5UxBpIAcHDN41h/iKGayzmz4Wc
	mN+erox2KIku4wqm2sn7MCDiUET7mrJ365mfZPZeZJJHHz9Mp9D4W7GXCCz/nv+Q1GgDIdkUIUo
	56mw==
X-Gm-Gg: ASbGncuaCiKOKCvskQnVjrMUPyroX3d7tQ+udlDye1bfHJ1ShacLZfuS8Q6ARLSe8Rw
	kS1Mc/FWOouFE7wtuqA7KbUsT77avE7ZGkrla0VozwGMwdK6AYxiDXOpCnM11pEEXAQOAZqBG3o
	/0m/aoGG0obc/zjxmUbA30hXw+fFsyt5YoNyn/yY4CFkNdCK6dcxyWM4HxMKU8RN1hL1aGvXOPU
	oP86z8KZjZZ5OR7LSZsS3RxboGqGzjbqE++hOUj42xSSlV0kLrCyMybX/Y67P54VTXAaX52Iu43
	UmEDp7kHlAx3u436RZvGBx5HhQ/UcsDUIqScR+LPd30GYfMuy2RmrEPZ7fjreUeVRaJBHbRZTkI
	msdofY9n0QiLmClwS5sjB/BR7ytW0CeXrwkqIBG/DwDfswj7hdrmms+PBjA==
X-Received: by 2002:a05:622a:2c9:b0:4b6:38f8:4edf with SMTP id d75a77b69052e-4e41ca1b2d1mr8343001cf.29.1759257821811;
        Tue, 30 Sep 2025 11:43:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVoTpyYZEYD5BDhL/ibzffyH63whEH/5BJy4dUuRPx4WpG/DtAm/AZa0wD/E68tizX2uBZjA==
X-Received: by 2002:a05:622a:2c9:b0:4b6:38f8:4edf with SMTP id d75a77b69052e-4e41ca1b2d1mr8342591cf.29.1759257821234;
        Tue, 30 Sep 2025 11:43:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665791esm5232132e87.82.2025.09.30.11.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 11:43:39 -0700 (PDT)
Date: Tue, 30 Sep 2025 21:43:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Romain Gantois <romain.gantois@bootlin.com>, Li Jun <jun.li@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
Message-ID: <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX0j2cmKsM+Tgl
 Xj8XpGhIEkE/G5C/wXtkHOBRUaqjdydt+H39mmjfHy0QLdgeuEfHxy/miG4mH9qpswBzNBCEHRG
 JY/52guedHSjcg1IOhZp1iTwqM4arBpLzR9QZ/I+5Q8BELghH83YeqAV1ZfIzz/8tpeXgDd6HrX
 sGwbOu2PeBM13s4IYIEBDwHgEvHeyazLdUtAQI+6reCUvAxFFK8TizG4c2yHOfMnrr7XlpBpa/R
 75aC3l6Z98LwSSjkyxsk5I3/IZY5zneB91RtVP7M948YqE4g52As1CsBcTOn1wGeXmU6hnid8p7
 /K3f98PzyMfg54kD4h1is4gjJKMH/2sg8x0xRm5P9EAuUCWrNiQNHw3f/Na70ccEGhiVYNuKX17
 IGH/aAoJ70jJe73VUrBG/Vk1dnADiw==
X-Proofpoint-GUID: xejWM5-0Mudai_4xvKn4yFgFQLzeK57X
X-Proofpoint-ORIG-GUID: xejWM5-0Mudai_4xvKn4yFgFQLzeK57X
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dc24df cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=OOCT3r6X_P3o6Jl0E7UA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_114344_279191_93531141 
X-CRM114-Status: GOOD (  20.16  )
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

On Tue, Sep 30, 2025 at 07:17:21PM +0200, Neil Armstrong wrote:
> The ports definition currently defined in the usb-switch.yaml
> fits standards devices which are either recipient of altmode
> muxing and orientation switching events or an element of the
> USB Super Speed data lanes.
> 
> This doesn't necessarely fit combo PHYs like the Qualcomm
> USB3/DP Combo which has a different ports representation.
> 
> Move the ports definition to a separate usb-switch-ports.yaml
> and reference it next to the usb-switch.yaml, except for
> the Qualcomm USB3/DP Combo PHY bindings.

Isn't it easier to make QMP PHY use $ref for port nodes instead of allOf
and keep ports definitions inside the usb-switch schema?

> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
> Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/phy/fsl,imx8mq-usb-phy.yaml           |  4 +-
>  .../bindings/phy/samsung,usb3-drd-phy.yaml         |  4 +-
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml       |  1 +
>  .../devicetree/bindings/usb/gpio-sbu-mux.yaml      |  1 +
>  .../devicetree/bindings/usb/nxp,ptn36502.yaml      |  1 +
>  .../devicetree/bindings/usb/onnn,nb7vpq904m.yaml   |  1 +
>  .../devicetree/bindings/usb/parade,ps8830.yaml     |  1 +
>  .../bindings/usb/qcom,wcd939x-usbss.yaml           |  1 +
>  .../devicetree/bindings/usb/ti,tusb1046.yaml       |  1 +
>  .../devicetree/bindings/usb/usb-switch-ports.yaml  | 68 ++++++++++++++++++++++
>  .../devicetree/bindings/usb/usb-switch.yaml        | 52 -----------------
>  11 files changed, 81 insertions(+), 54 deletions(-)
> 

-- 
With best wishes
Dmitry


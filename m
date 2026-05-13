Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E27CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amWzFW2AhltZZiBpdafVGSL8sTRgUnuUyXbxrb/TJ1c=; b=L2SdZ7OJDJ1+2+AyGOvF7/vOBx
	wdbLI3508jvB2UQRlRUmQIiSdntnCI1hp/bqf2uqiXDA/vMjDbPpKwD1aQJzXsfo1JD8Fp1h/nOhp
	F4xwp/8wh3bqneCpFeqKAKTyeHMxOJHA2kVX6bQVZPGxd/7DedQ9VyRIITcvPqDHcK6e11YUNLTyE
	LsoBdzwXKvoRRdiNh+65EKqIQuOa9KEMsvt9qztq1vIhMejjARNtg0a4XdWkP4EZYMinbFoxQqTWF
	wfItkbnfyvipvZAUvjp8jkQd/kENJccJcaz6BeQeCorz2bbFzBCBkOIfWWPZpm5RegJz05TDHe3Ad
	0WQrO5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDmN-00000003Os3-034m;
	Wed, 13 May 2026 17:53:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDmK-00000003OrX-2OdH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:53:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAPKa2321233
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amWzFW2AhltZZiBpdafVGSL8sTRgUnuUyXbxrb/TJ1c=; b=IBlM2wlMmqeFHzE2
	wOWomBDbwP7QrhCvlVkGxcI9aMBJLS5dDoXUAUC00axbhIBBeU6oOEyHJWA/kVY0
	FrZHO2ySgFs6qJBcYOLLd/+oKkcBb6oiMEAa7MsmhE7tE5XsFsg0rvujVPuK4zmB
	riOzJp+hD4PbmO4Kx4+wl00kLYv4tsdzH8VGmTzGWE/fgRrmvunji+kr6o7uc9d4
	K72iuduBvH+MCTPK5MeQhitzF42fS3xuqLWIwt8OFzt2S4kKpwYM7IJ3dd5pNljR
	rWJmEll7upmriXcTaPhJymm0GzIEi6yrNGXEY9nCiM4MX79mf4Uta1hTzFOkfbma
	xtKEJA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgub93w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:53:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51494d74d4bso116980881cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778694831; x=1779299631; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amWzFW2AhltZZiBpdafVGSL8sTRgUnuUyXbxrb/TJ1c=;
        b=j/yfOjMiVkUjPcP+CumNFijkuubmkalqzc3I7BEOJmo1B5uuLgNs/gWUa0jToZYJqA
         X9f94PyZlyGDVqsIyBZWJoBpVhhJOxjg9bIpDPcuMHJcoJFDoP99v718oZwsd0kEUJvI
         /AF5SM2CeTq+YeXRgAfk75xfx6zMxW+2QT/RZgv2qFZuJ22A0TWm6WoIT4vr6DzS4Lay
         KooIyD0be8BouPPd6cHVVOLmrR8sOxet+owF4PEWXRk8Not2F7a1SWxfv8SmLj/DXXYe
         ZMGrxM46V6SNMD9aiuOjQ1Fc9jMFw1gRkVgkiJ3dhnbU3L/85YgrvvA5T655mlClhsbe
         uOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694831; x=1779299631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amWzFW2AhltZZiBpdafVGSL8sTRgUnuUyXbxrb/TJ1c=;
        b=Dd91pKj4irNoF3vEbFcFFwYrPuuz9CxACDwHuNVXP80pxpwJceRIBTEB92+UeT7zh7
         xv7w7AFf5j11NGCbWv/o5lTLkaQZ+6HWeAFETgH26csZzMHuQ6dR74Qr39zF5f6lYMT9
         e34kXGAXUQyyY6jKeM+nSPPVMHwToYm5o2Td/fKCDb3AewI3bdZw/UFQD5bldUrDFNZh
         b7ltZxwuhqtCHqxBoSVUDuxB5LCO+RUed2k3Z/SkLuFWhoke+JSd1i3QCqfJGIEYG7NJ
         +Qic9dgb684FXSFlVAFkU3ITW7hcxyRRsNi8TkNRPP8X8AA/zKcVRMicRw3yyZAMqoTN
         qO6g==
X-Forwarded-Encrypted: i=1; AFNElJ/6n9H98DLoOkh3ZS4YINLxkOHgWsiZy8fCumpbcRWiIx/TUY7wWP8qBu35pmQqOTuXGXQQCCP1xPoGixqAqqf0@lists.infradead.org
X-Gm-Message-State: AOJu0YyRzEBeGYIMtdrWADoKZ5dokI/aPtUHkTaPWg2N+23LZogQR/82
	ZLl359deW1pEtD93XpFSTkwX/Xx+gyaiiDDh1OXzlFtVdjbRo4AkDJtMzJ9z7f4nl1Wl/nzsPe1
	ELYWAtiPlcjK5nVzudKsr9/utTgUI4FVq6cBM+a1EdQ3btZHIq217nkZ02VrKYXAq5C9Po5vytq
	5ZUw==
X-Gm-Gg: Acq92OGeqQ1xUn1Ak8YEmhCUvKrvh8d+dtGOvP5YoGuxbdSrP3ihL0a9S+oW6mnp8Uo
	lvSpB+J6FiyFeCgDh+VL+Jmq3qsF2P/KkWRKvD4ILRAIr7Rau9dJAiMxY9Hzcz6C6kqhGcKf8uW
	VRAAqVwtDpZrnaSqK7Grd3YAy5lxxzzU0rnqk2Qg+4L4ZU0Te7/oGaVtwXJuG2AF9jsZgEWlV17
	b/lMcxweK4J9mtzPj8h7fQ5QIfEufz1Tlmg6zNApIdVoNDfNdAmF8NQgOoyizMxHzAGEu7Xb76z
	f8ZAxG82L0fYXLgL/EXeEpgI0qzlOYOu6o/8BsK5c7UxHNiy7hma/3rsT/t6H8jOu3QnTMLFeOZ
	Y48SdkFcKah764LhjVI1OpCImsCSzEqN+AOtO+XashFvtAhdiSm4hLm807IMr2yPVgaIUlr8BXv
	xlFFt1ot1f+RS1u13qHRi5rJzwgh2aPg6lgOto/mHnlmj4nA==
X-Received: by 2002:a05:622a:215:b0:516:35fe:5524 with SMTP id d75a77b69052e-5164155bc78mr7504531cf.5.1778694830812;
        Wed, 13 May 2026 10:53:50 -0700 (PDT)
X-Received: by 2002:a05:622a:215:b0:516:35fe:5524 with SMTP id d75a77b69052e-5164155bc78mr7504061cf.5.1778694830374;
        Wed, 13 May 2026 10:53:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cae06b4sm109561fa.28.2026.05.13.10.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:53:49 -0700 (PDT)
Date: Wed, 13 May 2026 20:53:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
Message-ID: <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04bab0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=U2egry7Pn7Pb3urGTtEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: XxOf8AM7nk393A1HenSQJC2nQL3xvbZU
X-Proofpoint-ORIG-GUID: XxOf8AM7nk393A1HenSQJC2nQL3xvbZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfX1sNQEH5GI8DM
 4iWTYae4IN6xYWTxX7187Lm/GIPxz6mFwTm7eNeoL3kN1hqwFYafVIMLyN+VTeH9vtd4Uy5dvDV
 JatDUZUkuQ28FMV35J3M7gFd8vxgoyWpV41GfcMWz4X+quJ+Yd2ckeYZbWCfv4sRH3I7HOxfK7c
 7nb2OwMBWYXN1xoV9hZPERM6GKhIT2LWSPXwfR4jce/SYvOugm38Ef9tdAaLywR5ivk0PXks6pi
 p9RSNKalrgVV3f8ysRriuFVpJEtaWyEZu5lKGjRpVYlvLApFOtU1LlpPqUmOW0HR9yJlRXzqH0D
 6ZznsWQKS08HYVMmnWYyu7Nwy8o3eOtfXGxh3spDC2JwUZOfbfckEd7dqN0lOLArl9Kh+WBS2z7
 d7jCcbW2FVZuLmoOMKMWSI1A+2KPaI9SFQITkqvDNTB6NGIN3+b2F5m7EwRk6+Un5p8dNxUwyMV
 V3niLoHSvU0b9mUL8nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_105352_623173_587E04B5 
X-CRM114-Status: GOOD (  19.09  )
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

On Tue, May 12, 2026 at 03:53:20AM +0530, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
>  1 file changed, 135 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index c57aea44218e..5089416ec32c 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -26,6 +26,7 @@
>  #include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  #include "kaanapali-ipcc.h"
>  
> @@ -7045,13 +7046,15 @@ nsphmx-3-critical {
>  		};
>  
>  		gpuss-0-thermal {
> +			polling-delay-passive = <200>;

Other DT files use 10 for GPU thermal zones polling interval.

> +
>  			thermal-sensors = <&tsens5 0>;
>  
>  			trips {
> -				gpuss-0-hot {
> -					temperature = <120000>;
> +				gpuss_0_alert0: gpuss-0-alert0 {
> +					temperature = <105000>;
>  					hysteresis = <5000>;
> -					type = "hot";
> +					type = "passive";
>  				};

Why don't we keep both passive and hot trip points?

>  
>  				gpuss-0-critical {
> 

-- 
With best wishes
Dmitry


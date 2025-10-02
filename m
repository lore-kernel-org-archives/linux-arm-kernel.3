Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791F5CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 01:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uuV+cAEUShNKUExukS8SgydD6777ETGVMv3jAdKCJQ=; b=ccorLDV5dQQWwtrPL+peHw8hyF
	J9X+kAGUo5uxzvLPf3oG0Y6pl3bI5ITrALovUVnxTuI1zdP08DHpHoc5KNjj5fpl0nba+JowbsTEa
	IqXI9/om4yImWQH7oSFot6nU43ty29ecqFEPQk1Brz6jWMPR+614T6hhfDVODmv2S4uW2de1m4fcS
	Fyf8SBY2pJfIB/Nidqo418fkoaLKu27oxSZBqkRK0ZMXU/f0MBmVRb4vkR0rmkxzVVDTXs5bU+X+a
	bVDkesX2gCx3UWgibMQKZoXiZrBMRvksxJ5X4SjbWHTcwMBMu+sWmh7OImOPn1munIZ1DDwrd6Q+p
	mFC7Jxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47hg-00000009Lpz-2foV;
	Thu, 02 Oct 2025 01:01:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47he-00000009Lpf-0mKH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 01:01:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IctHO025234
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Oct 2025 01:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+uuV+cAEUShNKUExukS8Sgyd
	D6777ETGVMv3jAdKCJQ=; b=pzJAo28GyVqZx1sMk+eBu2npT920kGL71Izeb9ie
	5Sv1dzeXKseKZQpR6MRLHAUdZTQhn9lZI1VA2Tr1CG/guG4ptPbv/EqNjdbZ3lBI
	YS2+vGtRN/g1FHQ8A4vvoHJVpYXOo6BWE5NE3Cpq/joefc9THzWLWwERRU4TzW+O
	aU3+Qqn1/Ww3pk6dJoz1LNFZ/b+SrxJEhks3p3a/vxYFJqGXT/5ARVCMZBk+WTeP
	Hmt2YUjhWVZDtdpfjHfbcwsEvCQyHDsUncpSkhBSRjpcee/3ZFTVM4QGPyksrPOI
	9RUUmlmKcRQakxMFYTFiIG9oNgZG035AY3j1TEyNGLCeYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977x4p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 01:01:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de2c597a6eso18014051cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 18:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759366908; x=1759971708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uuV+cAEUShNKUExukS8SgydD6777ETGVMv3jAdKCJQ=;
        b=dPjkuEF9Xxyo4lmTAMHqQ1pfuSJe7czED9CLBftOJxFXfqPtiu7lV02Zt75IVl4p8p
         iBcb43EjfuQ5GJ83t8U28PZLsyMSq3QkGpVuxqa8Bn2DVGeLMN1kotZKJMdVcpVApinI
         SjQu5ZC7dpzz3MK9aW/m/akDw6ddZwsomirsooekzbHlZEn/9UMgSWHJbY4PH3dnFMSZ
         XCg3sl2KCp5Bt24Mif3So/FDRVH5TlOcWV8a54Z6AKYaiQEJ+LJdjuh9ZK4EVLusyPYy
         CcRZt+ykTI83SJYk+S7NpLg7bhUFWcyVV48uO9/RUBkz9hlUyqru2H+A+biMlsWF+QQw
         YeEw==
X-Forwarded-Encrypted: i=1; AJvYcCXFaPa2wSvp0nhSFgfJ4g72/fiI2iJOTaf/jLSxHLro2/tplyV73xCZKMam6cMH4a7o85zIirsL/0WCoWQHW5/h@lists.infradead.org
X-Gm-Message-State: AOJu0YxJtEPBEdQdot1E8eLQyy05NdgfQTlWv8dghUjrmUtMse5DPXtD
	+0l1PfGl84PrlJPL6S46Q/qGALp1xO+FmSZuWKDeRC2DQSDpH7GpzyAj0fmqZ0R73AuIFyL6f9K
	o+EC0/dX735/aH7V1SReBYPsDwTqaRQubWK1nZLAK0vozBeGCl6ctQgoW/Ctf+XkWdFE0Zm5B3K
	Yc1w==
X-Gm-Gg: ASbGncuOKIbE1ZV3TlH6+q2QQiQHqyQrqRon7faqsNqxmQ94gWLGFz9mYzeXsCOicDB
	vjqWFO1SgE4zrgA6+pwfmdQ5gO57c2o7xhQIWNMvRAyHe6X442FbOJt5rvV/cD7VE0sIwig3UEF
	FTTh1vJoQKo5pIJ1AAowx0HFPh80Z8Nb0ujzuAmVkltlLRBTFILafDAL3dpY+QsszN2g09LSwCH
	BLXM+UD41YVeY2ROlvGOcpxAiaszc1P5r2hhTrr3G+EiI0maHL/TFQ9jZSHql7aQxHHc4DmuQs8
	VmWgmrEg2u9bAjuex79tjDzFOgUj03J9zXGrGubT1gYujOT2tKXLnBYinqiv5lN2if68uh4Ynlq
	t82uKm6grRzu14sw+TAkP18/mqsRxWuMKgB29CpRd8XJsWWt3EXCYRNWOoQ==
X-Received: by 2002:a05:622a:7c0d:b0:4e5:c50:54c9 with SMTP id d75a77b69052e-4e50c505d71mr35072081cf.14.1759366908305;
        Wed, 01 Oct 2025 18:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn+cgowdIyCiT+tSd84oPTNAKVxBzdxq8x33fvDr8hPGJVsiMB7AsHFEUbdO1IdCvcYvE2oQ==
X-Received: by 2002:a05:622a:7c0d:b0:4e5:c50:54c9 with SMTP id d75a77b69052e-4e50c505d71mr35071211cf.14.1759366907553;
        Wed, 01 Oct 2025 18:01:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113f3ddsm344791e87.52.2025.10.01.18.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 18:01:45 -0700 (PDT)
Date: Thu, 2 Oct 2025 04:01:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/17] drm/msm/adreno: Move adreno_gpu_func to catalogue
Message-ID: <edfc7ke5ktoah7ftjbwk7dzihsgh2mq7tatfy6a5oxbn6yt7d6@yf6nz7b7jrmx>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-6-73530b0700ed@oss.qualcomm.com>
 <cp7djnezyp4whhfqcnsfpes5kxfbyvqvc2ceimdrnrl7s7agyk@z7ozx6oihezd>
 <82cd8782-b2ee-46ce-9964-e564ab6a0199@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82cd8782-b2ee-46ce-9964-e564ab6a0199@oss.qualcomm.com>
X-Proofpoint-GUID: eXvQStRT2y4Y9fVVncdVTVmlIvyX39J8
X-Proofpoint-ORIG-GUID: eXvQStRT2y4Y9fVVncdVTVmlIvyX39J8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX1e9qlDikjd5+
 hNisd7Vob6HDaa1nswlao2rNfvCy9ozBaOy2ofqNl1W3jv2ZsXV6ToqmVHvoigozRqJ4iJyrLAx
 ZUylj4+fOOOX4cFEQIdmSt9ivzJNPMTLg8VSxxXwm31zdRzCcN4vC+45ZH/gtiPUWVyXlyMPTNB
 Yp+U86M2yvaH6VQlWCko1TsL4XV0kTnkiSYV/8ktybMLiKgZHPIFFOxBZE50Uh9Ln1MsV2JBf2e
 PAKoHYmu4KAXwZCUR2v8XWVefcdELu47A7+nbC/tPsqbkivfrnOaSTUcNdg0kSfi31pGKF3tyMz
 g47T7HtPhNlFNcrD1DTyvfdHAD4QA9Ga+3cM8XLoiWrqY12qP0AANHwaoT/u5bJmoFcdBGDkqjo
 KbFLcFei/dczycy3EoAdIkd5qJY3dw==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68ddcefd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=RvmDfw1ThOOzoc4muVMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_180150_231832_16893F2D 
X-CRM114-Status: GOOD (  24.23  )
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

On Thu, Oct 02, 2025 at 01:24:36AM +0530, Akhil P Oommen wrote:
> On 9/30/2025 12:39 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 11:18:11AM +0530, Akhil P Oommen wrote:
> >> In A6x family (which is a pretty big one), there are separate
> >> adreno_func definitions for each sub-generations. To streamline the
> >> identification of the correct struct for a gpu, move it to the
> >> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |   8 +-
> >>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  50 +++----
> >>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  14 +-
> >>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  52 +++----
> >>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |   8 +-
> >>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  54 ++++----
> >>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  18 +--
> >>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  61 ++++-----
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |  50 +++----
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 209 ++++++++++++++---------------
> >>  drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +-
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  11 +-
> >>  12 files changed, 275 insertions(+), 262 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> >> index 5ddd015f930d9a7dd04e2d2035daa0b2f5ff3f27..af3e4cceadd11d4e0ec4ba75f75e405af276cb7e 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> >> @@ -8,6 +8,8 @@
> >>  
> >>  #include "adreno_gpu.h"
> >>  
> >> +extern const struct adreno_gpu_funcs a2xx_gpu_funcs;
> > 
> > Please move these definitions to aNxx_gpu.h (a2xx_gpu.h, etc). LGTM
> > otherwise.
> 
> This is a special case. These symbols needs to be visible only here.

Why? They also need to be visible at the point of the actual definition.
As such, I think they should be a part of the common gen-specific
header.

-- 
With best wishes
Dmitry


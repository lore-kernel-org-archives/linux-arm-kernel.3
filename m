Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B181CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 23:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbg2lZIT6IEi/rrQPbwo27yLNtC7VorLPG0nWcQWW8E=; b=fb5XQpLWeyHtXEWtViLKhPZpfc
	8OgryWDPQrKEnYtwyzJVAsQ+p+A+tNBybeNe1KbXA+2ejBJSgea6t7pADLhHmrr9GKdx32cVgo+vW
	/DJqMW1LIkbY1Ai9qmmaN+w2MUCNivBzq23HUr0KTe33HnETo7hCrtl/HAH/YoRfKi+jD76J/60iI
	BXrkZI0CvAHuOQpi8pPed3rBEGo4mm5LwgKM4cmUwap1Hj0yQ/uUkV3bpfDxqmCVuCvolPv0s3oyd
	rro2jLj8HD3f5/9mDbNzIK+nSwKvZEtGpaGRCJCmp77PBdbvKQoWGvvSiejbnu4Mn8RSCECmFTcoK
	WgQjtX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUukD-0000000FvOx-2Slc;
	Wed, 03 Jun 2026 23:11:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUukB-0000000FvOQ-1IZK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 23:11:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653K0J9k1740892
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 23:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbg2lZIT6IEi/rrQPbwo27yLNtC7VorLPG0nWcQWW8E=; b=PQlAGpWCLoN9iNoO
	/tfLoUmkZP92NidY3Epvt1h04Dvf+S+D9/JqS9E+BgigNus5m3iTZRdZQoI9g1X5
	MiIIC6fbQukvuITzn2r774+rb7L0bAxiA5C+0xZIZjrDrLE3KVI/2XIeDjjPu7s3
	CpZ1xetfksToCsKc4BVbm5gOaDxHjaKJeAPDRbIrhvea/seavCzRr/a9KBn8YjAO
	SzfAoM4kyftsO5bKY3C4nkD2QxtEZcLFYvSJQSz38ix+nmJysZimjp0vFyabYdz0
	3CBHYcgCy84ChAu7d9lst28zXiCUEvnHmdoXo0l4FJr3PND+0MdelNMPdIn/T6Us
	YOQHNA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejdq7vd7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 23:11:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751c50552dso53790137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 16:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528286; x=1781133086; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pbg2lZIT6IEi/rrQPbwo27yLNtC7VorLPG0nWcQWW8E=;
        b=gyLZn0N9Ngk//lolydVcf70uUyXHMh6TdQiPwkJjROXPM4Zijn1P/6HrhVJgvzjtAA
         qfIdA/PSalDwt1HHPWGNDRaUd0cNEQAUp3P6CSAUqozGLSf+dq1vHqtOitgAaU4b6B1J
         t8Y8OrWaRNIOK0DsoVx1Nlo9PIMm+j82G6g35iHFkaaIN19N5Ap4DCDd5ES5lST/4xJI
         6V1rgA/s8O46n7Eale5WK8dZ+ATmyoyL2yHYKS65iRAipd0Rsqu1ap2ekVpxV3R3i3LK
         l5shxAV05plq51RAAElLzQT/86srTlJ+dFZ8H1bgEQLKTmWE07zcGcTl7CyZMZqAnj2F
         S9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528286; x=1781133086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbg2lZIT6IEi/rrQPbwo27yLNtC7VorLPG0nWcQWW8E=;
        b=JsylqwBlLVi3pZrYKGImg049bNGK9KnfYyphVC+39xqWROEo342sXuAOtMsEBv8Hd+
         dtTVkdH+Ml2VmYOU65WydOzCi17wJjurqaGTw4tNrZCHaKkNmx6eL4PeTwBroF+3129X
         yGZJgp8l80khc9LVImPYu2bSxFLT7GYbiAOrYMwTEs803n8s3OVf5waI1XxbU76O7jul
         2HZVHk16rcC6R7tm3gVfabJE5FLhPPvOO9ILoyU23Q5xPihpzrA5tTdtvwKteS76dysq
         fFhd58OzDf25G6pnBodqznCPsWBurZycwmN12P+DRlgl728vqsFoJ79Td+Tc7DDoxST9
         g01A==
X-Forwarded-Encrypted: i=1; AFNElJ81X/ZuLEYSFR2dwkwBfblzgGex5DMKPKLb0lqdndpGqSp9JFWTZ3zJ0RC09ttg7KXCxxpZ7lbkt1aykPWCmSE3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4x2AAKxMrqLI6Gc9mrC5eVW7wAXoKpXfoyGLKWhJ0Gdb1Mewr
	ZY4KdN+QdbvnYpNoHpNolaQn1E9RtWuvJV211YpUlgNw1av8eN+/uV4D46URJhVuf4I2GdqqI9W
	OxZ9B3UYV0ZeuyrSV1EZTQ5Rc4DTlGUtpJo0MycDJS5aOUgHXU4Cw42VIvCTqczfmkF23vtU+Dm
	YUBg==
X-Gm-Gg: Acq92OE/GQp5d8vJ27npDtrvxTsIttWi5YXqoBZZq1hGsFhu67HJN4fvU1PGbiEl0bf
	EZPPzQ1m3x971hrCy61h1Zs8V3hQnXldZItDwoFk1y38jK4J7yw8KsN3m1KHkK3aZ8nUEsX9OV2
	BF8QFlUlGRiLTak0+qKdYXPmCdp8V5nnf+rXjCB1Cmnz4gzi5ZlsXmnUB6DGpmKaTZXcPqDRLEV
	2Q8txog8mygy3Iqs1sG4D4Xds6jLYF5UNPq9BCBxaZXAz1T9Tbte2pufYc9r3yqJ2MDcnmrG5Mm
	DtcAlNakyMS4WO+DnlCxauquQ27I0rlHngTlL5YZ9OEH8D2PY2U/6fAx50c1Ex3KJuOvymDKu6y
	Z3mdwMETsQT+MjK99xyyYylPlcBFF/gQ47ycVGa3ouny6HzhMyVtK68LCVEOP0iB9dlkGmGE5On
	lD7V7Ie2stGRR7I1QyRXFQKCKnIL9dzScoRI/cPWFn1i2prw==
X-Received: by 2002:a05:6102:3594:b0:607:4fde:1921 with SMTP id ada2fe7eead31-6ec490c3d34mr2892895137.24.1780528285612;
        Wed, 03 Jun 2026 16:11:25 -0700 (PDT)
X-Received: by 2002:a05:6102:3594:b0:607:4fde:1921 with SMTP id ada2fe7eead31-6ec490c3d34mr2892873137.24.1780528285140;
        Wed, 03 Jun 2026 16:11:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ab61sm888369e87.45.2026.06.03.16.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:11:22 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:11:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm
 SMMU client tables
Message-ID: <sfxhpi5tg5x3mm3twxtafwn4v5tkxeyoyackz4g4agjwhlb7yw@752limezj4m4>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-5-aeac1b94faa7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603-shikra-display-v1-5-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfXwLIutsFI4ZWl
 23NaJwKeVE0JSbEsN87pw4Z4QMPT1aNdkCzDgRspGD2XzxSaaO6rLv1hagKKJ7xv0RhwCRDULEO
 MEggxb21fnOuAcPM8xJCVYIqNATS5l8ZFVGm6XTlL0ehlwkSigD0ki7ALySGzeAJMqaT1uyteZu
 A7xEC4HtTQnQBIRVUCvlasdVHxV5v/45FvXqUfkmL/jOQ2k6axmjCzBRJHMZeDzkf4oJ/wR5cAX
 rtgMak6SI6ZFzXknNoHuoq8KKFqtm866ST7m+A0EV+fj9TOkMrNeXmPtxlfoz43gtLB7odfGiFq
 E7iMhfY6McCyX12XyLHMFIONTMjscSqX18ALsAIDQblPisbVLm2KQ+Kc7clBROUDytE6U2U6lb1
 cX/cj/bi8j8+R7MyU6luUCpV2JuLsaP8rF6z7d5hU0giVVeRIRa0eaE34RdhQOwhcJvJtcyLF4J
 d6bx4eF3LEOJ2wyBLpw==
X-Proofpoint-ORIG-GUID: JOYue4cVOjSytUjX0KUID4GeW6wVvdqD
X-Proofpoint-GUID: JOYue4cVOjSytUjX0KUID4GeW6wVvdqD
X-Authority-Analysis: v=2.4 cv=ccniaHDM c=1 sm=1 tr=0 ts=6a20b49e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=AKL9z4wCTGGjPT63ffYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161127_516176_1620B7FA 
X-CRM114-Status: GOOD (  15.78  )
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

On Wed, Jun 03, 2026 at 08:29:30PM +0530, Nabige Aala wrote:
> Register the Shikra MDSS display subsystem in both the SMMU ACTLR
> client table (for TLB prefetch tuning) and the SMMU client match table.
> 
> Shikra MDSS uses qcom,shikra-mdss as its sole compatible string, so
> explicit entries are required — there is no fallback to qcom,qcm2290-mdss
> to fall back on. The prefetch settings mirror qcm2290-mdss
> (PREFETCH_SHALLOW | CPRE | CMTLB) as Shikra shares the same display
> hardware block.
> 
> No entry is needed in qcom_smmu_impl_of_match: Shikra's apps_smmu
> carries qcom,smmu-500 as a fallback and is covered by the catch-all
> entry there.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

NAK, use qcm2290 as a fallback. You won't need this patch.

-- 
With best wishes
Dmitry


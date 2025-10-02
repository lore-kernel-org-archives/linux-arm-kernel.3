Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E43CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 01:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7Od5VFbcggRAlxWiQ0g5qlG79Lv/bUugfwD4ZphtXA=; b=XsfHQK2WaTz2Ks7JOX2fVJ/yNN
	8b9+h6Rp7rEYJU2bWhg9Tnf0UCFdvDvbvcqSvWLGwhHAxTjyU/3jCbIQqqO73HkTfZ2CgtLp4ygkh
	t2Jek1mSTlOOFtNn4x45i4d7gSrt4FOYFIiGi/HA4zr4ZyMaLn9Z9PsEFL7oGPpwLrubp5OXX/cSh
	SaukYMvNZQ/of+Hqd47UjuwRLInIWHrJ7nKxLF7YjWRIJ1ENj3DmQ6k1NMVs0KWTOWioVyvbr6BsP
	ZOxahK152BdorucnYj2qI/Akfh5E5QJ9B2vUlH5FNLfG09UEKEJTTj95x78T7aBlQiu8c4eDV81rI
	k62i30JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47ny-00000009Mah-2FTX;
	Thu, 02 Oct 2025 01:08:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47nw-00000009MaB-0XF1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 01:08:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbwIV031237
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Oct 2025 01:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7Od5VFbcggRAlxWiQ0g5qlG79Lv/bUugfwD4ZphtXA=; b=kAJ89+YBtKdwEXA/
	EY/RUK7xmEzz0FzDZ2y2M4hb4nQW03UXjthgmqSMXl+ImeN+/c84JPJ4z8HcaqVC
	kGm6fdGj+l1I2rULN2UIyh4O0pChAybfBTc2nvMX6YO2tP3e98hlyY8LXxg1tNTg
	I6mEJCb8nERgWCIcFpiOcFKzJDTd5H28k1sXGIA9xlSAKhN7KwaLxPqz8+4ohQD1
	3kyP7S9zQp4J6FXn7fQft5TSCY9om/mTj+QadQk92PpVlwgMtKE3eM0d+RdDtAvD
	p3aHvlMB+EW/WNAI6VhRrzWF84AJR+Fq4DrZ8/VFS+Vy6CAfjtmkjdeGxqD+XI2m
	Vg80gQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr6b9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 01:08:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4deb67c61caso14559071cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 18:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759367298; x=1759972098;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7Od5VFbcggRAlxWiQ0g5qlG79Lv/bUugfwD4ZphtXA=;
        b=f4o+jvL+oTJC1FVDWml5GSwYoIMXlMuYb0PLKuZlW35vCarH/CO0/6SFJ1uWXwZApG
         g0MSEV4Sd8o/PR2954O7gyuWfU4ZMu80rG4m7VjJO6VdMj3g2zUU5S4kZ8NETpl8vUK/
         KY6ZdHAtOPu+CtiOjJW241UN2IbIBFtQEmc01s6X/f7y7k16tUPsbFrtSDiHgbxmk1Es
         HuVgxh71Otn1yc+AESR3ZT8SyovIalu9xPc/F7MaCM5IUdza0XnjWw/6qqndD5hvqDOR
         k/7GH2TKrJ/F/gkQWjpWF1aIKvCJJVOnLiE8GMIj+qJNqPVtcZoH0SrsphqOG3FtTonK
         TSjw==
X-Forwarded-Encrypted: i=1; AJvYcCX3fdvgMkJjhVmf6eeM7UCAMnNBwEL3DNfIjk0keZxLmr0GHS9BdWCGEJ/q02atH4ifrqGSG6A/ScIa/grGlPDn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4R6gRsTe9MaXtz+OpYpmxE5B6tlx9/AhDgQKKBl/keK8Vi7/U
	HhfPYIKM/H8hTToQXgaHXeHKrJzuC42oUu8a1NnrgFBSdCsZ2g/pyfPvcBKILjCYC9Ogc1vTeWD
	9mezQ26fMKVzlgEoHFNJMF50QMBVkjW9g0ieqUHgkfE1A1xBI1Hgd2UCe6M64PlReaCQoC0XeWV
	MYUA==
X-Gm-Gg: ASbGncsNZhZ5A2jUe3O6o8nor6STN1wgRyLnOdyTkUUHaalDxKVjT2pD53g98kh9mni
	sUJNVWnv+GRHwzdLBqjzu/IDoXvRBVJMhSGnqxlL6OTUJStYBHHB/YwBT8St6wA6ErtAi18xvoG
	qaaaw7Ybfg1d8bA9A9FNgQa0Abi7/Q2H7iLYEa0O3P61UI/s2nJszd/klO3RKJ34cKaeUNJUn9F
	MU1zrpz62MaCRmlFUXHUcQ670hP7HX6/G6Ox7fwnzsWdqBxn97Fo4S4jU6cMTKhvkc3Hn9EunZm
	p1/l012nHTiKH6WtPtVQM/K9TAoqkF8PQ7rFH3dcME+zvQqJZK7dXWrJcRUoli2nr3t3g9LD55d
	mSTSBVOrz2RI6xfqJN0vC4dhU4TuVeZdZTLNXo32NA3rherslQn2WdR/pmA==
X-Received: by 2002:a05:622a:53c7:b0:4b7:aa52:a6f3 with SMTP id d75a77b69052e-4e41df6e97dmr78906481cf.39.1759367297939;
        Wed, 01 Oct 2025 18:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrZaqEqf2UGQPe+mVMDuKAcfgbDUzaQ4FB8Nc046Mcl+O0GtaoEhYIkuD7lCFi+fSNe0W6CA==
X-Received: by 2002:a05:622a:53c7:b0:4b7:aa52:a6f3 with SMTP id d75a77b69052e-4e41df6e97dmr78906061cf.39.1759367297485;
        Wed, 01 Oct 2025 18:08:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba273eeasm2860421fa.9.2025.10.01.18.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 18:08:15 -0700 (PDT)
Date: Thu, 2 Oct 2025 04:08:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, rob.clark@oss.qualcomm.com,
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
Subject: Re: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
Message-ID: <o55el5zduao57uomzm6zeqslxjg7rtzfbttk7gq6gvsatapktx@5lflwspish24>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
 <ks3ppjsy35wka2at5nxrr74l5mvzr4l6ovm5ncohanu2gn3ytl@gt2mzwjehq73>
 <CACSVV00AFEJVti7BryA-_sosmBKCuDtX7+NEi4aL4X98AqR1Qg@mail.gmail.com>
 <CACu1E7H0Y9wLwN=ztx+YSQLMQuqOF0hYPqvF-VdXyFW65og6og@mail.gmail.com>
 <845ea929-d245-44b1-a0f5-2ea67ca595d9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <845ea929-d245-44b1-a0f5-2ea67ca595d9@oss.qualcomm.com>
X-Proofpoint-GUID: VDr24PQ8FVxjD_9-ik38NC1kSHTT3my8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXzC6hHJ2IG3Zx
 hlfpMnNhPeBYNN2ZIxcpwgtFktVd4X5Pp50L8MWGzc9AeFr1pEwNH4XdOoAHyObmhLllXLxCXzs
 TQ3MMslUqDraAEent8h7LL0Kh3dTVpyssRhdF8huufjNnWgXoc0LJKXWhSRUBe8Dt3IAujv+8md
 sVKtMN/IjkBkGPik8DdaeCx8+REPZ9BGnNUqMkNyZLx+NEoLD4uDmtdsNwI9CBLjtox6X6k56cx
 C7EGY8gA/jcJDcbRhqcT9t2j07B7RKIDLMsU3rYbB+Xr0dUahN4K0yKy1wvCVUUWDRH5Bq9MAgf
 NhPsTtqYDuIlbch7uGgxDpHZCgfmXJV558pKgA9Evlo9hqIbnWtLLShZyAPHprzyMS3ROXdw3E+
 qcdAQt4DO+g9F7ZF73jsynwNCQr1Pw==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68ddd083 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3yd5t0Cfpw69QvuzZ3oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: VDr24PQ8FVxjD_9-ik38NC1kSHTT3my8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_180820_176286_1A7A4EEA 
X-CRM114-Status: GOOD (  37.03  )
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

On Thu, Oct 02, 2025 at 02:32:21AM +0530, Akhil P Oommen wrote:
> On 9/30/2025 2:11 PM, Connor Abbott wrote:
> > On Tue, Sep 30, 2025 at 10:08 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> > > 
> > > On Tue, Sep 30, 2025 at 12:43 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > 
> > > > On Tue, Sep 30, 2025 at 11:18:17AM +0530, Akhil P Oommen wrote:
> > > > > A8x is the next generation of Adreno GPUs, featuring a significant
> > > > > hardware design change. A major update to the design is the introduction
> > > > > of Slice architecture. Slices are sort of mini-GPUs within the GPU which
> > > > > are more independent in processing Graphics and compute workloads. Also,
> > > > > in addition to the BV and BR pipe we saw in A7x, CP has more concurrency
> > > > > with additional pipes.
> > > > > 
> > > > > From a software interface perspective, these changes have a significant
> > > > > impact on the KMD side. First, the GPU register space has been extensively
> > > > > reorganized. Second, to avoid  a register space explosion caused by the
> > > > > new slice architecture and additional pipes, many registers are now
> > > > > virtualized, instead of duplicated as in A7x. KMD must configure an
> > > > > aperture register with the appropriate slice and pipe ID before accessing
> > > > > these virtualized registers.
> > > > > 
> > > > > This patch adds only a skeleton support for the A8x family. An A8x GPU
> > > > > support will be added in an upcoming patch.
> > > > 
> > > > Consider this lands in a commit message. What would it mean in the Git
> > > > history?
> 
> Commit text is not just for git history. This sentence is for a reviewer who
> is going through the patches one by one.

You can put this in the commit message (in the git tree) under three
dashes:

----- CUT ----
drm: subject

Foo bar baz.

SoB: you
---

All the notes and details  that will be ignored by git-am.
----- CUT ----



> > > > > @@ -2561,10 +2583,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
> > > > >       adreno_gpu->base.hw_apriv =
> > > > >               !!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
> > > > > 
> > > > > -     /* gpu->info only gets assigned in adreno_gpu_init() */
> > > > > -     is_a7xx = config->info->family == ADRENO_7XX_GEN1 ||
> > > > > -               config->info->family == ADRENO_7XX_GEN2 ||
> > > > > -               config->info->family == ADRENO_7XX_GEN3;
> > > > > +     /* gpu->info only gets assigned in adreno_gpu_init(). A8x is included intentionally */
> > > > > +     is_a7xx = config->info->family >= ADRENO_7XX_GEN1;
> > > > 
> > > > Is A8xx also a part of is_a7xx? What about the A9XX which will come at
> > > > some point in future?
> 
> I think this is okay for now. I have a separate patch which reworks the
> cx_mem initialization. That will completely remove the above ugliness.

Ack.


-- 
With best wishes
Dmitry


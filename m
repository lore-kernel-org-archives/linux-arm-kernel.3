Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D895D3900B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzjToC7bxlPEMovlmHQv7V+w1bYZSj7+lrr8ySIusVo=; b=TP1EMFwOaECIvtQ35Fao7p1lfG
	SRJjjg8hOgGapt348E5xCZrUQOlfx3TyjGzW6ARTHBFiTGWw1NkY+wlf3P0phYUPLRxfeLN2NRWH3
	BMdY+RMEjXN700hGiDxPnCO0SDFvLm0ZFqTSP9UKV5ZKHycAy6pyM/r86Riz9/Uk2mbz5cug9zc1l
	+elsCikM1SwTuOZdreH5vbXCtEUJERNFZXjDd9QYUpptoTpGoYPgaCMeY1d7r0x/lfQ39GPiCu0JP
	enTsr79bg1TyILMFwhiHuvJ98pjMnCz+4hEKzM98azjkfd0ftV+dzPPRDeouUDy9XkUj3HYAaaoaS
	+1Id/4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6gQ-0000000AVcl-2yrm;
	Wed, 14 Jan 2026 19:37:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6gO-0000000AVc5-0Vq5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 19:37:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ECriBw2735989
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 19:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pzjToC7bxlPEMovlmHQv7V+w1bYZSj7+lrr8ySIusVo=; b=f0Gh5tZ32v/7Loh4
	vP7YHCRyPfdQRbp8S6AjYTwNrv4MN+oPtiJ9YaDZH/WygZJU3gQwZR6opHzaLpMd
	j9U/mTC1H2HxTOq+pLJ0gTdsBRQKaMwm7GOPpettMHGyyd8zA6IsdRNhTc8fKUhR
	mtj9R2t5h4/bIV2Q7cIBmMaV/WwcS/2IJc993ixeooJbJ6ylaO/Z1uEzKq13vbBI
	EnnXEw2T3lQQ583qzJuHqu8QghqpYHgRhVzvrWh9awwu4LeQSnQzmpF87fSCZi2K
	SFbzGjHCHFLcploNBZ1Lm/y/tLOs8qdQ4u2nyUdB6oU+V1gG/+/oGpemB4n7plY8
	vjwFEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5hdkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 19:37:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52af6855fso23231485a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 11:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768419450; x=1769024250; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pzjToC7bxlPEMovlmHQv7V+w1bYZSj7+lrr8ySIusVo=;
        b=c7HfsOU1f0XzVP8bZE4+yJb3sChu8qqc7/xr7Dr6xv4yHckxtIB6Rp1qw9xGvJ+mxG
         P06SGEYz1Ou+AJRp6E59ZkIIXyODV7ex03O2NvM7pUYtowypGVyKbrps8BGKtH0HDaLV
         zapBQVgSVL+xVHafL00SQjGStl8GCoAJ6HBCYRA0AjPDctJybD5AVEZNZ9j1AEcXWtz/
         lfolbwyaKaz57XuCoiyg9qeV+rWh7RYc7Jjrggop0+eJJEu+cVRFtkCUT6S0tlKY5lx6
         CdZ1rAyIR6stYl3WZbok7BN+wr/0TBUms974VtTNyGN+HuS3r/q9Sp0GeHD7FSF0btr3
         eJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768419450; x=1769024250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzjToC7bxlPEMovlmHQv7V+w1bYZSj7+lrr8ySIusVo=;
        b=Ysp9S+f1Gyl6zU0kQb6KWN57zfC06aig37qUi4XhrWMco6GzcB+tZ3wb+UU/yOTUGj
         bd7WQ2tf58SPKSt/9hiXGnVeu6o99NzW41gcJgtBCHsTzi85ebK+yvW12HsKEatZeDIt
         B3vGeV8hh+MJSAx3JJw5JZjrvK8qNMiuRqA4Nhh50KDm6dhDCQDEC1lhrm5Ouet1UCDc
         zhPbA9De/uAqpziVmhvb2IlMqd2RgyYoeTGVW6LcUtN37/zS30RegOA3WTrcKbOSP1Nh
         HynijrEPRQ/8adaRCDpFrEZnz54GnjMdT+FqFx+m/PQNgInDtiDMkWQqz4ADiqH/nVTt
         IQqA==
X-Forwarded-Encrypted: i=1; AJvYcCWkaHPeB/nTJ1je4BBFHUEtrWgoq4YO2O6qRwkxzwf6G5VH5AaBT9srEXbvvcVYJ4dokdIace8WU0KFwU8XIU/U@lists.infradead.org
X-Gm-Message-State: AOJu0YyUnm8oleHJONbw9mC9jku/xxBdg2xdnwbMBXsPxB0TnyPlqsjz
	4jS0j+gsege1FUAj/yRYPG/t0SBACVdYQBMvwBvyA8kTG3wndZcO76yrCubeqwO3QcaQVsqywrY
	x4tFkWb8R4VGLMAZQke6zjjozJhcwiPjoFRgi7ER5wwIrG+miAyucXExnUmzNT3TZsgqHoUnreH
	CpCA==
X-Gm-Gg: AY/fxX7yQcZWv5tbH6/qsa9jwhU08+6sIuhg7GS+mtwef6QIR3rXayzfYmbZtKYYB5L
	NxIKfzQkyVFID0tWAorqvuTVSiGRDnbrXrbyePXqQl/Y9cv/AmclwwcQ+ZH5xqcmSOnyJ0oQ/k8
	uAzJVUdPa3qbJHDcA8kSG6S0c0eivl79metnrX8y0KUWo/6Kc5rQS+EYRcAnejDULxTb+28pK3o
	I11XsYpniXgGH+jSp2M3rZ2hk+JZ8Ey3iR4MSc0R12a1PbG8eSH7NNAn6iLLta0XLH5yRPIb93r
	Lv3kpPzz1XlqZO0YTofiuWXIDEen1PGUG6kZO3EU78Lcwv157ijY4OM5AccEaGwMORRHdAqXHJq
	cJk5qlL2tOjde7YpAHx7zUvZszTGprCR4m0KaYlX3ls9N+Um12ULuNPRklKArg9U0mtxuoxI1XA
	T6ZLFrVSgeeU90gsirL3BZ5Kc=
X-Received: by 2002:a05:620a:1a83:b0:8c3:6f44:46c0 with SMTP id af79cd13be357-8c52fb32ae4mr509415185a.16.1768419449943;
        Wed, 14 Jan 2026 11:37:29 -0800 (PST)
X-Received: by 2002:a05:620a:1a83:b0:8c3:6f44:46c0 with SMTP id af79cd13be357-8c52fb32ae4mr509410985a.16.1768419449413;
        Wed, 14 Jan 2026 11:37:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8a9bddsm55420301fa.25.2026.01.14.11.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 11:37:27 -0800 (PST)
Date: Wed, 14 Jan 2026 21:37:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <7jhqea42453esyx4sv3okowy7jrdcrd4sxjpm4t2snsyi3nfl4@ieja4c4q3jj5>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <7ruiccdm7q5fg2pixmszr3fqvclvymdlkv4x4xbavkaeczrxgc@5l6usxqfi5fe>
 <619f20eb-77e4-4250-ba5e-78db741ebbef@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <619f20eb-77e4-4250-ba5e-78db741ebbef@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2MiBTYWx0ZWRfXz95B3yzLSRml
 iAu1X/Flw5i6rHD4IZRw1vNOndU946lfTpuXiMTTVAC4oPxUvaGrxvE3D5bc8+SjEwDPodjUA6o
 Wq6/dKZ3ehO+4eciRU/hGO1BZYTZDlEuLDNFBpcUObRENLbNo4+ylMHuRqsqMd/0rgzi00pI/Y2
 +2zYjAr7EWB9cz1IMikLOJ/NtuhFvw3z82s/FHH85wun7WaMQ44aVV7okCeqL8Wa5Gj0IROyt1a
 un9JnrQ1J0B7xU1/r+R+3Snx28CyjSnRW39oh1qtAo/cv+ki80sqIhE8+tPJTDgigm6GRE46bpw
 +39k14XPdO8DH6t5PbHNqZYvtbyqrRFz79LniDxQ09xNURp/Ah8RRImqPg3xUo2VoMA8HE4iapE
 Nv5LgTVsLAf96Ma8yfNv+sCIjpGx3gT0Plv+Rp4QUHsth4QZCkU62pFvnsMlhWIJFct+goKBHNC
 M9iIc4OeF8WdAQHbCcA==
X-Proofpoint-ORIG-GUID: DNwkdH-67gHkw0Zae1j3UNOB8JwsS3M5
X-Proofpoint-GUID: DNwkdH-67gHkw0Zae1j3UNOB8JwsS3M5
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=6967f07a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1I45dW-D_eH1AIk6hwcA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_113732_295450_A253F62A 
X-CRM114-Status: GOOD (  32.11  )
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

On Wed, Jan 14, 2026 at 10:04:21AM -0800, Satya Durga Srinivasu Prabhala wrote:
> Hello Dmitry,
> 
> On 1/13/2026 3:25 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > > 
> > > On platforms where a vendor SoC driver already exposes widely-consumed
> > > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > > 
> > > Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> > > prefer SMCCC over a vendor driver can explicitly enable it.
> > NAK, the userspace should not depend on the exact kernel configuration.
> > Consider working with distribution kernels, which would enable this
> > driver anyway.
> As I mentioned in the other replies, vendor interface exists before the
> standard
> interface and user space heavily relies on soc0 already. If not disabling
> the
> SMCCC SOC ID by default. I believe, we should  at-least have a way to make
> sure vendors can disable SMCCC SOC ID by some means or have vendor
> interface takes precedence.

Please correct me if I'm wrong, what do you observe? SMCCC device on
soc0 and qcom_socinfo at soc1?

In such a case the ABI file, Documentation/ABI/testing/sysfs-devices-soc clearly
defines that there might be several different SoC devices (identified by
different drivers, etc). If the userspace depends on qcom_socinfo device
being soc0, then the userspace is broken.

Last, but not least, the soc_id format is documented in the ABI
document. It is clearly allowed to have jep106 format in the soc_id. So,
I think, you have two options: disable SMCCC 1.2+ in the firmware or
adapt the userspace. You can't control e.g. the kernel that will be
running on your platform (it very well can be a standard distro kernel
from Debian, Ubuntu or Fedora, which obviously will have that driver
enabled).

> 
> Best,
> Satya
> > 
> > > This avoids unexpected format changes and keeps the generic SoC sysfs
> > > stable on systems that rely on vendor-specific identification.
> > > 
> > > [1]
> > > Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
> > > 
> > > Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
> > > ---
> > >   drivers/firmware/smccc/Kconfig | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 

-- 
With best wishes
Dmitry


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32268606A339
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 04:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qUFtFvDO;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWrqy98D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SSDZsahN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kKSfGYR+tjvF1v+s8GT4+Cm2kzZ0C6NBq5JcuXlorDo=; b=qUFtFvDOAGuVnk
	I0xeL+cNAZvL7qP7z0sfrWZGPRafrhOOYYch08Im6EAU3sNPxmgh+OxF6F4ZkSYfFd6qnL1E193t/
	l3lGzQ6xyQeB6+WDqQ0vCd9Ff03YU98uq2FGDkYiyTQRlYr+Qi0RH6jFSYpqw98O3GuFRtd0Z+Q7b
	9NZgQfapZA8ow7z6QrJZGWOlfj3zceD2H6cmmobkk6X2Lr8ewNrXKKiN5zppsRZS1J9A4HKj3Tour
	vHCQhm2a038JoZljEOp2Dm6lQySlxGbw44VuxHdwWQWKQAxqB8njMoQscEQdWnaaw08snNBlvdKiU
	Hd7fSgNtdWgOdCDlfEAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOof9-00000007jPb-3mn0;
	Thu, 05 Nov 2026 04:01:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOof7-00000007jOh-0JI9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 04:01:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50oVp12889703
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Nov 2026 04:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kKSfGYR+tjvF1v+s8GT4+Cm2kzZ0C6NBq5JcuXlorDo=; b=pWrqy98DdE6XK6ZQ
	LDWbSh1PNLpblLFWb2e83Gnnjoixdz5a1N6U9NbjVvP70k6DPtZKq6n17bLwOn5X
	dlfsEvOHHzcgFaGDzLyvy8vPhk7o7+U2ru/Lc3C/fEx2kLQCiVv8UMvUXTfvgsjX
	r0bAvSuYYg0XafUjK/wdA8TPGfpSAPp8HshjdXWasrkCloWwfxwX7x6KLl2tWTAJ
	iGbSsFa91k8geKgGdEc2YIjknj8KaftWVvhzwGh3G/lPhv4UKTyksmeIG8TUteuu
	PpKWDIz1IhvW2RmR1ZuR/thyBjbINp0XIrJv1EckD7Sk2MIzzJi20nMs7PjadFwp
	ikM6vg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br30pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:01:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a223755e4so5027634eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 20:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793851276; x=1794456076; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kKSfGYR+tjvF1v+s8GT4+Cm2kzZ0C6NBq5JcuXlorDo=;
        b=SSDZsahNHceP2gRMmaim/3pfbileQiSauw3OJu+gxrq91tAuGhIIECny2sOSZ8lTCc
         svG8OnXt3tBW1L7VguNma/K71icx3hFr0kMWuVBimOswU4iXCbPiGsVKOPrf8qOKD2FJ
         TrcKkPPLj1A/D/W6aQxH9WDhlbwPtxi8Pd7qtcDNwWZqsoMy7KJche9j2uUoRi/N2aaT
         AXFNm7B+vE1dX1JtRFuh6XzWLhswibXesl5lticO4QqfSiGLqhHV1IcK4KlDp4MccPqq
         hp8QxifzaPTQM6SwL6GWaSQqDR7l1H2Riah1nbAYGCWZHWk6VfxXd8WDW+Q2VD/LUPFD
         s1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793851276; x=1794456076;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKSfGYR+tjvF1v+s8GT4+Cm2kzZ0C6NBq5JcuXlorDo=;
        b=fLJiqWq6TB5pZs4WDhcqLyDQzRGkeR4ZJF5k0Dz4BjMeUFhBsa45LFB0RzO8qyJOob
         g0Htz92OJQ8qPy8IYj2wd5/zOYxm3XAKErK5quBHDu1Kk0ETon87eStwimO7PYzlnMBp
         b2s6NW239KW9KbDYMoUW245GyDKFJoac3B3DzwdLD3r1uZGPiNRJEIQv18wRtyatU8HK
         sclsoVwk3rHlIZDt+/vPA40AT2SAy8ze/eFsmLV4amYlZq6wERwQSqPUs4Z+o0Khl2sD
         HidIp69jj1hds3chq7AHfVjCdeoC0mRXvwWZaffyY3PwNQ1j8rNGkoKOPPUTYGGNfQdp
         YaxA==
X-Forwarded-Encrypted: i=1; AKwUvBzkwBtw2mhgy1oGlamjDaVcZap+7soMP4EsBZUh89l7bAdTcvD7qbsMVdlK0WAQUDcXcnGnPGmPG+Q7jNVqpEGf@lists.infradead.org
X-Gm-Message-State: APuU4Z8W4YlHfqhMXKywlRZp8qmetoO/IgsohZsZfixenDc3DqIQ5FKc
	6OpQGhfbJHjMiawEf2nG4/fZkTGN/yHEvVYKq/ak6OP2v8kKZhO8jrkBE/gM+9rrsVjtqEfe/J1
	CpNTSRsEmFtHPEkTca9s49FoEbeIXgjOguhCyWxyYE7jBY0ykqdMrDWFA0Bki6ewJ+dXX6Ppb+b
	W/3g==
X-Gm-Gg: AYBFou0uFmpWUoe3cSl7ONihMkAhWtyCeIvyQo6FiNVLmkzvgOCKhuFZzw1tlq0yHfB
	JbPHl/zM942GHv0ZgtlIBmuX5P2BgM2ra+7sLIWce1Af1pH/Hjwy3WRZu4TwPg9W95c4JzbXatW
	unoKMQRBjGtvWVlRlYaVxtSTCPgtgbydVkZK174gA302lmhKHwlMMCdQvjoylNSPU96Ra+ajoNM
	unZDAbpHfoDqdNc1+oTbdSHsG94YNgyTPembuvMUMGPH28qXm9hCTP5NFZuxDbz3LwuG66mMdbU
	R2xejPN1YIbxjdrFaGBHiHV+p91qxivclN/BvxdfTJixHg3KPQNBsO/1CIbdW+PRsc9h4Sx8z6R
	lDAA+Mp+KDKQaCYu3FOp2ROKE+IzxaWBh2tVsJjiegkYYm1ufLHNAuk3jk34VWa68Zdc+P6y+9a
	UD0GUT5sLfCj4gj8Inf4xGTYEgai0=
X-Received: by 2002:a05:693c:88c9:20b0:36a:18e2:64c with SMTP id 5a478bee46e88-36a4232bf0fmr27185677eec.11.1793851275302;
        Wed, 04 Nov 2026 20:01:15 -0800 (PST)
X-Received: by 2002:a05:693c:88c9:20b0:36a:18e2:64c with SMTP id 5a478bee46e88-36a4232bf0fmr27185644eec.11.1793851274719;
        Wed, 04 Nov 2026 20:01:14 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d3754sm16263984eec.14.2026.11.04.20.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:01:14 -0800 (PST)
Date: Wed, 4 Nov 2026 20:01:09 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Santino Wang (=?utf-8?Q?=E7=8E=8B=E4=BF=8A=E5=82=91?=)"
 <Santino.Wang@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Fred-WY Chen (=?utf-8?Q?=E9=99=B3=E5=A8=81=E5=AE=87?=)"
 <Fred-WY.Chen@mediatek.com>,
        "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
        "Light Chen (=?utf-8?Q?=E9=99=B3=E6=98=B1?=
 =?utf-8?Q?=E5=85=89?=)" <Light.Chen@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        Arnab Layek
 <Arnab.Layek@mediatek.com>
Subject: Re: [RFC PATCH 03/11] soc: mediatek: dram-ecc: add tracepoints
Message-ID: <20261104200109.00002de4@oss.qualcomm.com>
In-Reply-To: <3cc31b2f5cc226561c7c6642bcaeb85d3e22e9ff.camel@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102092334.138759-4-santino.wang@mediatek.com>
	<20261102115758.00005a16@oss.qualcomm.com>
	<3cc31b2f5cc226561c7c6642bcaeb85d3e22e9ff.camel@mediatek.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAxNSBTYWx0ZWRfX1mi+jNqZ4Eg0
 Gr/8IdnNwc4cmvbMNiwhFTdPsRmGHDKgMkc+S7wGZB/R3Dxtph3QTdg1EXknm3UZWyBB8sYsz6G
 /c+cyD8Ws3kRY4QI4jf7vW7i24wcgQ1cG74e5tEUqQV9AVh8t1kPaEKZiATisxg5G7b9i9PnwGF
 I8z/fFYK1NLSwjI0Eioa0bOdZ1/Pryu9GzZttbSYFIPMonFVov5YCu3u1Kc3CPHT5G1Em0q6oJl
 nHNnIRUfD4Y5SrlSlfV9MUtdPTDdgPcZMjeLhKVXWovTXmiDXS7xrbvR6xoIBddxqjUtKByggG3
 zERLebovNacHIs/dVW20mQUEDL4OfNkm6ARy1mTsALK5zGrFVbBjjEbWWOcZDxMrIgT3JVcI+c7
 4v1K3o3flZMmdvXdBUj+57n2sv5lBFwJOnaomBdGQfskkj4JmroikuWNfzbq/FZnx254oAePxgm
 S5PMp73rYF6PdRwZpJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAxNSBTYWx0ZWRfX1bnHXePablVH
 ZfjxS976HvUd+ReeHyoTbI3fpIIBx2gv+TYKXz/WYK93pnsxY8ILs7zFJyT0m0YVb3PCG6d9WUO
 Z3FPMfYtjltMvwk6lF7uY7XGoODeDv4=
X-Proofpoint-GUID: yty2lvVHY7cDIr2ckih1k4gacznsgp3k
X-Proofpoint-ORIG-GUID: yty2lvVHY7cDIr2ckih1k4gacznsgp3k
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aebff8c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=mpaa-ttXAAAA:8 a=016yWS8getB5-smde8QA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_200117_125602_C6A513D8 
X-CRM114-Status: GOOD (  29.33  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 4 Nov 2026 02:44:05 +0000
Santino Wang (=E7=8E=8B=E4=BF=8A=E5=82=91) <Santino.Wang@mediatek.com> wrot=
e:

> Hi Jonathan,
>=20
>   I checked UEFI 2.11 Appendix N.2.5 and N.2.6. Both sections
>   define Node, Card, Module and Device fields, but I could not
>   find an explicit channel or subchannel field in Memory Error
>   Section 2.
>=20
>   On MT8992, these identify the DRAM channel and the subchannel
>   within that channel. Could you clarify which standard fields
>   or encoding should represent these two indices, particularly
>   the subchannel?


Ah. You are indeed correct.  My mistake!  I confused things with the CXL
spec equivalent which is fairly tightly bound to these entrees but
apparently gained a channel and sub channel over them.

It would be a straight forward addition.  These days UEFI has a code
first proposal path that would rapidly solve this gap.

The process would start with a public discussion (this one fits
that requirement) then a ticket filed on
https://github.com/tianocore/edk2/issues?q=3Dis%3Aissue+state%3Aopen+label%=
3Atype%3Acode-first

Any example of a related one is:
https://github.com/tianocore/edk2/issues/13430

Alternatively you could encode it in the Device which would be
a slight abuse of the current spec, so not sure I'd recommend
doing that. Binding channel to this would be fine as a given
device is only on one channel, but that is more of a stretch
given subchannels in ddr5 and later.

I'd strong favor not inventing a new error record unless you
absolutely have to as that adds burden for all the userspace
tooling etc.

Jonathan



>=20
> Thanks
> Santino
>=20
> On Mon, 2026-11-02 at 11:57 -0800, Jonathan Cameron wrote:
> >=20
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >  =20
> > > diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.c
> > > b/drivers/soc/mediatek/dram-ecc/core/trace.c
> > > new file mode 100644
> > > index 000000000000..9a8b20e48069
> > > --- /dev/null
> > > +++ b/drivers/soc/mediatek/dram-ecc/core/trace.c
> > > @@ -0,0 +1,6 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2026 MediaTek Inc.
> > > + */
> > > +#define CREATE_TRACE_POINTS
> > > +#include "trace.h"
> > > diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.h
> > > b/drivers/soc/mediatek/dram-ecc/core/trace.h
> > > new file mode 100644
> > > index 000000000000..d603fc38f0a7
> > > --- /dev/null
> > > +++ b/drivers/soc/mediatek/dram-ecc/core/trace.h
> > > @@ -0,0 +1,119 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright (c) 2026 MediaTek Inc.
> > > + */
> > > +#undef TRACE_SYSTEM
> > > +#define TRACE_SYSTEM mtk_dram_ecc
> > > +
> > > +#if !defined(_TRACE_MTK_DRAM_ECC_H) ||
> > > defined(TRACE_HEADER_MULTI_READ)
> > > +#define _TRACE_MTK_DRAM_ECC_H
> > > +
> > > +#include <linux/tracepoint.h>
> > > +
> > > +/* driver lifecycle - state: 0=3Dinit, 1=3Dexit */
> > > +
> > > +TRACE_EVENT(mtk_dram_ecc_lifecycle,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(int state),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(int, state)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->state =3D state;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_printk("%s", __entry->state ? "driver re=
moved" : "driver
> > > initialized")
> > > +);
> > > +
> > > +/*
> > > + * ECC events - spa/channel/subchannel/rank/bank/row/column
> > > decoded from the
> > > + * ECCERR_INFO0/1 entry that determined severity (see
> > > ghes_notifier.c),
> > > + * mirroring ATF dram_ecc/mt8992/fiq.c's decode. No agent/master
> > > ID: ATF's
> > > + * GHES vendor section doesn't compute them (see
> > > mtk_dram_ecc_event.h).
> > > + */
> > > +
> > > +TRACE_EVENT(mtk_dram_ecc_ce, =20
> >=20
> > Why push these through a custom tracepoint?=C2=A0 This look very similar
> > to what
> > is in the Memory Error Section 2 CPER.
> >  =20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(u64 spa, u8 channel, u8 subch, u16=
 rank, u16 bank,
> > > u32 row,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 u16 column),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(spa, channel, subch, rank, bank, ro=
w, column),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u64, spa)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u8, channel)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u8, subch)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u16, rank)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u16, bank)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u32, row)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u16, column)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->spa=C2=A0=C2=A0=C2=A0=C2=A0 =3D spa;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->channel =3D channel;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->subch=C2=A0=C2=A0 =3D subch;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->rank=C2=A0=C2=A0=C2=A0 =3D rank;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->bank=C2=A0=C2=A0=C2=A0 =3D bank;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->row=C2=A0=C2=A0=C2=A0=C2=A0 =3D row;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->column=C2=A0 =3D column;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_printk("spa=3D0x%016llx ch=3D%u subch=3D=
%u rank=3D%u bank=3D%u
> > > row=3D%u column=3D%u",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __entry->spa, __entry->channel, __entry->subch,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __entry->rank, __entry->bank, __entry->row,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __entry->column)
> > > +);
> > > +
> > > +TRACE_EVENT(mtk_dram_ecc_uce,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(u64 spa, u8 channel, u8 subch, u16=
 rank, u16 bank,
> > > u32 row,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 u16 column),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(spa, channel, subch, rank, bank, ro=
w, column),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u64, spa)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u8, channel)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u8, subch)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u16, rank)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u16, bank)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u32, row)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __field(u16, column)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->spa=C2=A0=C2=A0=C2=A0=C2=A0 =3D spa;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->channel =3D channel;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->subch=C2=A0=C2=A0 =3D subch;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->rank=C2=A0=C2=A0=C2=A0 =3D rank;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->bank=C2=A0=C2=A0=C2=A0 =3D bank;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->row=C2=A0=C2=A0=C2=A0=C2=A0 =3D row;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry->column=C2=A0 =3D column;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 ),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 TP_printk("spa=3D0x%016llx ch=3D%u subch=3D=
%u rank=3D%u bank=3D%u
> > > row=3D%u column=3D%u",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __entry->spa, __entry->channel, __entry->subch,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __entry->rank, __entry->bank, __entry->row,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __entry->column)
> > > +); =20
> >  =20
>=20



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF788606D804
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M5upyW2l;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l14XjqE4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+43Nol+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=; b=M5upyW2lSqrT0z
	qtBa2W2ZVAXh/rzUhaU/dQphApkcBGAuy0wEZqhiQcfa9bz27uDd2uXr20Ja2FiPz1u4GOd9NpYTd
	1J5yOKCds9Wxbk4QojJ4TDpKQfj5j2I/l6Vxp1c/TfAgorYlPaMd9KEJqQUE5xoSsUfLO/1UPPxQe
	naDzoIj6OmGWS3TkDQ9w/SpGATWYpsrgQ3jU8QfzlTI4Rj9bTUSxXYlnwquVapt5P0VwzkTTq0lCN
	mGDBylGMpSFBk2pEHRWmtRdvCKRKO/nahWj0ch2o6x5/O0CRdf/qAm8sRrckzfph9MFYXCh/YSNt2
	c7bknrs8uQyViBc7udUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1km-0000000A2u8-1mkv;
	Thu, 05 Nov 2026 18:00:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1kj-0000000A2sJ-2rqW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:59:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeVox373828
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Nov 2026 17:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=; b=l14XjqE4iAeaylTw
	udgrt5Fz/NBNSZujhmgBHfQbVeUdVAnfcdzy+5JxCYMrm8RwQiUY4dvtYrvyPFNE
	O+7HSqjZCGjLWJz0keLVrobm+Pig1cRLkWSZ494lXWuJ26XaPzR12dIdmaI3P3Qz
	/Sfuqnc2UoIs8f0s8NRrDvr7t6BEWqaLstla7bVvVVohMCxMa9bmEDKZbqSQTO6u
	Rk67HNB+/VS7G7eobiJHoZAEg32daNlxHV2zNnBOZRXrspsOLFr9ooaBn1snM9DV
	Lw/gFGIkrAB91na7p6PrgBoyMjY3yXD5RzOgm+aSxmZscf1phwp8jjMG6Yd1O9uc
	IEnxxg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksqb3s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 17:59:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so928114eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 09:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793901596; x=1794506396; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=;
        b=A+43Nol+lAvxl1FNLmGKF7jHZvhdCrqRgOYyFUr08vgFiDd4Hdu+y32gvZN4SZcbst
         W/7hhcfj287TpUnjiCwrPYDv0omgd11ssYM6GXYRvuRCskWowXBVs3/RaTkEPu5xfGuo
         bMpl+iovg6gdGmOmDd3COKYwwWNrr1jjmOgQuIsjwGRmkrcJFSmpnh5pZWx+N5MrMuD/
         7VY9VSFNg1twr/5sguWviY7wtD20h3KL0rWXdt2U4NpoNr7n2Xg25tqEjz7mZYkZeXYs
         px5Pqd1PDTHW1PvYBfPahUVsaw/82jfG7N4Z/mY84k59xtSf4+wamMpMfg1wWqs0YClw
         eY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901596; x=1794506396;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=;
        b=MPgZLTjyron3I4EVji1uqXdk4HNeL+9isZCSe93kaGTpoQXJpbbs4bNNRTTXtRjSlg
         vejA0dx2qeJtIljdmnMzjkNATrjGgL6M3yKw+PerdVXGy7uAipjaMvBsU+1AfdXEMpHo
         HwLpOD1lkVH+1rO46ELS07PdyCmRXofvKimpSaSnLbvnGlrSVT/yN2Dk7TDhyyfqd3MN
         3J6e14IXyDvWucaHwjnakDMtyDoQhZGRilRRNwH+ZBFGD6JLiu0VJPZ0O9Zj9DE9SHyY
         GTvEVTk7MKuY4HEeFCDHuCceqF87QHSmC/QZuRd4Y1B4Zan9KABGfn2IYoqzJKorE2PR
         4y6w==
X-Forwarded-Encrypted: i=1; AKwUvBymeXKVUDhDv0j4mEEA0B+EKyGjAEpF5Se35wUzoHXcGKV3ESRWhQZtWAd9mYGdhwAH1HYDLDOEFXdCPEJdOKl2@lists.infradead.org
X-Gm-Message-State: APuU4Z//iNCnNkvGkGSqQL3ARV0n2auWwl5Rs1JKyAissES1DGzidOFW
	5hi1HdlzOxTie7u4TW0x2pubkEGdUWHlakbZNtUYR5PYbEaNlTl+e3VpN81HSmaeu6Qp69RAYqJ
	lpyKxX9qMS4rWcW0xGlPBBc9Xuq5aUX/chG09T5NklyuhpEBKEzc3WcZql7WDjUvwSl12qIV/y6
	FmWQ==
X-Gm-Gg: AYBFou1MHD1jsY69uzC9mmrBJ41rUqyK6GMtZN9PRUPNj6nwlIDq/JTNLAmy7B0fv1u
	EtaIpsh+PMnZGPhsFpEamnPPmzQ8iTB71PIXF5gmocZ8BADStndXUgV5VsAyLIvkPv44QBhzIUG
	DZky6PDOGJB3qw8ccfQLKxv/hXmkop9gvxmG5faI2k43ZCfsOymbUSt3Q4rDba7FuxK9NBdnA/q
	g5k5fWdQ2m2EyHXOQbTnqSVPHOPb0eDcKgzsBhcZLxOYjl6DWjOVxXJKojZZOv323f+KqN7nKrA
	elAJdIXX49/egy9yGlrsRdADq4WnD8XEyYUN/iqjJRA7q+L83UhpW4z35Pilu4BuEgwY7dIfmYb
	Fp1YbN30ldX7LAo0RXoz7aaHxnc/VTMLio8dqUgzoBMC2qcH9wizUnhQDyoPQW9O43oMM9JzzQa
	Y7Nzp4CUqlY/E2K0QXnOUOwXWpxw==
X-Received: by 2002:a05:7301:619b:10b0:36a:1d6f:917c with SMTP id 5a478bee46e88-36a423c3380mr31476054eec.22.1793901595371;
        Thu, 05 Nov 2026 09:59:55 -0800 (PST)
X-Received: by 2002:a05:7301:619b:10b0:36a:1d6f:917c with SMTP id 5a478bee46e88-36a423c3380mr31476004eec.22.1793901594753;
        Thu, 05 Nov 2026 09:59:54 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm21151517eec.16.2026.11.05.09.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:59:54 -0800 (PST)
Date: Thu, 5 Nov 2026 09:59:48 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "Santino Wang (=?utf-8?Q?=E7=8E=8B=E4=BF=8A=E5=82=91?=)"
 <Santino.Wang@mediatek.com>,
        "linux-edac@vger.kernel.org"
 <linux-edac@vger.kernel.org>,
        "Sidney Chang (=?utf-8?Q?=E5=BC=B5=E5=B1=A5?=
 =?utf-8?Q?=E5=B9=B3?=)" <Sidney.Chang@mediatek.com>,
        AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>,
        "Fred-WY Chen (
 =?utf-8?Q?=E9=99=B3=E5=A8=81=E5=AE=87?=)" <Fred-WY.Chen@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Light Chen
 (=?utf-8?Q?=E9=99=B3=E6=98=B1=E5=85=89?=)" <Light.Chen@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "tony.luck@intel.com"
 <tony.luck@intel.com>,
        "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
        "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Arnab
 Layek <Arnab.Layek@mediatek.com>
Subject: Re: [RFC PATCH 00/11] soc: mediatek: add a DRAM ECC error handling
 driver
Message-ID: <20261105095948.000013c0@oss.qualcomm.com>
In-Reply-To: <20261105045321.GAauwLwdk2PSruRAcw@fat_crate.local>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102123642.000044cf@oss.qualcomm.com>
	<20261102124434.00007741@oss.qualcomm.com>
	<78ce4a6ef441cb9836466e9ae5e72ffe21a88242.camel@mediatek.com>
	<20261105045321.GAauwLwdk2PSruRAcw@fat_crate.local>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MSBTYWx0ZWRfX8K0ALNNx5wfq
 tJI7CCEH1/oAX8mSL/m/eFet9/c2qbQUBhWpUZ+8GzhZumim7MCXOt1todYCaAtCWdJzjCPCtjy
 MnFUL5iIFTc/58UM6x0abRpCxff8/ir+ZHuVQG2ewx61HPC3U+ZyKfy+IMJAP7Zh93fAF/GNbx3
 uks3+ihF0mn1UzCnYjgkZXPW/+zJut1FRptJsuO1AW2f8WXJcQTtRKEbsEo8SxL5ehMOT1GJdet
 UOFMQqznkW/uZAHdsreBiLqgSS1F6h7vem6CZ7Ri38PpNsePRXc71xjY5QVHAqGMp2wySU+rILS
 OjT/jOOSK+D4i2eysMu3mCIr3wTlGk36vGQZvBAtTZAnBoTf7bN6PtHRJ5xaZio4k4v/lYGYwYJ
 EjK9B/WHhBbim/E6TB1OX/spqvX1yEnIFOYXcya6jSfbPKZ7LC67/VAQQhr6oF2GtSko+oZzgSu
 Dkh8T1y+ymWkyAmjUiw==
X-Proofpoint-ORIG-GUID: Buw3hne1FrCrLeSQ8M4ePLMhN4OLBMrO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MSBTYWx0ZWRfX8ucnEjbS83ck
 ieZIhaoPul66SgYHwyWnzyJUXBRYstGTbuvL8wdTLFtWHKnV3qszoldpC+QnAqH3etndG6vHdT0
 a5Dap3F8+Rskf8DakRtyUc/vgxPqJz8=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aecc41c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=xlvtQj9HLH9P9y80AtsA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Buw3hne1FrCrLeSQ8M4ePLMhN4OLBMrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_095958_042749_63A907F4 
X-CRM114-Status: GOOD (  21.92  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 4 Nov 2026 20:53:21 -0800
Borislav Petkov <bp@alien8.de> wrote:

> On Thu, Nov 05, 2026 at 04:19:27AM +0000, Santino Wang (=E7=8E=8B=E4=BF=
=8A=E5=82=91) wrote:
> > Which existing interfaces would you recommend for obtaining retirement
> > status from each memory owner? With that information available, can ite=
ms
> > 5=E2=80=937 be maintained in userspace, or would they require support f=
rom an MTK
> > driver? =20
>=20
> mm/memory-failure.c
>=20
> Look how the others use it.
>=20
> What you write above sounds like you need an EDAC driver which collects a=
nd
> reports errors. Look at examples in drivers/edac/ and there's some
> documentation in Documentation/edac/. Perhaps ask AI too.
>=20
> If the stuff you need is not there, you can extend the existing interface=
s by
> justifying the extensions properly.
>=20
> But what you have - a completely separate RAS implementation, homegrown
> somewhere else in the kernel doesn't fly. I'm actually wondering how you =
even
> managed to do this driver without *finding* all the RAS/EDAC glue we have=
 in
> the kernel. Googling for it would've told you that there's something...
>=20

I would add to this that if the standards don't work for you, consider chan=
ging
them.  These days it isn't that hard to get ACPI changed and they have a ni=
ce
code first path so discussion can take place on kernel mailing lists to ref=
ine
the idea before going to the standards org.

There is some overlap with things we will probably be proposing for ACPI in
the next few weeks. I'll make sure to +CC everyone in this thread on that
discussion.  Inputs form Mediatek (and ideally Borislav, Tony etc!)
should help refine that and avoid pitfalls that have made previous RAS ACPI
stuff less than ideal.

Jonathan

> HTH.
>=20



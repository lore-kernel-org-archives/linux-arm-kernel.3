Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D112C606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yhWVHzMP;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ea355nfN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CMe82Xe2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=; b=yhWVHzMPuARlFR
	KPZg4iEBwxPjSmARORI1jhxUK0jqbLD0e4X02dhgY6eAVCkzaNuQFxbfltsy+e2hlEPl9z+NKMPvv
	WAKPawlJUUFaFSQ6bxGNtEqMizdjMkgyJ65ZOmNveOFdxL2dJhgmd327m+gjwr42YEiQWl1+h6NBH
	fyISez8fTpQhRUy4Ssevm3Nqc3AevzB/VclIROCncEH7wg9IweHdnG0IxkEMMIclBPhPBR+uA1MY3
	ylhyXlwbgg0kG87xrkwMaa+2QrpDZxrhsiWMVKPr85P5YLoxWFhq6qQhsrS+OwpLhLPcjs7FA+sYq
	PCC4plrYyJoS0Vg1ojlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNllU-0000000Fg0V-203D;
	Mon, 02 Nov 2026 06:43:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNllR-0000000Fg09-35ug
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 06:43:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vNcl2745518
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 06:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=; b=Ea355nfNDVTQvAl2
	xBG2AMba+bhyh8m8w+ple6BS+BpH1fD4Uc7p/HU8qj0QTOWfTBFTZnh91OzIEn5w
	4JiFIr/axfiMk03rPPGBMKGApqWMWNY5J2ruCk+8/4RYb6edJ1EheDzoqA+s/UKJ
	SXNk+9n1dO9uG+jAgXc/B6ctrx8DaurPYyGbFmh+v7wTdNdif9Bw8nrwGysIjvXP
	eih/xJQ78Ec7Y9zeRkvhXivOYmYhs+0zxc/GzPi8cngBaPVWHkZ0MuMw4jB9ldNI
	K6VAKdaNRsclgQ0sBsNl6b9F3PWUUEb8yx8y4ohHGhzapcUp7KTWrVFX9FgKXvFE
	KeCCLQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8dudg8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 06:43:28 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-677d93efa20so4884607d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 22:43:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793601808; cv=none;
        d=google.com; s=arc-20260327;
        b=npg/UethxQDNEDE0QV828V/HHV6ShR0WshZNcPX2BDAnAhRoUX+nG89lJunGmCwEI9
         S1gXp8RUag3slxbN3kkttsVDdNprJoHLnykogkL/h5yjdOkcZ5D1tk4vg18bgTZmKA8o
         /ZwM2E6IEJrcp8AL33XH3GQX2iGP2K4cnnk9/+y6OVh/N6h0s6awei0SUyrRxyxSlTQ6
         vfjNj4PxEHK/HkZA3p1joXHkRvQSv8aDAtPcgYRgjl0ys+UYUGWRatiBlclAoYg/uDxF
         UqfzsUl7S/UROBqAOxZEm1i9BcdSOWz10MKGSZb3mggbQ8Dt7MlXdE8wxfFKP5whjC0f
         eE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=;
        fh=Uvnqv9tLP/MPqot+nIWfS7/WxnMPr1TByxsCzFz0ygA=;
        b=pGC8JJQkxDHoKEqMybHNBIMkWpLUHzHdxFHreOg7pkbU7o1bCG6L8m0p8XQbD4iIVq
         iuaHl8oETcnK8HSv2qDzbuYXE9r9VlFScQ3kujM/98K99aWXuqkhX0BAurahqfm5YMSW
         Z7cb1u6ZHkpwkp/AgAfx/cPk6emEXtga83qe7ra/RWcQsaxbKITDb3TfGpMsa+/1MWmy
         S5bQVLgZ1g0mH4OJEG+skcvTTLBHi2uYbHR0pGFVHjmqAiJOuFDUZwa5UROdHqpfEbKD
         S7U6ujhES25aWEbWZrStSSA2EuCwovFOVONDD4AsSPs4/nJfe6XJbgt3HMO7Ql2oM6SY
         aJ3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601808; x=1794206608; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=;
        b=CMe82Xe2yNsrNo1Xm0c+EoqY1EMB3/7cc3LHNRwAuVN58o8+ms9Z4FfBndOKpWAhoh
         g6X++GaDoJTPXjWoyhO/C5ykP573+ukrLrvuctLSHnWF29Dl/8TElbc6+v4lL6gfgcyv
         qFmsQgznPaZ6wiNlPCmzuTyxiWMYw6mzwespdK3ygsaLwVq33/jZj0ymLnDS6mVZu8JI
         gWO/ec8g+oiPgSC77DH0q47ZozSkixsXkrKh8lA44GYK6KMM1o0v/wxDwkTwpY8xnVHP
         gJULxtphUHRGsjSabL3GuoofePllCm+HhJ0IIoS+PkEasQLbjse0Ct/UTgrFUJYhu8TM
         YT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601808; x=1794206608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TqtZRGCtVJpincp6xgXv1y5SBG3Wk4Hw2deQw0NvH10=;
        b=Rff04lS/hNn1+F0c2GfM3/xNQR1B7qkB1x9f7yMt+Npk8pvfpMnL6LfnI34T73l/lX
         r6V98cIThr59Nz3olMXOSmpT84Rw6q6Bxsq5toy5Lrn+3j3r7l5ZkKIcBmQ9l/NNf2aM
         0rsYX7IIprg4Wkcz5KJQiTf0HQs7yUa0W/0+IYaYCslEj9EaoQ6QX0kGZMcNhT/2LLVX
         Sd4i4QdvX7gUvKJQgka2UdDYblvWbqjzndHoTGx8iHDaffVSCyaXrQaWvLD7JoPxaOtr
         OaLl0Y7rpYGIFZF6pbEB/8B6V5w+fyaPXGjRigd+7nzPs9KwigegmgnQ+mYbcqXY6slE
         ykBg==
X-Forwarded-Encrypted: i=1; AKwUvBylEVS3D7wA4gQZ0fC7JCmeGvmGbZs3zv7jm8+twcYs+kUcE/1+/Wc4Asva9Jh8MaYNFyggyK9Wz8jb32F5Hf78@lists.infradead.org
X-Gm-Message-State: APuU4Z8UO6UUrDP1GQUvshByaIASRmNxUaEVQcDai0uqgxKfYMnbzBeS
	OPheu0zrp5LJl6bqj2ChimrA9HldPIKyIGbXolOq/LOZwPmatMJbjPyfzTmpcWNyDD/sURCrx6d
	B0+KuYsdLt8idomb67xsipMGorSTUjvxMb825MddKB7HwbwjTZOaon/XRYbiZJorw5qfUKoyVX9
	PnXG47rEYXhj9XW4sucTyAE4PEJThyXPNbUC/oRhIPxFkZmqLXboOk
X-Gm-Gg: AYBFou2tWAqzTyDxyLrJuhmraWqQsWrb862SYFZxWRKVWHBVAwZbDpQNg711f+FqGWa
	d2e9NwamlYcAHRrn80MtFflZmI4BUEp/aUcsG1EY+Lgdsnv8axooZRUx4+co3QExTZcytu7APjA
	RLbQ5PzTzebm+j1CMe2Sp2ZcltfLB7O26v2rFRLhqmXChSffZxgIEx0IkyHA==
X-Received: by 2002:a05:690e:140e:b0:679:99ba:180d with SMTP id 956f58d0204a3-67ba4fd0dbamr5409939d50.61.1793601808178;
        Sun, 01 Nov 2026 22:43:28 -0800 (PST)
X-Received: by 2002:a05:690e:140e:b0:679:99ba:180d with SMTP id
 956f58d0204a3-67ba4fd0dbamr5409926d50.61.1793601807648; Sun, 01 Nov 2026
 22:43:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260922130653.357615-1-andersson@kernel.org> <04be768e-7c38-4ca6-a721-d716947b8708@app.fastmail.com>
 <CAGptzHOaNfXhDf7pZ0v=nKGXE6UjwOaw4pacPA4y9Lop8yP37g@mail.gmail.com> <CAGptzHM-FgeDuaE_xMT2FNJrN5y=8L=FmdtoPs5tELNXZ20CRw@mail.gmail.com>
In-Reply-To: <CAGptzHM-FgeDuaE_xMT2FNJrN5y=8L=FmdtoPs5tELNXZ20CRw@mail.gmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:13:16 +0530
X-Gm-Features: AclHuK_nviIyG8fb19_CXIlxqxPEMtYwAJZGKcLdxWVe1gcuMOlrBn_vK9GS17U
Message-ID: <CAGptzHOtC+D8uVcLph=k9ZkbJALmJS7SrBEUHK5mAT1Do6HsXQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.3
To: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae83110 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=ygn1YfmRgnNSw8eP3TAA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: gto50VYYe-jDFiMu3XfpYyJd_4W5tDGk
X-Proofpoint-GUID: gto50VYYe-jDFiMu3XfpYyJd_4W5tDGk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX4MSaFFysrroF
 x+8tsTMMKKd2Z79X1Fp9ahE8DjGA83rmac5LtgTj6YuX/9PSe4NgyHwH55xcweiWa2oei7uV9Wn
 tpWHTAdzt8PFt7pUwdVjoyqQe756hAsNv7cUB3KCa+bzL/+lChQMOz46HwLcFlKd0Z0oPEGhqZU
 Ak02QUC2x02rjdPec+stjsTdKras/h3U5mlSZO0WoGJoKyRib4j66s3LI53MRfg+TgufF8rcCup
 +3xuEb9uyuRAZqLVg9VfXaCg0Gb5alLmBuV1ohqrntGfo2Tq1uz7UE2JOusLS0VlFwHkb10Rb3b
 c2OLf+5eNj8t5UEga+OznE+15h/jdyTyPH/a5mYTDWTHVw6GMcBV0V+FzQ0LH1Uga+xp/7bJEEz
 u7Gwj+++Hnt2RWdEP4KplLlrrUNZqe79UtmllE1l9OdlaXiZWubwc8qz3uCI7tAKOg9RxNeXXE1
 RdaWlViZuyNyK8fwxpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX/5UBgbiiTktv
 L1EJkNGFD/uVb63QppMQQ3IYH7P1xQhd0UyQLUWdoUrgOfTOetP2dpF8n4iFfY3MpvdPdejK4Zp
 8Y6vG2xMjNZzSf+P2wYT3JlbSv3dWcA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_224329_893209_C1093F5A 
X-CRM114-Status: GOOD (  29.28  )
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 11:39=E2=80=AFAM Sumit Garg <sumit.garg@oss.qualcomm=
.com> wrote:
>
> Hey Bjorn,
>
> On Thu, Oct 8, 2026 at 10:35=E2=80=AFAM Sumit Garg <sumit.garg@oss.qualco=
mm.com> wrote:
> >
> > Hi Arnd,
> >
> > Coming back to work today after vacation.
> >
> > On Sat, Oct 3, 2026 at 3:07=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> > >
> > > On Tue, Sep 22, 2026, at 15:06, Bjorn Andersson wrote:
> > > > The following changes since commit cee9395acd8043be0644b25c34bfa866=
23f2b935:
> > > > ----------------------------------------------------------------
> > > > Qualcomm driver fixes for v7.3
> > > >
> > > > All clients was migrated from the Qualcomm SCM PAS API to the Qualc=
omm
> > > > PAS API in v7.3, remove the now unused direct API.
> > > >
> > > > ----------------------------------------------------------------
> > > > Sumit Garg (1):
> > > >       firmware: qcom_scm: Remove SCM PAS wrappers
> > >
> > > Hi Bjorn and Sumit,
> > >
> > > I was running a little behind on the fixes merges, sorry about that.
> > >
> > > As it's getting a little late for 7.3, I would suggest skipping this
> > > one patch as it is a bit large and is a cleanup rather than a fix.
> > >
> > > I would instead merge this directly for 7.4 but still take the other
> > > ones for 7.3. Let me know if there is some reason I missed why this
> > > needs to be in 7.3 after all.
> >
> > I agree it's pretty late for v7.3. I am fine for v7.4 if Bjorn is able
> > to keep the dependencies sorted.
>
> Looks like we were also not able to land this cleanup patch in v7.4-rc1:
>
> firmware: qcom_scm: Remove SCM PAS wrappers
>
> Would you be able to merge it for the v7.4-rc2 at-least? This is just
> causing issues with patches being developed on top.
>

Apologies for the noise here, I see it in v7.4-rc1, the tooling I have
confused me.

-Sumit


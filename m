Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B27D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HzTj/h5m;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d19wo7gv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YSkRZtkZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Nqa2HWb+gMyhH1q5C2IS9vP6rX1bzS8fEOjh0AxXP0c=; b=HzTj/h5m6cBUVd
	EgtT4LoMcxa5ghI/OeRLBGLlVjuVU1qMQG7vbw8G3ZBPgQi13ZelK8MPfUbMhcQAvufX8/uqVTjLq
	jf261EBHUm+qWqfXZJPqykUJX5cqPK01HIaLAUZE6KE2gX+X3RJKiZm5lw17Ubuf+1ZWsct0iKGCi
	ZIWaabOOd/xKPJZFw9qw29AUyi5ieV1Jb1GvHZIrrCNRzuDn9oLQn+mAMymwtgzcg/2k59a59vmK0
	DA+Ug4qrfDN8QLk84p9oj5CVcxlmke6B8qgKWIID/8ynB7ngx5sJiT69ymSYEhKfciCmO6I8gf5j5
	f1nLu3jx27tXfq/i3mJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLkQ-00000003fOi-2rSt;
	Tue, 03 Nov 2026 21:08:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLkO-00000003fOK-09NR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:08:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ1Gi445336
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 21:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nqa2HWb+gMyhH1q5C2IS9vP6rX1bzS8fEOjh0AxXP0c=; b=d19wo7gvSskyJQtj
	zn04v+tx++jgkYt9Qj3cAJXvlgXV3Cw5+iqSdFqauPrwz43fXfVRpO/fPUEdYHfR
	lMZXWimqC7YCDZyC2i5j1lckR15gAHs+TZpOj0+lBBualPVy+7PPATGPhJOAlcZ9
	DAPOoMLFRRZUBrP6kgsKzuw4IZgl4jDopwcfMXLs95lcvlaSc/d7Vqds+CCiaafo
	N8m1ziwS/8lzMMCkvJrvqYOEeMEJHG2Is6G3UCCsTu0cWD3BO/zzfskc7cFopaTW
	avAtwGUCSzzcElg30NazHEu5oC0TDKWpUx/zI/NPtiKrnEuEISsT3cGolU4LS3TD
	i6lqLA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pguaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 21:08:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08be1c84so240195ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793740126; cv=none;
        d=google.com; s=arc-20260327;
        b=DCktzq1/QHhCC/IwITv3RL6Yh4TvJJZ1DJ4FkLMnjPfblPUleKpx6ZI1v90lFanwFd
         o/QA9AwVewY3Fg7WCA/pAulPDZH/yO3TMmuf1XOF4MtFU1YghO5LDmFYR/oIIOgsC/6r
         4nDdRZCJSXO5xfBq2+btOlFDWhRP1pu3Pb81D6KLhaaw0VefzUaapkjqovA3Ic2PFz6l
         kCTAH6eg6JwhF5+GlJrEgDu/z9cLIIxcqrjbwzzbCkP5Urz05oYHtKJoHkQ13+LmqHwQ
         8Ju1E0mTKm1LrNJ5HcPt7LrNMQ4jmtImtn8RkabfQcA+O/o6pC2nQ2/5XBdcYw/hzuok
         x37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nqa2HWb+gMyhH1q5C2IS9vP6rX1bzS8fEOjh0AxXP0c=;
        fh=b3uogkJp+jTRaB0iWAEl+G4z0rc8ALkg/gpddq5AGFo=;
        b=jIfAnvbs4ewvsord3tNCYZ+ltNuDKPrXOPVIDw6wWqvDzwLH9I7tzX9Qyqa9EMXJ8e
         s+o6AWZOcTBqKpKvgPB131NiMdr8nSZzBpaKRkKDRjl9vJlyLqRmos5zVaMkiSObSmnR
         2IV8tOJV/OUgKI0Ff7EjDKV9u018tSDDE/Ydo7c4x+TK6L+Dl1Z9Vf1SzpKR7Ls84qb8
         w07YMPvXdwPrdrHJ7l53cCHWwQ8BVsYkUtQqPo+uCNJxeBcYVLkVe2Oo9MY/v1QCgYYn
         t+UTyyNcVFJo5cGjVP86Mwc1klZGf/Mbzn0KN1vLO3ICSU1zUNgUzpKSMHuwr6rRHuzd
         n8Ow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793740126; x=1794344926; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nqa2HWb+gMyhH1q5C2IS9vP6rX1bzS8fEOjh0AxXP0c=;
        b=YSkRZtkZoofkzeILTvF5SbP+VX6wz60kZmnTvxmzT3uSSn7yWRsCvYlmnOK94BxVVe
         hcM/jwwrJl9HCXtSEsRULPTMMHrgDphRpkkgI2pj602dnPlPH6DdJrmI9ZqUi711WoaZ
         9j1rXTpB3QRW6F4EHDBO/zBwi+girVFkQtuw6/efUnp9iLAKdOtP9jy4sIKAKGFrAUZU
         c95/0jzdmBEkSV3nLgIS/Dyp/f4EIVvTOvHCFPhJSMGW6o/78M264cd+sMmHr9bH9RjQ
         mG6DU8ECxy9UAgoinKDn+zqWaNXg4qxCQpR6ICYs0JKiR/GNH94uv50aCJUbWhbBeybR
         TuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740126; x=1794344926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nqa2HWb+gMyhH1q5C2IS9vP6rX1bzS8fEOjh0AxXP0c=;
        b=0iNSOZgFGt2rV7wihtym59KBFPr+JeUmo5nxFk0U2UP6GJ2MRSkNsMS8TOLsQKsHAF
         E+JiSfTPZba141Udvdx0+A0cxYHqiXIW4enjmReiArPVj+hJ9VxSpq2OO90Xb1tOkWRN
         f5Dgz2fixry8zcustxs4ZYbHR2LRIQTKdQMjk1jNqGqQX3DDUYqYtM1vwxvZHqhfHdRt
         w5vyscYNunreMDMjZ0RffCMqbOd48ZOwT0X35QLKP/s0CR4COsXyrhssMeUkG8T+Le44
         IFJxlaGqoFRKRjAAnmst36QH3XQBPXiFzP2mwqYbU+vGDP+u6Z5BRcoe33Uve8rovaBM
         bDxw==
X-Forwarded-Encrypted: i=1; AKwUvBzjqO9q9yTucV8Qu0Hf7YgF5hX38kL9J/hkA35fuz1hSIIN8CmvgpyLK8fWr8JqM5xax+euWC1kMopUaBD0Sx8P@lists.infradead.org
X-Gm-Message-State: APuU4Z98FfNI587qFEoSdxDpgOl7QnWq+t7vjJ540bd5NaRmhWXrJNkE
	SQSYyCnyYlSi85kbuCvlZ1xlp2BNb6BPcPxSg3L4u3XVZNQ0v2b/+rRWi7Xa2GuUA3C7n/TPWTG
	/Eg+CLu07+4UwzDkfzUuhf39v25RxD5sJBj8gNK6J3Kf9y4c9EHlYZ38d1ydGXwArKbTInVAA1q
	gmgKUtyaWbj2/MenJEa/A8rxbvZFJOQ6FM1x8GeScQ+7HBgC2Yldb9
X-Gm-Gg: AYBFou1lLiyGkDwdnotvJA7+t/XgXaVen7mZ3Xq+6B9j8EBml053wv5G4zAEQtDEFoJ
	urAhyVaBxi/e4V50AQpLwb0qKRpvtecNL1T/Jj1eQsVbeC3tHT4cwtsbrT1uZS2/tXjpdUmLWZ7
	maqGG7jJqLwm4zAwMA67a/tcjnZwTF4Z11mj8++u9qDsrpkvNYwKp+LiZRnAM=
X-Received: by 2002:a17:902:f542:b0:2e9:9263:a5f with SMTP id d9443c01a7336-2eb36493707mr131781605ad.17.1793740125221;
        Tue, 03 Nov 2026 13:08:45 -0800 (PST)
X-Received: by 2002:a17:902:f542:b0:2e9:9263:a5f with SMTP id
 d9443c01a7336-2eb36493707mr131781035ad.17.1793740124147; Tue, 03 Nov 2026
 13:08:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-15-9352be6b86b1@kernel.org>
 <CAPx+jO_KJJ6ORKuw6VJmtZAOEnzVz0+bq3bEFupAK_4UROKBAA@mail.gmail.com> <CAD++jLkC7XehyM3Qh4mDu1zB+_MKhmFn6ae1sA4XCxeS1btT9g@mail.gmail.com>
In-Reply-To: <CAD++jLkC7XehyM3Qh4mDu1zB+_MKhmFn6ae1sA4XCxeS1btT9g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 22:08:33 +0100
X-Gm-Features: AclHuK986C4IgEa_un_uJ2N3V7r60Yd74MfgWjVPHQJYngYAYIhlhA3cS1R7Hj0
Message-ID: <CAPx+jO-=OXpTY7no36tLoKh52EyscohYqtwD64xsgAc4Sh-g8w@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] dmaengine: ste_dma40: Use power domain for LCLA SRAM
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
        Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NCBTYWx0ZWRfX117M+AU+R+qJ
 w2P2CQ81P8BoB2aC8BmqNQxkhsAco34eKD5+Bjhqf5uZw3/3gBPLNwaSKcMc9zsRelHujavLkxB
 vk10fyorM+nzLnIH7IJXrjsIG+N16mqB7CWJQVgZJEg7OzrLtht6Un7wCNzSjX6K+EYSmZ7VdMW
 8ec4sBzyu3gzeCGjdYmZQGUVtrviOg0bLeFi1B8B35/pUGNbmK8EKbKi5lWVBtayQlhoLyZXWxj
 UhdS7m6M8OrCP4laMlDDc5KUjVXfibCQ0F9JJSaVcelZ7EU5hESUtuaNGClD4u3ztV1PFrY6HKl
 5x8q44imU2pHcusdNDOlmTFFLx3bv5nBv4YQgFbE/M70r0POqEkA90Q8GcGjRsB10S0p7e70ftM
 S1tWepbq17yKvHqQc6wn3e6EJCzypMVzmt1EKUU5ewSjm1HCZg5NmbsbFkX6ILU2CZoEgwkv5Sx
 H0P1yK9753N2iASwN0Q==
X-Proofpoint-GUID: HUZzP-nkEbS0GstsaDruCSol51DI6Cgl
X-Proofpoint-ORIG-GUID: HUZzP-nkEbS0GstsaDruCSol51DI6Cgl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NCBTYWx0ZWRfX17s5F6cBuPk2
 KLbWOmBq5+sHa1Bhy9Ur9G+SsIxXRXf6IUyt51jTA8v7kWr8J+A02c692tHSpym2BZlvpWI4xWV
 da4vOivt5tfOsqauwLt4xrQFCJApPVU=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aea4d5e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=neScOegWvRHQb6aK0P8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_130848_115141_7D28B334 
X-CRM114-Status: GOOD (  38.48  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 11:12=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Thu, Sep 24, 2026 at 3:27=E2=80=AFPM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
>
> > > Hold that domain while DMA transfers are active. The DMA controller i=
s
> > > runtime PM IRQ-safe, so keep taking explicit LCLA runtime PM referenc=
es
> > > from the descriptor preparation path instead of relying on a runtime =
PM
> > > device link from the atomic transfer path.
> >
> > A bit of an orthogonal problem, but related to the above. The irqsafe
> > thing have been discussed in the past for DMA controller drivers.
> >
> > Would it possible to get rid of the irqsafe configuration for the dma
> > controller device, altogether?
> >
> > I don't recall exactly, but not the entire consumer DMA API is allowed
> > to be called in atomic context, but perhaps that is not sufficient to
> > allow us to drop the irqsafe configuration for the DMA controller
> > device?
> >
> > If not, I wonder if the consumer of the DMA (like an mmc controller)
> > should be assigned as a consumer device (using device links and
> > DL_FLAG_PM_RUNTIME) of the DMA controller device. In this way, the
> > consumer (mmc) would be able to control the supplier (DMA) through the
> > device link directly using runtime PM. This could potentially avoid
> > the requirement of having to use irqsafe for the DMA controller
> > device. Maybe someone already tried this?
> >
> > If the irqsafe configuration can be dropped, in some way or the other,
> > this patch could become less intrusive, as all that would be needed is
> > to create a device link to sram device using DL_FLAG_PM_RUNTIME.
>
> I looked at it a bit, talked to the AI prompt a bit, thought about it fro=
m
> my (limited) understanding and while it seems possible it will need a
> substantial amount of work, so I think it's best to get this powerdomain
> migration in place first.
>
> Steps to actually go there would include getting proper consumer links
> in place and verified, remove all atomic resume runpaths in the
> DMAengine, handle requests without a device such as memcpy (I guess
> by simply using the DMA device itself as device link?) and some minor
> refactorings of lifetime for channel setup/teardown.

Okay, so it seems like it may be better to revisit this later on then.
No objections from my side!

>
> But indeed we could use the pretty well documented and supported
> U8500 platform as a canary, I think you have access to this platform
> too, the upside is that it is "simple" compared to some recent SoC
> monsters so it could be an example of how to do stuff.

Yeah, that could be a good candidate for doing this. Let's see if
someone get to that then. :-)

>
> I don't see much generalizable stuff apart from things like the
> pd-patch to the SRAM driver being pretty generic.
>
> Yours,
> Linus Walleij

Kind regards
Uffe


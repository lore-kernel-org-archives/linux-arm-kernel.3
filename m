Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69166606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fWneeuQM;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iFG/gbXs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jhWW9nJM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=; b=fWneeuQMIEXqlLkPwi4EI5U8b/
	pVxEsTgI50NQaK1ljBHg9WsEz5VUmqANyKclXD/oGBkHhq4WG+07xp71Xas+0mOpyLvSuOnssG1tD
	ZEc7Wzebqfn2su9hEY767hJ+KizLeYpdwxq6KCLvzL34WOdDdl1YGt4YKGod6vfxtDDLUXonHwK38
	9bqxsSth2NkzfLbGgIY4ZZ29lrIpulyfruVnCbTa65c8CQoVMF9N7e94+R53J/G66+nrxeWbWoqiv
	uqfUsWyn2znKqrF9bQptDwTN5ZbURSz6hH37ZkdIH4+ut4v34iGYCgc3KPDKnJr+EC2+Et3hn/DOe
	k/++jLqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzzz-00000000WCu-2BrT;
	Mon, 02 Nov 2026 21:55:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzzw-00000000WCV-1guz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:55:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K605Y372005
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 21:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=; b=iF
	G/gbXs4vywdlb2op5UKUfoQVuQsH8yMcM9nEoSU6ycicr6Tah6+SmKgoKWHlbd5c
	oTe3KdUw4yG0ztUBVCgrAngbcIGFF6dazGHGsIcZLU2Ur/6b2wydddoe3UU6DPnt
	nse1dREVyXhQNTDl5/f347gV472rkITi5/j5XHCFKsQgnRb/4vQmBxmaxxgAc7rH
	9EOE4ryF2jMbmKYvd4RlT9xN1HlwEv3aYWTUUnaFe5B0ow+dL+P/+TasTU8y5ZHM
	O9pC6IsO4/ehOz90Mx9k3mdCbu4GLgZg+xHD7RqLlWfL4Yrezi677hHnTjqI2F30
	UjmuutvQTnPWekcwOxJA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r0ndn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 21:55:21 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-84478a97bfbso5404513a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:55:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793656521; cv=none;
        d=google.com; s=arc-20260327;
        b=qB40c5+xIp6kD/mGIuecJH3wLOPxTmkLkCzKtM9o0BxAUcW+ikfGzbSVKJ2U4I0QYF
         ix1GWmfTS7JXZY7dK9MgjNMcwTKidG7y6LduEHIOlI+1FD/Wbe1tFnpR8/9vBCEfbHCV
         RKl0DdPjuUwph5P4QFbP+xY17JsMpMhYF8fxdxgLHNol3gsV45EC4mCKNLUDntYcD5MQ
         HLvBzhkD9wl2TVxcoLrWQ0+Yl2CI1XMmKtXPRt++I+yxRftLuoMuGbGIN5Vt/kxLwVa/
         SKp7uP2/+eh68LlYSrHbyHOVp8G3uhtm+k0BC8yzunEGya2lh5mu/caShtC9iYB/0uEp
         8phw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=;
        fh=bivhKNMtpUD8zTaAfpV/SI7zQy5BUfIEavSU7C/+G/Y=;
        b=eWH4niUkJH3RYA9LSodcsSqN9QKH0TZhwz3gUhYOdIpfMA0zQiRop8ewIZMNJGjGfq
         LYci3UdiMfc6wLa0uZuqxzdq7MMGFgEzdzJWKGsXfD4c3Rb4iku9XAHi7ueKIG+W2J2l
         QmPccOw2CJ2A67FlBSJLg57T4yq2Mmg8m1rCaao8mytD8J61q41f/vnSk2VIL/AFNCkW
         /MseoJWcMVlq+blAa9+KRR4bEdXZkOVfyafebAEF6anS0G3KlHU4gDjSipfjFrxlYBH7
         N0x80f0vj2ztd+y7p0Hj4TJM96xaxnzcFlDdzyjWJqLVmRWSgWh7JlR+Il6073b0Za1u
         f8QQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793656521; x=1794261321; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=;
        b=jhWW9nJMXnrSyY3Q7PwF0fYIBTsk7P3gP6hGwXnqcbS7KrbcagERILwxnz7S4vNvOH
         f3yiKlT+XOm/XytpN6nNJI6qZMtlr+ojCPnjytRJE2peQsaSnK149QFVNMbF9sB1I0zZ
         6NfO6vnKMLorvYdnd1RSBcWQwf1S31LnwNwhlfJWmTx072JprHwqyXJKFKJnQWLAHzrk
         kaEKLwOThyw0No6iTbUfqVn3EICxgnSVfLdkV6h4gWak+SlSjpI8vAzKids8zWv4jm8w
         Gm1DlXD3KYOJPobEJc3JmISPIVDk1qx7/sUp/l4xkEeaZVbtwYeSNtfwej/Sm095JOkB
         uiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656521; x=1794261321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Kons/VVJeecTE95p6b5aHbvgxf5kG9AxNXwlr03l3E=;
        b=UurPMNaY5c76qLEZ+v5/xyuQAEFHK+FBaG6SY3gpKrCqiF/CsZCgf9zy/YllI3aWwx
         iZBY+mm0T7T9oZgdfZ7Ru6Md+m8LMSlSFdZqA563H/6ylK63EzyNgoTr7MOCq0ZxZATI
         kpgTLW3PMsxfRHT209n+aQ6pJPAuHlVc43Sh3P+27qfDD7EvIczQa09f2G5kv0XKSOWj
         Bk01sbURG8nbRF7pFl/5pqSK/inW+ocYZEhkJcgGJ46Qig9g6jdqI3nuBywPeQK2KHv+
         5N9mqML8MyenNgqG0lO2J9hTPorzGtUJYXdcxRrl0RqeyO2OU6M3wKoJIHVYaHdJv1TX
         u7Sg==
X-Forwarded-Encrypted: i=1; AKwUvByXwGHpfPBjVRI1lJOYvC6pSWpEXBmCBhtcnJ7QHyo2fTqaH9t6H9O0tStrNXbJ9up8S75dhqysH9fVGAr9Ovua@lists.infradead.org
X-Gm-Message-State: APuU4Z/2PEs5q1fEYzLkYD9Nu/No+L/iIwEb97ydfBy0ZfEZSr8oCAQF
	07DTPwgmQvaVtHfn+bdqJDo4C2kramoTgziCxzWKFp3+ZfPqwygYLPIgzOFP/WFF3ALvfmOd6sr
	NDGId+fZ684PuU3zxoU5whBSuBXvU36Ik+j57QX5lM4OWLRY9nPPfgkk1wWYrhwoxM7hLw18RpU
	COFDJ9H1e6NcCNf34oq+6Ok1mr7Qp4gWMyF+tUFTfmIMLJ1bNalZvw
X-Gm-Gg: AYBFou3Y7MyS+Uo8qQfeAv+uqkRGZrtpZEhHD4p9b6t6FIxcvzQxB9gCzdxZpNNE1Ow
	LjbrX9JO+zD3cbziHXYrDkEOXZikwXURHxzuh9b4frsPjRx2zjTePF17Q8aefQJuddX7ROgl1Ve
	aO7TpuvgmMTkzHzwEdpgTQ5SNk1Sc54SM3hm8lRqvh2pQDRtQJqUcE37IIng==
X-Received: by 2002:a05:6871:3285:b0:48f:e107:317b with SMTP id 586e51a60fabf-4a9077d5bbfmr7236433fac.46.1793656521136;
        Mon, 02 Nov 2026 13:55:21 -0800 (PST)
X-Received: by 2002:a05:6871:3285:b0:48f:e107:317b with SMTP id
 586e51a60fabf-4a9077d5bbfmr7236414fac.46.1793656520482; Mon, 02 Nov 2026
 13:55:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <CACSVV02xa+emUMd7Dp1rDSwa0e3wpyQBcPeZg-bXPL4U3kzQvg@mail.gmail.com> <vfpvxwe54n66qmdy5f6hopfo5szlwrl4gcu667mplv2eplu3br@aqpupbzslcgi>
In-Reply-To: <vfpvxwe54n66qmdy5f6hopfo5szlwrl4gcu667mplv2eplu3br@aqpupbzslcgi>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:55:07 -0800
X-Gm-Features: AclHuK8vUilw2z840EWu19Aj2IsPjbqVTCvonIaFNq6IovHlRAiOrSo_eV_NVk4
Message-ID: <CACSVV03=CiMQX4sPp8EkL-p0+nyU6JGc8G0HXhyMK29Cw99CXA@mail.gmail.com>
Subject: Re: [PATCH 0/3] iommu: qcom: Fix the MSM GPU and display with
 DMA-address based mappings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: reFZyZyFzJOMyQWgT2W2uXNNskegNR1r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX3RvnyfZ6gUnM
 fzXq9OPgABeWVFAn/Qq3m8CjLoYKNpl1JJHFMd0HGz/nEfp9brxsfoWH4aLSNjBh2UQfq0skIN1
 x2A34VWU+BTTEQU0NucY6899WiUkGkzUEPMW0ECO5gkPK3queM4a78bFYZBZ2YbYNp4M9rQoZDz
 5WhvuFVWe5eaEQMebm4xclyqJODQJ8o6KJUoObIJCprHvpkzLMrMYQ3UfnWyVIiIq1eGSd88ZSt
 wbaZJVZ8JzGZBN5Dcu5j0uOZTNE/g38+FtHZOsyZeesGH+oiZoIlmIes8E65i8oZffkZ+w45Htu
 dX9pFSjT/vhsSZi8KOXIM+qI7oB3Pr6jENgur0t2ZjVkMkMdWIJJUroWvMMkdPg4QwXuAqz7way
 6y+9D584VJkYumhpMoB5B0kzCx8MZzpyFJKJDiO+5LjsaKtQPnYIrYwNsD76tVK2qSS9so3dRWY
 Fm9Z4IB/PkixWkrIL5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXy1lFrky2nWyc
 yTQLA9M6FhWU5BglxebK8waNRwyEi9Gj6nRXOqhzOs4w4uwHsBBz+NsRDUx9Rmy9JexCPTwlOMS
 O18S3vQU/OHIA6NaQVxm4l+O4LbB4+o=
X-Proofpoint-GUID: reFZyZyFzJOMyQWgT2W2uXNNskegNR1r
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae906c9 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=HdZ-pd3ExLc5KhsI-vcA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_135524_585864_540B54D8 
X-CRM114-Status: GOOD (  26.30  )
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
Reply-To: rob.clark@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 1:58=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Oct 31, 2026 at 08:33:06AM -0700, Rob Clark wrote:
> > On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > Rob's drm/msm series [1] writes the addresses dma_map_sgtable() retur=
ns
> > > for the DRM device into the GPU and display page tables, so they have=
 to
> > > be physical addresses, i.e. the device must not use iommu-dma. On DPU
> > > platforms that holds, the DRM device has no iommus of its own. On MDP=
5
> > > platforms it is the MDP5 device, which ends up with iommu-dma: the GP=
U
> > > then fails to start on db410c and sda660 and resets db820c. The last
> > > two patches give it an identity default domain in qcom_iommu and
> > > arm-smmu-qcom.
> > >
> > > The first patch fixes qcom_iommu's flush_iotlb_all, which never
> > > invalidated the TLB. Nothing relies on it today, but the series above
> > > does, hence no Fixes tag.
> > >
> > > The patches are independent of [1] and a no-op for the current drm/ms=
m,
> > > but have to land before it. Tested on top of [1] on db410c, db820c an=
d
> > > IFC6560 with and without these patches, and on Open-Q 835 (DPU) as a
> > > control.
> >
> > Thanks, this should mostly supersede my untested series[1], but I
> > think msm_iommu.c still needs the same treatment?  Hopefully just the
> > def_domain_type() part?
>
> The msm_iommu.c needed more fixes. I will refresh my old series and
> include fixes necessary for the dmabuf debug to work.

I guess if iommu/msm needs other fixes in the first place, that
shouldn't hold up the dmabuf-debug series

BR,
-R


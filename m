Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDCD606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m3qERSFb;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=futowQ+d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UsvaXtMO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xv2AKf702Amb8kE7FInOdGlSjutL7r+KnslMQbW9EJs=; b=m3qERSFbxTcP4hcJYHNYBTG6B3
	BRuK7T3FunrckcBMtlvPDDmcfpts+gJ9ltmbQZJUeim+jzX643cM3SNgSS8YwoSpvyzVt7AY+LDUt
	1bwDzT2rScxk4K0wD5EFh0f+tIgc4B+TI1uOZqDnSDjCCrP3RHGKAmVuXyViyUOnrM1AkjVIBdl5F
	ymOT+aCK4iwNEw5uqG/LNhV0W04PN8xzqKGlnU1pFax/yuXYh7eug1OUTwt4y4VU8VQ4Gx15Q/UrH
	mpnGK8YcNCAMqt9zHYXMo8PfUDihGwxJGMFjEScydxuuvrWLgeHgfZRMpOESLHY9ImcMP5auhas9W
	Abt4B0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoo8-0000000G6xM-2IKv;
	Mon, 02 Nov 2026 09:58:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoo7-0000000G6wK-0h4x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:58:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1Dx2466122
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 09:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xv2AKf702Amb8kE7FInOdGlSjutL7r+KnslMQbW9EJs=; b=futowQ+d0AVA1wU7
	Fe1XnXE/6MhUV0vCnUohaHpa4xmem+tbtDGUqss/w8e9mNFe0pfjfGLIzDjRJv7/
	Qi62eDUiaiggCl1vQ5n14Dm5rg2lkf74M5bZnRbMXdwDJd12WDjugSY3430cu7zU
	hfhEsPR6TaZv9HGFuMHH63Cy0wQ+aslg7XXogVCuYQ47ezT7G3/D8qZB2CkMUm2M
	Z/YhAZ7TW95TPXR/cm9jZfjtvHNkDi7dZfw1NUbuVNqOFhZMWT9eOL/2w9N9i2jW
	vlyY77cH9lHj8aKWug1zLLrcLFp1ltLZtpx/te/g7LFq327mChW+XccuC8QwnAHO
	xVCKxw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rh7gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:58:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7bf2d734so32145916d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793613505; x=1794218305; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xv2AKf702Amb8kE7FInOdGlSjutL7r+KnslMQbW9EJs=;
        b=UsvaXtMOpXa9fdrUQJqOe7eRrCnWXTu6a9TLL1RQZ2VQLAWPiPE4VDDlkLZKG5RECA
         uifqIEnoQ3Tys6CST+vEbmv68MIuG4A/uylchtY5+hzJFa3aXCrOVHzOiBH2mwAmLkBR
         lQIS+fptCWuVJUi02gVo5oyK8+rOWGLmGOfC/tuDHTGMDZUJ19nAPX0JE7GVJvIcNGvI
         DXp1uADjDPvshqsWhNvqtzqj5QQQvw8XXpH5Kg1cj4vJ9MIyP/zPN/5ub3ap9mMVGpNP
         6ZxHubKEwSsayK+ehjD/oD3cf71eSATJVf5y+wxi4iA9ZSwziRiDbCGb1qKhID3uSle2
         vr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613505; x=1794218305;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xv2AKf702Amb8kE7FInOdGlSjutL7r+KnslMQbW9EJs=;
        b=mFwc1dowUBFOKeGAik1fazIO2+xyjvSbyWr0WsKmSjNkr5Xae3mk0583mqjXsEETaM
         M8D0QKqrOhAvNtiiYu98MsG+4rMETqbGEV+Y9ndl2kAL8M8pEqXUY1SmzldVfTNomq0P
         jrLcWqxxt/TxKAZNeysRRWJKcll3WPlRM4Vnt/TcZJc6ZNwJ6UBRaGgUKPtZt/X6ml4O
         ONQyMsrun1Fe3DlueNkf/gW9GhMaL/2SgsVd7el4/QjzFLWll+2XHto/WVPB+zVAceBR
         KUsWTeZOsOcN91miccRPB299zde3emzCtN12qx9RDtpEvqav2csfFmApXY0B9rydNmZz
         PPGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP/OvDKrasJzIXY8Td4buUUVKbUlrtFnyyj5Gd8rOhVFBYZNRQdJrvygMpR7I0OuMR4BUwd86nz/kKmPSFFMkh@lists.infradead.org
X-Gm-Message-State: APuU4Z9d/eEFRiiBdvTrVZuR0/YaPKCdPlsv8BMizDOlXGcf+AiLEp4i
	R/IHJjuumZGS3p8hsqOsjDt9wGEAFf1ESXB/VsEoukgTS5T79S9oY/uuAcLEpBEqt8DiK6vEgYm
	VtqlrPc4bGMA+Drp8x0ANRMVpqjechyr9l6A0+Sl7pnhPneUob/iGWZdQTOwzA3PvGw1QIGCMls
	sAGg==
X-Gm-Gg: AYBFou3P0HcKKHTGfOKUUltTvkU+p0XUochmkExghB+sgBQju+ASl/MtAU9N299KSio
	XKOOA74WPH42gmoTYVk8Zc7YPNMJUchcstmXmiKOCMsGYcqPfFa7cKZmm0XJfJ8feA/2zXrt8Wj
	tJXRi+az6oVyoLBupDaTaPvJbGXoHz9SRVrpdEgXAWrl2v4avETdpgjGMF8lvnBNlUMuj56idCe
	KBG/a0DUhXhxZIzUA1ZPxUNEjGhtrBDjSv5iVQ+VAGBvST4yeDTdfiqcgnDgAJtsGc7twTWyBVE
	3ssle7zccsXSGDScoDGG3YRwaCf6L2WUxNaYQAHtcTukye1tJQ+S29rK3AqGL2lTofrEeM7R5Iq
	LCQ/8/T35AdmgNtIRts6+fBDqemfWHnw3k0fDN/fZQwHTwJb3EM3DpuNt4xvALQC8roYUdKROGF
	UyO0EalY8VgGMpTqZVOcuXz0O/HAVG2F5mAU88jHNeFQLdZP1m19As+f5ecuRU
X-Received: by 2002:a05:6214:3909:b0:91b:5d3b:4aca with SMTP id 6a1803df08f44-91ca4b980d0mr164013186d6.51.1793613505216;
        Mon, 02 Nov 2026 01:58:25 -0800 (PST)
X-Received: by 2002:a05:6214:3909:b0:91b:5d3b:4aca with SMTP id 6a1803df08f44-91ca4b980d0mr164013006d6.51.1793613504569;
        Mon, 02 Nov 2026 01:58:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbedf87dsm19739631fa.17.2026.11.02.01.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:58:22 -0800 (PST)
Date: Mon, 2 Nov 2026 11:58:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] iommu: qcom: Fix the MSM GPU and display with
 DMA-address based mappings
Message-ID: <vfpvxwe54n66qmdy5f6hopfo5szlwrl4gcu667mplv2eplu3br@aqpupbzslcgi>
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <CACSVV02xa+emUMd7Dp1rDSwa0e3wpyQBcPeZg-bXPL4U3kzQvg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02xa+emUMd7Dp1rDSwa0e3wpyQBcPeZg-bXPL4U3kzQvg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 4Nd-OWT7LCTL54K0EK8GlqA1YIN79MvQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX2mKoYc0jIZAt
 U/v70Vf2epnTi2mJW1v3FD0mAsxLPCDgof9JogoRCVLtRDbQ18jxpdbkSwMtOGh0B9c4Im/C3eG
 pzKSAwY0vgltucnxR/R6pQUVKXeHdCAFHZsdTV44a9zJ4C/yhzQMuq+zf2fPpH45WKJbummYmMQ
 +S3iVkS1PFHQ+PAuPm77P2kcL1LmyVLWz8gxbNiI22sLala1NLfyZKet0EWtHxNLj/QhtpG/8l1
 2QrhXegnH/DsV5TIK6XevI6LPWeG58kXBCTWas0uc6sYnNAQ0h7kEDgE0CcsOTx8ksvFj7xu8Bq
 rp3tTqlJylgriKYUU8e1pM5gmeG9HgPugzV5ytwkUJBDt04Uw4yi9rPoAy1+EIGijth3oKUkYs2
 b8ak1NEsyHZf7FGIy8kfd7qV4fxvYOydPZGagGr5KQ09YtK/QPWgiAP5piyxUSgbbEHKIx9ErVj
 pJ5KXzKQ17puMIXzj1w==
X-Proofpoint-GUID: 4Nd-OWT7LCTL54K0EK8GlqA1YIN79MvQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX/uLxECmp4Pr1
 MZw5YwQ918GYAnPDU3pZs/Y/CPFGe2tUPtMKM8SHQG+2Kfgy6X6CXInu9LsCtFFqr0r4DABdbmU
 uyfYsq565KeJI1OVV/R/pXgFCy2pHic=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae85ec2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=wZccLAYvN7ng3IXnx9gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_015827_214103_18CF60F1 
X-CRM114-Status: GOOD (  25.47  )
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

On Sat, Oct 31, 2026 at 08:33:06AM -0700, Rob Clark wrote:
> On Fri, Oct 30, 2026 at 3:05 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Rob's drm/msm series [1] writes the addresses dma_map_sgtable() returns
> > for the DRM device into the GPU and display page tables, so they have to
> > be physical addresses, i.e. the device must not use iommu-dma. On DPU
> > platforms that holds, the DRM device has no iommus of its own. On MDP5
> > platforms it is the MDP5 device, which ends up with iommu-dma: the GPU
> > then fails to start on db410c and sda660 and resets db820c. The last
> > two patches give it an identity default domain in qcom_iommu and
> > arm-smmu-qcom.
> >
> > The first patch fixes qcom_iommu's flush_iotlb_all, which never
> > invalidated the TLB. Nothing relies on it today, but the series above
> > does, hence no Fixes tag.
> >
> > The patches are independent of [1] and a no-op for the current drm/msm,
> > but have to land before it. Tested on top of [1] on db410c, db820c and
> > IFC6560 with and without these patches, and on Open-Q 835 (DPU) as a
> > control.
> 
> Thanks, this should mostly supersede my untested series[1], but I
> think msm_iommu.c still needs the same treatment?  Hopefully just the
> def_domain_type() part?

The msm_iommu.c needed more fixes. I will refresh my old series and
include fixes necessary for the dmabuf debug to work.

-- 
With best wishes
Dmitry


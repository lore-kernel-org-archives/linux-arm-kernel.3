Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6887606B962
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eehzuK8f;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTzOVivM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=btu247vK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PIuOCX0AHVQZHCW56MurqyskT5/roJv4n8HNkBO1lr4=; b=eehzuK8fh8NTgB
	1mXdfvhAIoYhJbr2qVNKiKP4iCDkNOywxBm4HuSyO3LN4qB8uyzENo7/4izvGIIKh3cNZkNeJ/oG8
	M6Z/8kU28CKnqbIvZzSPP3gd7FPjBfMP2IuFdtOVKVtBAmTeSFUA2ul7lWOpLXi/v8tJCL/WLKPln
	oRfCNyPtaBi2MW/nw9kfJAaCIj9rMDimy1XbELjD8veNUFbCe2LUFXqNkrSgDigRbcWQU14HNgUBd
	0GOSr4R1U2ZPe1I8nO9AM53tuARM+sIDGqGNLt59FjwhISCywGgD5HJQjCz/vVctEQoRx9cWS6YFZ
	QtXWpIGxpBBHT4uwCoww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkLC-0000000BU4o-2dCz;
	Fri, 30 Oct 2026 11:00:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkLA-0000000BU3J-1KLH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:00:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F1F92682389
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 11:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PIuOCX0AHVQZHCW56MurqyskT5/roJv4n8HNkBO1lr4=; b=aTzOVivMPp0yWKdU
	9LGLEv6Ecdv5Kov+N1E3GZC9BjPJVT9lzoQmm5SLp4p1w7SbyzWmSKKV9ZdI6vGV
	MvBhZveSuOzvdzRSWF1fiSEXOw+zp0rE+dXiWlR9aYBJqvkHlUPtpSZx8tfnTRT7
	WOTpxYWBMbhmqqcSVIMnabloXlQqW+b0bpkWRBztpaJEQGt6PaZPtg5mR0jYpPJx
	FmOAqUW/84QlIfhRZAQMPNy5MEnaABH786sBNXj2c4es1H+sYf89OXA/h40VgajG
	v7h9/zjWQIsHZwBEXPSIM/4Ht3+PlxxZd1EccLcPKF8omnZWfDobgWIL1gSkj1V3
	zM97OA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjkah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 11:00:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8e16d22d8so10304765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358006; cv=none;
        d=google.com; s=arc-20260327;
        b=s58j44OvyksKw0MI+Ig4Uv/qTZHODZld8ap0YZl8aS+N2wjloorGmk0MrJJjEpSRTb
         jaXgqh6i9I++IANy7s7sdbqgHH966qq1iD/09+NlLUSQhXTzNqEnhvrJwDHyBMOvf1EY
         5R0g7ieL3THXMSFnoAxGJtlCZDpLzxdNRbNgeRjSGMWR7+KDIMGUv2TF2W4eyi7GKx8Z
         mvWxDs7Mht+wJi453pm7E/3YfnQm12YfjSM/hRMgmKLqNRv7iSiqsYUnDJl18Bt0bQfq
         NyIn2qcBHMbbn57tPr5W6ENWMA7/SP7P1i7+0L1JdRIXIxM2i0Pt39SsWLkXHX76A61y
         uV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PIuOCX0AHVQZHCW56MurqyskT5/roJv4n8HNkBO1lr4=;
        fh=B7gcFINchYpxm0KGUZKzim0JE0/XEcB4jdm4mGZi/AQ=;
        b=dOBaqyOnuEGONboVQNtWQD4hgD4h1Pa/CzRhHulV2SuJ1PuJNABupHROcOfgZWxIK5
         pGzW0EkFkuKcSgH0719EEjejGl+oJpUcE3K0RrRILDWnqVgquZVeQQQHbcceMpgXmcb8
         AnkF7mzV7hSJz6HNmXi+aDtzbzrYNzIDTMXoJKtpIlVNCzbBTeeFPG0Sx15AsgBbY2Xo
         DGCXltiz2r7dMnOQhp20M5nyNgv95j78RzLBkVZB6DZs4m79o9XaVpjYdUKuiEsNor0Z
         8ADLjdAHwJemH0MpZlcOUHS8trLbmEvHGrdZdMsUV53NLynhVPodIw8ulpTrgX/Wdf3q
         cidg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358006; x=1793962806; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PIuOCX0AHVQZHCW56MurqyskT5/roJv4n8HNkBO1lr4=;
        b=btu247vK9kGrqsm2jVICFh/1NCiSB2zmwLYzYGLWieg9jQ/QHsu3NywBr488zZ5DkM
         /umplUptSPMc+QC/ueh0g7/4exi7nKmAE/l9S1NomAGff5kWhtf8beANdSqwYEW80rXi
         MwxTzRK4ceb/dp1VhFfRxm4boRcbCDbTXai0kXNYB9DIAniJT/iHPJ/PV1MWwR6RIBW5
         6H46gsrteLKESdZsGgrzQ0BgyDECndrE45aTwZfBLGhbNGijHyB/YzH0QwcwlxreL+sL
         zHmSe9y4tZZXM71m4c/5qt8e0EhrdBP3XSGZ5l3twVU7HSVjllwR+J8/QCD8YztEmsb4
         xwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358006; x=1793962806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIuOCX0AHVQZHCW56MurqyskT5/roJv4n8HNkBO1lr4=;
        b=Rcp2hIrDmH77EjweS123Pcibawn8qKjHR5WkAvBNQ9Ojiz4lzbKeGg9JXpjO3mn2M/
         yd8rN8YcuEKGBHlmM8g+NYhAjLNpvocsye/1xucFLSxIGfwBbWn/0npYj3jp0a7RDdDd
         UDRmTpvlFC+pwhK3EC0dMdVUX7LFbnsiJipjuWBDPTWkAImguQkfB4HO0/xsY843YXAO
         WWXjynH7Lj3Uog5/TXrblP1fBAdPqeva841ZbUoNGBubnlVzFeZ/139/yORteByEgacZ
         1tehWWP/SY/mCI6EKgal50NNvt2/6e850JK28lPzw3Y+9WPdgkaG3beP691PNZJU3gPY
         p6+g==
X-Forwarded-Encrypted: i=1; AKwUvBzu4OBS7SqePdlsYaIoYD+VNSjjVxeg7l3GXnZpmuDqBf5CnX8tVBwNctKmmJtp6NrKKPT9mDt6zPjgu6/iLDiV@lists.infradead.org
X-Gm-Message-State: AFq9FYJ43X42VtAeimA3NA6CFhAHtsGmQUArus83a5xfiyerL/qa8prg
	459egLrzrB6XNKjXsL175m70eoSm267fKvSxD5n/SB3HlMDZBkmIwmgDs2bISTOpGnHcmLyMEYi
	6LPGYi45eKZD7fHcXWAi7Am+TCAuVYdj9gVq48Lur5an3eNei6PNTAMF8IJl46GGxKaZkRwo2Wm
	uw8T3wubdXW1Z9Ckxf3ed24clLqU626NOj3lQPGzjsV+pytq5tkdpm
X-Gm-Gg: AYBFou2QA2ULEtla3crBZBQAiWYNPL4BPxvcvB7Ni9/CeapFd0+O6qmIjiSvCH5t8NP
	wnukYlwOCDi53hbfEvClhP9B/9f9YkgNu/qH1CZkzsyKxlIu41PQC01HKSvDy3E+aGBiw3ajAJI
	kUegZa4r9jMtTLgfosowvyf9YTEBMVHZtq6xvhcfWBaoDutVTRia9+uY9qpA==
X-Received: by 2002:a17:902:f785:b0:2ea:238c:4451 with SMTP id d9443c01a7336-2eb364b499amr21193645ad.30.1793358006476;
        Fri, 30 Oct 2026 04:00:06 -0700 (PDT)
X-Received: by 2002:a17:902:f785:b0:2ea:238c:4451 with SMTP id
 d9443c01a7336-2eb364b499amr21193275ad.30.1793358006004; Fri, 30 Oct 2026
 04:00:06 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016163707.3508-1-anferneemelokc5@gmail.com>
In-Reply-To: <20261016163707.3508-1-anferneemelokc5@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:59:52 +0100
X-Gm-Features: AclHuK-BvDlghJYUIO9TuDP8Rn85PebL2VkhT0kLOMXOR76evk5RCctsK-_4c1g
Message-ID: <CAPx+jO_FV4Cfms7HmfxGxhtNuME6NJ8Vgov1P+AT+4UtJOsqAQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmci: fix DMA channel leak when mmc_add_host() fails
To: Anfernee Cao <anferneemelokc5@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulfh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: l-ZcD1FQFBe6skxhHH04aKbuVddWL-Bi
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae478b7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=rFPXIUPvEMN7u70KbzcA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX/c+3vsI80j5A
 tgT68zD6ACAMXcJdtI/zOlJtW4Dd6AQQb0ncvVGa9qABa2Y4RDy858QlNVinbvXBF9I47hyayuL
 niLRWOnfZZnJQTWNuCTh9zIAIOk1iDkOF7cQ7ymOYk7VwugQKtg1ux39l9zmwtboeAb7mr/XL43
 A27TJnBNrb5PeX/ko7QKmR25OeJTkrBuAlVA9vnifSphg5CbqGklyrdOD1bQ8KaCTLV8jsr+SeN
 WIbLeOa06XoJnsxu2MMJ+KVNM5WtHGODvVAJZMz82fHregHSfd65027gfTjkfSpd2o5gAcmquZl
 MefPgnUvHEmr1r5kj0UH0vU8QkcSrcYQ2RZL6JZybWsbntLTrbGHOFw2C32EIuDo/Dyg8YAela4
 kYNS7HzK3m++MZ12VVcu2FGlwIrFLRDf1NOln3IPPv0xZxKWJET74qXjrtPCiA6x5DBx7bB1+r/
 Tgl7utfOdK5sdhey8DQ==
X-Proofpoint-ORIG-GUID: l-ZcD1FQFBe6skxhHH04aKbuVddWL-Bi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfXxjrQ6yIx7ng7
 0B78d+HQRMjCmEGUZ5l8rpfNojcVcC1ok4Ebzg3HKiWZsykEI+l7HIQfSFD+Vqkbv+3WtzEsOSz
 sOnHaUsihenz5jrK2gcvhSXusLysaRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_040008_371416_AA44859D 
X-CRM114-Status: GOOD (  22.87  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 6:37=E2=80=AFPM Anfernee Cao <anferneemelokc5@gmail=
.com> wrote:
>
> mmci_probe() calls mmci_dma_setup(), which acquires the RX and TX DMA
> channels via dma_request_chan(). These channels are not managed by
> devres, and are released only by mmci_dma_release().
>
> If the following mmc_add_host() fails, probe jumps to the clk_disable
> label, which only disables the clock. As probe then fails,
> mmci_remove() is never called, so both DMA channels are leaked.
>
> Release them by adding a dedicated unwind label, reached only after
> mmci_dma_setup().
>
> This issue was found by manual code inspection.
>
> Fixes: b38a20f29a49 ("mmc: mmci: fix return value check of mmc_add_host()=
")
> Cc: stable@vger.kernel.org # v6.2+
> Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 416bdb184ed4..4db5c55b2700 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -2477,11 +2477,13 @@ static int mmci_probe(struct amba_device *dev,
>
>         ret =3D mmc_add_host(mmc);
>         if (ret)
> -               goto clk_disable;
> +               goto dma_release;
>
>         pm_runtime_put(&dev->dev);
>         return 0;
>
> +dma_release:
> +       mmci_dma_release(host);
>   clk_disable:
>         clk_disable_unprepare(host->clk);
>         return ret;
> --
> 2.54.0.windows.1
>


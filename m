Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94920606D29C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1FDmPG4z;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Re4nznSN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=heG81Euj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S7Xg2vGeJzK/amaGgwLRI/lApgi2Uub6jwZHNBWQ3u4=; b=1FDmPG4zs+ZIZ6
	l4wSnRBPWf7PO/Cb1zNuTJlmsK01ox92VQxg/LoqZfsFvcpi1Ti9eFqQAb5pUYnpNCrWvOnTCkSca
	VOX2oaJ0ck0wHtcXDR5QHa6JV9huBeSO2vRKml43Uu0wzWuiekC9ROftnEZKD1jBLtkOh9j4vphIz
	+LT8WHjo0K17nuJJZ8t8nbyVK4/omZtZxykOylrwkUe9lnMyoxDnBeS15KiWQkXH/uEwqJ361ICav
	QO/V5dxcS+a1rjNjMz+4PhQ4QOWmB72uFRVu/Esv5f0CzLpFIFUZs/0P6D5oMb7woiUwP4Ogtayco
	v2gTHgFaEy0dz932yssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkLu-0000000BURR-1nHG;
	Fri, 30 Oct 2026 11:00:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkLk-0000000BUMS-2tGI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:00:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F0Yw2721626
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 11:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7Xg2vGeJzK/amaGgwLRI/lApgi2Uub6jwZHNBWQ3u4=; b=Re4nznSNXCExMHMm
	9m9s4nt2irbhXDYytwghS+frh2ODnBR9PC7dVYIMdgcGrD7Tsv5FtblauPJDb5CN
	RN+ApNHAzdVpA1lcXHDHDnjjPA16Qefq2urBpL2LWzv+mQSPYr7cKPCtbajK7R22
	JvGeRvuGeJesNmSi/3HPOi5iRYaCLVZ4CXDe6k6mW2McRyFkHu68yNBV0+B6mzrQ
	7fBGfk0Q78xP//M3NxUrxxep729h2K4kijeDXwJai5BzRSB1+VQmOhoAYb052wm8
	kZKha3wRDwoPtXyRJOLVBk8Hnsp1f0MjFbhadl9pdOfd5L6iY8pX7E9rTX44aSHN
	hmcXJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjjp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 11:00:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso831566a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358042; cv=none;
        d=google.com; s=arc-20260327;
        b=R3pLbu1jA1PREmpWYX/aH8MUapK1QFoAo9Dy/GrlGSbNdL8riwCSWidovnr4NNZJ4/
         fF6oLSHVUPTnmHZMd5B6h80lnfUpcZAOpi0PsdFPjjQbw2TWMDRF6tWzaZaQnReg9b56
         RjxHDXwMcya4PQLSLPaETRWAKFL2Lz/bKUolWBsmtAwQtiw1/QPAuxiuWN+yYPj4yvW1
         RtEzBdoY0Pwd6urm+gWoxdQjJuNvPq0JknHaimCBuD9U8vQS/uSwPS5ZAmY5Lka+YTa7
         3KRLWACdrH3JIZ380G6UsYatMtYBfTR8FXcmglambGngPdxRRtKmZMpVQwynwBUwHTKe
         q1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S7Xg2vGeJzK/amaGgwLRI/lApgi2Uub6jwZHNBWQ3u4=;
        fh=qAH6y9M3iA28ALMOadebiTkP1nD/sm00nSXlxPf3NFs=;
        b=R6L89TDDNcdQGCpcmojrSagIVDbK57ku8sUnqaHBQT1XPkTwv9pgNkcAoqGaX+71cT
         lMY3gHTvaC2mqLp4sz81qibmGKTePlB5yPtIQH3X2vzhtbYkjhBxPiI5OLTkjPBQdDid
         zMyzrSi/sBIBh7Y3LtLe+AcVzCe8qudwnUpXBUJeqd4VJK8dpXxXnJfiwGtVgCEu68jn
         G7qYniIfqPpXUyjr5YbaYxyO4HAXmN7q5bZ1JSX5zp6mLXqt1rwv100YqqbpQtiympKq
         EDlmgUFCtCwNK76ueGGk99AKS3HW4G4LriOfd+he/ODNRmDt9Pyhlxjes204eVdXWRYb
         dpfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358042; x=1793962842; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S7Xg2vGeJzK/amaGgwLRI/lApgi2Uub6jwZHNBWQ3u4=;
        b=heG81Euj8vodrXYH6tXp/m5jW+dpzqNXaQI51WTsPBt82nwV6Zo7K/9ssRjOkiVImz
         Fc1dlBjaNszDtDQdskYsRgqQ4rfvKZS9o2vHddSdXI1/RJIVdOhRnXuuId/A8GKtGFCZ
         9+KUdHO1w9Y7BIDeT5FyubDH70wZWX7Dd7TkKglIjI4x+kr4hyGylSALRg8/K7/k6nt/
         62rbL2x5v2fGw3GP9j07vJ4KdBjeJGOjFPq51OUil6gaHqZtRoZC9l05QxRyo5VzxvJT
         eYnDrIx9N8uJ/JIsOo/kB8d6yROEV2loQGcw9wA1MWlaJEVj1Hlszjw2NMdLBSm0xDEk
         Cotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358042; x=1793962842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7Xg2vGeJzK/amaGgwLRI/lApgi2Uub6jwZHNBWQ3u4=;
        b=JACgxQGm8GaONVL+fOPfvB3xifmUfYEcnfNn2utF7yAqu3EOuGKUgV23QvVNqBfjIM
         o7zaz9DWdjTou0agG0ZieEzomcs+VDV/Fh+C5RnT3Mp4CWM4OPqzIIs4rLTLgvAYxdoh
         9mgXFqmnlbvcFOcoMrzn6Dvy7t6HMyKGqMe5ZTJSwJGpks6wC+aclda8rbVRI76//35J
         vnkiZomw7FUNYQYfN9oG/TBkUtMFzP0VCUY6BkScJsCoFZrDP0QHfvqNrTSEndcyX6XT
         s/FxpyXMbUhqd5y2XYi9yMOOHgV+hMwjdfAqGAd7lEpYs22GNNgLpV9O48opYNfRT9xg
         DyUg==
X-Forwarded-Encrypted: i=1; AKwUvByxRVlRpf0OrFJ2xNSgGhiE53HJqiNAVY8cmZ8HthDcGcO63u/JS6rG61cX1r4S+ra2RlW0pYWXw1abVLj6LCWr@lists.infradead.org
X-Gm-Message-State: AFq9FYLcuAFRgHkSDtV3EGmBrTw3NlBQhgJVXKcUy2GzNgzFgtFxzfUT
	kFK1wW3lp4xpNACounM8hNrDeShurmoreTuRrQW9+UZztxHWTrtLAQvRtu5xkWltDSLG6nxPrwN
	uUl9guyND/liIVRrawDcI4o+HOANUn5Li/Eqs0mXtTSezWUMxpbtJ4Ew9JUXA1kla8iDTTHxKOB
	+ME7ad+JDQ4qHEkHCux4N2k2XBDKn3mtfynDnQKHvl6YuZ59vmccup
X-Gm-Gg: AYBFou0Pdg8U/+vSmqe61kjIID8pHl43evBphee4XsJRBY62Mzbl/i/oTVLUUWlx7YC
	I5oDqNmfmAYwObgCu+J57GWqmKJUL2CzeG9c86f7tecSFMLebzi2ff4yolJueuygPvgtmYXEPed
	Oq1h2jDxKXpT8SU5E54kxB2+aWZvbIOJh+dBo6anprypn7RJmxAyt+H0IjRg==
X-Received: by 2002:a17:90b:584c:b0:3ab:d26b:c2d1 with SMTP id 98e67ed59e1d1-3ae89724955mr1586108a91.11.1793358042351;
        Fri, 30 Oct 2026 04:00:42 -0700 (PDT)
X-Received: by 2002:a17:90b:584c:b0:3ab:d26b:c2d1 with SMTP id
 98e67ed59e1d1-3ae89724955mr1586088a91.11.1793358041880; Fri, 30 Oct 2026
 04:00:41 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020140743.2765011-1-bruceli20040604@gmail.com>
In-Reply-To: <20261020140743.2765011-1-bruceli20040604@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:00:30 +0100
X-Gm-Features: AclHuK-8I4I6OlbthS0jN4vk_MeSDsmg6sB27-NI9aRz5ijsyEpNPQ6o5hrWtN8
Message-ID: <CAPx+jO-fVQ1kt=aeOG9fkZGo8qBNVBdNk7PdKNOEFWfDAPkXTg@mail.gmail.com>
Subject: Re: [PATCH] mmc: atmel-mci: fix PDC bounce buffer use-after-free
To: Guanxin Li <bruceli20040604@gmail.com>
Cc: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: leLt5v1USOZysJuima1-iMuSua2LMMmh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX9JQAwcBmFIG6
 RKtl3q1t+eCnyBLDSKf6/A7zOrkn7nh5nDUiCyn2uZQ26e2i4ZrApcdCHpF3axNzR5jU+GNWnWy
 DayRH7jGL2PFNm1zdPxKDJppOrvGync=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae478db cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=gKiUwDw30W1Mxb9jGGUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: leLt5v1USOZysJuima1-iMuSua2LMMmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX1ZYXhvQzPEcQ
 vBb5gBrgAXwsAXaTyQxQtkg7Ntb79NsbCayEa3+UHACg51aqImRYT+KQARaa5FpRc+yqTX/2DDT
 Q5/lBoer70ccLb+WGKsBCvaq0IldUmPlAdSo68AQP/jJFQwH9vKcQqbV6TzZ+6fI3AZZelG+58l
 7gRvf4jLdJeAnfJMUzmPKm3qSUaYGW+i0M9Nz4AIOOq6t1EICHohitX24CjM+b8m9/uVXzLj/yY
 OBvoJyj/P5vqwn7HPkBdHwLNgf7yinhsGV/IZJwCf6MTDUu44iXwK96p7TyxE2wZUQ7fPaiXB4t
 f8CNll6hhuHgs5+IOtZ9dQAiYf+MGUDqhHRvGBB87R4Dv3y5IqObif5RIPKpVEGeuGVZnJRTIh/
 Oo/E+bExf+Aa2rTmcgWjX2E2RdMHBru78v0sIWeClg3LYy3nH1ZXvLFO3S7Zuv4R4L3L255PbXh
 1uHQx9Wpbz/gbNyXaiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_040044_850384_B5AD70BD 
X-CRM114-Status: GOOD (  25.26  )
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

On Tue, Oct 20, 2026 at 4:08=E2=80=AFPM Guanxin Li <bruceli20040604@gmail.c=
om> wrote:
>
> atmci_remove() currently frees the coherent PDC buffer immediately
> after pm_runtime_get_sync(), before the controller and its interrupt
> handler have been quiesced.
>
> A pending RXBUFF or TXBUFE interrupt can enter atmci_interrupt() after
> the buffer has been freed. For a completed receive transfer,
> atmci_pdc_complete() accesses host->buffer while copying received data
> to the request scatterlist. When data remains, the interrupt handler
> can instead call atmci_pdc_set_both_buf(), which may program
> host->buf_phys_addr back into the PDC and make the PDC access a freed
> coherent allocation.
>
> The buffer must also remain valid while atmci_cleanup_slot() calls
> mmc_remove_host(), since an in-flight request may complete during host
> removal and take the same interrupt paths.
>
> Move dma_free_coherent() after the controller is disabled, the timer
> and IRQ handler are synchronized, and bh_work is canceled. Keep the
> remaining teardown order unchanged so that in-flight requests can
> finish before the buffer is released.
>
> Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>

Applied for next, thanks!

While at it, I noticed that a similar problem exists in ->probe(). The
dma buffer is allocated *after* mmc_add_host() is called. You may want
to fix that too!?

Kind regards
Uffe


> ---
>  drivers/mmc/host/atmel-mci.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 8f4df250a77a..7f1a5864da96 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -2592,9 +2592,6 @@ static void atmci_remove(struct platform_device *pd=
ev)
>
>         pm_runtime_get_sync(dev);
>
> -       if (host->buffer)
> -               dma_free_coherent(dev, host->buf_size, host->buffer, host=
->buf_phys_addr);
> -
>         for (i =3D 0; i < ATMCI_MAX_NR_SLOTS; i++) {
>                 if (host->slot[i])
>                         atmci_cleanup_slot(host->slot[i], i);
> @@ -2612,6 +2609,9 @@ static void atmci_remove(struct platform_device *pd=
ev)
>
>         cancel_work_sync(&host->bh_work);
>
> +       if (host->buffer)
> +               dma_free_coherent(dev, host->buf_size, host->buffer, host=
->buf_phys_addr);
> +
>         clk_disable_unprepare(host->mck);
>
>         pm_runtime_disable(dev);
> --
> 2.43.0
>


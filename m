Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B638E606D287
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R/5gXvOP;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HmIUtBvE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idvz22d0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=; b=R/5gXvOPH4fjR6
	DUwfFFrP+WPjzxwZ5xJkkhJQps6yPzsTOFcTp+YDlrLoR9Lp/0sbBBkuCrMykltkLYYFf0XzYIjAn
	ERHOC5g0Sv29IEJOCTvxX2keP6WEXp9cN+xZlu9ZEKOLQSrD/WkoRoaUcTbLEnwoPbkpabEY+DfYH
	BMpffVGfNhIjvVxpzhhpUGZ5M+Sq431ZJE4qDRVuXrb6GV/Dnd01RVelWByBJAM+B9NngVRzFSA2a
	J2nVT2bwyenPp5vOTSXBHX5jjXukg5O4fmJgpS4QJdmh6ZNlW7G8CNq4hpLN9m0au+rJ/Rt7mZKEq
	pA5SnTE4pQnaVVwA+fXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkLW-0000000BUFE-3Ira;
	Fri, 30 Oct 2026 11:00:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkLU-0000000BUDa-2geJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:00:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F66Z2683320
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 11:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=; b=HmIUtBvER/Y2SW+i
	q5qyGmDoHSPZdndt97PH0rykbu1/4QX7YiVLErRJi6rCe7850+rpnwajQdu5VUxp
	pIAPcjEXNDjPn+uQ1AtxgikcP/JNvGpX0H0YUVLl4OKVGBD86MAxL7/TcGsHBfjF
	VVCq697DkSz3vVq5I8JzA+m7+1xqRzrV2tEhmavl7NPBoWKP5n3xz0tuRm/66EsW
	CvFuCc81VYGmkzj51FYXmakxs7M5Qp/mtS32JBEoDxcFPhzbqqcvRxTakgGf/DU/
	nJWhukWUiGKGSNCZ7dqHeO6JbFzq1igI/QrfoxM1gpX35sZBWPP9eq/mcO/KKPJn
	emqnOQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjkcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 11:00:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05bfa6af5so477615b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358027; cv=none;
        d=google.com; s=arc-20260327;
        b=MPWEKXdaoFp9uF1t485OUka2eL+YFHR0HUGCjWaqz9WH7GKw4MgZxuLtX/VUZXGssc
         BTByz+4N6mSjPkVvleLJuPIt8OohpFM6o75YwWO8oBd2n2fd8+nUVUFDrwftiVXcq2oV
         cJ+nEgfPFdBWsZt+W1s3XDf4t7gnu0IA9TTKwlTMpJj6a/yalS+CRpv2DaNo9F4u6Mxx
         5GTqNTM1u1huNalSZ7LB2jufoCT7kfnHk4oLebdSPiJND4UumXLzCC4ys6lFmgG/ok87
         Xhhxjssl113LYeGmbPDBD4bAKhjLM1OZKY9JShfOxilloVyWnkVssvJwCFS04K3B9GrS
         7yEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=;
        fh=UJP3Ejpk67CwVGBR6CA2w8x4W5YIKdU8ZAmYGtQpMBI=;
        b=Mcl2HDlNlk6nBhazomRi0T8cwmCSsPrb9ZIFGdev82V39zMLyfByActgWJy9eAIvvA
         evImbU6VJfhUa6sB2SG9FPD9Z6QPBembPabhzuD8iDCr1oJgRVjMQpgRaZE4hpRXy9+X
         6CMJXkp4c/T9ySsgsZSvNscqOBoprE/Xu4tv7o5dny6YzDw0Y327+fYGEVPortEESVdP
         N7MXfZcRPSJ2sry86OvSSP35C/udgaIyONvF/Zp85rwv7lXSJ6rxqQxwOydvv3sUjHNV
         cGZ19Fd7Ad9X6LYv3Fiqv2gt5bCW+aIpINDhn5jP2u2BK+ZdN+5s50VNAFB8nlaAJ+4Y
         Vy4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358027; x=1793962827; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=;
        b=idvz22d0J760kExBn7L0Y+rsemLkLK99NO3NE2FVPDP4qB62Jf0NzoUAHkuuW3GupH
         ARTEsaatQUB0KS7V3Q2+dHAIjfir5TS86z1h/1fFTJ4REjbF+7GprfXiTGzQXMV7Dpuq
         BSAu2tjii0IOz8wBfXrhQKqH8VUC23L2mXP9Q/mazUgc/JtviFopkFGB+xci+++B398m
         js/LevoSK+umRWHar+YMuISAvf5LTeQfUrU/pX46NuQ5yNnHmd8z7YyYZvc9nK+t4qwv
         lK9Me3/kl0bmmJAvDu0EZxGHq7t+Ip0Vl/NRL+wywUPqyU3O92aD2qLyp5M++4+QSNx6
         4czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358027; x=1793962827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgLsF++4YrDHxiLkxSaC+mUba5OUh/3qh0E4AJY47EQ=;
        b=eM+ivwDjSWSDFlaredZ3p28/nZUHxBDvmnLvLaCeIPqvEZIwVFb7/TIuLBe39Itm1q
         GsRT0OHjLrBxJQ6En82ZIdfBB2LO5vFjY3EC+9X9uiBKtL0OPCiHZXe0rNy3lp8MmQYD
         R7eGfFKgZnBWOaCesAx6cUdbbyMi3GY2XCRiMmAxjUVv7BQi29UE09TqUG3H6yGrIZZj
         FmPMvOy4buCN5OsZFKqez85JNrmOlAyRZTBwrtYhZgHYm9e8OvRARIBXvsy+E0y/E4iW
         Aj0VISI2KZ/6X0o1W0sbZIixVeQB7X8wxDILYOZUUQCqSlfeBLoQlwbbqmNSWuSKWlzd
         mItQ==
X-Forwarded-Encrypted: i=1; AKwUvByqCglkgTHRXvU+2ZN2QxrhIQnIPB5svIvpGlDFBxdsw7Xdk+hjeWwH0tg4eEQD652Oh624+VyGnUk88jGDLHPK@lists.infradead.org
X-Gm-Message-State: AFq9FYIBWYF0KZwbu79/YNIn+OFXRlHkUyk6M4cbZa1XIP3puweBODz9
	lOzaOO9s865MhAP+x5Nd6Lo0c9xb0IntJy4Wypjbds6J5nnVVZgcI9Jq2Ub3DPOuiUIgn3D2WDs
	c7O7oJksqQfajhCTjm3MmMk811JvAdLfShdIwmMUCuX0bK+/yQDwtJPlT7+8QEtF8r9qDsZfz3Z
	v6AAnNx8IUkBVLjbHikaKXT+tmG/VfdnJF/U6N84ZS334/5CpEh3O4FnQ8NQnz
X-Gm-Gg: AYBFou3kdZx4u0/iNvyaDImWgQH8Q2U4If3gyoQyXOyDoKSGxRXyZdwFfV8lFLE4031
	0gRwUeBTlGQnoB0JG/SC0cRv0lwpzQAxxROpS4MrFlrgm/kTaDaBRjDYFkJAH7nfi4BvzYxTYDm
	jTt1rc9cswigoTBF4HzJllctKWKloyQdOuqi9+X+BOVquNy7GwYgfROOf18g==
X-Received: by 2002:a05:6a00:4b52:b0:89e:7bfa:f880 with SMTP id d2e1a72fcca58-8a9be4912efmr1664008b3a.11.1793358026732;
        Fri, 30 Oct 2026 04:00:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b52:b0:89e:7bfa:f880 with SMTP id
 d2e1a72fcca58-8a9be4912efmr1663980b3a.11.1793358026227; Fri, 30 Oct 2026
 04:00:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020220140.31752-1-anferneemelokc5@gmail.com>
In-Reply-To: <20261020220140.31752-1-anferneemelokc5@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:00:14 +0100
X-Gm-Features: AclHuK9cDn85gWrusMMP-W9L41_UYwMzVXdFFjFJTDQP7QMovH4WYgXI-UJFkXY
Message-ID: <CAPx+jO8ZmctKiQntoYrrYW61zwFXkT0_jR8Uqgup8iB1m0C8mQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sunxi: fix clock and runtime PM leaks on probe failure
To: Anfernee Cao <anferneemelokc5@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BpRA_80U0b_D0haLYdKgqydxXs2q9Dft
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae478cb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=BnDUjJD_-KrmPbzgTPgA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX194Y20Ly3Qj4
 1Y3bpY456c3Q0TLRHjXZNipPqeBDPddcq518+cpbVvWwzseJcqo3PHBoFFKGJ6v5tSCQ8qXDM50
 +Wa20PDERz59Ekzo0+gErI9X/bdRdsgGhMvtDK6BEKvScApA0Z0I45HePkYjIVsTJsn6fu/1Mwy
 cSvnmuSVJmReQ34wg8j+Pj0Tc0XauLRM2WlZzfvyz2rKmP+BkrNdCXsFd/UxVtlPL8wOM9cMbsK
 rCI92hg57WCOoaKH7VEIikrC1AeiQ7aZkOPAIYRL9OBM9fMJSd1O7xxTBtSfjSoXDgwCka0CEGZ
 NFVi7Od9oMiQxo3iO73Q2etLXfUa+abkOqY/8Ah2MkbkaRvSJSVbeq+FcKtujS5Vxu2GzpFPvmN
 upqa1rf9PpOh2yMXdZUzc14Z2BNq2Nn9ObbXBuO6QtjfvxR5Ag9tVTP2Zxx/nQsqB4ZKlkDZars
 z5Z08HG8vM9t4HfJkOg==
X-Proofpoint-ORIG-GUID: BpRA_80U0b_D0haLYdKgqydxXs2q9Dft
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfXytGdKLxI92tA
 zYgmkr0bNai5p/81rtJDlg4gsVY8dRdC0geClAaSZIfkg+UyEZzvb4O0LC9gCOTiBzXvt5cYX0u
 5K68Qg/WeSraT7Tn32dxMYkfGw37Dd0=
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
X-CRM114-CacheID: sfid-20261030_040028_686615_991A81EC 
X-CRM114-Status: GOOD (  28.11  )
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

On Tue, Oct 20, 2026 at 4:01=E2=80=AFPM Anfernee Cao <anferneemelokc5@gmail=
.com> wrote:
>
> sunxi_mmc_resource_request() enables the bus, card, output and sample
> clocks before returning. Several failure paths later in
> sunxi_mmc_probe() leave them running:
>
>  - If devm_request_threaded_irq() fails, the clocks enabled by
>    sunxi_mmc_enable() are never disabled.
>  - If dma_alloc_coherent(), mmc_of_parse() or sunxi_mmc_init_host()
>    fails, probe only frees the DMA buffer and the mmc_host.
>  - If mmc_add_host() fails, runtime PM has already been enabled, but
>    pm_runtime_disable() is never called.
>
> Besides leaking the clocks, this leaves the clock enable counts
> unbalanced, so a reprobe (for example after -EPROBE_DEFER) calls
> clk_prepare_enable() on the same clocks again.
>
> Disable the IRQ and the clocks in the probe error path, and disable
> runtime PM on the mmc_add_host() failure path. Also handle a failure of
> devm_request_threaded_irq() in sunxi_mmc_resource_request().
>
> Tested with QEMU's orangepi-pc machine: with forced sunxi_mmc_init_host()
> and mmc_add_host() failures the MMC clocks stay disabled in clk_summary,
> and a normal probe with an emulated SD card still works.
>
> This issue was found by manual code inspection.
>
> Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Al=
lwinner sunxi SoCs")
> Fixes: 9a8e1e8cc2c0 ("mmc: sunxi: Add runtime_pm support")
> Cc: stable@vger.kernel.org # v4.18+
> Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sunxi-mmc.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index fe4c0f6d73f3..437fdadb5950 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1354,8 +1354,13 @@ static int sunxi_mmc_resource_request(struct sunxi=
_mmc_host *host,
>                 goto error_disable_mmc;
>         }
>
> -       return devm_request_threaded_irq(&pdev->dev, host->irq, sunxi_mmc=
_irq,
> -                       sunxi_mmc_handle_manual_stop, 0, "sunxi-mmc", hos=
t);
> +       ret =3D devm_request_threaded_irq(&pdev->dev, host->irq, sunxi_mm=
c_irq,
> +                                       sunxi_mmc_handle_manual_stop, 0,
> +                                       "sunxi-mmc", host);
> +       if (ret)
> +               goto error_disable_mmc;
> +
> +       return 0;
>
>  error_disable_mmc:
>         sunxi_mmc_disable(host);
> @@ -1385,9 +1390,11 @@ static int sunxi_mmc_probe(struct platform_device =
*pdev)
>
>         host->sg_cpu =3D dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
>                                           &host->sg_dma, GFP_KERNEL);
> -       if (!host->sg_cpu)
> -               return dev_err_probe(&pdev->dev, -ENOMEM,
> -                                    "Failed to allocate DMA descriptor m=
em\n");
> +       if (!host->sg_cpu) {
> +               ret =3D dev_err_probe(&pdev->dev, -ENOMEM,
> +                                   "Failed to allocate DMA descriptor me=
m\n");
> +               goto error_disable_mmc;
> +       }
>
>         if (host->cfg->ccu_has_timings_switch) {
>                 /*
> @@ -1467,7 +1474,7 @@ static int sunxi_mmc_probe(struct platform_device *=
pdev)
>
>         ret =3D mmc_add_host(mmc);
>         if (ret)
> -               goto error_free_dma;
> +               goto error_disable_rpm;
>
>         dev_info(&pdev->dev, "initialized, max. request size: %u KB%s\n",
>                  mmc->max_req_size >> 10,
> @@ -1475,8 +1482,13 @@ static int sunxi_mmc_probe(struct platform_device =
*pdev)
>
>         return 0;
>
> +error_disable_rpm:
> +       pm_runtime_disable(&pdev->dev);
>  error_free_dma:
>         dma_free_coherent(&pdev->dev, PAGE_SIZE, host->sg_cpu, host->sg_d=
ma);
> +error_disable_mmc:
> +       disable_irq(host->irq);
> +       sunxi_mmc_disable(host);
>         return ret;
>  }
>
> --
> 2.54.0.windows.1
>
>


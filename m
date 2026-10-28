Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0AF606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IW7Skj5k;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RYGmdgia;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkzu9Kee
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UDp0wgkglTmPmDg1owrhZsr+zbSjJcFONFEn6LtAuCw=; b=IW7Skj5kJLGQ79
	nivffpf9eetKqKgkvwahgzfja26e3HuTZHTctPvjmTX2l5ZUPKAEiN/y4z7MtqgNpVySnLP1eGyEw
	/sX9I1ksbK9PyiIpxXjr5FHNNb8XPl6oYXpQRgst1B92TnB4wbxUSBzkn+M0wqWIK2mTsaMofcvCS
	PmEyePe8tdedRLsRQF5Q8Cc2eQc+a1y+GxZ5HgmBb/Jr5yyDfUHcooAW95TU7ZLcNUJ22B0ffbPuh
	3Md+D0H3uLTy7Ef+NXloq+rXKBVlVp9eN3tyDDIicYulVsWd9MZpKf8CwQyFPHBfgo4nk1aTE6Rq5
	LZFrgg5vZ8FRJ9UHZviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7Ee-00000007eCr-2I0j;
	Wed, 28 Oct 2026 17:14:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7Eb-00000007eCT-1duA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 17:14:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAlAt1517256
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 17:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UDp0wgkglTmPmDg1owrhZsr+zbSjJcFONFEn6LtAuCw=; b=RYGmdgia+3ENWT3K
	8+9fUgyk3+OJ48GqrcLUDuwVBC9OSko/LEE1L/7t9RXLVs4tE1UHXsyw9MBM171X
	soVqa+8kcSxMwLw6aKmHKma7nuVbkr09rYqDakq8oZRPuWIyxKPSGBFu0dxAL0Sp
	Ez+h5JedlHpuq2D4MGclYUBV0DaB780wGy2MgucF9vVEALqYzjQuTDrJYQdAGtwE
	m/LPl1MRV//GkFz1jINnl0hZuJ9wxS0OlpbuxTOfDdXF6bnGn5Qv+mtPWkqsGgtn
	38v4cf5wkYahd2NDWLH2klgFk/XgEEWejb0wMkwRzsZUrhukUndRLnjyoFz0wtA8
	PzrMoQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwam50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 17:14:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so729747a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 10:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207683; cv=none;
        d=google.com; s=arc-20260327;
        b=i79zkTv5Ed1l57VJk70yAwW6i0HV6XupKe3qN2XY7zGnwNq1wolNfDW2eImQmkRhjN
         TxX0kqIrm9k5eIirQEvqEGyPbi+Tz7fDiNY36RarpU1Dqdpmd2OjHOf8ztiF8p5nbvVA
         WNwQuj/uy4cRyjezTzDbFnFc49cuifAf2zAgd7j3jouodCClMvL+H0F3Sc99RCMyvg+2
         v/d5MbzIyumR/l9XUfUadxecFY2MDj4BxRLMMTT8H/6QSWM90/+9A4kuuNXdgW/TTvZo
         SFMl/NR/lIBYoJUKafOCpc32khGF0fAtaqn1DwQMZ61anrNvz/COtG8m25Cjca8x8e3p
         qnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UDp0wgkglTmPmDg1owrhZsr+zbSjJcFONFEn6LtAuCw=;
        fh=rl8OBeziTmQg+wRz8sXm5EvH+zGYvOB53YBCiB0Hflk=;
        b=RU1RXaWcXxoEcPWsC650cqRcvu/QO5lbOxlf/Im8xaJCYvVyqdwdO+SrV6vUmCqvYP
         iJMPPYBTJs0eAcenC6Q72aQEGsaUUp6TFZk/AhMtSY9uCKA+Qfg6jnjZhEym/duoBz28
         J5juXuNmoVSMPY7lquvlyHa1fy3YXPDXaf9gdB/01g1Lto8lQOGY9OSAp3AaC7Cj9xJr
         y6q3vi3H348V8n7HPQf76sseL0Kw4gfFLFa0hWTDdIj9NI6/wh8Zl6vNu3LJGEtLRVai
         fZkNZqJAxI3EJ0En2sKE0ZS1Gu0yMhJjRUCxIj7Tft63uRZnwxMhkhjIBrVXVDknxPHZ
         Gx0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207683; x=1793812483; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDp0wgkglTmPmDg1owrhZsr+zbSjJcFONFEn6LtAuCw=;
        b=dkzu9KeeqdowaCTRiVQEwLE159L5BrX3cQRQQEutxSj7skl8okAKEfhrO3Ba/ImI61
         dR/JI5QgAJXOmVSmjKN86LWqKDy82Qqkjs+hjWpsRXX8LLTm/UjmYNncPael1jviN8DZ
         0AjISCdesq1pPH8hrGs9wv5f3galuZlrmpvbhhUUWWUiM4GR6PYjqh0d8SNohEVtOOiS
         b7bi1k29mu9D7Xk34plS2X+gfmf6fetAJRXKkCUDzqQPeK6HyFTe3pFSYlhoxA7gh6Js
         Tm5rsfCfkLZ5g9QsyPo8OJlPGzFpkgKwECb8bxHiSqM1x6KQJmtfl7HHRGnJxOFyho6k
         sZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207683; x=1793812483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDp0wgkglTmPmDg1owrhZsr+zbSjJcFONFEn6LtAuCw=;
        b=CzOxHxVJOHsU5QJH1Ag+mvyU4qQNwjNC48VPKLnGzzl3nXsNyXfXQ4FtZliMxB93ZD
         lV3gA8lpDCas5zehZrRwQKMCWFHvf6VrnF3FbWUizno2cenw7dxnMa1ACQUY3pekkoTO
         E1DQ5C3scsVlA8l/6g59QtQ2kWKd19vHEH7X+2BZFJdTZ6KLk8yJc4DqTs2ZSehtdlZH
         4On6VwKAnP5iLJzXS8Ts9qcmKquvc6PgH1vz2pyH1MEvQuVBZHtfxS9a1KVtN/RRVYe2
         WrRQGpae7J8yjcjvfw9Z4w6h+EtpnSuRW8Ean13JofvTkeGxQqq34zeFOs8AfRiZ5i9v
         HssQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEaDszxMbKHXwMkLbsW0F+rvKnb6FNNEzTzqn1JdxGXV6iXotm74QclFHXIayjx1j12vGU9jo9Uk/C09X9P9/I@lists.infradead.org
X-Gm-Message-State: AFq9FYJV6KMc3rnD1bdXpKaL2NygXkUDhWT3bgyiXglRHwLL4j85Nsvv
	dkIFoMuzejNYKxjAssToWQd6fxnU8BVZ4BO4xGTPtSUJYUJl1Y/SB4r5ROyWjMKBsav8oZj02sh
	ymrdJiXEexqcokRT065OyjeoxSw/x6BqYssxWH7HzmyRBvu3q3H2x1DwizkZVjjz3ztLaBjjHi0
	B9TacE7xoI3dcqvX8ySBpfdOeECMngwXZ9C+9+U+o+buCFK9q3OoOF
X-Gm-Gg: AYBFou0YR6CkiFu88yg60+rUF9lUJiMOyR9vn/unIuc1E/ngwdMD7N0jI/fdhQ2fp3q
	0UpDr4YGjoa+8vsojAXS6G2fy4xWd2FSHtnOsXEO7z6vBH5NaBV6v5E5Uvaf2oGavs5njM9AOLL
	NuDz+XzVQdTDhf/sGJC2gdO4+S1IFN3sJ+eW1N7lnhOexWDPK8Ru1UmUxofg==
X-Received: by 2002:a17:90a:e7c7:b0:3ac:9a03:20bc with SMTP id 98e67ed59e1d1-3ae5824d380mr2248109a91.47.1793207683155;
        Wed, 28 Oct 2026 10:14:43 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c7:b0:3ac:9a03:20bc with SMTP id
 98e67ed59e1d1-3ae5824d380mr2248076a91.47.1793207682688; Wed, 28 Oct 2026
 10:14:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261007070313.863-1-ian.ray@gehealthcare.com>
In-Reply-To: <20261007070313.863-1-ian.ray@gehealthcare.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:14:29 +0100
X-Gm-Features: AclHuK8OzKAlNJgB9bkGdb-Xga4FUgj0a3CnfcJYrvb6cJly0UazM3hY7LrTXlM
Message-ID: <CAPx+jO8o3+ca6LE-1DPuiOrxOWVRosuW7rf23SzLAGq4vRHqeg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sdhci-esdhc-imx: map unsupported driver type to
 Type B
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Haibo Chen <haibo.chen@nxp.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>, stable@vger.kernel.org,
        linux-mmc@vger.kernel.org, imx@lists.linux.dev, s32@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: yp7XCu94dYrzksWKsF_p5Scxp8KzaceD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX7i/hy/Ayeakh
 vYONGXgDebZoXL2+7lSy1PSt/IFjZ5TtSC+Mdbabc6r74dWFz2D1qUAuPKV24npvCz2BFYAPweG
 KxGVnNeqqP+S16Fndny5W4a8W8+eN9I=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae22d83 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=lb8OlhKpAAAA:8 a=QyXUC8HyAAAA:8
 a=NVfV2Rmm9NVekzJLEn8A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=7GnFejQYy5TgUzHuXd-m:22
X-Proofpoint-ORIG-GUID: yp7XCu94dYrzksWKsF_p5Scxp8KzaceD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfXzycOHo96LKd4
 5sEkdZ4J4xayrgJzb5Goh2+eu/Ygk+e4nt40APW3RLd5UaKKsEE97GGaiLqpL1zKAIkhF69TdQ5
 flWMJb1Bj5/BiJ4ohD3K2kutq/uW3u+gboquwf2t27+k1l7jGRxynzDha1B5ASjzUq8Kg1GwPPn
 9U38j8TMKbkhlvpmJyMSgkF+NO6q0P2vNMgUZ0oUQ+OsyrWf4wfCUUvahxQkpNyUAA6BvdYyWEo
 FE3vr5dlrM0jmlavl1opLYnhtJLfipG6ES320DbMV7JGoETShjyQULUN3m4ZguB0WFHzQQR4QXF
 tWxvuzNnqR7SzTJriTkhKb430wCfVMJpjywUj1wn0n0a8g4P+L8/Xo/6wL4T7QssCnWT1MNCjaE
 sVIunsy/YfAYiH1W1t9h4YVBqjj/u+mKhWd2gB7TKPd2LLaxaYiDfnMgadFz8+TTMbMttUYvTkg
 ZArrlkQLk+wSKqp1Xlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_101445_435524_4172BDE9 
X-CRM114-Status: GOOD (  27.68  )
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

On Wed, Oct 7, 2026 at 9:03=E2=80=AFAM Ian Ray <ian.ray@gehealthcare.com> w=
rote:
>
> Since commit 5a52c5701a67 ("mmc: core: Fix host controller programming
> for fixed driver type"), the eMMC driver strength is passed directly to
> mmc_set_driver_type(), which propagates the value through ios.drv_type
> all the way to sdhci_set_ios().  For value 4, SDHCI correctly warns:
>
>   mmc2: invalid driver type, default to driver type B
>
> The host driver type has no effect on this controller: esdhc_writew_le()
> never programs the driver-type field of SDHCI_HOST_CONTROL2.  Hook
> set_ios() and force drv_type to the always-valid Type B, so that SDHCI
> never sees an unsupported value.
>
> Tested on i.MX8MP (usdhc3, eMMC in HS400) with
> `fixed-emmc-driver-type =3D <4>`: the warning is gone and the HS_TIMING
> register contains 0x43 as expected.
>
> Fixes: 5a52c5701a67 ("mmc: core: Fix host controller programming for fixe=
d driver type")
> Link: https://lore.kernel.org/all/20260926122908.866-1-ian.ray@gehealthca=
re.com/
> Cc: stable@vger.kernel.org
> Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v2 -> v3: Force drv_type to Type B unconditionally;
>           hook set_ios() for all esdhc variants, not only usdhc (since
>           the driver-type field is ignored in all variants);
>           reword comments.
>
> v1 -> v2: Move fix from mmc core to sdhci-esdhc-imx driver per review
>           (see "Link:" above); always provide a valid host driver type.
>
>  drivers/mmc/host/sdhci-esdhc-imx.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 6ab59d3e346f..931e383748a9 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1142,6 +1142,20 @@ static void esdhc_reset_tuning(struct sdhci_host *=
host)
>         }
>  }
>
> +static void sdhci_esdhc_imx_set_ios(struct mmc_host *mmc, struct mmc_ios=
 *ios)
> +{
> +       /*
> +        * This controller has no driver-type control: esdhc_writew_le()
> +        * discards the driver-type field when writing SDHCI_HOST_CONTROL=
2.
> +        * The programmed value is therefore irrelevant, but SDHCI reject=
s
> +        * non-SD values such as 4 (eMMC 40 ohm, from fixed-emmc-driver-t=
ype).
> +        * Force an always-valid Type B.
> +        */
> +       ios->drv_type =3D MMC_SET_DRIVER_TYPE_B;
> +
> +       sdhci_set_ios(mmc, ios);
> +}
> +
>  static void usdhc_init_card(struct mmc_host *mmc, struct mmc_card *card)
>  {
>         struct sdhci_host *host =3D mmc_priv(mmc);
> @@ -1952,6 +1966,9 @@ static int sdhci_esdhc_imx_probe(struct platform_de=
vice *pdev)
>                 host->max_timeout_count =3D 0xF;
>         }
>
> +       /* No SDHCI driver type control */
> +       host->mmc_host_ops.set_ios =3D sdhci_esdhc_imx_set_ios;
> +
>         if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING)
>                 sdhci_esdhc_ops.platform_execute_tuning =3D
>                                         esdhc_executing_tuning;
> --
> 2.47.3
>


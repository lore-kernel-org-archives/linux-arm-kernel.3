Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E8A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fqDXa207;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N2ulyUq2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZXzQ0I3V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SmeG8eDrUww7PbplsIcYx6wyVdH7rGxQXJYVetL1ZLk=; b=fqDXa207rFEiE9
	mI0oKxBFi/edG5d5AAvUT5UVcuMVYB1vmfy+s4/tHDUVKSs9wgqOgpPJmmovZDmKMZbC5ulpwa3eQ
	TjPqrJ8qYFu3Zwwfc0DXuXKMVHkWbtZTTZ6HGa60YvqLk4/3yKMJGG2iNTFNSuChjn0uHxnm9lCB6
	izEpHXEC9PE0jnEEc7zaOSd6B/hcMyO52fRafskLSjyaWgoc2i2zn4Z136n3jOsJRllrLxM89rUu2
	WEkjIEwKDtykDRnMpJJ84tiXRFBHEcDV/mB4JKTYA33RqrCUQioMmgxDHTZFWpBaDlGrxSAmGxWDh
	66ZKPNsR/iMhvkpaYfUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOMZ-0000000949q-0guF;
	Thu, 29 Oct 2026 11:32:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOMW-0000000949U-0KMH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 11:32:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TA8VTH821269
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmeG8eDrUww7PbplsIcYx6wyVdH7rGxQXJYVetL1ZLk=; b=N2ulyUq2zQlxC4vG
	5LBSt97dCkUvPpTIWLM9QzF/oTONOlYpjFHqdGTYm/5FjOqreU8Gj34ek14PzYb3
	Lj5hkgh+a5XBCPXxUFpDwKi/Buwkja1XEMgaBUkL1PLDXzrjBpzGpSFXTLYcI9SL
	FLAlPCIIebAXBDGkAamNdvf/gzgnSGXkxCLP7c9hrypgtAZ8mhpWlQHZLibDjNTX
	JltAweSlnEZVoEdeXkk8y5rsNAO9r6uq3XvLNJetGafOJymdV093csowGjjv0qkw
	cTn/3wHGsmafNGn96owgFSRCsQCsIT2cm5aCoCS7Gre5eibWb3xznWMQh1oX3JPb
	xtXJ8w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm44q8946-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:32:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd67466211bso1152085a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 04:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793273522; cv=none;
        d=google.com; s=arc-20260327;
        b=soq9HrHyA6Y3pxoOvT5/i+C4RwvfvTTHcpXvdDlmvQ3Iqjg2zopfUQZayR/QrtiydF
         l39QI88JoRmgAHnzan6BkZJGCIzExmbobh+2sVDVljk9OPQy7Q08EDYXAL3bfORLe45h
         IBOt5T/BNO88/SGxeQZxO712+Jr4GV6z5BXthdnCn1oEMI3nhGnrysCJkj9ZYulifaaP
         BLUYqh7CPZnbBJJBzFE/G9yIpEH6EYD95yqe8gbMhk2hpxd/rBwcnHFwJl3L+EamJJFc
         dsW5VI0RUWK6DeyI38bw88SomULFBMr5Mawwj73ki+cN6DXc4MASS33gva305IvjGfe5
         3coQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SmeG8eDrUww7PbplsIcYx6wyVdH7rGxQXJYVetL1ZLk=;
        fh=K9dNBPA/UAvp0/FheC3BKq1DoydxMyk+/yuD15hX/ZQ=;
        b=I0uYI53jhfbgtEDa+jLtSURPe9RuJpqUHId0ozm0DNtyYLOACr3T9yV7FrSurhmWHB
         whw9d2BCAl7jhP3FqiQ1UyduasL8c23dfECckKJJQNKXSi8sY39PnWm4yHcLHxCRZT/L
         zwJmFPFeAhQrIn4DeOw6LASXCQaXnan7vOzlnNTMWpnFaXbNFdxTDgaKZTuSQGw9vzUj
         0/t0Depc2zIrBp9+eXAUUzwVQeWQ6HAkbHO5JeG2KK1n789HAmG/nTa4iI4GKKsmramh
         PxK99Udm74ZYZih/NJ0ilkpow/w1jg4JF4jobDFUSgccwlYtuPOMTFTRshDXsGNAoTPn
         3r2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793273522; x=1793878322; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmeG8eDrUww7PbplsIcYx6wyVdH7rGxQXJYVetL1ZLk=;
        b=ZXzQ0I3VHPMusx6JKfsbP/NphGYe9667KBvuJd3bZSSISvBgy10UOYHM9/K4ePzW7L
         cE3a42zac2mj9eOC+Gir0/UDpaNFNbVGqttnlIoZN9s7f/E4YbXY5b3kUxQdJ0QOnNiz
         VtDzG2UUHNfP+hte8pOwipJXYG8s7YVJULGftWyi4KYfni/P0qHclJbC4ukKets+tqaz
         j1LavuPdNddB39kQ0e+itN7DksoLHFt+/9mCzz1aLHqw2XjhsqkOPEFAnquokOkCZ1X2
         FWydZwXNeym1JmW/GbULIxxLM0JKz36Btw0iFqAE7S3KfNPwoKX2386ncxnWtX5VX5uG
         LNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793273522; x=1793878322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmeG8eDrUww7PbplsIcYx6wyVdH7rGxQXJYVetL1ZLk=;
        b=P4jPYPdM64ZxDUib5KuYbBP+hqs9TzG7lruEuW9OsX4iGbCBLx8kaqDnbK1Uzax5EP
         7XQuejvo7x3ZBikwS8D1S0PSK+WgtsGftGLJZj/i6bbe6ivXpnhWD4BZNfLJ4kz46lHo
         yPhslk9xY6lx9c4Ezt5LPDfcdRPSzxoOEDd6DTJ2VxNz4N4juN78CsQYKlnbLXXITso/
         Ck862H2Td4sRuNwvzqojBnYNP125F4ej94IASP/KQcyzhS8WluxVQ/v1ydrrG32QmtGv
         EPO6aO02bhL2T21WlK8eX0ncY3deiPC9WgTDlnZ3azU9P+b9zfW9jBoC1/HAbsGutpao
         Zyhw==
X-Forwarded-Encrypted: i=1; AKwUvBxDU7YZ+F3VhSK6DNX0ZBSLIuCVydjKc+MuoNpGKRWCIrOOjkWr332Fy1nJA0/qvO7Nn4Ghd5yvgGrVOjpMwq81@lists.infradead.org
X-Gm-Message-State: AFq9FYIu183zooXyN96P9eHQTeIi4Sete4oHLNcnAEiqFr5kxRqNVMxo
	SO0sNHryrJ0ls34HScEhsB3Lfm8iMY5xHwNR2BLPpJmamjH4RhGERZuvub2hGS1S/wB3eYD8YrL
	icdQ/T9coN0JM/qn7lXg/cnxoLYovFxqmfH+PVU3VO2BQUm+4jUpeFrjLmqZJjQVrjDodlSmNA1
	1fTx7Iet/Glt5XN4TqR4umyvyKQL9hyPqMHCypgOGdbYb+0s+Xu1pq
X-Gm-Gg: AYBFou0YqUv6+o30PvTlEZkoztj6XGq7p5Xc95WpxjeZUcwN8j4VjxsMVIfJ6mlLWZM
	Ff+8IdlTTezbt0S2T/SlnLUOqngtQMCwyOdzsE56CBzoi/OBIlJmHf7RCLV6xrG3W3O3ZizZmq0
	9sRrxnyhZODk8mbE+A3vSaYLux7q6cGgwVzfTXeUSXMfEILPCSmq+uFdINsQ==
X-Received: by 2002:a17:902:ec8b:b0:2e9:69ef:ff38 with SMTP id d9443c01a7336-2eb0046897cmr53687845ad.55.1793273521894;
        Thu, 29 Oct 2026 04:32:01 -0700 (PDT)
X-Received: by 2002:a17:902:ec8b:b0:2e9:69ef:ff38 with SMTP id
 d9443c01a7336-2eb0046897cmr53687425ad.55.1793273521275; Thu, 29 Oct 2026
 04:32:01 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014202619.715573-1-aubin.constans@microchip.com>
In-Reply-To: <20261014202619.715573-1-aubin.constans@microchip.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 12:31:49 +0100
X-Gm-Features: AclHuK8ocQ4ZyIc2NMN2E2foJvz0KUaZfpo5I8Tv2CJSYssB2wGKDJkhP3QujAQ
Message-ID: <CAPx+jO-fyYy9ZX_O9UQ-tSnOG7LCd0rZ8SNn307hFWLbUAqBRw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-of-at91: disable selectively clocks on pm runtime
To: Aubin Constans <aubin.constans@microchip.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Eugen Hristev <ehristev@kernel.org>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Romain Sioen <romain.sioen@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ryan Wanner <ryan.wanner@microchip.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0NCBTYWx0ZWRfX75VIBnL0CJym
 nLk6GAnA3amWQkonTuJZhCJTdn1of16CrIrr5PN8heJqcaOCvp1GfbYKafcjYhaRE4GVeHBc0uj
 r5fhBTgdxsKIReTF9jNv2Pt0xykyU5U=
X-Proofpoint-ORIG-GUID: TULadT3PneoVA8gd_uDbVvaN8WYUUXL2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NCBTYWx0ZWRfX4eQxQwqUcsYJ
 iKBEdgqnQeEQKs65mjifb+stVIVZ8BXheOxR8oC/EiciWS/tj8v/36tWmmYj5gXqqNaKPwArkri
 q5TmfjP8eopZ2VKDN2rtW+x5JYWDIb2GQok180m1c1VZvpDG16N0nudwenR/S5qdE4nqWmgLhQQ
 Fix0tdtbf/Yi7B7qltWT9qlwK7xDfhJF4Rcxs8gXPS+lytMQ8LK40XdTQ8N5FJ939VsdjQtDzYY
 Elw4/jjikOepSGJZMomYnbFbOW3Tt9w0jAeHOcPI1Ld4xR47d2g3SoDvCmc1kMDNc7z0evPUdRF
 A7OdFUmbCrEd+VITVGAJbO1Dz57nwo4r4LP69DY8ZERgZ26kx+51BcXP1+x7ib0WOZke8BcZnAs
 AuyPt01zNEtDv6CO5bsHrHMP6BHHfXm/86w0ULJ4+t9jySacy5OhFMDugg1lZRGGPzUdkPerjA/
 14FJAE7+YJEKFOfu4bw==
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae32eb2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=XYAwZIGsAAAA:8
 a=Newhmvhl9Q1cYdYltlgA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: TULadT3PneoVA8gd_uDbVvaN8WYUUXL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_043204_125955_EBC4FA16 
X-CRM114-Status: GOOD (  31.29  )
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

On Wed, Oct 14, 2026 at 10:28=E2=80=AFPM Aubin Constans
<aubin.constans@microchip.com> wrote:
>
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
>
> SDMMC run-time clock disabling is not supported in newer SoCs, including
> SAMA7G54, SAMA7D65 and LAN969x.

That sounds a bit vague to me. Exactly why can't the clocks be
disabled? It seems like the clocks are still being used on these newer
SoCs.

>
> Make the clock disabling scenario conditional:
> - still enabled for the sama5d2 and sam9x60 compatibles (which are all
>   those implemented at present),
> - otherwise avoided by default, for subsequent SoC families.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> [Romain: Fix unbalanced clock activation/deactivation]
> Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> [Aubin: Rebase before sama7g5 support and edit the commit msg]
> Signed-off-by: Aubin Constans <aubin.constans@microchip.com>
> Tested-by: Robert Marko <robert.marko@sartura.hr>

Kind regards
Uffe

> ---
> Changes in v2:
> - Edit the commit msg to say the patch prepares SAMA7G54/SAMA7D65/LAN969x
>   SoC support w/o immediate change.
>   Also, move and summarize Romain's own commit msg close to its sign-off.
> - Restore Claudiu's author and sign-off email to the microchip.com addres=
s
>   he had upon writing the patch.
> - Link to v1: https://lore.kernel.org/r/20260918153414.909333-1-aubin.con=
stans@microchip.com
>
>  drivers/mmc/host/sdhci-of-at91.c | 36 ++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of=
-at91.c
> index 7c4ac65f247d..399856643e57 100644
> --- a/drivers/mmc/host/sdhci-of-at91.c
> +++ b/drivers/mmc/host/sdhci-of-at91.c
> @@ -39,6 +39,7 @@ struct sdhci_at91_soc_data {
>         const struct sdhci_pltfm_data *pdata;
>         bool baseclk_is_generated_internally;
>         unsigned int divider_for_baseclk;
> +       bool pm_runtime_disable_clks;
>  };
>
>  struct sdhci_at91_priv {
> @@ -149,12 +150,14 @@ static const struct sdhci_pltfm_data sdhci_sama5d2_=
pdata =3D {
>  static const struct sdhci_at91_soc_data soc_data_sama5d2 =3D {
>         .pdata =3D &sdhci_sama5d2_pdata,
>         .baseclk_is_generated_internally =3D false,
> +       .pm_runtime_disable_clks =3D true,
>  };
>
>  static const struct sdhci_at91_soc_data soc_data_sam9x60 =3D {
>         .pdata =3D &sdhci_sama5d2_pdata,
>         .baseclk_is_generated_internally =3D true,
>         .divider_for_baseclk =3D 2,
> +       .pm_runtime_disable_clks =3D true,
>  };
>
>  static const struct of_device_id sdhci_at91_dt_match[] =3D {
> @@ -164,7 +167,7 @@ static const struct of_device_id sdhci_at91_dt_match[=
] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
>
> -static int sdhci_at91_set_clks_presets(struct device *dev)
> +static int sdhci_at91_set_clks_presets(struct device *dev, bool start_cl=
ks)
>  {
>         struct sdhci_host *host =3D dev_get_drvdata(dev);
>         struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> @@ -174,7 +177,14 @@ static int sdhci_at91_set_clks_presets(struct device=
 *dev)
>         unsigned int                    gck_rate, clk_base_rate;
>         unsigned int                    preset_div;
>
> -       clk_prepare_enable(priv->hclock);
> +       /*
> +        * Manage clock prepare/enable procedure depending on if the boar=
d
> +        * support runtime clock disabling and if we come from the probin=
g
> +        * or restoring procedure (for backup+self refresh).
> +        */
> +       if (start_clks)
> +               clk_prepare_enable(priv->hclock);
> +
>         caps0 =3D readl(host->ioaddr + SDHCI_CAPABILITIES);
>         caps1 =3D readl(host->ioaddr + SDHCI_CAPABILITIES_1);
>
> @@ -223,8 +233,11 @@ static int sdhci_at91_set_clks_presets(struct device=
 *dev)
>         writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
>                host->ioaddr + SDHCI_PRESET_FOR_DDR50);
>
> -       clk_prepare_enable(priv->mainck);
> -       clk_prepare_enable(priv->gck);
> +       /* Same clock management as for hclock */
> +       if (start_clks) {
> +               clk_prepare_enable(priv->mainck);
> +               clk_prepare_enable(priv->gck);
> +       }
>
>         return 0;
>  }
> @@ -254,9 +267,11 @@ static int sdhci_at91_runtime_suspend(struct device =
*dev)
>         if (host->tuning_mode !=3D SDHCI_TUNING_MODE_3)
>                 mmc_retune_needed(host->mmc);
>
> -       clk_disable_unprepare(priv->gck);
> -       clk_disable_unprepare(priv->hclock);
> -       clk_disable_unprepare(priv->mainck);
> +       if (priv->soc_data->pm_runtime_disable_clks) {
> +               clk_disable_unprepare(priv->gck);
> +               clk_disable_unprepare(priv->hclock);
> +               clk_disable_unprepare(priv->mainck);
> +       }
>
>         return 0;
>  }
> @@ -269,7 +284,7 @@ static int sdhci_at91_runtime_resume(struct device *d=
ev)
>         int ret;
>
>         if (priv->restore_needed) {
> -               ret =3D sdhci_at91_set_clks_presets(dev);
> +               ret =3D sdhci_at91_set_clks_presets(dev, priv->soc_data->=
pm_runtime_disable_clks);
>                 if (ret)
>                         return ret;
>
> @@ -277,6 +292,9 @@ static int sdhci_at91_runtime_resume(struct device *d=
ev)
>                 goto out;
>         }
>
> +       if (!priv->soc_data->pm_runtime_disable_clks)
> +               goto out;
> +
>         ret =3D clk_prepare_enable(priv->mainck);
>         if (ret) {
>                 dev_err(dev, "can't enable mainck\n");
> @@ -344,7 +362,7 @@ static int sdhci_at91_probe(struct platform_device *p=
dev)
>                 return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
>                                      "failed to get multclk\n");
>
> -       ret =3D sdhci_at91_set_clks_presets(&pdev->dev);
> +       ret =3D sdhci_at91_set_clks_presets(&pdev->dev, true);
>         if (ret)
>                 return ret;
>
> --
> 2.43.0
>


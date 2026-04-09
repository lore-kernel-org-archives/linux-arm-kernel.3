Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C096F364CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 23:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlZDWKcM8jfTnaUWuyXCK7Fwfq/ufyyfQpAEuBT0ffI=; b=NB3nL4ddhDQU1lVVzMqZB7IHQv
	/zIY71VuqUoXRng33agcqKlwpeUTgW0I01LrvtGVmVELgonEaWF4CstOdkUmMN0r8zY/dx+LyfwlS
	g6XIPuY/M/cE2hrJU/n+U20mj+KuSZtj8JGwKMbUEAaMY51PLBpon6LFRuMwexLVm2eVzh6v/ela+
	ymnod7Yg+mvtPtFy34dg4e5BL6wu+whHoDai7XnAfnRxtkDy+FbD/Mt6svnndLSf7NFbXfvF1WBYn
	OrJmy9GloECDFnIRola7pSOBwk+uXq+BXRddOrHtPdhjB8y7bWoXs38iUbtpf/POYzTXrwhm6dRVy
	KuV3BvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAyTh-0000000BJ7R-11xV;
	Thu, 09 Apr 2026 23:08:01 +0000
Received: from mail-yw1-x1163.google.com ([2607:f8b0:4864:20::1163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAyTe-0000000BJ72-3O0X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 23:08:00 +0000
Received: by mail-yw1-x1163.google.com with SMTP id 00721157ae682-7a43424f861so13363357b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 16:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776077; x=1776380877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlZDWKcM8jfTnaUWuyXCK7Fwfq/ufyyfQpAEuBT0ffI=;
        b=Ix+YxmfXLWKmTrdMaMJ/mMC1p0L7ebqkxZ8Ypp4ESqfso3v7lv5rEKNB1K9xnrGUi1
         vrJlOqt0BI0DRDeGBnk+8yxn1xaAFLQcM/O60FHhG0cVU5PZaaX5EVb0SCBWwgme5K7n
         a0+i3zGJAnCuA4vTaRXJSlMmrv2Apdvw1kTCFgLwZW8a9t67dKQQv78u16ZUR6AEtUX8
         q99Z3ToPOIZ/X99KpoagyRJH9p7z2RNEUSsohFbzSHs0etXwIrCkOclgii2r1t6p+UsS
         zJKmEj836qz85LE22uTTW1FfY8HARs6/vakawdF/G5paoHckXlUQp+8AQQegkw8MHQya
         92kw==
X-Forwarded-Encrypted: i=2; AJvYcCUcGJb+oSbaSQmAlx+IcVtMiq6ups+mDL0JRe7B3yrY65UdLqLTHjDhddv5paiz75+d7rUssJ8xAnlZpHm77XEP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3ttDiZJ3GhlYc8tdwa8e7napNwhZL6H8hhwBOdyPimw3XwFKK
	9GwEl85WPOzxcv1dTSPDg6GhhjMBxHkKvMZMkGktyTWsPaAZiq0LCOB27697nbey66RfsxWtiTI
	eBv3vGOrEB5reVLJSgDn3YkqkSTPenmhjOrAcMIoEp+r52SdMcBfPXsZY95gMJew9e2S8E42sgV
	RplMQptsZAJPE74//7fZk4jIGt5sgxgXklw4KjKvNohfaeNzxk68mvDkuPVUQ9R3yfaltn0gycV
	T7kS7GfBMNcBZamKUhtdsTdGntQ+gWkcMg0
X-Gm-Gg: AeBDietBP1itEMk8BXEVlIyFxYB2LVoaFsshws1oBGeiODi7pIOIk5x6Z0nxNcmhn+K
	ASwrNNjk3hg4ZkwSTELiWHl9i6Rc1PIuXYu/03n/WBla73UIsTb6qbAuE2Elt2ZKyL2WLpUyy/g
	V4MUC+HKDskNhwNU9lwq3O58i39SPMp3FrqmDMMRIZSmGjBWDDeNe7/rqlTwJ82iRRZhF3rxFCW
	c07tCtgYg1hf8kccYyTy6PWZfpuGqxJmhtk8DEKkqGh4PRySlXI7d872hycH652Ic5pJkxIF+S/
	CQKyDmmONsPyl1KD43icFCRh2iLVzar5mqy4pLmaZIDDZ+KcPs2ztMCyE93uLtcEUlkeJcFgI3k
	HcQ+soGbvP5milbDkOpwVprEsbGg7mEXzGmK8GIPDewMIclIbZxOXeQJEjMyfuuSkjStLDe3UtE
	975zBA9wH0kb4mlLA6e3PKf7ltZtibM3JgV4IpRNK8wLVQJak7hnti+SqK8tcDAFA=
X-Received: by 2002:a05:690c:7681:b0:79b:f4e1:a5b8 with SMTP id 00721157ae682-7af6f2290cemr7622067b3.8.1775776077370;
        Thu, 09 Apr 2026 16:07:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7af3e3758c8sm654477b3.3.2026.04.09.16.07.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2026 16:07:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d1ceb2ddfso1343369f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 16:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775776076; cv=none;
        d=google.com; s=arc-20240605;
        b=YTYQhKPGE4Hp+b8JovSwM6voLOTerbWKh6R6WlE1vQbGz6yBctkYzChqbO6T7fILqU
         FzMv+iBceGV1x2LhGeUObOKMQFUOC1wSEbfPpYrIVwiILl1D/08er54qNHUOSHMvyvj+
         B0z37e6CjLyv5nMDR1DKbbflPK49fPkgnmkUEXWOBDYk2yumTvmYxKr2nGXYSssCNBEl
         A4XyvicaHv5dxSDSYlbu+m29aOwDCGgrojP3MID4fDD5vDAlEVT7E+z7Ckml6Vq15ksJ
         RHYVsa7Ga8dWUW99D70+V4oORydJZ4mkao4v6EIFz+sb8JTL3qQWRRXFtVUnDh7O5afj
         gKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zlZDWKcM8jfTnaUWuyXCK7Fwfq/ufyyfQpAEuBT0ffI=;
        fh=TJbxv0xZt2b/zjXBBhHa5gxK79JBtpuxztXB1RGm7GA=;
        b=E6va1OV9Tn1luYGvf8zSqQ4AM7kNFVujyzMBvdWBmyLNYWXXBGLkUtxGPqeru4NdX6
         kkVj7l7JgPlU32wMjnhVWEUHiSBGNViMswfnVJ2XzNuw5YZwuSKdtnts7hXaZK7YS7yh
         uSSUwRwR3NX4efxJDz3IwIyCho2c5oKgm04VTN+sSYXCk/35piW3zp+6FKbguI+MtuzJ
         H4yvEcYssZWAAK8aKNSRsO48zZirY2/83+UtznIfeYhYL2WCMMcQQqscMuN7e+HeM9RZ
         mxl27GoLsqIdFe1/ww/459YrHUMBggCrjYQvHpqrIVA5Oqg4sbKyP1NJsgaS3GeCCBNQ
         cLUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1775776076; x=1776380876; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zlZDWKcM8jfTnaUWuyXCK7Fwfq/ufyyfQpAEuBT0ffI=;
        b=OsOLV+G8itDogu36x/0iUWzlaYTlMN8FsebJtZQ3AVRtODCEkyoSbKlA5DoXRpLyYR
         tygCOuMrynQnooSLtfKhRkMXXEYIMqBT28lfOUEEXVaXLf2RNvQvA9uY6isj7IrGxUuL
         coOOFMkuvQ14q1BicTX1exRoU03A1P1wdhjKA=
X-Forwarded-Encrypted: i=1; AJvYcCVNN+9f3/cl1QGLyR04sLcNwh4eO90lIj05W1MCkmO/F3Dq3RQ8/8imMICRQzcOfTcmlDUBfupK9tURYRGzsX40@lists.infradead.org
X-Received: by 2002:a05:6000:2408:b0:43d:1c75:db70 with SMTP id ffacd0b85a97d-43d642537a8mr1160268f8f.15.1775776075731;
        Thu, 09 Apr 2026 16:07:55 -0700 (PDT)
X-Received: by 2002:a05:6000:2408:b0:43d:1c75:db70 with SMTP id
 ffacd0b85a97d-43d642537a8mr1160236f8f.15.1775776075250; Thu, 09 Apr 2026
 16:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk> <E1wAPBR-0000000F7ju-1fD9@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1wAPBR-0000000F7ju-1fD9@rmk-PC.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Thu, 9 Apr 2026 16:07:42 -0700
X-Gm-Features: AQROBzCWB9VUvQ4RpL1EJYfajIJ7yfPJs9yk-WkOxw3bptp81Ttc8d621uiKtaQ
Message-ID: <CAMdnO-+TK65AxjTsDd017Mhop+VC3Xf8jtfaTXYpE6wBNZOt4g@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 02/10] net: stmmac: rename dev_id to userver
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Samuel Holland <samuel@sholland.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000037498c064f0f16da"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_160758_933372_68CEBEF2 
X-CRM114-Status: GOOD (  23.72  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

--00000000000037498c064f0f16da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Wed, Apr 8, 2026 at 2:27=E2=80=AFAM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> The Synopsys Databook and several implementation TRMs identify bits
> 15:8 of the version register in dwmac v3.xx and v4.xx as "userver".
> We even print its value with "User ID". Rather than using "dev_id",
> use "userver" instead.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/hwif.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/eth=
ernet/stmicro/stmmac/hwif.c
> index 3774af66db48..830ff816ab4f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -15,7 +15,7 @@
>
>  struct stmmac_version {
>         u8 snpsver;
> -       u8 dev_id;
> +       u8 userver;
>  };
From the XGMAC databook that I have access to bits(15:8) identify the
DEVID field of MAC_version register.
The userver field is from bits(23:16) of the same register. This is a
customer defined field (configured with coreConsultant).
Currently stmmac doesn't care about bits(23:16).

I think the confusion is coming from macro name in common.h
#define DWMAC_USERVER   GENMASK_U32(15, 8)
This should be named
#define DWMAC_DEVID   GENMASK_U32(15, 8)
Hope someone with access to another databook can confirm this.

>
>  static void stmmac_get_version(struct stmmac_priv *priv,
> @@ -26,7 +26,7 @@ static void stmmac_get_version(struct stmmac_priv *priv=
,
>         u32 version;
>
>         ver->snpsver =3D 0;
> -       ver->dev_id =3D 0;
> +       ver->userver =3D 0;
>
>         if (core_type =3D=3D DWMAC_CORE_MAC100)
>                 return;
> @@ -48,7 +48,7 @@ static void stmmac_get_version(struct stmmac_priv *priv=
,
>
>         ver->snpsver =3D FIELD_GET(DWMAC_SNPSVER, version);
>         if (core_type =3D=3D DWMAC_CORE_XGMAC)
> -               ver->dev_id =3D FIELD_GET(DWMAC_USERVER, version);
> +               ver->userver =3D FIELD_GET(DWMAC_USERVER, version);
>  }
>
>  static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
> @@ -111,7 +111,7 @@ int stmmac_reset(struct stmmac_priv *priv)
>  static const struct stmmac_hwif_entry {
>         enum dwmac_core_type core_type;
>         u32 min_snpsver;
> -       u32 dev_id;
> +       u32 userver;
>         const struct stmmac_regs_off regs;
>         const void *desc;
>         const void *dma;
> @@ -247,7 +247,7 @@ static const struct stmmac_hwif_entry {
>         }, {
>                 .core_type =3D DWMAC_CORE_XGMAC,
>                 .min_snpsver =3D DWXGMAC_CORE_2_10,
> -               .dev_id =3D DWXGMAC_ID,
> +               .userver =3D DWXGMAC_ID,
>                 .regs =3D {
>                         .ptp_off =3D PTP_XGMAC_OFFSET,
>                         .mmc_off =3D MMC_XGMAC_OFFSET,
> @@ -269,7 +269,7 @@ static const struct stmmac_hwif_entry {
>         }, {
>                 .core_type =3D DWMAC_CORE_XGMAC,
>                 .min_snpsver =3D DWXLGMAC_CORE_2_00,
> -               .dev_id =3D DWXLGMAC_ID,
> +               .userver =3D DWXLGMAC_ID,
>                 .regs =3D {
>                         .ptp_off =3D PTP_XGMAC_OFFSET,
>                         .mmc_off =3D MMC_XGMAC_OFFSET,
> @@ -291,7 +291,7 @@ static const struct stmmac_hwif_entry {
>  };
>
>  static const struct stmmac_hwif_entry *
> -stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 dev_id)
> +stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 userver)
>  {
>         const struct stmmac_hwif_entry *entry;
>         int i;
> @@ -305,7 +305,7 @@ stmmac_hwif_find(enum dwmac_core_type core_type, u8 s=
npsver, u8 dev_id)
>                 if (snpsver < entry->min_snpsver)
>                         continue;
>                 if (core_type =3D=3D DWMAC_CORE_XGMAC &&
> -                   dev_id !=3D entry->dev_id)
> +                   userver !=3D entry->userver)
>                         continue;
>
>                 return entry;
> @@ -358,7 +358,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
>         /* Fallback to generic HW */
>
>         /* Use synopsys_id var because some setups can override this */
> -       entry =3D stmmac_hwif_find(core_type, priv->synopsys_id, version.=
dev_id);
> +       entry =3D stmmac_hwif_find(core_type, priv->synopsys_id, version.=
userver);
>         if (!entry) {
>                 dev_err(priv->device,
>                         "Failed to find HW IF (id=3D0x%x, gmac=3D%d/%d)\n=
",
> --
> 2.47.3
>

--00000000000037498c064f0f16da
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGbTCCBFWg
AwIBAgIMGHX6KxYK3WW2YyprMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MDkyNTEzNTAzMVoXDTI2MDkyNjEzNTAzMVowgbMxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjEaMBgGA1UEAxMRSml0ZW5kcmEgVmVnaXJhanUx
LTArBgkqhkiG9w0BCQEWHmppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNvbTCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAKWV+9PYvG4njqRsbQas79f8Q46VL7b1ZxvWT6ik6VMbdRZx
tfpfZalVXksqcb02/N1H7UA9V04cV2q97FkSr/KxeFLMetPb3cVJZICg23IRO2NTPdmgPFzwkPTo
35h9h/OYLgh3/9a1nTsC2xqJa8GtohD5+42rsskGcI57U4n1r1L4R5IL9ypSqDxX/xVEAdGI5FTj
VgvoZC6iuEbnez+yO8TT3wun9b/PQowOB5P0CwIFv7ERW0S1s6B8yrbsoaTrz0vQaEA786k1pZkg
ykC1+zXq/iTyZuPP4B4RkzFd43Pw+GAH0Tt2nx5V4rNisJHeAVNU92Gj01cEg0I+FnsCAwEAAaOC
Ad8wggHbMA4GA1UdDwEB/wQEAwIFoDCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0
dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQw
OQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAy
MzBlBgNVHSAEXjBcMAkGB2eBDAEFAwEwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIw
ADBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWlt
ZWNhMjAyMy5jcmwwKQYDVR0RBCIwIIEeaml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tMBMG
A1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1Ud
DgQWBBRq5Jlxz3MqC+zEgUxK566xEc2g3DANBgkqhkiG9w0BAQsFAAOCAgEARXrmeeWA31pp9Tr0
M6mOlMv+Pr2raES4GzPSyftvxf6tBQCBNaqi6LSbyusDYOj3mG9bp6VeVn+68OxNY9iNAk+ujtId
f3+30BlZOQ1v8z9u2peUOUtWI60y2MxhdH0X0n2H+BCGvUOFqs5z440jqqy1HsscZTXHB7FEZmVP
fyD+0Z6cxyh7WNC6+BgLiFwf8iqmAbu7Yb1sGTUGyS5gfYEjJbF2PJfwNUcJDd7eS4w5Ju5mK5y7
spgjH2/JmDgbkpSk9JyuWfjGZIg4ah/q2nb6UMd1XJb6gLQZuzPOI3SgXPvd8MHGjKZrX2BHOBSC
bJJ8rp4w4a9QMS6dde2MFObusxkZAft4tUnwo+ProchHs7iA85sL7sWEZhAmjmKKCpECpEfZm0+/
hpvKQV3AZp5vBstb4IVL8QmLj8beDVHYnNhEicsSiG1wW7zSYyBnmGbFRrFQIJnJDWPjTZOlVEyp
T1ShrXRCtqJpOt6rgg+rFEY3D8j6/bAkJXnmKnE2LZ0YyrrKk7eC6UfNNimx38w3NWchtcGY8zJn
Y/1/C9Jv/mWm/2lK8nvusOFxhKmbG83Hx8toQdZ5F1kYk6zAWjfB7lwXr/En9mCmLieJ18hen9EK
qbYyUkmCmuoLi5GXFMJy+iQv6DgMVQ7CACagybU6FUrmL9lVa+A6caBEEh4xggJXMIICUwIBATBi
MFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9i
YWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwYdforFgrdZbZjKmswDQYJYIZIAWUDBAIBBQCg
gccwLwYJKoZIhvcNAQkEMSIEIKWQy2mXIISkzcYEPlbdhtpPqkM/JUwZeydB13GuGHztMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDQwOTIzMDc1NlowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAEE2b2zWJhSn
m11bQ8aBW6C9td4QBvPDmIdoV6rE+Y9H5jn/1fXAaPSdu3AoC3/79TkDGBpd3bg84S/rA7I1MmU2
5eooWq3dKlgWLSwIsY8FT5Uuv5X03b8U5zCch+kX9I1LvJzPA4C1OWJYuJcM712tNQt8drk2I2Ye
HajTx4I1gih4m/44YEUukvny325l2cxanNzopdMx24RkDEwcFfgjEjvsHYHDIFDCATl8g1yhMiyH
1Qgq/8TDjrLVlXolQasoLRXfb8s+lEV55fQREW2D0zztsCabp5v8eBKmQPICfv1CTNa7t0haWdN0
9M2LRyQbKpPprmWCMW2UncOAjjw=
--00000000000037498c064f0f16da--


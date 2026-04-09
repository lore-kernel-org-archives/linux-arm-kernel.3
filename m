Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFA4F364C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 22:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbnOnkCKBGzQzf94zFhjTyo77yWuUAH+7/i1G40axIU=; b=2EsN3DqugoJiDMyzi6gt+VUFjr
	mRydYBh44H16EC0Yp9F83QByD2ZblDl3gOotYkSonz309o2E7cF4yRRV6vBhSdlOModwwsMv399EV
	A0+Ulq9Bv/bkSOZmAqMAMFK+Wa2Sq602kWzgFK0nZUrgk8OcVhKh/2rUK0rsODjDmt+/XUxymigWV
	xzSfrhGo71S2zoBpGbqkxR3fuQSFFwCYgJEEMIEap3W6RvhoqvzRr76Et9tzTC+5KnRM4pMzyFYKZ
	FuFUjZnfVSi3GLbPCA8sG3Fuy2RvGRl7Vd8bl7jkyYUxLapN9LWywmeFnbGJb7smTifPSHvoHuquj
	0SJ8Sr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxeL-0000000BHKc-2Aqd;
	Thu, 09 Apr 2026 22:14:57 +0000
Received: from mail-yx1-xb162.google.com ([2607:f8b0:4864:20::b162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxeI-0000000BHJS-2UsW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 22:14:56 +0000
Received: by mail-yx1-xb162.google.com with SMTP id 956f58d0204a3-6500040ef83so1110560d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 15:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772893; x=1776377693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbnOnkCKBGzQzf94zFhjTyo77yWuUAH+7/i1G40axIU=;
        b=pYrIj9o3u6ciC5WWwDNx9DvM51hzWAR7IaWMLdMIwk6bbVKbgC0ul0kNs4kXl5uhWS
         K+//PEJkAmGEhFijwWbLtRu0DaJjOjWH0XbS7s7hBNgRXpBAjFYQw7HURUYufXR6rVSM
         0IWlzFunVvwWz31vU3IIijqXJCpkyffjMwWsMDsC/d4BJNXOypdp1q9C8wwMOzYgiEVJ
         3FLwUGqYqGqM0N2JBudroIYBL0qbv3AFx/7q5qATiWpn0gsUwcXTwxXKGw4+vXhv0r/7
         Z00otJVwX6B0GACGpGJp1svGhz8KBlLGOMqzG3ZCToHvI/8Hh1AjZYQqq9obXp5ujkBC
         3mLg==
X-Forwarded-Encrypted: i=2; AJvYcCV9IAB1tkO6TALjF5okh+jRN81kA8Vr8ruGGpjyMMS1FZ1OEfhbHCtRyEZgH16WJiRXF1RHccsRQv+JKdlxgtIc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4aUQIP66hdKO906g6z6Gka3HqOvTvEoI1fVyjKOuTGTf3jImY
	jJ9g8c0r6WXNOVBb91V8rvMkYjhlIaBOkmfouFd39kQ/L+2uGj/eNMYg46WiU+1DlyJ5mZ11inA
	V/FteKUfx/1SbDP6SKKySpYQOOo+3nA96gaotBLn2RqoHPZoyL0IgHxYuSCn8mvVdo1hStp1mEi
	o+zOy+7mZl/xPaAuivrAPkOKvz4wHZW1YVWEHjQGwjYR66wRKkc907jCGv9tlFFoLucSQChi2QO
	8QdemhYWA34A1bCbUyObC5LePfOPyGfWj0Q
X-Gm-Gg: AeBDievuZIFUsFtGiPYBE8J0uwk7zGvana0n342r7FPjWK7hWhjPZK50A5PJ8k0wJ72
	w5G7XasPC9SK9SvnVBafNFdg66AIH+47TrGnwL6A8+xcYX6hm6cHAiYTe4KPyGXsrvzDtl5Fgsc
	C5R0+PNNfEDickRcyIpkhMMO5wYQC4CUfsnixVk9gRXYlZ/1MA7BPqaouhT1j3PHZpv4VSa+NA0
	GUVVYgTxRqggAAaGaQFI/LAoW3WQC6aOLevkWpSHZc5bFWiVJhr5BsC7EesLeomVuTKOtm+UVGH
	7a516DWho77qydZPUukvQMAyFzrlNF1uSho7X9Mp6X8YF9EHh4DCi9ZRvXMITWwhskGbFU69xdv
	vftUdVAYVmfmb0B2BMa3hP+pm1Q3T4tS1EN4au6hAoIofdnqocFUhqZ0Cf+JUgltzzemnDUD/so
	Lnwft4Bh9XghaPBdL6RBe6sOTiA+csOQmnOP1DIfZk+PTbYSsPISGfjQMEjJcgu5c=
X-Received: by 2002:a05:690e:4853:b0:650:314f:1108 with SMTP id 956f58d0204a3-65198beeacfmr545449d50.59.1775772893277;
        Thu, 09 Apr 2026 15:14:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-65197a6af34sm53700d50.7.2026.04.09.15.14.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2026 15:14:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43d1dea12aaso988857f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 15:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775772892; cv=none;
        d=google.com; s=arc-20240605;
        b=S1Qtwy6xJOSBtQo3Mn/xlpRMgH7+Pn2h6a+RtDzYWTEWwejk2ZLy0gFBIg7scCGxT3
         eSHYLwmNaACMEdj+2o8IuNp8+6OXjgmbh06oL4i0lsdBWc6wiY0hAPBJajjQcnwCwYIp
         k53EaboHdMJqhdyzZPPY4OdHvOwNlGcpL9mVmMZmpqy/MhOvaS0/3zhsFugCrXovchzw
         L4Xm4lVVdDl2hX+4OW6nDjqTtpLz9AC66Ol+hIwyOabnUnHRgVelCAVpODR6l5WNI3If
         0lFkDOYrQkyXjWnUdShEX1ebjycqFK5tCtWlqA4NUkfh0vjlOatzsg9Pn3c7k1ckUQV6
         sGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AbnOnkCKBGzQzf94zFhjTyo77yWuUAH+7/i1G40axIU=;
        fh=/MsGDoJkidaDZ8CwZ4BFTF0PSx5g1cozV7nalBIxaHc=;
        b=HWnN57r5gDFKaa8iekc1BcMtI5vKZk5AaafG1ZTXLYugGx6v73VcckGmxapTzmWK4d
         ESulG171eHNNZ9AkIRyc53AXZiqkKvDBAJm2kFBOL2DQYuDze8zqBprmgP50hDPJVvFE
         w3CKI8cUR2Y2W2FcnzW4t3YiFT/1GEWwfl+VzhyRoH5UecVahGJhsUDY2FLtuaz3+VZS
         pzHKB/Yuub21VJlb52I3qAj0fENnFrRYDwgZO6a3XjDIzkRJ7zijHeuAkhY/7LJEHM/D
         pelZBdJu0GIh1+RGea9Hoe4A7Pmm06r9h70k2nadypxeEsDV/bIWUwUFRoL1LT0QF4Gk
         /djA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1775772892; x=1776377692; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AbnOnkCKBGzQzf94zFhjTyo77yWuUAH+7/i1G40axIU=;
        b=LYbdU/pTcV1pXwjt0zoRIA4OPndVySxmubb+J3q/fQgqfDWaicveIn0iDWgslD+6um
         flPnkd8tRWiLau77Q5Qy10LDCn6PGnMG1jZnVFO440UiQExfLZrodVOEuo44Zdju3QQZ
         usCvkBzJkPW3vQIBLVPduBC+is4Nnq6hVXZ/Q=
X-Forwarded-Encrypted: i=1; AJvYcCWZYI10EspVWmpZ91vb3Zbog9jGin1huoeeorv487LXpuD7fXAKONnVWFkKQXqceE6t19lis2BpgEzVo1TvPibg@lists.infradead.org
X-Received: by 2002:a05:6000:2010:b0:43c:f7e5:817a with SMTP id ffacd0b85a97d-43d64292b01mr916393f8f.19.1775772891634;
        Thu, 09 Apr 2026 15:14:51 -0700 (PDT)
X-Received: by 2002:a05:6000:2010:b0:43c:f7e5:817a with SMTP id
 ffacd0b85a97d-43d64292b01mr916355f8f.19.1775772891127; Thu, 09 Apr 2026
 15:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260402213629.1996133-2-jitendra.vegiraju@broadcom.com> <20260407020954.3674529-1-kuba@kernel.org>
In-Reply-To: <20260407020954.3674529-1-kuba@kernel.org>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Thu, 9 Apr 2026 15:14:37 -0700
X-Gm-Features: AQROBzDIrVBrq9a8N-kCZj3is_dHAtUZh7lT-03nRSlBMuTVHnIsC_ZMyZ5jrJ4
Message-ID: <CAMdnO-KHq273kkC2wBou7oEK1BAHbYYW4u9iRV9nfe0dNk_61A@mail.gmail.com>
Subject: Re: [PATCH net-next v9 1/4] net: stmmac: Add DW25GMAC support in
 stmmac core driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	bcm-kernel-feedback-list@broadcom.com, richardcochran@gmail.com, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, rmk+kernel@armlinux.org.uk, 
	rohan.g.thomas@altera.com, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	andrew+netdev@lunn.ch, horms@kernel.org, sdf@fomichev.me, 
	siyanteng@cqsoftware.com.cn, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	weishangjuan@eswincomputing.com, wens@kernel.org, vladimir.oltean@nxp.com, 
	lizhi2@eswincomputing.com, boon.khai.ng@altera.com, 
	maxime.chevallier@bootlin.com, chenchuangyu@xiaomi.com, 
	yangtiezhu@loongson.cn, ovidiu.panait.rb@renesas.com, chenhuacai@kernel.org, 
	florian.fainelli@broadcom.com, quic_abchauha@quicinc.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006ec0a9064f0e5802"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_151454_664793_B14DEF96 
X-CRM114-Status: GOOD (  26.54  )
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

--0000000000006ec0a9064f0e5802
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 7:09=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> Subject: net: stmmac: Add DW25GMAC support in stmmac core driver
>
> This commit introduces support for the DW25GMAC hardware in the stmmac
> core driver, which uses a new Hyper-DMA (HDMA) architecture. It adds a
> new DMA ops instance mapping virtual DMA channels to physical DMA
> channels and sets up the basic device configurations.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c b/drivers/n=
et/ethernet/stmicro/stmmac/dw25gmac.c
> > new file mode 100644
> > index 0000000000000..82eb22bff73e0
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
>
> [ ... ]
>
> > +static int rd_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel)
> > +{
> > +     u32 reg_val =3D 0;
> > +
> > +     reg_val |=3D FIELD_PREP(XXVGMAC_MODE_SELECT, mode);
> > +     reg_val |=3D FIELD_PREP(XXVGMAC_ADDR_OFFSET, channel);
> > +     reg_val |=3D XXVGMAC_CMD_TYPE | XXVGMAC_OB;
> > +     writel(reg_val, ioaddr + XXVGMAC_DMA_CH_IND_CONTROL);
> > +     return readl(ioaddr + XXVGMAC_DMA_CH_IND_DATA);
> > +}
>
> Does this readl() need to wait for the hardware to clear the XXVGMAC_OB
> (Operation Busy) bit? Returning immediately might read uninitialized or
> stale data if the hardware hasn't finished the fetch.
>
This is an issue. We will fix it.
> > +
> > +static void wr_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel, =
u32 val)
> > +{
> > +     u32 reg_val =3D 0;
> > +
> > +     writel(val, ioaddr + XXVGMAC_DMA_CH_IND_DATA);
> > +     reg_val |=3D FIELD_PREP(XXVGMAC_MODE_SELECT, mode);
> > +     reg_val |=3D FIELD_PREP(XXVGMAC_ADDR_OFFSET, channel);
> > +     reg_val |=3D XGMAC_OB;
>
> This isn't a bug, but should this use the XXVGMAC_OB macro instead of
> XGMAC_OB here for consistency?
>
> > +     writel(reg_val, ioaddr + XXVGMAC_DMA_CH_IND_CONTROL);
> > +}
>
> Similarly, does this function need to poll for the busy bit to clear afte=
r
> the writel()? If back-to-back operations occur, the next indirect write
> might overwrite the control and data registers while the hardware is stil=
l
> processing this request.
>
Agreed. This is bug, we will fix it.
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index f02b434bbd505..64c38de294da2 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
>
> [ ... ]
>
> > -int dwxgmac2_setup(struct stmmac_priv *priv)
> > +static void dwxgmac2_common_setup(struct stmmac_priv *priv, char *mac_=
name)
> >  {
>
> This isn't a bug, but should mac_name be declared as const char * since i=
t
> is passed string literals like "XGMAC2" and "DW25GMAC"? This avoids
> discarded-qualifiers compiler warnings.
>
> >       struct mac_device_info *mac =3D priv->hw;
> >
> > -     dev_info(priv->device, "\tXGMAC2\n");
> > +     dev_info(priv->device, "\t%s\n", mac_name);
>
Ack
> [ ... ]
> --
> pw-bot: cr

--0000000000006ec0a9064f0e5802
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
gccwLwYJKoZIhvcNAQkEMSIEIGwoVXYTb7jIt4pZrqv7oj7W19W19KkcepsmKqv6JpsJMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDQwOTIyMTQ1MlowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAAZLX4DO4Cov
kQIFrRc07yuLHnUiFw6Zy57h25q9VBipyCFcX1t+qvtoZWuRRC34DLZB5+TL5jSkWkcypzrGbJL1
a9ywfeNdACY6ZTGC1dzVICDIM4gdYlCBwXyly5bwm+/+rf+yKQS2wRFhZ0sWOrVpsTcglCi3F/UT
plCuAp8w71I5vtcxJiWUmU5+BXXMQFdLdoSPO4hFp7aOW8hO87mQ0LIzTwtt3sn5Vu9mFCmbWw3b
swspQ85xb5Ra9j5Do1TcVaB4HHXojqjB1a4dxXEhLjIxfb+NJHxYAE9e3RZHwwrJFmVXW/JduMra
502KfFM/YwnlfaghhO75Mp8TqQ8=
--0000000000006ec0a9064f0e5802--


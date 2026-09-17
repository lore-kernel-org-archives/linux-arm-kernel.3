Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52161C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsUR3bXYVE2d4Ot8OooTDoq9+J5YCWznKRqMkdZzw6E=; b=qm4/Q1Mpj0qFmPwvYxC9bVcvfO
	zgX94AsIHHLFxzZzfEmRGstAR/yhiuJMto3UsV55pRUQSOQYgA2ROBwpbg/qmIb+h+K2Rerv0lOB1
	v+r4R3BBtQrogKbi5YeF79bC4kh3sonoxS1FVcAx/vaG2gGDN9Majul7gU0gy/8MuReM5wiGzItHs
	hmFpB4ahI2/ItDEYhIs11GGQks4LZO957a6KP4+db+mBJ0rhBs1z/kB8qCDTemtgyG6z5lQvo/iZM
	4/wtzJWd+L/N3fwSIX22lR8LCfiiOTfssmvtFyHd0eXBy+EsCA8dn1MXMgMSZYj5nT7NkseLSZ87Z
	YhbOI7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GWr-0000000CAud-2rPH;
	Thu, 17 Sep 2026 18:08:13 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GWo-0000000CAtN-0sUR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 18:08:12 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-39de1f85ca2so242132a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668489; x=1790273289;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KsUR3bXYVE2d4Ot8OooTDoq9+J5YCWznKRqMkdZzw6E=;
        b=eUs0eoebzuLcPb2o5Bgmby9uFDDZSpErQtwL2PaSEdokFvt9yNkXdf1ngX72uepSSd
         mWJFbVh55Tq/KPSnPhSphrOZye9txmkfYfRF4eaBpSYWrPIsBlX6L6NUPJpSpMZLtwYD
         YJQE9pvjur+PpRSkRvpFLjNf+8kSgSGsv9V8DbycZ2vnyj0mZqmyOuFafMORZ5Sw7Qhx
         15U56mdndUSaueF5YvRXyVHHLTSk5ZfX82EgA2k8ShG+8uzH4PmmzN9wgnx+c64/ITEP
         KztCFQ/LdConoTE93QuSUE4wJWlDstzJsQXMYuyAHkLLSQWCTHaIaGak0z+30XxOXVZG
         vSpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzg8FSFVcHucv0pDtSLAjH5LIGW/nIesFULersimyXKqBylkGa+UzgpVUlF/jA8GbzZR5IvzTzeCabvvh5Q14kK@lists.infradead.org
X-Gm-Message-State: AFuF++mdpW37cNZoaBYRWj+FwI7djuCs/Y0Rer0bXQMtZrfXbkLehA9j
	cOAoWE9bWTHPyasKTZNja5NPeUXNVTO7yLApRTIQpufDBHEL08c1W3bGUyaX5OgKOJ2OgxWvicS
	+3QcBMhEyRvnNhdNZws8pJKf6pFJarwQMbEDv0Fp0Xh8adufwnA6Pluh3C5k7Han4kWB13ZNAtw
	U4/hZhmiG35SSHxdhnWvhljgCyKcrWdhlXqAafBd0HXIm/tI6+WFM3ViAwCvQ4TC1bDTlxLsiP3
	Q/EaDFo7K9IAu6ECR0MR3nZIc0G94c=
X-Gm-Gg: AYBFou3KfqRp4ZL9JRL7H0InCCju5n62CGCewCu63N5eVk0Q6TXlnzEvjk4Bk9snBL3
	5WnfcVax6f/wTPrh9dYWzI2NtJ4BEYY3JQScXpqNCN27mpC/gYDNKWzQv2MHatwMkR+WuEzfrhb
	lIyWS8cvi2+81bwnqnrRoqziYKJr8n3Q4vQm30uipS4i4dwo7/WDkB1XtN0H5oPWNppIjx4c0+x
	lMETpFwD7gY8C5/kbqKRJzDzHa0s26VX3Y6QavTQmEXqJEHEXM+g22wmOFmqIiJhdmAVt9d8/0B
	c00P43AGqsptTe/WKyF7nbghc9ANgGtQWfHk/xTXIMsCKJTV+Mp90SsM5FsKYuk0cMpvE0nAfTw
	Qew4uXzJOd5UCdHfPnTXDlgB4q99SOfiIsJosqFHt/Q7zh/SAe56TKmG6aIEvXrrhMtv+FVc5kL
	XO4ztD2PMvP8MJn4+D3fCF3IkD26tn9EdIag7XmzM=
X-Received: by 2002:a17:90b:2885:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39e1e502f25mr17501710a91.21.1789668488886;
        Thu, 17 Sep 2026 11:08:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e35da8d7csm1953662a91.2.2026.09.17.11.08.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 11:08:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c294ca8193eso62482566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789668487; x=1790273287; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsUR3bXYVE2d4Ot8OooTDoq9+J5YCWznKRqMkdZzw6E=;
        b=E1ESoT7CqceWckrkxVkaHE65HNxZH6fghj3qD4Tb+npavpr+ijC6Y3i7KRc2c/Wyqp
         4XTOrXoQW+L2d8OXycX96nSGYd3JisEARmCRqGQYDVlICNUjVVZY08zrS/S72eA28hDx
         AQ4SfPF6ANk4eNjHkioBHXv2AJsXqKgWVnwvY=
X-Forwarded-Encrypted: i=1; AKwUvBzkDU0845glbho4/fyAsIJ9uRiGARJOTOGnsAbKZfR6GCIzxhPCferjeorI2PMVeg8ZCM+J7+CVaIh4MTp15tgU@lists.infradead.org
X-Received: by 2002:a17:907:1c91:b0:c29:62d8:68b8 with SMTP id a640c23a62f3a-c29e532b637mr572225666b.48.1789668486746;
        Thu, 17 Sep 2026 11:08:06 -0700 (PDT)
X-Received: by 2002:a17:907:1c91:b0:c29:62d8:68b8 with SMTP id
 a640c23a62f3a-c29e532b637mr572223966b.48.1789668486322; Thu, 17 Sep 2026
 11:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-12-james.quinlan@broadcom.com> <6ce4208a-3869-4eea-9ae1-06985c9774e7@broadcom.com>
In-Reply-To: <6ce4208a-3869-4eea-9ae1-06985c9774e7@broadcom.com>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 17 Sep 2026 14:07:53 -0400
X-Gm-Features: AcwNN1UU-8XC5Z3nHrhgoIVmWAvdQIlVjifTkLgZoE09TXPfLT3Nxu4b8U_xWlE
Message-ID: <CA+-6iNznU3xyESOZYWfYFKghTgOLy0Vd1WvMCd=1EJPfBF7M2Q@mail.gmail.com>
Subject: Re: [PATCH 11/13] PCI: brcmstb: Put max_burst_size setting in cfg_data
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000702296065bb1aa2c"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_110810_289860_D089F7C6 
X-CRM114-Status: GOOD (  28.26  )
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

--000000000000702296065bb1aa2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 1:05=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 9/11/26 16:35, Jim Quinlan wrote:
> > Rather than ascertaining the max_burst_size setting by comparing differ=
ent
> > SoC IDs, specify the setting in the config_data structure for each SoC.
> > Also add a comment on each SoC's encoding of this field.
> >
> > Note: Previously, the max burst setting used for the 4908 Soc was 2.
> > However, it appears that the setting of 2 is illegal for this chip.  Se=
t it
> > to 0 as (a) this is the safest (smallest) choice and (b) the 2 was prob=
ably
> > interpreted by the HW as a 0 anyway.
> >
> > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > ---
> >   drivers/pci/controller/pcie-brcmstb.c | 29 ++++++++++++--------------=
-
> >   1 file changed, 13 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/contro=
ller/pcie-brcmstb.c
> > index 047783e33ae4..8bca98e6f5fa 100644
> > --- a/drivers/pci/controller/pcie-brcmstb.c
> > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > @@ -317,6 +317,7 @@ struct pcie_cfg_data {
> >       u32 flags;
> >       u32 quirks;
> >       u8 num_inbound_wins;
> > +     u8 burst_setting;
> >       int (*perst_set)(struct brcm_pcie *pcie, u32 val);
> >       int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
> >       int (*post_setup)(struct brcm_pcie *pcie);
> > @@ -1153,7 +1154,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie=
)
> >       void __iomem *base =3D pcie->base;
> >       struct pci_host_bridge *bridge;
> >       struct resource_entry *entry;
> > -     u32 tmp, burst, num_lanes, num_lanes_cap;
> > +     u32 tmp, num_lanes, num_lanes_cap;
> >       u8 num_out_wins =3D 0;
> >       int num_inbound_wins =3D 0;
> >       int memc, ret;
> > @@ -1188,20 +1189,6 @@ static int brcm_pcie_setup(struct brcm_pcie *pci=
e)
> >       /* Wait for SerDes to be stable */
> >       usleep_range(100, 200);
> >
> > -     /*
> > -      * SCB_MAX_BURST_SIZE is a two bit field.  For GENERIC chips it
> > -      * is encoded as 0=3D128, 1=3D256, 2=3D512, 3=3DRsvd, for BCM7278=
 it
> > -      * is encoded as 0=3DRsvd, 1=3D128, 2=3D256, 3=3D512.
> > -      */
> > -     if (BFLAG(pcie, IS_BMIPS))
> > -             burst =3D 0x1; /* 256 bytes */
> > -     else if (pcie->cfg->soc_base =3D=3D BCM2711)
> > -             burst =3D 0x0; /* 128 bytes */
> > -     else if (pcie->cfg->soc_base =3D=3D BCM7278)
> > -             burst =3D 0x3; /* 512 bytes */
> > -     else
> > -             burst =3D 0x2; /* 512 bytes */
> > -
> >       /*
> >        * Set SCB_MAX_BURST_SIZE, CFG_READ_UR_MODE, SCB_ACCESS_EN,
> >        * RCB_MPS_MODE, RCB_64B_MODE
> > @@ -1209,7 +1196,8 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie=
)
> >       tmp =3D readl(base + PCIE_MISC_MISC_CTRL);
> >       u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_SCB_ACCESS_EN_MASK=
);
> >       u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_CFG_READ_UR_MODE_M=
ASK);
> > -     u32p_replace_bits(&tmp, burst, PCIE_MISC_MISC_CTRL_MAX_BURST_SIZE=
_MASK);
> > +     u32p_replace_bits(&tmp, pcie->cfg->burst_setting,
> > +                       PCIE_MISC_MISC_CTRL_MAX_BURST_SIZE_MASK);
> >       u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_MPS_MODE_=
MASK);
> >       u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_=
MASK);
> >       writel(tmp, base + PCIE_MISC_MISC_CTRL);
> > @@ -1961,6 +1949,7 @@ static const struct pcie_cfg_data generic_cfg =3D=
 {
> >       .perst_set      =3D brcm_pcie_perst_set_generic,
> >       .bridge_sw_init_set =3D brcm_pcie_bridge_sw_init_set_generic,
> >       .num_inbound_wins =3D 3,
> > +     .burst_setting  =3D 0x2, /* 0=3D128B, 1=3D256B, 2=3D512B, 3=3DRsv=
d */
>
> Not sure this one is much of an improvement, especially if we end up
> repeating the comment,
The new code is simpler and does not do any "if" conditions like
"pcie->cfg->soc_base =3D=3D BCM2711".  This is the commit series' major goa=
l.

Additionally, the existing comment lacks sufficient information for someone
to change a specific setting. Of the nine comment lines in the commit, only=
 four
lines are duplicates. Also keep in mind that I plan to add several new SoCs
in future commits which may require yet more interpretations of this field,
requiring more "else if" clauses.

> also there is inconsistent decimal versus hexadecimal.
Ack, will fix along with s/Resv/Rsvd/ for consistency.

Jim Quinlan
Broadcom CM/STB
> --
> Florian

--000000000000702296065bb1aa2c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
P6nIShznyqOL2EoCa0IXujxvXUo0pANFYsDhrCVF5JOVPeEL3Y2m+4flRtOI+YlRQoepb+TEVdkY
/g1rlWG7GIYrtHxrFFRvn2/Iqqpv/x5kzJgoTYFOyTTGlXIqGkKTqCWFrN09kJWzhhmxhxtJprJs
KveDLF8yhHSbqmXfKTkT+CIrynXXDro+80qXEXC8CM9W9d+2lDDM+hWTlC6Pt/ikMYf/ZB4K2Nr8
VFruDYGZfAHhh9/lqK3SpS2Z/8cB88K62U+Eb1yNAgMBAAGjggHeMIIB2jAOBgNVHQ8BAf8EBAMC
BaAwDAYDVR0TAQH/BAIwADCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0dHA6Ly9z
ZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQwOQYIKwYB
BQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMzBlBgNV
HSAEXjBcMAkGB2eBDAEFAwMwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggrBgEFBQcC
ARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wQQYDVR0fBDowODA2oDSg
MoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCUGA1Ud
EQQeMByBGmphbWVzLnF1aW5sYW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQiuRLoBkhIaas+1j3yf23P
ffVFcjANBgkqhkiG9w0BAQsFAAOCAgEAp1y0fznw9Uo7UzExANVpYjj+OG1c3C7MhWOvAd7LvfPX
BSFisMaabop5Pyfc/sWzb/jCNfVkkDW5Ij2mzpUsUca2qpILoFhOUT9b0d+nc48MCZ4/Wj6vX5QJ
i9VdYeuv3DYASZsQdH8iYnV5X5YCYo1AO/pyW+M4gG022Nsji9+3A9zkx8JRPDIXkPaDLrzcGD9L
rEVIYnnSK9b/4VHzITVgEmSsUTAIzOD6M6TzgrSoJZFmKNMXlAqo+m1nlNyJkM4OyOvaDx5y+2hA
mp4tzD9gJNU9TzQpQRZFz53+c8BkCpzvcHqT8lMluRlCrIYWqaSOUDHX9HPYvzbtO4iYV+irMdGN
2PBz6Wtfaoi1xTfFSKK9ON1mvxACK+E4B5gycSoZcOBADTbGXLDMqiygl7Wz0oooAPqZpUnaD1nc
x/pX7N8Ff6YK+iN3vVah34vLkE1CMFyDQMtyTCzQPW+7XCTxCL9ML3LBAF+eNAtKpPOsrGIdRHy5
6oQr+2ZquSMvWj447q4v3sk1LHs7ata+sP8/kmcPKn3WPXQ/4xMevqFVyv2VIFrBK9ZnOZ//fz8R
7SjJ7t2kOITvbWcMkizMc33S9hfmYiXaVTjIi89NiO3EXCJouYShpptgGNG6mpYHcddnfdKiILOS
06KlKNuHO4IpRmaGrzcDjsUQQSn8amMxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgwHM7pH5w7o7Qb7yXUwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEINZK
hMGyDyPOuUZs1N2ag+Aw3q0dJX4UilBb8byBVATaMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkxNzE4MDgwN1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAFFK7Odpq9EablSgtblzzAl/P/mJU+mAMBpSNFpu
omcP2HQAjwUId1+h0CuumRHlktWGyZbK+IcG7zquyk4+ztq6rjTKCx2xUVoXwsfrWZMRqJfBB0n2
c6RiejE/T2loHtTi4OgpoKnEQ8+odfrla7lw+nappaw/esu7u7DLbnbsqOa2V6bowkmhHE9Y5Hng
UksZtfRT3Br/Y7Shi/OSJrd4tPLw4MU0RSOPKVyIrTACP6JfkNKX4zJC96v0i1AoNI2n5K45kmCv
Z8OoAM2wLRL+mHMVEnzet12HN4TsyVf48YLnwpH08gyICOx9PGLQ7Am2M9Cqv9w7SaQv/TOTpHc=
--000000000000702296065bb1aa2c--


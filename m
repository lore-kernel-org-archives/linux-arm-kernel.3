Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD20CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLSSJzcPMvZLxMHU/12wH7tKNc+RusbKq7KfkzBdjCI=; b=ulA/w3v7BiUbMswJkIXXQQhVUm
	Llf+6YtU9iXMdYxYcNDrixv9xMivpAkt6ImzCYiXTMvLVixpKHoT5ugtt8jwuvogoRDXxgS6xksaF
	BP8lMA9+BlvnYS7SbACTwb81ORnALOufcRKX/c1XGR9BNCi+g9uFg4YgkRVXiJe2IM0DsxUQFqiAr
	SQSHkv8kEGa+13LJkK22a0HzFqFNzb6d72U1fjXtektS7Z7YMTUn3ZfJGCOWyxQL4CuSp04RIf9r0
	jGY35Rd4Zb4dexIBxPmTpxzEOJz7vlX5m5seuFCRruYhxW01COIQXEXiTgcOr0YNWbY690SeTnLBp
	gpfCIvNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0F9-0000000FlDT-0NoL;
	Wed, 14 Oct 2026 14:46:11 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0Ep-0000000FlA7-3H6H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 14:46:09 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so362440a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989147; x=1792593947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eLSSJzcPMvZLxMHU/12wH7tKNc+RusbKq7KfkzBdjCI=;
        b=iIjwEG/T0D0ZbHxQG/wTt1rfD5o1g+3JUbvE9yv4HDX2M4JrGSW5nPDtPW+9bH7jbV
         cxzXe+y3xrO1wNDHV4X3AKsW2mOWYIew+aI+tBvIDa0M3GMHXy5p8vyZe64t3Xprf77+
         Ok+vdREOQLE6zVmz05T84O+lr8QV3eIRdmOQfsSAQGxgdg7A+z4XgjL4IWW/R5T87cYQ
         3IUTyWhTRAyjUqgHqoWTYj09LtkTUKTUErefFP+MfLhnU4k0yXsxY87RkcFaZfpEsnn0
         lUHH+RyU9rDUb9B76aa6Vdw8qSX46L9vW7wR/Kwx1ZFg4VwWF24uO7v8JcJekkPzcQla
         79IA==
X-Forwarded-Encrypted: i=1; AKwUvBzqT1Ha+sMs7ve3lZ9YgCM1M4i/eV90ljOVJ+Q0zo/ekgp9tOH9vnz4sVyS9L52sBs36TrRAnnjlQCp5lGPICVe@lists.infradead.org
X-Gm-Message-State: AFq9FYLQ/VYIdCSQgm3J4XLoQMdjn7qrkP3P+TiYYLXZSE+NSfrGqQu6
	Mx11Di+lLiXhYckmK3RzeIACSVXiMGHFJzdlMMYEZG+Y5b/zPpyvZJX+SY8N/ha6I0gH/5fBacx
	AQROAs+QMYOND34F5izbvLv5a9ZR3wil5+z1LwJQB6ZIiXzBl9EnwHOHKJawRArswhWQq0Ykrnm
	fjRuCi2KE61kWAkz2SpVnJiUJabZAl7bwElVYqhDfy59S78y2nR8VvBKTVA9b4Hm+71svchsqdJ
	/cBbhqT5fGswACecviFM+E8urvCm4E=
X-Gm-Gg: AYBFou2EhYdDJEX1z3rQ2mGDtLrc+YJ3CWyKrJAyH8dvHIzxbWhPg5Z/VIeYOI7Pcjv
	t+SB1fhiI5RDxkfBiCpM7WbDnmLo20g3Xb8KwYpj5lHD86+Sd4N7TEMvmjA7IGOLZaqI7o9gedJ
	fivEGpVrJvZUve6W6swzAt45H7WPLrNtpik+SqQrO823TH4aIJG3DvGcz/LYTCHbC4vpeMmmC3O
	tfExNKPU7AAw6BxUd1o5pJEctIAWYRjQApymdyJtjtjUWSXYxguEcG7TezT6a76f6vJedxwCTFW
	diTYWS53K4+bV0K/ovoK1BUi60N47X0BxSikdThTjSuCampZ+/N7/YT6Eqllug/4ppI3RPtZor7
	SSg+3eyeTt5EOC0nrmK9tA+axXlEWPw22g9SB3rGAvmViHhbCpK7fUM/Hz9dBdSluGKnMwHSwJ5
	0Xiru5n6ab6IxcP4hyA8UOdVvI5JZMRQRZljd4hoc=
X-Received: by 2002:a17:90a:c88b:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3ab3ab32a3amr12740368a91.46.1791989146802;
        Wed, 14 Oct 2026 07:45:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac8074a2c3sm664720a91.4.2026.10.14.07.45.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:45:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a5d57a8d51so4760977a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791989145; x=1792593945; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLSSJzcPMvZLxMHU/12wH7tKNc+RusbKq7KfkzBdjCI=;
        b=MvyGVCkjmx2AxmGxM8tFRoImRtNTPeR4A3k3J1AptUop26Hu+buitfoLFSFEd16+Az
         RGeAqq3FJSgDjGAPjQsDHHfMRjC2PIDh5VLOXqZTOEBShZq3NwycGCpb4r4BuoVIqIZm
         kJaSGlz0SJnkP4PLMcpdZuHLcU/yovCEwyGtE=
X-Forwarded-Encrypted: i=1; AKwUvBzaHnTcxcO2ome2Y94FGgecfupIXvZtISeOYE+kw779IizA/nwrtw/yqf/Qhh4mJyx1378k+ZA0QvtBCmqSxkCl@lists.infradead.org
X-Received: by 2002:a05:6402:a0ca:b0:6b1:c6fa:c45c with SMTP id 4fb4d7f45d1cf-6b1c6fac5femr5974856a12.38.1791989144721;
        Wed, 14 Oct 2026 07:45:44 -0700 (PDT)
X-Received: by 2002:a05:6402:a0ca:b0:6b1:c6fa:c45c with SMTP id
 4fb4d7f45d1cf-6b1c6fac5femr5974839a12.38.1791989143922; Wed, 14 Oct 2026
 07:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260911233541.1650895-1-james.quinlan@broadcom.com> <179197952602.38040.4438252459530233972.b4-ty@b4>
In-Reply-To: <179197952602.38040.4438252459530233972.b4-ty@b4>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Wed, 14 Oct 2026 10:45:32 -0400
X-Gm-Features: AclHuK9b2HukVChamYvAbAQFqc8oVbXMQj3aiVF5tb5QwJogHH1q1hyVc_gReBw
Message-ID: <CA+-6iNwE935j4wn4BWxs+t1qh3iRtWb0xNjZ-hRS0j-tkLx8=w@mail.gmail.com>
Subject: Re: [PATCH 00/13] PCI: brcmstb: Stop using chip numbers for conditions
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, bcm-kernel-feedback-list@broadcom.com, 
	jim2101024@gmail.com, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006df533065dcdfc29"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_074607_704763_23303AFD 
X-CRM114-Status: GOOD (  15.96  )
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

--0000000000006df533065dcdfc29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 8:05=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
>
> On Fri, 11 Sep 2026 19:35:25 -0400, Jim Quinlan wrote:
> > PCI: brcmstb: Stop using chip numbers for conditions
> >
> > Much of the brcmstb PCIe driver code does (essentially) this:
> >
> >         if (pcie->chip =3D=3D 0x1234 || pcie->chip =3D=3D 0x5678) {
> >                 /* ... */
> >         }
> >
> > [...]
>
> Applied, thanks!

Hi Manivannan,

I apologize for not submitting a V2 promptly -- I thought that only
Sashiko was waiting for me :-).
I have a V2 series, where 10 V1 commits are unchanged, 3 are modified,
and 5 are new.
Shall I submit the changed/new commits in a new series since you have
applied V1?

Thanks & regards,
Jim Quinlan
Broadcom CM/STB

PS Despite my delay I am a big fan of Sashiko.

>
> [01/13] PCI: brcmstb: Remove redundant const specifier for struct fields
>         commit: 46edf058e1531ceac70c59b0e69c3ff35b22e3f1
> [02/13] PCI: brcmstb: Use flags u32 instead of bools
>         commit: 17bf3521be9674ecdea6354af3ea2a38ca979ffa
> [03/13] PCI: brcmstb: Add Broadcom quirks macro
>         commit: ac87f644cec7f86681f56e2e07fb5124e622d26d
> [04/13] PCI: brcmstb: Declare and assign quirk OB_WIN_32BIT_ADDR
>         commit: 8f3d8492346ef55e20099eda7d170befcb2ad97d
> [05/13] PCI: brcmstb: Declare and assign quirk OB_WIN_MAXSZ_128MB
>         commit: 3c34e04a5ceb9f25453b51943127f3e242318a81
> [06/13] PCI: brcmstb: Declare and assign flag IS_BMIPS
>         commit: 19db283e770e9efbba6fcab0786210e4d870d7c0
> [07/13] PCI: brcmstb: Declare and assign quirk 32BIT_PCI_OPS
>         commit: 11c1752f24e643d7a3281f1add22f6a99d56a64a
> [08/13] PCI: brcmstb: Declare and assign quirk NO_RGR1_TIMER
>         commit: d3e27c1f1c1a3df58495f3cb51ce5ff0e6551256
> [09/13] PCI: brcmstb: Declare and assign quirk EARLY_PERST_ASSERT
>         commit: 644c94d347f644acf48801cd8841cea55e730bd9
> [10/13] PCI: brcmstb: Declare and assign quirk PERST_PCIE_REV_CUTOFF
>         commit: 1e840300326d6977cce6211e62e94022d569ac73
> [11/13] PCI: brcmstb: Put max_burst_size setting in cfg_data
>         commit: db776dbcfd25fc8e354aa4b3c16bdc4a7c59d99e
> [12/13] PCI: brcmstb: Use order-0 indexing for inbound BAR window array
>         commit: f22f415f21daaeb6d0e6b1537460513d3421d166
> [13/13] PCI: brcmstb: Split up complicated function into two variants
>         commit: f22895a0c371adaa8345dd76616462b868a8f38f
>
> Best regards,
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
>
>

--0000000000006df533065dcdfc29
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
QSAyMDIzAgwHM7pH5w7o7Qb7yXUwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIARU
O5DTL4MBriX6O5pBZJJSVMiAHrbLR8FLZNJHRUl6MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAxNDE0NDU0NVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAHNMdszc19c8U9HEWTuw5jOFrA6uj3+VE09DAdC8
GUYMJz41rnfpspJltqwvXh/pGocI0AWZRe4gXaSk0eUL2MYKFRvLbMAiz1GmMnZt1d1JXJXXOlk3
qIjrSqFO/B0invDSgzHHSjx+U3SBbEvxFXqs4WcNWFMyHYAeMOP3l+FhRmImpNzc357y50awdT48
Ol30LjzohWALPJD7e3/UQBpDsHK5l2jxEeQVesErU2TvtbetFgOqBL8dlDoQ23NX+OdnwGT1KOgg
BJT5HWRJsXROUZIL+W5gevl8dwV+uJCnjAElByVb6cKwXxoX5lEfz/flvONu+lo1zCql645kPMs=
--0000000000006df533065dcdfc29--


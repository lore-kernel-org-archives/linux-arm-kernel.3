Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AECE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 20:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRVB3EQAdfG27QmfkAvFcAO8XBrqAJULsCwLs00LZPA=; b=I3rq7O3t/RK+8QRr4I+Vv/Yg9z
	kplnyKL6mGj7Z3Tt0Z923kgxHF7p7D3QAySYoUSloQLIG+qU503RDF89z9ZlZAOP37pPr813mp9xy
	ghUoEvRImzxPxHene+nQ8HRxf6S2sSrE1lVXgj1wIJ4GmPn7d4tTVMZMxve9Sb3k1Uexu0Xqwu7hC
	5vdoUqE7Cg284DgDNeMrTTNhH/PSU4+nfc1295NZp3MsMqY+lxbUp0HfGKUFzsnjxez3i3v1qj6fY
	oIrj5pMEsnC1k2QpSkGH4JSWfmqqILqftQD2fPE4qJ/17Yuicfc5t6tKFtT+qXCca0tSXNlfHSTpx
	95psxyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVGJJ-00000006Fze-0mjq;
	Tue, 07 Jan 2025 20:36:21 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVGI6-00000006FsD-2hBu;
	Tue, 07 Jan 2025 20:35:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21654fdd5daso219168885ad.1;
        Tue, 07 Jan 2025 12:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736282104; x=1736886904; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dRVB3EQAdfG27QmfkAvFcAO8XBrqAJULsCwLs00LZPA=;
        b=g9tpGxB0WjphbFfn3KyzQZKaPsqVlqW47cqMvt2oTjagPDBdsj8Z/OzrIpWpceOEO/
         JCZkNArCB0AxuiQ68yNwK3Sr9X5eRf0iThO7BCqg6pMjcm+w/e8fYy3a03lnUFGTATv7
         OkUZWYTlNRnEPQH0qVDfAARSInl4XZPybXd4B7yhYLN+Hk1Obp30HF1WDkp4aERnEVOm
         hzQCrBZmKycyOFXYl9Uz1nvv/VmjeRujhmrVdMBRUUm4e4vY3HfVXIHtladaNYI9aCQg
         j4SMPC9FowN/BjjAht010nv0CW+Xp2mxBUxYlfkWQ7RZKvQdCFaiVBgDzMVRgCmpwoI5
         DkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736282104; x=1736886904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRVB3EQAdfG27QmfkAvFcAO8XBrqAJULsCwLs00LZPA=;
        b=RkY1WHwp3NBYjx9nnlstixXT4R09XtMAN6UPN9MMSX3leTs5EUOQF4emW87f9ntBnM
         9hMySXtlkeeUyH+xwYO30hXa3s+knbQnodNbK0jIqkEPKGlmB+hHO7UXOCXuKTdlp8pF
         S+PPxpouqzIGtVHu4qV8cf6AnlO1FXi8JaLE3NV1zgAX2/CQQ1eNrwrizVZYCkmuqQkL
         0BvnjJycgNa0NiqAyRaWC06X7+x9lc2iWYZZ03XwUZT3va/XNDWLdevHgICa4u8N5ijx
         qb7tJOunrn2LtYnEJizktCREVldkgX7X6+3AGVpoyBFNzWo+SX3kCoRYtfJ6XpqhlOK7
         9nYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEYffhUICw2vtQOwiz2gEFG7QxXzKZHl/EKbSKnRnOAHYKXfxzwSO2306p7DaQpWXTt/c1+wqM7Fsm6Uu0IK3otA==@lists.infradead.org, AJvYcCXiGUvAEY2NZeDs/HNev+FYMZH3FE94XdkCMM/iuG+fgkgc0hfYYGA/xm7eyBLJNI8LlHkPpsQYO4yK3P4I@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn40DM83XZ91/QolMKVySkKI3Kt38j8tDZHvyAfzDEfq0yZCS1
	wK4D66ZUf8OjCLY0k96QtqFwgh8op6YTaf1n7pCNcBFkFaZTvUaD6VNUf8BT6vpxEPSJ88eQtek
	G1rxkq4lDoNuPbllHKzbA9Erohh0=
X-Gm-Gg: ASbGncslJRjgxFJ/DWgjrWdlXp9TbVMq724+pf+F3nUJC2LGmu543voJuEhJZZriI60
	YFmL2PSqAYXJwulkEzw2WXvvNPjyY7EDH7IvPM9a/1cc867GJeJ8+
X-Google-Smtp-Source: AGHT+IEWXQpDosg5fBG9oEhfRRnfn4Ki8gx5OzGLJWxwUbX8THg3BLPGAJ7UBdXDRFLc1aDS+WnzGa2ZkElhUYtCfxw=
X-Received: by 2002:a17:903:22c1:b0:216:554a:2127 with SMTP id
 d9443c01a7336-21a83fde33fmr5223815ad.41.1736282104261; Tue, 07 Jan 2025
 12:35:04 -0800 (PST)
MIME-Version: 1.0
References: <20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com>
 <20241219-scenic-revision-17da9231d61a@spud> <91dfdd42-6ddb-490f-acda-41ce55782959@microchip.com>
In-Reply-To: <91dfdd42-6ddb-490f-acda-41ce55782959@microchip.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jan 2025 21:34:52 +0100
X-Gm-Features: AbW1kvZQsZremWvONR__RIVII7Gmwg3ACXgayGcRUA1UfxoArUjpvPFmSVjBTV4
Message-ID: <CAFBinCCxZjuXL0duy3ePPDtL1oJS_GZiX3=djXpHR+-6gLkN_w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: move compatible property to its
 specific binding
To: Dharma.B@microchip.com
Cc: conor@kernel.org, ulf.hansson@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000000e2074062b23aefc"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_123506_694600_B5E48BBC 
X-CRM114-Status: GOOD (  22.89  )
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

--0000000000000e2074062b23aefc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dharma,

On Tue, Jan 7, 2025 at 4:34=E2=80=AFAM <Dharma.B@microchip.com> wrote:
>
> On 20/12/24 1:41 am, Conor Dooley wrote:
> > On Thu, Dec 19, 2024 at 09:40:41AM +0530, Dharma Balasubiramani wrote:
> >> Move the `compatible` property into its specific binding to make the M=
MC
> >> slot more generic and modular.
> > This makes no sense, as presented. What's the real reason for this
> > change? You want to ref mmc-slot.yaml but the compatible is causing a
> > driver to probe?
>
> We don=E2=80=99t have the configuration for that driver enabled. Wouldn=
=E2=80=99t
> including the compatible in the DTS files without the actual driver be
> redundant?
>
> Is it the correct approach to add the compatible just to fix the dt
> binding errors?
Let me try to summarize what I understand so far:
- your are trying to convert the dt-binding of atmel-hsmci from .txt to .ya=
ml
- while doing so Rob asked to reference the mmc-slot schema
- after referencing the mmc-slot schema you now get warnings in when
validating the .dts because your .dts doesn't specify compatible =3D
"mmc-slot"

Is that correct?

There aren't many MMC controllers with multiple slot support out there.
When I wrote the dt-bindings for amlogic,meson-mx-sdio I *think* (it's
been some years) Ulf pointed out another dt-binding
(Documentation/devicetree/bindings/mmc/cavium-mmc.txt) and driver
(drivers/mmc/host/cavium-thunderx.c) that already used the mmc-slot
compatible string.

> related discussion:
> https://lore.kernel.org/lkml/63473475-f29e-4a65-a0aa-1f1e4112b57d@microch=
ip.com/
Rob has suggested two approaches in that thread:
- don't mark the "compatible" property as required (in
Documentation/devicetree/bindings/mmc/mmc-slot.yaml)
- add the compatible string where needed (I attached a diff with an
example where I picked one random Atmel board and added the compatible
string)

Your patch is different from these suggestions as it forbids the
compatible property in the generic mmc-slot binding.
What's the problem with Rob's suggestions? If they cannot be
implemented then please document why that is.


Best regards,
Martin

--0000000000000e2074062b23aefc
Content-Type: text/x-patch; charset="US-ASCII"; name="add-compatible-string-example.diff"
Content-Disposition: attachment; 
	filename="add-compatible-string-example.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m5mxaprh0>
X-Attachment-Id: f_m5mxaprh0

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9hdDkxc2FtOW4xMmVrLmR0
cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9hdDkxc2FtOW4xMmVrLmR0cwppbmRleCA2
NDNjM2IyYWI5N2UuLmEyN2ZjZWYyOGRmNSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
bWljcm9jaGlwL2F0OTFzYW05bjEyZWsuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL21pY3Jv
Y2hpcC9hdDkxc2FtOW4xMmVrLmR0cwpAQCAtODAsNiArODAsNyBAQCAmcGluY3RybF9tbWMwX3Ns
b3QwX2Nsa19jbWRfZGF0MAogCQkJCQkmcGluY3RybF9tbWMwX3Nsb3QwX2RhdDFfMz47CiAJCQkJ
c3RhdHVzID0gIm9rYXkiOwogCQkJCXNsb3RAMCB7CisJCQkJCWNvbXBhdGlibGUgPSAibW1jLXNs
b3QiOwogCQkJCQlyZWcgPSA8MD47CiAJCQkJCWJ1cy13aWR0aCA9IDw0PjsKIAkJCQkJY2QtZ3Bp
b3MgPSA8JnBpb0EgNyBHUElPX0FDVElWRV9ISUdIPjsK
--0000000000000e2074062b23aefc--


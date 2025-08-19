Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F53CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ik2CZRraiL4wjLDuUaIjOn1b1SNp0YAfTL1m5BkDZ58=; b=XbPvBUe2DFHGie+fGo11WRovXy
	6GDVd4e9ChHdW1tXfNN5gXlZAWZm1sk/xcXocJ6aO9RwQ8G/82sW3hPpJG7M4GKUFRkvKTCHKSciY
	rkT79Ayoz+qxCrxdcQh4cw6G0vU0tjKfeu2x9P+a8BtaIG6xYDrnGExMnQDSvh6MSSMEur2z3PzbU
	aMZ8J2bq7p4wArt9lnGkraU93ZkUrJs6SfOAfxy3SE0KHdBh4ZoU7eK6C6H5Q8GduwoMm3c+yOYfc
	Ewyjp78j8YDDhFe6ZcKITsKWn93diTFr7BkleoHWRK/ruCGcCTqlA91wuqBYtXJXw+gV2YzxZSxwC
	XGBCW6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTAR-0000000BYtr-3dpw;
	Tue, 19 Aug 2025 20:42:51 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoREt-0000000BJzT-3WDn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 18:39:20 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7abfc5cso961805966b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 11:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628758; x=1756233558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ik2CZRraiL4wjLDuUaIjOn1b1SNp0YAfTL1m5BkDZ58=;
        b=jDPdqOeJM2f0x0UwJ6nNMG3jnsw5UiRioZjQ7xJ9uO5mrGDhzGmkDZ+vibfWmjqsBu
         jpGYlkpsvaHdnLUcyaYnKrB46AQJ7Mqyw/3oyzsy2kQ0meh/k7wu52hBnFIxAQrxU68x
         i5eXX/eCBQsJeV25X8FptuVyTXNFVQVI8vhiEO43Eo/Ko1aBqPmZBzqiHIQou/+Ka2+p
         1wUp7RNtqqqoFMa6re6tqoGfF1063gaAXcpXjVh3Y2wqHBUIUhF0Sr+ypw465oN8deyQ
         7FJffTtCOPjhtHtTCUBLex6oDXplfhVw1zOAylITfn9cQq98P+3KHLzVPc4SUaonInu0
         kBIg==
X-Forwarded-Encrypted: i=1; AJvYcCV2OWnXnOJEDtlKP3OILW/ZPqh5qy3dGyyTC5z7/xpOx2mD8Byxenh/cOE/KNMPLdmZIiWYpRIHRvmy3XTJjXaM@lists.infradead.org
X-Gm-Message-State: AOJu0YxlK73XGHNuH2gxOzZf1j23YX6VjtiigeZ7rkH/QazQgUlxhhU5
	3yUvpXfCX7yJIyYLlloT0RUTUPnx2LDifCWo1tIsO8V57gJn3JA5dGcEL/DKmauBjkE=
X-Gm-Gg: ASbGnctiORxghlbGfQu+VOjBvkhGKSY8I+hkIBj1/knRYKshFsSHSAp/zRf8dFZsCIp
	Q3El6CkjUQk6Lh7o6UW3zFBY8NMVrBV/VPKDEdB8jDGjTe4aR0RcVLjZOp/3VFSUV94cEmXS8/U
	HIsB+7XagNd0OHdn9vcSb3JI9EYcM8tGT6tz8FPrySrbery+Wjm3tsL3OEQpHoyxPC8EfZBF0cN
	dN+BcPf6VSYp7Xh3ZzS0gB1Y12QzdYqjHmgxcRM110nEJuZ9/Mm4OtfRJ2G5AktVHPl0F/6h+33
	XJtT0hh3bxgVLDeEFPv3q/RHgvBhFgl5P2kkvyGS7dtBcMqo5aYEUJEzNZeoI6Q4R1KFHB4jCBe
	u1zK/WN/62c993O929SBScofJckUyaeM9eE2B/gssfg3wNlcTQmW7laxoBHHU5xc=
X-Google-Smtp-Source: AGHT+IHyA0FWl198bi2yJtMIJpUGfVLOkF/0jzpXHaYBsaT8NngdXIkCrpNa71koN+3csJZm4MU09Q==
X-Received: by 2002:a17:907:7205:b0:afd:d994:7d19 with SMTP id a640c23a62f3a-afddd221443mr367672966b.62.1755628757417;
        Tue, 19 Aug 2025 11:39:17 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded47909asm29121066b.54.2025.08.19.11.39.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 11:39:16 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61a8b640e34so1329056a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 11:39:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+swMv6/6URgwS+boI1k1BQb6cSo3W+zN6cu88811iCquvWGZy7Og1f8Kx41Kl+cCjmiNF2vxdpxfAbBSq7lIr@lists.infradead.org
X-Received: by 2002:a05:6402:354a:b0:618:272a:6dc0 with SMTP id
 4fb4d7f45d1cf-61a97825978mr311982a12.27.1755628756633; Tue, 19 Aug 2025
 11:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
In-Reply-To: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 19 Aug 2025 14:38:39 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-uMD4xPcmfcoxzdmo_wfHdiUvw=EByY+zG1c5UQ0=EfQ@mail.gmail.com>
X-Gm-Features: Ac12FXwXcPnRZb3XHtBRKxe3pDOsXrkoCrBveLOoTcxv7QMCxYMri1d_dXh5Bt8
Message-ID: <CAEg-Je-uMD4xPcmfcoxzdmo_wfHdiUvw=EByY+zG1c5UQ0=EfQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Apple device tree sync from downstream kernel
To: j@jannau.net
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_113919_875921_40F00799 
X-CRM114-Status: GOOD (  19.94  )
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

On Wed, Aug 13, 2025 at 5:53=E2=80=AFAM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> This series pulls changes from the downstream device trees which are
> supported in upstream kernel.
> Most importantly it fixes the PCIe description for a specific iMac model
> (iMac M1, 2 USB-C ports, 2021). This is worked around in the downstream
> kernel by not disabling the port. In preparation for submitting M2
> Pro/Max/Ultra devices trees I investigated the issue on the similarly
> affected M2 Pro Mac mini and fixed it this way.
> It completes the Wlan/BT device nodes for t600x based devices and adds
> the missing 15-inch Macbook Air (M2, 2023).
>
> Checkpatch emits following warnings:
>
> WARNING: DT compatible string vendor "pci14e4" appears un-documented --
> check ./Documentation/devicetree/bindings/vendor-prefixes.yaml
>
> Which I chose to ignore. `vendor-prefixes.yaml` prefixes contains no
> other mapping for PCI vendor code and the list of ignored prefixes
> forbids extending it. Both options feel wrong though. "pci${vendor}" is
> clearly a vendor prefix but duplicating the PCI vendor data base feels
> wrong. `vendor-prefixes.yaml` currently does not contain and PCI vendor
> aliases.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Hector Martin (2):
>       arm64: dts: apple: t600x: Comple WiFi properties
>       arm64: dts: apple: t600x: Add bluetooth device nodes
>
> Janne Grunau (3):
>       arm64: dts: apple: t8103-j457: Fix PCIe ethernet iommu-map
>       dt-bindings: arm: apple: Add t8112 j415 compatible
>       arm64: dts: apple: Add devicetreee for t8112-j415
>
>  Documentation/devicetree/bindings/arm/apple.yaml |  2 +
>  arch/arm64/boot/dts/apple/Makefile               |  1 +
>  arch/arm64/boot/dts/apple/t6000-j314s.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6000-j316s.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6001-j314c.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6001-j316c.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6001-j375c.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6002-j375d.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi   | 10 +++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi        | 10 +++
>  arch/arm64/boot/dts/apple/t8103-j457.dts         | 12 +++-
>  arch/arm64/boot/dts/apple/t8112-j415.dts         | 80 ++++++++++++++++++=
++++++
>  12 files changed, 161 insertions(+), 2 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250813-apple-dt-sync-6-17-d1fc1c89f7ca
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>

--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!


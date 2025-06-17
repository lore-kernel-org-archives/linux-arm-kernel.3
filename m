Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1DAC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zjtqGhgjnm5yBwbIgqfOiHPrC8nlYTo3NpdAZ+T86I=; b=eFM3ft5bTKSVh4iXg11W5Q1XyB
	lniMEVajVwr56+9fHVfHGlVrMR70csBhpvr1NHOZktmkVD7o1UQAV7+fEBNh2Lhyox7LzNOzSefv7
	vtHxVT66qw1XNlS8QafffZzSN3UlxEcQc1tKI517Pu5ntKgMMXbhVW+gedAVYWhB1b88EHA11TSK7
	KZLY+d5zc0kvNr6uJyKcmzBa/Pj4wD932CkShqMwX7cOTiZrEkI+naiRhMxwu0HWu5zN+AKPm6wsx
	OheBZfbMK2RuUu3A+r1wVfWVUzJywIeRqsfoBTG/AM0OmeWnJoJhzsYK8Ee0jX44ukdGNDIrefL3s
	xg8SMulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWVB-00000007NrT-3NXw;
	Tue, 17 Jun 2025 13:37:25 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVzp-00000007HPG-0wxT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:05:03 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1750165497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3zjtqGhgjnm5yBwbIgqfOiHPrC8nlYTo3NpdAZ+T86I=;
	b=Fkvmjd2w2NQ8I5Hn2AJHECacEiSJ1Ao16vtWobrQ89RmfTW9kxU8gLMlO+MMDsSdqAcHRM
	ZSOeUUHWE21vVjLIgdR/pl48JrO9JuhNQ4I9WvjudTFO2fyrLI3m0cofplneVJR2gZ4BG5
	DjWx1auT9lzJ3gw0gYvyyzmkDQZqg35+bLkZ3AouwWgpUhv/p+K6TfuYXbZBHcAJM0gB39
	Y0/Q0KcW5E4RSrcfuM51EuSEvtnLGnqp9FsB84aO5Y7YWBZkVnOl/92OdbpmahOS+gxAOv
	7CSSpYfKxL9oxN0n8jvcYwZktO3rtX9xc9oC8pI461JhMWyNVJ6ZfCBI60hNwQ==
Content-Type: multipart/signed;
 boundary=95b0041d640d325258bcee1396591f4111b720f6b27198e107b759077302;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 17 Jun 2025 15:04:44 +0200
Message-Id: <DAOTVW4YEC5Q.STXG6APE0YGN@cknow.org>
Cc: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <heiko@sntech.de>, <nicolas.dufresne@collabora.com>,
 <p.zabel@pengutronix.de>, <mchehab@kernel.org>, <joro@8bytes.org>,
 <iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <kernel@collabora.com>
Subject: Re: [PATCH 3/5] iommu: Add verisilicon IOMMU driver
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-4-benjamin.gaignard@collabora.com>
In-Reply-To: <20250616145607.116639-4-benjamin.gaignard@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_060502_063628_B36B9673 
X-CRM114-Status: GOOD (  21.33  )
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

--95b0041d640d325258bcee1396591f4111b720f6b27198e107b759077302
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Jun 16, 2025 at 4:55 PM CEST, Benjamin Gaignard wrote:
> Verisilicon IOMMU hardware block can be found in combination

Can there be only 1 hardware block or is multiple possible?
If only 1, then I'd start with "The Verisilicon ...".
If more then one, then I'd use "blocks".

> with hardware video codecs (encoders or decoders) on
> different SoCs.

This makes it sound like it can also be used with non-Verisilicon codecs
and based on the DT binding description, I get the _impression_ that
that is not the case?
But it's actually not clear to me if that's the case or not.

> Enable it will allows to use non contiguous memory

"Enabling it will allow us to use non ..." or "Enable it to allow [the]
use of non ..." or "Enabling allows the use of non ..."

> allocators for Verisilicon video codecs.

And the wrapping of the whole commit message is not following the
standards.

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/iommu/Kconfig     |   8 +
>  drivers/iommu/Makefile    |   1 +
>  drivers/iommu/vsi-iommu.c | 900 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 909 insertions(+)
>  create mode 100644 drivers/iommu/vsi-iommu.c
>
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 0a33d995d15d..4cf4504dcc25 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -383,4 +383,12 @@ config SPRD_IOMMU
> =20
>  	  Say Y here if you want to use the multimedia devices listed above.
> =20
> +config VSI_IOMMU
> +	bool "Verisilicon IOMMU Support"
> +	depends on ARM64
> +	select IOMMU_API
> +	select ARM_DMA_USE_IOMMU
> +	help
> +	  Support for IOMMUs used by Verisilicon video decoders.
> +
>  endif # IOMMU_SUPPORT
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 355294fa9033..68aeff31af8b 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -34,3 +34,4 @@ obj-$(CONFIG_IOMMU_SVA) +=3D iommu-sva.o
>  obj-$(CONFIG_IOMMU_IOPF) +=3D io-pgfault.o
>  obj-$(CONFIG_SPRD_IOMMU) +=3D sprd-iommu.o
>  obj-$(CONFIG_APPLE_DART) +=3D apple-dart.o
> +obj-$(CONFIG_VSI_IOMMU) +=3D vsi-iommu.o
> diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
> new file mode 100644
> index 000000000000..f2fa1197916c
> --- /dev/null
> +++ b/drivers/iommu/vsi-iommu.c
> @@ -0,0 +1,900 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +

No copyright statement? (or an informational header block?)

Cheers,
  Diederik

> +#include <linux/clk.h>
> + <snip>

--95b0041d640d325258bcee1396591f4111b720f6b27198e107b759077302
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaFFn8gAKCRDXblvOeH7b
bgL/AQC2+pfAq9y+rYClfqDV6JafnSW/BsK29aRiz2WgF9RTPwD/V9oxqTRqrf49
ZD2TLkIPP43QDiTJOJ66STMrp/UUAAw=
=lqws
-----END PGP SIGNATURE-----

--95b0041d640d325258bcee1396591f4111b720f6b27198e107b759077302--


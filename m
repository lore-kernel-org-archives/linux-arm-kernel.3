Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB548CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBxKHfRCGcE5Q/eepg5aPjxUu8diqcOmzAvEs6SS1gU=; b=4NX5qsyuIKSNlqcJjjdI2tSnU6
	Rh1OYfDe+Er+r3ieXuAt0qM0wiOkfSeregOtA7aPF06wXq7J4jAX+61AvFa7p8knZMC6UsjfSXIVz
	h1sumyOYzPrNaa6FMb1UEq9ajN5nCQYQWTZHeJ3bJLurq+Y5M0NtSYZwtAzrNuIg2Zk63sfdfXEe2
	x1MA09P2XaabMcusLeARmt/XCoKtPKUPgmtf/I8CbWOwj6xx8Ah7r721mDEmjXIdSjabc67J/uCok
	XFepgs/kQ4f5LeOwGjV/Br7geyhRgraxF/9cJKOIXdatFDYFrQtKHFZQbJNzNm4huVPC9pHoLvvqS
	7pDOgtwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyt6z-0000000CCob-3gQ4;
	Wed, 17 Sep 2025 14:26:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyt6t-0000000CCho-1jWp;
	Wed, 17 Sep 2025 14:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=XBxKHfRCGcE5Q/eepg5aPjxUu8diqcOmzAvEs6SS1gU=; b=iPeTG/S7BlbqBcsqvb6s5BzW8C
	+K5i7IF5xnqnky7+WluHCxzTVYLW/nX5SZ4xz1RRqfPrwlRCIPUb2l7VwS8EZtUMDFXIBh3I1HiUV
	v6hOiPZ6kgUyWn/QyT7HAVCmge5ATcGHua9nehvN3uHnUDWteZpHXyEn6D5RGt1RDNxDKovDDrJIc
	gJg9Nsh5XBjMoTJjI3znoDVX2LidNsR2MS/d43s+VfKZ+LKV3CvGmQqADqCP5zowN84MEkKpPt0q3
	zY+XFX1H7akSvKHeWA5keKDUxePGwWuDjYuqh8Al6wqSXQWXEdYAh1OLPVtTVu1XKLDVFvdfAi6sP
	fktAFmTw==;
Received: from i53875a9d.versanet.de ([83.135.90.157] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uyt6e-0000pg-Tg; Wed, 17 Sep 2025 16:26:00 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ed Wildgoose <lists@wildgooses.com>, Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rockchip: dts: Enable UART DMA by adding default dma-names
 property
Date: Wed, 17 Sep 2025 16:25:59 +0200
Message-ID: <4007782.fW5hKsROvD@diego>
In-Reply-To: <7c8576e3d9fc73ba45830833f5281706@manjaro.org>
References: <20250917114932.25994-1-lists@wildgooses.com>
 <20250917114932.25994-3-lists@wildgooses.com>
 <7c8576e3d9fc73ba45830833f5281706@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_072616_645235_882A3620 
X-CRM114-Status: GOOD (  18.84  )
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

Am Mittwoch, 17. September 2025, 14:22:52 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Dragan Simic:
> Hello Ed,
>=20
> On 2025-09-17 13:49, Ed Wildgoose wrote:
> > Kernel appears to need a dma-names set for DMA to actually enable. Set=
=20
> > a
> > default dma-names property for all UARTs defined in the base=20
> > rk356x-base
> > dtsi
> >=20
> > This is tested on a Radxa Zero 3W (which has 5x UARTs) and removes the
> > warnings and enables DMA on this platform
>=20
> Thanks for the patches.
>=20
> We should (still) stay away from defining the "dma-names" property
> at the SoC level, because doing that causes serious issues in certain
> cases.  Thus, I'd suggest that this patch is dropped, and that the
> "dma-names" property is defined instead at the board level, where
> it's needed and tested to work as expected.
>=20
> Please see commit bf6f26deb0e8 (arm64: dts: rockchip: Add dma-names
> to uart1 on quartz64-b, 2024-06-28) for further explanation.
>=20
> If/when the underlying issues are debugged and resolved, we can get
> back to defining the "dma-names" property at the SoC level.

And apart from the whole stability thing, on a number of socs the pl330
dma controller has more possible sources for dma operations than it
has available channels ... and right now the driver does not support
handling this.

So you can (and if I remember correctly we did) end up with some uart
requesting dma channels (and not needing them) and then sound not
getting any.


Heiko




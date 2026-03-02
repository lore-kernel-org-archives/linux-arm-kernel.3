Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692C1EA4E21
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/tAMTzIOE7bFqndq4kXm1Iott5bt/Erb8taVDtOhVM=; b=Yzq0O7c3VcKK08MRulCJ5/fQBg
	mLVmp+cJBJ40za47PKlpYSixtPts1MG4vMth2rhgp7dJ8F9ouZP9Pal5ZCIBworMJcsl8u6afQ41F
	u0wcnk1H4c6rdP8qZKU9gmIZOunMw4a6USqHtfFlvSXSU3V6f8OYC+UupzDiWkCmuxGMqFmaYpHQn
	YKRKdNGpm/8kz8tysWHSajWb8ts/rYkWjOCVqu5qPL9VNlfVBd10BJgK++x8ss7Rttpm3xjy1ld7P
	LVDa6lkrbRKzJy5VDH6+P0R/js0DVFYy8lBCnvFon+yBasOcmn0yMohEUrzi1ZQlssZ/02Evdh+hh
	fui9SuXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx58y-0000000DM8R-1RYt;
	Mon, 02 Mar 2026 15:25:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx58u-0000000DM7a-2qNH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:25:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1FB344E424D4;
	Mon,  2 Mar 2026 15:25:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E632A5FE89;
	Mon,  2 Mar 2026 15:25:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D5DF10369562;
	Mon,  2 Mar 2026 16:25:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772465104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I/tAMTzIOE7bFqndq4kXm1Iott5bt/Erb8taVDtOhVM=;
	b=2BZl40p1clVD9RsScsSKOR4NzroGtwRaIRwje2dQZpJLdoNWZ1C5lQdSItQ8aotpExfs7M
	lKJ3IEjclt8EZEArNys5PFihZpgwgnGYMW7IcQL51837tlcJZZ9G/hszE+6msTdkzzVGYy
	S6rSR9slyAkCyg0069Laeqqlgvo0GHOGO2270j6xt0biR8YkuFHFd6nXgK5lCpXp6Qud9A
	UmPjRdUD90QCRjCt921q5NThgvHNZ4RPd9GuVOhZlOijNwHNxW3n71WCXKRuO0zfWSmfxB
	pQ/Y0V9kPsiWkS2Q9LePEeRpdrSKCAAc5YifkFma/yRvcDIqmsO3Q6EBjmikjA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>, Elad Nachman
 <enachman@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: drop file entry in Marvell Kirkwood and
 Armada SOC support
In-Reply-To: <20260203083842.347391-1-lukas.bulwahn@redhat.com>
References: <20260203083842.347391-1-lukas.bulwahn@redhat.com>
Date: Mon, 02 Mar 2026 16:25:00 +0100
Message-ID: <87seaife43.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_072508_852453_20EC7FE2 
X-CRM114-Status: GOOD (  18.21  )
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

Lukas Bulwahn <lbulwahn@redhat.com> writes:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit fcaf733ca526 ("MAINTAINERS: Add Falcon DB") adds a new file entry
> referring to non-existing files arch/arm/boot/dts/marvell/db-falcon*.
> Checking with 'find . -name db-falcon*' and the files actually added with
> the commit b3370479a5f7 ("arm64: dts: a7k: add COM Express boards"), which
> was part of the same patch series, the files intended to refer to are
> actually arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dts and
> arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi.
>
> Note though that there is already a file entry for
> arch/arm64/boot/dts/marvell/ in the ARM/Marvell Kirkwood and Armada SOC
> support section. So, the added files were already covered by the
> existing MAINTAINERS file and no further file entry is required at all.
>
> Drop the unneeded file entry, essentially reverting the commit
> fcaf733ca526 ("MAINTAINERS: Add Falcon DB").
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1d6c1df42bf5..0c474d8f62ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2989,7 +2989,6 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git
>  F:	Documentation/devicetree/bindings/arm/marvell/
>  F:	arch/arm/boot/dts/marvell/armada*
> -F:	arch/arm/boot/dts/marvell/db-falcon*
>  F:	arch/arm/boot/dts/marvell/kirkwood*
>  F:	arch/arm/configs/mvebu_*_defconfig
>  F:	arch/arm/mach-mvebu/
> --=20
> 2.52.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


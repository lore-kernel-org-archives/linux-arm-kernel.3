Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B973C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNvIwIL0F+WGb1cP296osJ4ZZdbCodbHqraWe1YZzog=; b=A9oFXIhh/9wOnuStUVoIiHq2N1
	Gf9G6H2W8tdz9MSboq4QazPv6uVLgM3Uft0jDrmP2zERTSQxpRFAm5RWlALvHjXOyPY2VhREIcgDX
	QTWnB3YnLV6XQflUhcXQLDz4WzKn45+HilCmPbwcOpSIB62mN0hp1PvtmuxRup4Pwi16LSLdZoK5+
	BqYJeuPmCXuyyWcA26D3E/u2VSdN1hPgk8/M8Ed7RaoLDDfErFG+48KUa988xfGPLL4DD2kXuknCr
	W8qa4ISphCdi1aQE2l2ZCiNawMDopMGQycTsjivFrJ/TNM56B8PNLgV03wnZdy8Di9dtcMOUtV+ZY
	sjoOqWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGKn-0000000GWav-3kYF;
	Fri, 24 Jul 2026 13:53:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGKm-0000000GWap-27Ae
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 13:53:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 94DC5600AA;
	Fri, 24 Jul 2026 13:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88DA1F000E9;
	Fri, 24 Jul 2026 13:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784901183;
	bh=uNvIwIL0F+WGb1cP296osJ4ZZdbCodbHqraWe1YZzog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DVHAf0IXKut/rgOXRCr3U1pceg9fxuVvhvImCQ8KNMSrzvzTohQO0zFfyZCm9Q01l
	 jS1KjX/6eVwf5/LlLcZqa2go7vFFK80H5kHCOiKl2L48aj2OZr80Z0jh6H+lGDSKe5
	 Efbp/ZC6xCjRdfROMt+CDOOgI0eCWKhr5bx8Y8dfA8vXRNETYrY70iHYHEZl0tAi3c
	 4aT74NHW297AKS0BK+/NbrnvXEzc843AXm6BV3fARrdzI4RTzqzJb7MHbkzpRkjAWF
	 /pu0N8OzWMFnrePzg1FAO+TRKwgxdDyAsXa+6FsXcx3KnIWK4QdbNliRaWnTLz8BYr
	 N0+oN4yQmMIMA==
Date: Fri, 24 Jul 2026 06:51:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <20260724135111.GA1876@sol>
References: <20260724050645.223799-1-ebiggers@kernel.org>
 <amM22cX7KTqyOoOk@sumit-xelite>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amM22cX7KTqyOoOk@sumit-xelite>
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

On Fri, Jul 24, 2026 at 03:26:41PM +0530, Sumit Garg wrote:
> Hi Eric,
> 
> On Thu, Jul 23, 2026 at 10:06:45PM -0700, Eric Biggers wrote:
> > This obsolete driver was already marked as BROKEN.  However, keeping
> > BROKEN code around in the tree is unnecessary and causes problems.  It's
> > much better to just remove it entirely.  Let's do that.
> > 
> > Crypto acceleration remains well-supported on Qualcomm SoCs via the
> > Qualcomm Inline Crypto Engine and the ARMv8 Crypto Extensions, which are
> > what Linux actually uses in practice.  The obsolete QCE driver is a
> > dead-end approach.  It's extremely slow and just doesn't work well.
> 
> Not sure why only performance is seen as the major driver to drop crypto
> accelerators from kernel

Maybe you missed all the other reasons I gave too.

> while neglecting the security use-cases they support as well like:
> 
> - Support for hardware backed keys
> - Support for secure media playback use-cases

The QCE driver doesn't support these features.  So they aren't relevant
to this patch.

> I know it's not good to add functionality based on a prospective
> future use-cases but at the same time dropping functionality for it to be
> added again is just too much unnecessary churn.

This conflates current functionality, which doesn't meet upstream kernel
inclusion standards, with mostly-unrelated speculative future
functionality.  Anything new should just start from a clean slate with
just what is actually needed.

> I am sure you are aware about support for hardware backed key use-cases
> for many of those crypto accelerators. NXP CAAM engine is one such
> example.

The CAAM driver does register a "cbc(paes)" algorithm with the crypto
API (i.e., CBC-AES with a hardware backed key).  However, there's no
upstream user of that algorithm as far as I can tell.

But this is unrelated to this patch, which is for the QCE driver.

- Eric


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD97CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 01:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrrofRYL2z0dvHXeTssozkcKWCmca/7LdFgTt3bUbuk=; b=CweuxjAlC2DOeHLVOkiQtOIYOf
	s0wMPDSSY+slilp6SVCstpDfRC3qj3ogYvIteM6qZ/Yje1MGYe+fgrq14rowbljcqmvYJZX5LITnn
	RH3ZYCb8G1ceGxZu8/QcLid0p5Fwx6uJL4L34UuMyQ8DuZS84QqnIIk5PLHZVsVWMiC8unPquKQtM
	U97O2o1ujWrywfbfICiBUPjLI1wPlRgd5xgZQ1F15Y5wGclvgjh5ld8KdzNHC0L/G66nf2O+54jXi
	RZWgClxf1m8kb6AnFB7Z6UPmflEaxTUaAa5X/na6kc69YXZjCDquLYL37UPk6CCGOt76mBHxYj5KJ
	38A8DpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS3YD-000000038pM-0Cu4;
	Wed, 27 May 2026 01:59:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS3YB-000000038pG-40d4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 01:59:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1497160098;
	Wed, 27 May 2026 01:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8273C1F000E9;
	Wed, 27 May 2026 01:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779847154;
	bh=HrrofRYL2z0dvHXeTssozkcKWCmca/7LdFgTt3bUbuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I44m3YabNCaRf9MGC3FNPgMBeFtRbN4RwifF5NdF7BB/kM6Wno628WXkP2BeocYmI
	 cn+efU01XGmaac1UWKDib1aBDzh3ItfnN3arln/LccUjG6A/t5TSYPA+IwOuQ3Kq3I
	 AQxR4OpCLVY3zdiA93tGhrXkhJ5Tt/vXsWw1mBUnX133HIyMDxl2XWYh4s3xTc4CRA
	 Vl0nWMg3Y5dtUTxjLuXMtSjHqnSLAb2dJUIpqnW6ZQIh5CHN0DwNLnJ/P+nWgdYi/e
	 fhRbEMjv17cRCIsAKyDzpwg5rRF8GxHTzfAffy/D0Pp0OjjaOEdfj3A+z+aI8Ly/RS
	 aa39Pu+XClZKQ==
Date: Tue, 26 May 2026 18:57:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-raid@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/8] lib/raid6: Include asm/neon-intrinsics.h rather than
 arm_neon.h
Message-ID: <20260527015754.GA13078@sol>
References: <20260422171655.3437334-10-ardb+git@google.com>
 <20260422171655.3437334-17-ardb+git@google.com>
 <20260423074712.GC31018@lst.de>
 <20260509202354.GD11883@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509202354.GD11883@quark>
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

On Sat, May 09, 2026 at 01:23:54PM -0700, Eric Biggers wrote:
> On Thu, Apr 23, 2026 at 09:47:12AM +0200, Christoph Hellwig wrote:
> > On Wed, Apr 22, 2026 at 07:17:03PM +0200, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > > 
> > > arm_neon.h is a compiler header which needs some scaffolding to work
> > > correctly in the linux context, and so it is better not to include it
> > > directly. Both ARM and arm64 now provide asm/neon-intrinsics.h which
> > > takes care of this.
> > 
> > 
> > This could potentially clash with the raid6 library rework I'm doing
> > for 7.2. Although git has become pretty good about renamed files, so
> > maybe it won't be so bad.
> > 
> 
> I think this patch also breaks the userspace build of lib/raid6/.  Which
> is going away in Christoph's series anyway, but maybe it would make
> sense to drop this patch (and patch 8 which depends on this, I think)
> from this series for now?  That would make it a bit easier to take the
> rest through crc-next.

Ard, are you okay with me applying just patches 1-6 to crc-next?

- Eric


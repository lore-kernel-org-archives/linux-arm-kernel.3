Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6D1CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 20:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQ8o3NwYNG+FSE8c2GdyR3sj/We0W1HgEtNlRdVdUJY=; b=fEsorn3c8ZQXUhvmcErpDUHfVl
	AHjwXW/5uVI5eGIFlEaCYwEbjGO9udYBAhcIf7KTEGPwzRBsA3L+4e5wNyDmu6czLDtES8maezEM6
	yMndRvUjUBRTgJTlnPnACDerTjjhk5O6nZT10BGkR87H7aCTbtD6YDwVwVU1Flcdvx+B+lEtErwnS
	Fv/MXCFcp5fqvd8I9x+euc5PfFKtk6PMXn6BiDwAHyJc57u7t3NGMU/jJpwkJe6x02jCfVs4IihgE
	fjQ0+9L+CJDvBR4IelgBfE3A7A8RGs58LMQn/uq6lKsmF8L6FQggxWAsUN83qw32TV7fl7e8r7Ixk
	gxd21I0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLoE6-00000009bf9-3ryl;
	Sat, 09 May 2026 20:24:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLoE5-00000009bey-47i6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 20:24:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FB5F60121;
	Sat,  9 May 2026 20:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F57EC2BCB2;
	Sat,  9 May 2026 20:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778358280;
	bh=kKWh3Ax64/du+5vhX0vAjVHPv0l4sBuI+ks7VTd/Lkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shZOE2pVpx5LAwKbDSqYjkqU3e5ZgIBDTpaNBPpdxKFnn7hy81myAkpSA+zI1NOjy
	 +lCtIM2W21mDt+l3OF+B+pL6zjn3w28574nppg08u0KqlgRXdvAkRbO0G0oWB1uOto
	 jurZzH1+Cd/vfNOQTM9pKWMYYNG4HiO8Sh0B55lhaS4+rgi07zTcEBESprQlU41IE4
	 vFiUSg49UFiqrg3tyQkj6J+wmzNc6SyfV+8nCiAnTOkcEi8iLsgzKaJMAahzCtfg77
	 2MaiR67kIZf0F5sTVlTruJXAgamxbEsnq9e5QVxG+RGOtuUl5FVZyf2t/vtmBZqubE
	 M9kJNzwTG944g==
Date: Sat, 9 May 2026 13:23:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-raid@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/8] lib/raid6: Include asm/neon-intrinsics.h rather than
 arm_neon.h
Message-ID: <20260509202354.GD11883@quark>
References: <20260422171655.3437334-10-ardb+git@google.com>
 <20260422171655.3437334-17-ardb+git@google.com>
 <20260423074712.GC31018@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423074712.GC31018@lst.de>
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

On Thu, Apr 23, 2026 at 09:47:12AM +0200, Christoph Hellwig wrote:
> On Wed, Apr 22, 2026 at 07:17:03PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> > 
> > arm_neon.h is a compiler header which needs some scaffolding to work
> > correctly in the linux context, and so it is better not to include it
> > directly. Both ARM and arm64 now provide asm/neon-intrinsics.h which
> > takes care of this.
> 
> 
> This could potentially clash with the raid6 library rework I'm doing
> for 7.2. Although git has become pretty good about renamed files, so
> maybe it won't be so bad.
> 

I think this patch also breaks the userspace build of lib/raid6/.  Which
is going away in Christoph's series anyway, but maybe it would make
sense to drop this patch (and patch 8 which depends on this, I think)
from this series for now?  That would make it a bit easier to take the
rest through crc-next.

- Eric


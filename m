Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201CDCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V0BeRkhSjVtrn4P9RhYiGX9H4lfMlcPK7DpeVcq/dQ=; b=LIOFVXy/JuRfTPzFz0O8BZvGGV
	o0qxHzcl7Wgi4M/7AYYl3I+gwHDuBP78CN2Iwge28IIYSR2rf8yaV4xGwDU7mP6GN70UWam4XUBTs
	eRsHYFKUT8XgSJC79O2Eim+m4SNhpk7d4Ms7uC+5SEbXD7cBMyQBYbqse4xuwb4ZYWVRB80VhNZG0
	GtuH2RXU3DK9loOuzGifF7kfw/JuAfz4GpzKIUjmFtsjWRSWbMK/VP0y4pu4/vPbpy65PKK/O8deE
	/KDY6KHR34y4iaObnPimBvsyKgG3sUqqWsr7R79GpZrDpj8XqvrKFrY7C6TCWZ8lrRwYL3LE7HdtG
	C8ElzKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyNV-0000000FUA1-0cyf;
	Wed, 14 Oct 2026 12:46:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyNP-0000000FU8h-2mDo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9V0BeRkhSjVtrn4P9RhYiGX9H4lfMlcPK7DpeVcq/dQ=; b=XY3tDPJyJRl+1T2v9DxhT7SFzk
	cwnQDTuOn7CtB5PPQfjsF0hisPWuysvuvMELCEcejtG5Bl9R40maKfT9KgpenrhwJDOoecFUqhwp6
	bWmUVGYNYbnoaJoefFmi0BG7bpLq/MuCgl8VH/OuVCjlsSpCcsqYppIhv5qzGFSwolME=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xGyNN-00AjUP-LK; Wed, 14 Oct 2026 14:46:33 +0200
Date: Wed, 14 Oct 2026 14:46:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RFC 00/24] ARM: zte: Add support for Sanechips ZX279128S
 and ZTE ZXHN H3600
Message-ID: <9dde103c-354c-4fd5-84fc-cd6555df59d1@lunn.ch>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <Lurh_NpYS2qId-6ONmcWzg@gmail.com>
 <20261014071955.1755637-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014071955.1755637-1-ghahramani.navid@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_054638_724424_18E3CE5A 
X-CRM114-Status: GOOD (  12.44  )
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

On Wed, Oct 14, 2026 at 08:19:55AM +0100, Navid Ghahremani wrote:
> Hi Stefan,
> 
> Thank you for the candid feedback, and I completely understand your
> concern.
> 
> To be completely honest, I am returning to low-level C and kernel systems
> work after being on the software/application side for quite a few years.
> This router bring-up is a personal hobby project that I work on in my
> spare time rather than my daily job, so I am a bit slow right now and
> still catching up to speed with modern kernel architecture conventions.

This is the sort of project i like to see, somebody with real hardware
in there hands learning about how the kernel works, rather than the
usual bombardment of AI generated patches.

You are going to need to split this patch series up by
subsystem. Please send all the networking patches to netdev.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

Thanks
	Andrew


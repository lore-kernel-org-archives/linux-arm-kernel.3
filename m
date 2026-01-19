Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B20CA5FF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eeu1NoLap5pNHeOyVFOwLQY4O5RAV8xxm6CRPXLCCg=; b=3tinySIW4chPrpjPdbPE7YdBPM
	KKfr9IPh49ZEBevB2RoOBAmUJfaZst7IOoOxuFHZ1bodkrYbH45DpCGyMEhSZjW6rzij7os7bvftG
	dr7Gutbkptzc4nlTO/zW39CEXjX8g3+T6CrXv1k6VyBAEgVmpd0VUfQlhb3LfSFTLIF4PGI+YB0ML
	Fy+eSq6FmhpQd83jYOueRqLeX3UpFLmgWBWZMcQZQRMhuZVojI34OWQudo1eslV/H3/Z5n5WSdyV8
	tgkUQy3iSstkjLj9BIewOS7ENcuQeT5tNCEWvxHP/hDLQrUoEqG1aasfvZpVqaDHGvW2T8WK4D3+s
	GGwIHKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn2U-00000001qSH-1KxG;
	Mon, 19 Jan 2026 11:03:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn2Q-00000001qS4-2qME;
	Mon, 19 Jan 2026 11:03:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4DC460140;
	Mon, 19 Jan 2026 11:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7800BC116C6;
	Mon, 19 Jan 2026 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820593;
	bh=Mt0lTtW0SXUZ+bfiJxVUlnJJ2N4AYGqAw+VCdzmAl/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4pl0ofFVaZCWtIpWJuGDssLs+2l2nRdSBXVxh6DBcRX26quEJJHUBZTwC44GHoYU
	 Sq3KC8JHsAD2+9OD17hTSWRkgCPsL2XoZOgE1LIPMtGdrDJmK6bgGER6XgwtSO3VZs
	 ThFtbVqn/JDqSueZGKjpbzJxoaTdLR5M7m2QsV53lTG++FOzrXWIUHwOHZU0KECT9W
	 cVGuEJwW7PmX+lXcVYQ1dDPeuEkOtWecV4nFkcsYEUAgQf9U2VH40udzyT1pKMnPvX
	 QW8lrTHNl9UJPMIZtkdEAaBSnysDMlF7KWo+vbtJHtdW+gMOl2YDSTr+H0R+NNLWvw
	 GZo3UpMCsJcnA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vhn2I-000000000vD-10Ay;
	Mon, 19 Jan 2026 12:03:06 +0100
Date: Mon, 19 Jan 2026 12:03:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aW4PajoKqmyjkciY@hovoldconsulting.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aUql_tZisfH8E1bq@hovoldconsulting.com>
 <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
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

On Tue, Dec 23, 2025 at 04:11:08PM +0100, Bartosz Golaszewski wrote:
> On Tue, Dec 23, 2025 at 3:24 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Dec 23, 2025 at 11:02:22AM +0100, Bartosz Golaszewski wrote:
> > > It's been another year of discussing the object life-time problems at
> > > conferences. I2C is one of the offenders and its problems are more
> > > complex than those of some other subsystems. It seems the revocable[1]
> > > API may make its way into the kernel this year but even with it in
> > > place, I2C won't be able to use it as there's currently nothing to
> > > *revoke*. The struct device is embedded within the i2c_adapter struct
> > > whose lifetime is tied to the provider device being bound to its driver.
> > >
> > > Fixing this won't be fast and easy but nothing's going to happen if we
> > > don't start chipping away at it. The ultimate goal in order to be able
> > > to use an SRCU-based solution (revocable or otherwise) is to convert the
> > > embedded struct device in struct i2c_adapter into an __rcu pointer that
> > > can be *revoked*. To that end we need to hide all dereferences of
> > > adap->dev in drivers.
> >
> > No, this is not the way to do it. You start with designing and showing
> > what the end result will look like *before* you start rewriting world
> > like you are doing here.
> 
> The paragraph you're commenting under explains exactly what I propose
> to do: move struct device out of struct i2c_adapter and protect the
> pointer storing its address with SRCU. This is a well-known design
> that's being generalized to a common "revocable" API which will
> possibly be available upstream by the time we're ready to use it.

Revocable, as presented in plumbers, is not going upstream.

> You know I can't possibly *show* the end result in a single series
> because - as the paragraph before explains - we need to first hide all
> direct dereferences of struct device in struct i2c_adapter behind
> dedicated interfaces so that we when do the conversion, it'll affect
> only a limited number of places. It can't realistically be done at
> once.

You can post an RFC converting one driver with a proper description of
the problem you're trying to solve.

Johan


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EC8FD5312
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3USc2QfZCgPyXVGMQZO0u6aGgfjPZSd55Ii4xffhPPo=; b=1kOXM9ow6Va9LXGNwKcnd38j/R
	k/sy2McGPZrfKaMM4qZUtcmLAhW0Kv60HBklYAM5khcAHND/XazrjIKUUgFsIkxXwDtGFFPQmhjNj
	j2K6k7HR10JHvztd1tf62L94eE+led8hS5G6GPnzViAOeKgXlGKA5JWeR6ULc9LnUJTpzeOBS+BE7
	+0aXsv5Epa08wF2RU7RybcqOaOip/2mFNhJ++pFnwerqoSDH53VffzFSFU9DxC/jjR0JUvOOMfEi5
	WdY+EvBtXJuf7spPot0AA/JxtqJOvLSNlrsFBUO5gixKC7wdM9EBle5GpN7unA75n8syAVNAZq5i5
	DsNtkoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtgj-000000082bI-0ISe;
	Fri, 27 Feb 2026 08:59:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtgh-000000082au-41ZZ;
	Fri, 27 Feb 2026 08:59:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 177D16013F;
	Fri, 27 Feb 2026 08:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3918C2BCB0;
	Fri, 27 Feb 2026 08:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772182746;
	bh=VzY/ze97VjQJB6pusfmZwjsA+pOGa2Ehm/PhEEoeuXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JAEhKUUK1BXG9J99lnYRvccU7OFWmcACPC8G9rjuzLEiFAB2pFKgNDr54l7D9w7aY
	 xSx557fMzTqXOTN8Kd/9smGEiItjVaMfSsC/FVg+l0Ja7O5Y5AFFDboPmD3blrTLBc
	 qCpF0Whlvi8V/CSgBZSgfiu2Wu+JrwNu+N6eY65JcwI3csJVwuRyHs/glM0nZ0lbRv
	 1WyAUrwiutxoCbarTjTNR2oXy2mPIL5AwjVCagk1Hpn5C+PSAovHSd+tXGxkLdH9ju
	 ePuzH2Ur7TfopAXlAuB1pO5xVPa1dQecHrZr/EP44S+wpOCuPcj249WAdenNAENoJ+
	 vi95mzuN0VLqg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vvtg3-000000001ZV-3EUL;
	Fri, 27 Feb 2026 09:58:27 +0100
Date: Fri, 27 Feb 2026 09:58:27 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aaFcs1miP88QWmtH@hovoldconsulting.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
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

On Mon, Feb 23, 2026 at 09:59:29AM +0100, Bartosz Golaszewski wrote:
> It's been another year of discussing the object life-time problems at
> conferences. I2C is one of the offenders and its problems are more
> complex than those of some other subsystems. It seems the revocable[1]
> API may make its way into the kernel this year but even with it in
> place, I2C won't be able to use it as there's currently nothing to
> *revoke*. The struct device is embedded within the i2c_adapter struct
> whose lifetime is tied to the provider device being bound to its driver.
> 
> Fixing this won't be fast and easy but nothing's going to happen if we
> don't start chipping away at it. The ultimate goal in order to be able
> to use an SRCU-based solution (revocable or otherwise) is to convert the
> embedded struct device in struct i2c_adapter into an __rcu pointer that
> can be *revoked*. To that end we need to hide all dereferences of
> adap->dev in drivers.

Again, this is not the way to do this. You don't need to wrap every
access to struct device in random subsystem specific helpers to address
the lifetime issues. You're just creating a big mess here for no good
reason.

I asked you to show where you think you're going with this because none
of this looks right. Same comment applies to your other series.

Wolfram, I noticed you merged these last night. Please think again and
let's discuss the end result here. There's no question that there are
lifetime issues in i2c, but this is not the way to solve it.

Johan


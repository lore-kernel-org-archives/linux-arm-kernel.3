Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E5CEFCD84
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysvPiqp562qCZQnJw5l8TL8cq4IhZO2GmAxe8p0UZ7I=; b=LizVXhlkTgpR0384BmGbCo7FV5
	PpbLwXHTCc+yiV8u3Tc3UFYV8mp1LXMBE5x7HqC7ak5F2bnZpIYkfCVAW7Dbhm8XhEQopexVjzf+8
	GKe5vl2xptxG4ojJygR78EY+1E6Vzjl3C+44mHGpSPWurbW53sOPgBQ4uTNeFGAJFagcr0vt136z3
	yoaauZK40o7dONOtPaEc/qiz5gFW1abSguqscn4Dup+j5+WdnVIx4ZevnC2Kpl1GPIhr/pdy6lWvY
	qLacjyEB9J/Zpa/wWhHQCMMEvrODfFAsqmVDQ5NyVyBs9TMVlX9niM4oahGap1mqezdRWAotAMzoq
	/D74eE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXtO-0000000769W-3yzk;
	Mon, 09 Mar 2026 10:31:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXtN-0000000769C-30aM;
	Mon, 09 Mar 2026 10:31:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C257B600AD;
	Mon,  9 Mar 2026 10:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FDCC4CEF7;
	Mon,  9 Mar 2026 10:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773052276;
	bh=1dv+XhP5OwvToCXeXxaL6H6crc5uBccvLhwiXF5Big4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X6j5855B86hH8+1MUUbQdzfRXXIEh36roQzDmNtZdLVlt+VtMSp7FWhuEC7HxLg+4
	 3ASrEfhKmLdpAm/VP1gGb5GQPHRZyzlA9Wv0XEN1P9t9gflLXWiWM6s0bOGH7yvuC+
	 bzFzU3sZ14p5clqbm5EJMcExCvTp6B+pn4mlEtyJ/vArl5P4gUHyApQeDYt0UIVnjD
	 fa5DgkOvoLJmWeP1nzIlE2PZbnVc5lUB/zjgDz6l71LVoy9/1JqpjV41i5czOq4RpO
	 WHnzI5JOAaJobCwW4FNmaOORDUiIpodIFsZfZXzTtQ7X18XgT4XUH6FBc26i7cEHtL
	 xVdATdgxh1BHQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vzXtJ-000000006A5-3p2H;
	Mon, 09 Mar 2026 11:31:13 +0100
Date: Mon, 9 Mar 2026 11:31:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
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
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aa6hcT7MROZqxF1j@hovoldconsulting.com>
References: <aaFcs1miP88QWmtH@hovoldconsulting.com>
 <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
 <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com>
 <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com>
 <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
 <aar1PDUB2t7DgEP6@hovoldconsulting.com>
 <CAMRc=Mcv+ZMGaC_MD8WRH113rDuuxdiZXuW5JAXWga1V7vM_ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcv+ZMGaC_MD8WRH113rDuuxdiZXuW5JAXWga1V7vM_ng@mail.gmail.com>
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

On Fri, Mar 06, 2026 at 06:34:43PM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 6, 2026 at 4:39 PM Johan Hovold <johan@kernel.org> wrote:

> > You have posted changes that will prevent driver from accessing the
> > struct device of core i2c structures. This is unexpected, non-idiomatic
> > and subsystem specific and therefore a bad idea.
> 
> That's not true, the changes provide a helper to that end.

That was supposed to say "prevent drivers from accessing the struct
device *directly*".

> > Again, this is a core feature of the driver model. You can't just ignore
> > it and come up with random ways to work around just because you disagree
> > with design decisions that were made 25 years ago.
> 
> It absolutely *can* be done differently. There's nothing that imposes
> a certain API design on susbsystems. If you design the subsystem code
> well, provider drivers don't need more than one reference (taken in
> probe(), released in remove(), for instance via the
> register()/unregister() pair) so the counting can be hidden within the
> subsystems that control them.

Yes, there is nothing preventing you from diverting from the idiomatic
way of doing things. But my point is that that's not a good idea.

Johan


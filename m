Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48840CF65CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6JNIXiL4/1bW0+UR+jZtVn2Er2iWLO91YkvCOZjL/A=; b=IcLTuGSnyALv3dBsiRgpYfR33P
	zCL1SRWUaPG95PR7FHMYjXSMFIOFIbZlmXuQaq58P3dcafA7UEiUihuMs0t/avPUONUahBMnH9qld
	S02CuZRttSBv0aMvKr75FD5qFADUuoL6joJxZXujUIk4k2t7nkSmInD8eSHwTt+iHKrZo3EzcrhkB
	h4s7ZvmGqWuZ2yzdWYRaxuKHLMJbsVLkU8pXf52xGAe3Zlzc/e/lYQDHuSfSbWrTPNVpX24FbnU40
	86Ius9YMxn7B/A7sJrW0Z9NSJvvBZb/tMFOE54rPCt0K9sG/2WcVAR0/+G0BQ2QK94k4n0wOnmA6P
	6FZKxANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJch-0000000CG91-41p4;
	Mon, 26 Jan 2026 10:15:07 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJcT-0000000CG5g-3ZNf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:14:55 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 4D4F0240029
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 11:14:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1769422489; bh=E6JNIXiL4/1bW0+UR+jZtVn2Er2iWLO91YkvCOZjL/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=E29na0SSqIs2W4igK51vQeFxdxtSOXSLgjA0NLoShn5RPCxH2npMhT/d1cpPqsO67
	 VTLG2MUClfpMluCA9UXRwa4sizciCHrOCPzD8IAWv/kqPZ3Ej9kq+03mQCxJG4uQyT
	 btyKjrCVJ9ug95eG8DETg1EFrv2B++emLJW2OJeCLfvqwP6ZrLdYBlRnb0BHbHOUf8
	 RhceP0Rv8ue7pkg+urFtALbpqSN1HsqtsFK4XK5ukC4WgeTFgPN0O2gayKHGbwxUGR
	 C1e83lIFjfxC3nXAn/817hprWuHz/Hz18k2uHLihK2UMUvGiMc9iCXG1M/p3mHej0w
	 eM9M/hI4huGYw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f04CP3GGZz6tws;
	Mon, 26 Jan 2026 11:14:41 +0100 (CET)
Date: Mon, 26 Jan 2026 10:14:46 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andy Shevchenko <andy@kernel.org>, Antonio
 Borneo <antonio.borneo@foss.st.com>, Arnd Bergmann <arnd@arndb.de>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson
 <andersson@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Chen-Yu Tsai
 <wens@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>, David Lechner <dlechner@baylibre.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Konrad Dybcio
 <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, Linus Walleij
 <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Orson Zhai <orsonzhai@gmail.com>, Peter Zijlstra
 <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Samuel
 Holland <samuel@sholland.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Srinivas Kandagatla <srini@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <20260126111440.67394323@posteo.net>
In-Reply-To: <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
	<aXc7DxsqiCGdfzxi@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_021454_232383_1B91DA4E 
X-CRM114-Status: GOOD (  32.13  )
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

On Mon, 26 Jan 2026 11:59:43 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sun, Jan 25, 2026 at 07:46:51PM +0100, Wolfram Sang wrote:
> > TLDR: I want to create a hwspinlock provider outside of the hwspinlock
> > directory. So, I refactored the headers into a provider/consumer pair.
> > Which seems to me like a reasonable seperation anyhow. No functional
> > changes. My build tests went fine and buildbots are happy, too.
> > 
> > Longer explanation:
> > 
> > There is a device (MFIS) in newer Renesas SoCs which combines various
> > things like hwspinlocks, mailboxes and other stuff. Sadly, these are not
> > strictly separated. Registers are kind of mixed and its register
> > unprotection scheme will need one of its own locks. I tried various
> > paths to handle this device (MFD, auxiliary bus) but I concluded that
> > the sub-device dependencies give enough reasons for a single driver in
> > drivers/soc/. So, this series will allow me to instantiate a hwspinlock
> > provider from the other directory.
> > 
> > Patches 1+2 do the actual refactoring with a fallback being in place. I
> > used '-B' with git-format-patch in this RFC, so the actual changes are
> > more visible when the headers are moved.
> > 
> > Patch 3 converts all the users. There are not many. We could try to get
> > all the acks for this single patch. Or I can break it into single
> > patches and send them to subsystems. I don't mind.
> > 
> > Patch 4 simply removes the fallback.
> > 
> > Looking forward to comments on this approach. If the hwspinlock
> > maintainers like it as is, I would kindly propose to apply patches 1+2
> > after 7.0-rc1 comes out. This might sound a bit hasty, but a) I want to
> > avoid chasing a moving target and b) this would remove one dependency of
> > the hwspinlock driver I originally intend to upstream, of course.
> > 
> > I would take care of patches 3+4 as needed.
> > 
> > A branch can be found here:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-includes
> > 
> > Patches are based on linux-next as of 2026-01-21.
> > 
> > Opinions?
> 
> I don't like the idea of sharing internal stuff. Why would we need to have
> a struct hwspinlock to be visible?
> 

I see what Wolfram wants to achieve. It is the same issue I encounterd while I
wrote the sun6i hwspinlock driver. Currently it is impossible to write external
(out-of-kernel-tree) drivers because of internal structures. And it was a pain
in the ass for testing purposes. I prefer to be able to write external hwspinlock
drivers.

greetings


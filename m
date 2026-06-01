Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBB9CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 12:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUNcxP5vUlsQw11K7iw0C8/gbeiciIxg4PjeApBK+Jo=; b=Slyo4B4jDGVPwVgUxZRaLtJjFQ
	D9HCByO6bgxBt3cNoAdQi/1JaMzFmoQscPfMZKCLFBhfTEwnIXPQQvJJh9XmpbVZ/yPUQAaJJiU1P
	aa3uhU+R/o5gdHwJmb/O0yZJYAFx93zE+o/Ee0mrQvFlWw/QuokOkMUIF7oaNYdssGDjooPcMqXBd
	TytK/fdA+6c9DHV+AzB3ddIWdEBQBoJaYVpS7yyflJfYLpIX8+4OlOUS2F5yLyg8iZKNht6vJEg+p
	jwO8sDSnyQyznY8MpB2VdUw6V5Nq73mVXFS4sV3sav384O7HAHbb44xnKuPhQ1LjlYTwp10WRGwNL
	WHbmmgyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1lh-0000000B8FL-1bl1;
	Mon, 01 Jun 2026 12:29:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1le-0000000B8EZ-1TcO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 12:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=iUNcxP5vUlsQw11K7iw0C8/gbeiciIxg4PjeApBK+Jo=; b=T8
	Gpi6UGVu9AekjAumqqzMy7OkcbToxxlkqLfNI+lDKx5ijWT96PNJ3sKmBJrssAm7nDzvsSobk2Y7b
	0eF5hrE0Npnc63i4+vJSmgWtkOwMoUrKqhweKPtkoI1c4SszjTn43MelZI5LNcQ5+Olrtzv502npz
	zhd2vutXPkvjPuk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wU1lP-005V96-1j; Mon, 01 Jun 2026 14:29:03 +0200
Date: Mon, 1 Jun 2026 14:29:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Grewstad <dogestad24@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, jacobsfeder@gmail.com,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hjk@hansjkoch.de, davem@davemloft.net,
	netdev@vger.kernel.org
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem
 direction
Message-ID: <8f7eb9c7-6695-450c-81c4-fb96643adbc2@lunn.ch>
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
 <84d8f2a1-6562-47a9-93d7-2d7ff33c31c0@lunn.ch>
 <CAD03fjah2GMedDtauPQjP0++3USpy6tm3AUemgAjVHS=5Nirtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD03fjah2GMedDtauPQjP0++3USpy6tm3AUemgAjVHS=5Nirtg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_052918_392480_2C8F34BD 
X-CRM114-Status: GOOD (  18.80  )
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

On Mon, Jun 01, 2026 at 11:35:14AM +0530, Grewstad wrote:
> On Mon, Jun 1, 2026 at 1:22 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> >
> > In addition to what GregKH said, look at the vendor information:
> >
> > https://docs.amd.com/r/en-US/pg080-axi-fifo-mm-s/Core-Overview
> >
> >   The AXI4-Stream FIFO core was designed to provide memory-mapped
> >   access to an AXI4-Stream interface connected to other IP (such as
> >   the AXI Ethernet core). Systems must be built through the AMD
> >   Vivado™ Design Suite to attach the AXI4-Stream FIFO core, AXI
> >   Ethernet core ...
> >
> > when used for Ethernet, a uAPI is not needed. The FIFO driver would
> > just expose an kernel internal API the Ethernet driver would use. Are
> > there any Ethernet devices using it? Is there a driver for the AXI
> > Ethernet core?
> 
> As I said to Greg K-H, it's 'chameleon' hardware because we don't know
> what it'll be used for. It could be SDR or Ethernet or whatever it is
> programmed for. The main thing is that it is a streaming interface.
> But we cannot assume the use case.

Flip that around. What is it actually used for today? Make sure it has
the correct APIs needed for what it does now. New APIs can always be
added latter, especially if they are in-kernel, code to glue it to an
Ethernet driver for example. 

However, a grep for XIL_AXIS_FIFO suggests nothing in-kernel actually
uses it.

Are there any real users from user space? You talk about SDR, does GNU
Radio use it? Using what hardware?

If you have no idea how the code is used, you cannot say what the
correct interface is....

	Andrew


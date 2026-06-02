Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F1BC5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 06:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PleAjPFfBrplT4ylTQmKOn/ycmA34mile0CXUYNdL3M=; b=rf3MQ56wED8IG/i2MbFM3pf6hG
	InFPbZ25xHOe0TNY48phKpwBuRFYn3/9y1KTloU/+ZzlGaygGOvUyliGy4NdaOdE5eczfslj94tgI
	MXsp/DolkYOM0ROYzoSBI5xNScmp7KdVSlVYewmIcBoVAwxs8qKVpcEttxLLuIDNiJpCTlx+y1j52
	MEaxi6zoNQ2xBzUSRrrFGD/LPKZLAle0IFEdOa5WK6pvsTqZ59+kpqyCBzV3x7Cgz/ofRQoXXCFlc
	q7zxYP1YuTETgC9b5v+Gs6nAXY2JpaftrI0ajSiJrgN+KfDGMSCVsWhPQbCQV2e3XC+UImyyaLJ7b
	8nH/r63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUItU-0000000CPSI-06qp;
	Tue, 02 Jun 2026 06:46:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUItR-0000000CPRx-0IoL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 06:46:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 452D4419CB;
	Tue,  2 Jun 2026 06:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876D01F00893;
	Tue,  2 Jun 2026 06:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780382788;
	bh=PleAjPFfBrplT4ylTQmKOn/ycmA34mile0CXUYNdL3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mVGn27VjBYlBXigY19uQZMGy1qDeaz2fzAGuUicaPA2kPhFlhogeDIvscFLUeipaI
	 jpIYR7uUt3QJDgPV8vv2B/X6SDosAyUaVfmZKvQPQZXEAtsxzC+710PFRiBfCt7zBb
	 RIdBUe91H8C649x3A0Al+eSO1vNNXlfi0OSgJBzk=
Date: Tue, 2 Jun 2026 08:45:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Grewstad <dogestad24@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, jic23@kernel.org, jacobsfeder@gmail.com,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hjk@hansjkoch.de, davem@davemloft.net,
	netdev@vger.kernel.org
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem
 direction
Message-ID: <2026060203-protozoan-widow-1b41@gregkh>
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
 <84d8f2a1-6562-47a9-93d7-2d7ff33c31c0@lunn.ch>
 <CAD03fjah2GMedDtauPQjP0++3USpy6tm3AUemgAjVHS=5Nirtg@mail.gmail.com>
 <8f7eb9c7-6695-450c-81c4-fb96643adbc2@lunn.ch>
 <CAD03fja5oG3-BrQoy4+LEmCWPYGW_JWDEkaPndjSVz=PbRj4wg@mail.gmail.com>
 <2026060202-wad-skittle-263f@gregkh>
 <CAD03fjaHmsYpLj_PU48AW7h=E6XdMpqKsS7wQtDQKnEkGpa93g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD03fjaHmsYpLj_PU48AW7h=E6XdMpqKsS7wQtDQKnEkGpa93g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_234629_155493_2A4236F8 
X-CRM114-Status: GOOD (  14.45  )
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

On Tue, Jun 02, 2026 at 12:07:48PM +0530, Grewstad wrote:
> On Tue, Jun 2, 2026 at 11:28 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > If no one is using it, why don't we just delete it then?  It can come
> > back if someone shows a real use-case for it.
> 
> Yes, this is what i was thinking. These boards are generally used for
> development and research teams can probably maintain a patch if
> they really want it. As you said, it can always come back if a
> user-space application depends on it.
> 
> One drawback that comes to mind is a development group may
> currently be maintaining a proprietary application that depends on it.

Then they will speak up when the driver goes away and we can revert the
removal quite easily.  It's not like code is ever "gone" for forever.

thanks,

greg k-h


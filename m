Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F2AC5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 05:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/FErISb+2QnG1P6pu4OzfuEn7EsXrCTB7tFZI6xt/Y=; b=AKbiNDart/gM+5kdyLAP6z21Yl
	NcTjtTIgSmW3ttAmCA80LUEIjW+uHKyR4BvvIvg+uTs4RqK8AT/tIxrv/7p0AYfAJ/DaSkssAhELk
	X1C/Sh9bbA6yYpNeZdTqkxJsvtuMclAmw/aFlMKQ9rGlesb7cBZGSBAv5RH23onL3QTfWIqL7vwZy
	29BgtDyLPDutoHuIsPcc6Ws8f3zm8ei7UCjF2H2L09eOqT+k6yKpGcDoU5nkeApauFww2WXi8+H7k
	m/UmIrNy20LX1Lx5dPNSIgMAvLWiJtbe6lyH+Ub9bqza4Ld9UpTUZ1g1nlnx8nZTpARU4SIBY0z4d
	sgmM5f+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUI8w-0000000CLzb-3wyX;
	Tue, 02 Jun 2026 05:58:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUI8t-0000000CLz5-3w9h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 05:58:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B69E9441F6;
	Tue,  2 Jun 2026 05:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBCB1F00893;
	Tue,  2 Jun 2026 05:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780379902;
	bh=i/FErISb+2QnG1P6pu4OzfuEn7EsXrCTB7tFZI6xt/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJW1kDdfNtPpXHSmmydgicC+jRCKoyenJ0pTetch8dufqFBZT8OAnclAKC+6nmeGW
	 1+nkcnPHd4QwtYeuhmTNl9V3QI5TfdCmZfp5IjG2nknuig1l4SPcxjuIS0Qwh1J7vT
	 0xvVp2qmHWksOHK5+wOII9EPoLxHsBpmdIPJJemU=
Date: Tue, 2 Jun 2026 07:57:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Grewstad <dogestad24@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, jic23@kernel.org, jacobsfeder@gmail.com,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hjk@hansjkoch.de, davem@davemloft.net,
	netdev@vger.kernel.org
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem
 direction
Message-ID: <2026060202-wad-skittle-263f@gregkh>
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
 <84d8f2a1-6562-47a9-93d7-2d7ff33c31c0@lunn.ch>
 <CAD03fjah2GMedDtauPQjP0++3USpy6tm3AUemgAjVHS=5Nirtg@mail.gmail.com>
 <8f7eb9c7-6695-450c-81c4-fb96643adbc2@lunn.ch>
 <CAD03fja5oG3-BrQoy4+LEmCWPYGW_JWDEkaPndjSVz=PbRj4wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD03fja5oG3-BrQoy4+LEmCWPYGW_JWDEkaPndjSVz=PbRj4wg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_225824_110770_711F730E 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jun 01, 2026 at 10:15:49PM +0530, Grewstad wrote:
> Thanks. My research shows that no user-space application depends on
> this driver. As you said, we cannot determine the subsystem without
> knowing the actual end users.

If no one is using it, why don't we just delete it then?  It can come
back if someone shows a real use-case for it.

thanks,

greg k-h


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BCCCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zufCpAXCVEwDc/8p4UXog53BnP9tM+43qUpcW1f09iM=; b=vxFCpK0FdFZ/SC8Rc+18ypqtHr
	iywX8OGPLsIRhUs7er8EnxMFwywXdEB5DY58cNSNXVp5H6k6jcEAOXPYCOharBEG3mAm8e3IWlC1i
	+sU79FeGPWIN+34u5nfEkUl5atH8UVtxIohxNMJf8F6ek/KV9BSGdp3MzwvyKS8oLtFhd8BHa6NJQ
	YJ0xR7X6VxLcqvwr5dq7UYXJ7ZmsdN8P1UhGtrSr6atV84SInpRQAINSe0QB327zXM4lP2OlQw15M
	w+x25s4RM+dzZmvyQey2yP161tdtWfeItk38tNkKbb0KgsnjcAri6+VBdVj8WnuQWxIPOC9TdSRoF
	irRbM+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PnE-00000005Aix-2ind;
	Thu, 16 Oct 2025 15:21:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PnB-00000005Aht-1uKt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zufCpAXCVEwDc/8p4UXog53BnP9tM+43qUpcW1f09iM=; b=Vx1Go4EP3OHyeVIlzAQWHe7TrA
	q4PyEtofbcg/a89657ONYBOhGme8m01o1I4N46htjcrOUWTIS1p0SAFYDwisxemju5McrvW2L416n
	5n8LYFZkwTfi0eFEWEZmAbMvNlJkCT5NnT6FaFRcVUEWGRRdUh/GjTkOramECPR1pCz3g5C8Qswte
	OwJX/mInR0Yhwg3khITa/XhHcy3PEKxW8KogItiPrJSjyOJahDKru1jM/BG+BJ/PHMtqfkxvxt5ax
	SThwSwUPE4eUEBMVn+vMFMohFFliLU5O44lKMpVZRChieBgc4IlYMUQLXtotPU2knjiWFkcQKd2v+
	2OCeEeng==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56116)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v9Pn3-000000006dM-2UPG;
	Thu, 16 Oct 2025 16:21:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v9Pn1-000000003NP-2Vov;
	Thu, 16 Oct 2025 16:21:15 +0100
Date: Thu, 16 Oct 2025 16:21:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
Message-ID: <aPENa90OS4ZZA5Rc@shell.armlinux.org.uk>
References: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_082125_512027_ABE56F1C 
X-CRM114-Status: UNSURE (   9.10  )
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

On Thu, Oct 16, 2025 at 01:37:30PM +0200, Matthias Schiffer wrote:
> -	if (!sport->have_rtscts)
> +	if (!sport->have_rtscts && !sport->have_rtsgpio)

This is fine...

> -	} else if (termios->c_cflag & CRTSCTS) {
> +	} else if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts) {

This adds extra parens that do nothing to aid readability. Too many
parens actually hurt readability.

> -	if (termios->c_cflag & CRTSCTS)
> +	if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts)

Same here.

Maybe change these to:

	if (sport->have_rtscts && termios->c_cflag & CRTSCTS)

?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


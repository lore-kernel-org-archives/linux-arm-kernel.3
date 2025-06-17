Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2B1C71159
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 02:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/FstTaRqwltJHTBwGfZ8N1a8DYjd18WNPa4HOsqEdA=; b=kmZJIiq54xsIXP4KlEEj+ydMMg
	JYJ3cSOsOAtaKY2vpnaovL4qmUk6OJxoLWBniO0GsZI6mT4HLUPcHvARlcN5Nznam6Py17uUE9mRA
	MTT8hPg0TJ5oOP7/mIj5x2wWEtZePa/jWmVsSKiL64YaqP3tIHc13uC7HtmNjxVmYJ+ekOoQLeNrj
	a5w4DEod+GJattcyYGUxyq7uFUNkUzrikQDKftw6LcuvT8MseL7IqoM+P9zIXpdg2h92uZC2XQ17t
	oU7KRkiYwBr0Bd6celMjbrPUxiNbHJ2rC4gB7UAB1ak0cJpn/x2HmMRl0oLNQgr+FHQ1ahLFPyUSc
	e07F3aOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLkm-00000005zgr-1eDl;
	Tue, 17 Jun 2025 02:08:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLiZ-00000005zcL-3aOI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 02:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=q/FstTaRqwltJHTBwGfZ8N1a8DYjd18WNPa4HOsqEdA=; b=f1UNbNf7mbpRVvtw+3yg7NO05N
	Uujho8pRofrEpsC6hqwcRhKcGTPU9ay3OkdrFttGhFnmWAFIcGK2ncfNMD059nsnMTY5h3smIrdxU
	v3l+xkuUq/6rSu01EMsUl/nzLniLYFO+6B0LvNSwt0Dd/U296vVhhp9VQdvDcmJxNYWY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRLiS-00G7Rx-D0; Tue, 17 Jun 2025 04:06:24 +0200
Date: Tue, 17 Jun 2025 04:06:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Alexander Clouter <alex@digriz.org.uk>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm: orion5x: use string choices helper
Message-ID: <520f1391-a107-4705-bb11-02912cbc3b98@lunn.ch>
References: <87ldprnsc2.wl-kuninori.morimoto.gx@renesas.com>
 <eaa1038b-9a3e-4f42-abaf-8bb8b92aa482@lunn.ch>
 <87h60fnoct.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h60fnoct.wl-kuninori.morimoto.gx@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_190631_892000_8AF52643 
X-CRM114-Status: GOOD (  11.88  )
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

On Tue, Jun 17, 2025 at 01:33:38AM +0000, Kuninori Morimoto wrote:
> 
> Hi Andrew
> 
> Thank you for your review
> 
> > > -	return sprintf(buf, "%s\n", (ts78xx_fpga.state) ? "online" : "offline");
> > > +	return sprintf(buf, "%sline\n", str_on_off(ts78xx_fpga.state));
> > 
> > static inline const char *str_on_off(bool v)
> > {
> > 	return v ? "on" : "off";
> > }
> > 
> > That is an ABI change. Sorry, but NACK.
> 
> It updates format too, I guess it keeps "online/offline" ?
> 
> 	-	return sprintf(buf, "%s\n", ...
> 	+	return sprintf(buf, "%sline\n", ...
> 		                       ^^^^
> 
> Thank you for your help !!

Ah, missed that, but you should of also mentioned it in the commit
message....

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


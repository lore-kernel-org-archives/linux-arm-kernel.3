Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51864C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5U8qa7HtB8UcKwAN6pfZbxgVaUoYaKU4fyigqADa94c=; b=r17+RXEE4Gnozim7GBXUHD1MxJ
	1SOyU/kOtJvi+B/6LR+lne+KgEVrIpwUW6a5VV3Dmrp6mNLZc22gKAvXqyXEg/udi/k2JQMFJFBWU
	7d2YvqCQrok5qVrcDjOj/EhUMbppBIc5mnbhRA5eXi7u5HsKMBEHU6b88+Gzww5EDCNP5ZWJ43NeZ
	9sdU9K4NpMN1Rm7cLO48ionjuJcPc6yNmyGyGQfgH8RuGecSup8BiqhGsfT9kg024mZG4+GbGWSVc
	pGZV2LV8huCw1d0cIJPuEzXlDburk28Iw7GEc648LgxVI6cnDdrI5a2Am20BmkMQP1M+2WX9I4xN8
	j1Ofp/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWGG-00000007Ker-1p6n;
	Tue, 17 Jun 2025 13:22:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVrf-00000007Fq2-0fIn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=5U8qa7HtB8UcKwAN6pfZbxgVaUoYaKU4fyigqADa94c=; b=Gp
	hEc52uuzoWpmPN/jCwVavUm+n9JN5RXpwOIg8TBu/7zmOvqwnZc/Mf3AuX5Bklu7x8mdZ+Mtcfp9u
	icAFaaqdlTo/BWHcvJZdAPBbfxQ4VsfYZ8P0xeVIlNkVSNyxlfJmN9bg814jY+8C1+EMiFsYGbwT6
	D6lrhxhQtDLCUjQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRVrT-00GALa-W5; Tue, 17 Jun 2025 14:56:23 +0200
Date: Tue, 17 Jun 2025 14:56:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Alexander Clouter <alex@digriz.org.uk>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm: orion5x: use string choices helper
Message-ID: <902a7135-22a5-4589-8464-bdecaf8020bd@lunn.ch>
References: <87cyb3nm45.wl-kuninori.morimoto.gx@renesas.com>
 <CAHp75VdeCyHdSdYvke0RVs_qtrhqbn_z1VFM22TCuNe2h8hFMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdeCyHdSdYvke0RVs_qtrhqbn_z1VFM22TCuNe2h8hFMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_055635_195464_3873B4A6 
X-CRM114-Status: GOOD (  11.13  )
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

On Tue, Jun 17, 2025 at 09:14:10AM +0300, Andy Shevchenko wrote:
> On Tue, Jun 17, 2025 at 5:22 AM Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> >
> > It updates format to keep "online/offline".
> >
> > -       sprintf(buf, "%s\n",     ...? "online" : "offline");
> > +       sprintf(buf, "%sline\n", ..., str_on_off(...));
> >                         ^^^^
> 
> With all the respect to Andrew and his review, this is still NAK, but
> now from me. Add the respective helper to the string_choices.h, the
> proposed change is harder to read and it makes things confusing.

Fine by me. It looks like it could be used in at least one other
place, handle_hotplug().

	Andrew


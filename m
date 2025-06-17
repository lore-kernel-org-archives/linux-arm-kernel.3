Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F902C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 01:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2xLTqG82SuDlnu+9qozq+9cPO2/3+dWuWic+O/CEls=; b=DzhYznaT/CpzQfGaa/e4LaULFK
	F32dd50RzW/AobCq/5B0EF7lfU1EQuMOwHg4Ok4lGz+yAxm8gftXuGaxX9TEpVEfLb6KR/rKwAABk
	4rDjFtElswN5Y3aVdIPu+V9GXV5/qAw9ZYSHzupD+igT9+DEripl3YczLp2tDJ2kZZ4PS7sUhMci+
	o5DcLSUHThStpfXAt3FtzK2KzxCEA8dn0841r7m18xKBZQiNLvZ8M46i+xWmcyXLUhmr/cl4a/C6b
	UMxIx2OLYx8hbNGkZMh41opabRr82d0G5keYQjdZY+z8QS/aLEFv8qvJ1hkbIzyLFzsbQ8vm07ryG
	zEOZh6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLFJ-00000005x9d-3Jy2;
	Tue, 17 Jun 2025 01:36:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLA3-00000005wrS-2pUR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 01:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=N2xLTqG82SuDlnu+9qozq+9cPO2/3+dWuWic+O/CEls=; b=eDkWFy+wnFB3pgM6g2XzoejZm2
	HUFg/yTjlZySrTgTSzH2L0YIFu/TvxkoevBUC8Zpc6dh3AVZnVGF/r0Jo5umYAkbS3mdFRu9U4j1X
	g6XrdV1LrImo4NdlWkAffmrIJtdLbDN1E6l+C0uIljbX+VqxwVnBapfajTi8Q8hs0sC8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRL9z-00G7Ck-17; Tue, 17 Jun 2025 03:30:47 +0200
Date: Tue, 17 Jun 2025 03:30:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm: orion: use string choices helper
Message-ID: <c0cbbc7b-f525-49a4-9348-dec746b169e1@lunn.ch>
References: <87msa7nsch.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msa7nsch.wl-kuninori.morimoto.gx@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_183051_714757_FC05F73C 
X-CRM114-Status: UNSURE (   5.77  )
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

On Tue, Jun 17, 2025 at 12:07:26AM +0000, Kuninori Morimoto wrote:
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339ACCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 23:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1uikCk1PVoFKraVmv1JjdTmyz7aVTR16X64oIcnMf8=; b=Id3fwW5H0XOMnMSxmHUl115buk
	z+5hlMNoOdj8R1lz2JhBQaWQ9hCKM48f8KstddKQKkLmZep3/HGu+wQA67aAaqpJQg1cSQLWbI4Ob
	BZYf9imTzaHWHF+/dY3vS6A4ZEe4ZjJNGISsqDdLqyyVotcoJeTFjJo0/j/50KdCx3LPb8641w8XP
	JVEhROF1Frmj+qoNhYR5esp3GnV57QBKeFWFTTOUUml3SBtfIl2pIaduBclVb8EC7826VeJxPhHLx
	R8eZ5XLUHy/c/a1KfTCgMUCDsXdrBUZ4SLg3yvarFVeuDTAbp53o0DmJ2rfGueCIJuD8hMGt27iwG
	UOXkWVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtX0-0000000GodJ-42PQ;
	Tue, 28 Oct 2025 23:55:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtWx-0000000Gocm-30HO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 23:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S1uikCk1PVoFKraVmv1JjdTmyz7aVTR16X64oIcnMf8=; b=SA1gJowDBcLZISZx0Lli/3K9Tr
	tSQGuKix+Lwh74Sfj/czjDbD+PnGWw7ARxxjBvN5rOHI+4H2ewkNHUPFg+WtHUOPGO8x2RJQKdDYC
	pdybl08H/jFyXjVqDIP2uBppNyOHf1z97iYoOnGNAdnArT9qoiDC2f3ScEQv2UjyIDX3HY3CY1ltT
	e94lz91ONXafGZP1BifBuX/mawC8G2o6UlUaEbZaSV4Dfks24zWdHZIaIHgjxy2p8GGXs/IxzxHUP
	j6O+zAU8PPw3K0SAfHx+4P5w2kbpHPxKi9eq9ARmOHYnaZ8Yi9oudR9PZiojyBt6yP0hoyrV6QWBW
	Pv34Ld6Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40576)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDtWo-000000003f0-3177;
	Tue, 28 Oct 2025 23:55:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDtWk-000000006xk-0Ryn;
	Tue, 28 Oct 2025 23:54:58 +0000
Date: Tue, 28 Oct 2025 23:54:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
Message-ID: <aQFX0cdyCHLHIquB@shell.armlinux.org.uk>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
 <20251028164257.067bdbcd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028164257.067bdbcd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_165511_759307_34EF7FED 
X-CRM114-Status: GOOD (  17.16  )
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

On Tue, Oct 28, 2025 at 04:42:57PM -0700, Jakub Kicinski wrote:
> On Fri, 24 Oct 2025 13:48:23 +0100 Russell King (Oracle) wrote:
> > This series cleans up hwif.c:
> > 
> > - move the reading of the version information out of stmmac_hwif_init()
> >   into its own function, stmmac_get_version(), storing the result in a
> >   new struct.
> > 
> > - simplify stmmac_get_version().
> > 
> > - read the version register once, passing it to stmmac_get_id() and
> >   stmmac_get_dev_id().
> > 
> > - move stmmac_get_id() and stmmac_get_dev_id() into
> >   stmmac_get_version()
> > 
> > - define version register fields and use FIELD_GET() to decode
> > 
> > - start tackling the big loop in stmmac_hwif_init() - provide a
> >   function, stmmac_hwif_find(), which looks up the hwif entry, thus
> >   making a much smaller loop, which improves readability of this code.
> > 
> > - change the use of '^' to '!=' when comparing the dev_id, which is
> >   what is really meant here.
> > 
> > - reorganise the test after calling stmmac_hwif_init() so that we
> >   handle the error case in the indented code, and the success case
> >   with no indent, which is the classical arrangement.
> 
> This one needs a respin (patch 6 vs your IRQ masking changes?).

Are you sure? Nothing came up in the re-base, and nothing was reported
in PW.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


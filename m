Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603D7CF65E2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 00:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UB3pHoZfhLuR5wYLQxTQQtxInkU8rpiKFH8WiyB2FiA=; b=ZpAV7lQpYTlW+b8a4KtbYIhO52
	Nq5n6kdCsLrOxVw4XcqVJSPU1x+bl4YA8A6r+PXWIsf0HYHvc/tAylZYA5Wiw0pIYJiZyT70IMI56
	e8W1krJXDYqBCmu8BO79/BNlUR24XVr09Afzu49mUs1TiQJBCo+NY1mkpKj5+Jojx4vBKpD1pnteY
	p4zbOast0L4VbaeXywCI1pAO5kH+XNTeRugISjDujUsgPYicAubWsd7gWK5LtCqHTmuh0/RVoSZxF
	855tIx9k8B8gVH5Gc/CxzmZlomipDJahB0T+lKk8vLk3AS1ll4JN2uCtyP/eI3cjAuwDTVZIdNCa7
	aAwQK1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkXQM-0000000DPWX-2MHN;
	Tue, 27 Jan 2026 00:59:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkXQJ-0000000DPW1-1B0S;
	Tue, 27 Jan 2026 00:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UB3pHoZfhLuR5wYLQxTQQtxInkU8rpiKFH8WiyB2FiA=; b=XxqMU6so9wgx0Ob7CLD9I9koKl
	1bIuqOnsrKnirdPF6+IUlbbHkk5osLqE+abCrhyjGdoY7Gy6OHLWamp/T474HWewZmcVzLJd/868+
	hI6TLQKi54zIrHiZqusoZ0OvfZVePQtUFScEwHaZa0/zufsVSpVPD30186q/4gQX8n1RfsPIAb2jI
	20FG78TAy838yHXfa16Za4e33oHnnxyp46iJh6CXlAfC23YObXQNY0kPpsBvc7EXM9SFGoHALGkBl
	1opeldmTzfqeWnkDCWXWaFbe51TKc1PskJvPH1WZJdmLWHQdu0BnhNlEH1kZ/XYTGG/RzJyAR3qvK
	F93ep63g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44558)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vkXQB-000000005UP-3uHt;
	Tue, 27 Jan 2026 00:59:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vkXQ9-000000005R5-2z48;
	Tue, 27 Jan 2026 00:59:05 +0000
Date: Tue, 27 Jan 2026 00:59:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 06/22] net: stmmac: rk: add SoC specific
 ->init() method
Message-ID: <aXgN2UjiI_OxWHH-@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
 <E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
 <aXd7aSk7KIxlQd5z@shell.armlinux.org.uk>
 <20260126165144.25055591@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126165144.25055591@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_165915_327555_1EC149E0 
X-CRM114-Status: GOOD (  20.15  )
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

On Mon, Jan 26, 2026 at 04:51:44PM -0800, Jakub Kicinski wrote:
> On Mon, 26 Jan 2026 14:34:17 +0000 Russell King (Oracle) wrote:
> > On Mon, Jan 26, 2026 at 11:45:28AM +0000, Russell King (Oracle) wrote:
> > > Add a SoC specific init method.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>  
> > 
> > I see the AI review has identified that this patch has an issue, whereas
> > in the previous review, it was fine with this patch. I can't imagine what
> > it's problem with this patch is
> 
> I released the reviews for you, the first one looks legit, I haven't
> scanned the rest so YMMV.
> 
> > and there's no way to find out for about 9 hours (more like 19 hours
> > for me because of the timezone) as the AI reviews are not accessible
> > until then.
> 
> The patchwork checks are for maintainers. If someone wants to build
> a public CI for contributors that'd be great. We can even provide
> funds from the netdev foundation. But let us be clear that the current
> setup is until now maintained primarily by me for me on the weekends.
> Unless you make an effort to actually help I don't think it is in good
> taste to complain.

This sounds like my contributions to netdev aren't valued, and if that's
the case, I will stop.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


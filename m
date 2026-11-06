Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D23D606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n8/fP7XJ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=cg9wurH7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u683Mp167vRRYMWqRckD1jVWMTr0O+F8yrVQZIo8ll8=; b=n8/fP7XJgwM4Tc0JD20EgAAr65
	lGCoD2vPW70EXLnu5qz3wzeEh4t8cBiZsrXYZo12yztnKO3RI8EFmy/6b/CQtTTzIpe8YHIq2Oycs
	fB87DJ4DbLKoQZanQVhgMPDdP4iv2+Yr3uZqVN0Sv1Xu/SUt+1nrF6ShTmpgwd9ch88HAK03BIxHw
	i/ZxClmMYkNAH0ZPgfMzJJ3IZp4XvLO+aApgysVZ1s4S1DUIMErsHOTjQcVhyeHUoAf8E4FrnxH3o
	hfDKzdz48S1MshXRzZhwHpnojf3H7ENy0dihNADmlk6jEuxSij0RbfaBjvr9zcxUM5iwrLdM4n963
	AARPlyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFem-0000000Bd9e-43Aq;
	Fri, 06 Nov 2026 08:50:44 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFej-0000000Bd8i-3rSI;
	Fri, 06 Nov 2026 08:50:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793955022; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K1sEecgNybdmwlsQxMYevt5CmsQ5ihQPj0LcKrmw9V2q8WhI9b+mH/xemeAoCQRPgjJRtsNIdHcN63pXjW9bfDVn72Bv8De18Mqg1N++SbosmpbO1KruYapOnTjFX3CXXmN8i5Ux2rIQqEJZItqs9SPaLSy1INk6uRe3iPVMMiA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793955022; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u683Mp167vRRYMWqRckD1jVWMTr0O+F8yrVQZIo8ll8=; 
	b=mg7xe9OEmaB0+oJUjp9z9dzXQ7E1/5tQ1TARRUpwNKr5rTRYfazlcZzgPgkwY4elXLDCreYF7TGw/r7M+EtFAfeTxRo1yAsUQnsZtBd4xxYbM/QC5IBLUdF2ysIh524fEGHSI6hQn7WnLrKxXJzQ8VaX0ojE92TnOet9TBCYWSY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=cg9wurH7f+KD2WoCD5W+v4QLoDmjBS81b79BGy2k4WFlu3/10c0Vyb4upbEllly6vKmjc7iqXCzh+7w0yqnJsOU142b9iCig0GwgUov+B+Y2B8g7TIDGeMUbK9OjWviWi8TLCtXXQ39HfZ/wvnPrV/DrPMfubgQVH1X4qCO1LVo=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=u683Mp167vRRYMWqRckD1jVWMTr0O+F8yrVQZIo8ll8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793955019916373.169635391934;
	Fri, 6 Nov 2026 00:50:19 -0800 (PST)
Date: Fri, 6 Nov 2026 08:50:06 +0000
From: Yao Zi <me@ziyao.cc>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>, Yao Zi <me@ziyao.cc>,
	Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Midgy BALON <midgy971@gmail.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Frank Zhang <rmxpzlb@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Kevin Hilman <khilman@linaro.org>, Caesar Wang <wxt@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>
Cc: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 2/2] pmdomain: rockchip: Don't log when of_clk_get()
 fails with -EPROBE_DEFER
Message-ID: <au2UvnY0CdGTRnum@pie>
References: <20261105001257.1368266-1-me@ziyao.cc>
 <20261105001257.1368266-3-me@ziyao.cc>
 <71b77625-8475-43da-a62b-983cf572229d@auroraos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71b77625-8475-43da-a62b-983cf572229d@auroraos.dev>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/293.948.33
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_005042_159284_87B87622 
X-CRM114-Status: GOOD (  26.79  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 11:47:13PM +0300, Sergey Shtylyov wrote:
> Hello!
> 
>    Please consider using --no-git-fallback with scripts/get_maintainer.pl --
> I don't see what do I have to do with this patch (other than fixing another
> bug in this driver earlier).

Thanks for the reminder, I usually enable it but forgot it this time, sorry
for disturbing...

> On 11/5/26 3:12 AM, Yao Zi wrote:
> 
> > Current error handling code considers -EPROBE_DEFER as hard errors,
> > logs misleading dmesg like,
> > 
> > rockchip-pm-domain ff600000.power-management:power-controller: power-domain: failed to get clk at index 0: -517
> > rockchip-pm-domain ff600000.power-management:power-controller: failed to handle node power-domain: -517
> > 
> > Use dev_err_probe() at the callsite of of_clk_get(),
> 
> > and check for -EPROBE_DEFER in places> where its return value could propagate to.
> 
>    To where?

rockchip_pm_add_one_domain, rockchip_pm_add_subdomain, and
rockchip_pm_domain_probe. I think it's obvious in the diff and too
detailed to the commit message, so didn't add them here.

>    And I didn't understand why you couldn't just call dev_err_probe() everywhere --
> the error code seems to always be propagated...

This was what I originally wanted to do, but dev_err_probe() sets the
deferred probe reason, and if we call it several times, the earlier and
more specific messagess ("failed to get clk at index %d") get overridden
by the later and less descriptive ones ("failed to handle subdomain node
%pOFn"), which I think would make it harder to debug.

> > Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
> > Fixes: 6be05b5ec161 ("soc: rockchip: power-domain: add support for sub-power domains")
> > Signed-off-by: Yao Zi <me@ziyao.cc>
> > Cc: stable@vger.kernel.org
> > ---
> >  drivers/pmdomain/rockchip/pm-domains.c | 22 +++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
> > index 34c862e56aad..c147cc88edb1 100644
> > --- a/drivers/pmdomain/rockchip/pm-domains.c
> > +++ b/drivers/pmdomain/rockchip/pm-domains.c
> [...]> @@ -1006,8 +1006,10 @@ static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
> > 
> >                 error = rockchip_pm_add_one_domain(pmu, np);
> >                 if (error) {
> > -                       dev_err(pmu->dev, "failed to handle node %pOFn: %d\n",
> > -                               np, error);
> > +                       if (error != -EPROBE_DEFER)
> 
>    Why not just call dev_err_probe() instead?
> 
> > +                               dev_err(pmu->dev,
> > +                                       "failed to handle node %pOFn: %d\n",
> > +                                       np, error);
> >                         return error;
> >                 }
> > 
> > @@ -1102,15 +1104,17 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
> >         for_each_available_child_of_node_scoped(np, node) {
> >                 error = rockchip_pm_add_one_domain(pmu, node);
> >                 if (error) {
> > -                       dev_err(dev, "failed to handle node %pOFn: %d\n",
> > -                               node, error);
> > +                       if (error != -EPROBE_DEFER)
> > +                               dev_err(dev, "failed to handle node %pOFn: %d\n",
> > +                                       node, error);
> >                         goto err_out;
> >                 }
> > 
> >                 error = rockchip_pm_add_subdomain(pmu, node);
> >                 if (error < 0) {
> > -                       dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
> > -                               node, error);
> > +                       if (error != -EPROBE_DEFER)
> > +                               dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
> > +                                       node, error);
> >                         goto err_out;
> >                 }
> >         }
> [...]
> 
> MBR, Sergey
> 

Regards,
Yao Zi


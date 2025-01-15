Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B598C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02vkT/PHD0QirIj8EauhQw9q6730oAe8P+eKRo8nank=; b=ag+nRgSYTCl0Ap5DOt9lrf8J3/
	+8odF7BxavtjfGsCoFFwuj6si/jG0S4OSF1m4y0CF4X99ErFT31BQLd2XP0rGapYicts/VE6UdFU1
	lPW5GNuxSrVKoCkWv/TyU1eFLkCwlJhVvXK6qVugmcbq6lu2D6qsynPBqjyIengK8N4RxImRCsmUl
	Jg3fO/OmMg2w7YfH04YL9p1pIi74yjsfJ32yoj/rQ8SE4z8qVTLP9nCpnb4BrVGh2NEkeU+zUGC2+
	+590f7BHU99WYz3I9ESw/hJ5kO9oAdnN49CxkeoX6HQ6zhE/foRXe81VEuul9J8eD2a4QkQf027EA
	io6jjOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6kJ-0000000CWcD-0kqs;
	Wed, 15 Jan 2025 16:59:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6iY-0000000CWG0-3cm5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:58:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tY6iU-000601-2A; Wed, 15 Jan 2025 17:58:06 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tY6iT-00071r-2d;
	Wed, 15 Jan 2025 17:58:05 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tY6iT-000OEP-2R;
	Wed, 15 Jan 2025 17:58:05 +0100
Message-ID: <d265b2ad8d04c8e37b6fae2a312d0d1c9a3366a9.camel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller updates for v6.14
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 15 Jan 2025 17:58:05 +0100
In-Reply-To: <d0e58f29-4e12-445f-b110-49dfbacf5b74@app.fastmail.com>
References: <20250113163648.1757178-1-p.zabel@pengutronix.de>
	 <d0e58f29-4e12-445f-b110-49dfbacf5b74@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_085810_900027_62ABCF6D 
X-CRM114-Status: GOOD (  15.31  )
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

Hi Arnd,

On Mi, 2025-01-15 at 17:13 +0100, Arnd Bergmann wrote:
> On Mon, Jan 13, 2025, at 17:36, Philipp Zabel wrote:
> > Dear arm-soc maintainers,
> >=20
> > The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9=
b0b8:
> >=20
> >   Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)
> >=20
> > are available in the Git repository at:
>=20
> Hi Philipp,
>=20
> I have no objections to the contents, but it would be good to
> avoid the back-merge of rc3 into my current branch that
> is based on -rc2.
>=20
> I see that the two patches for the reset driver depend on
> commit 5ae1a43486fb ("clk: amlogic: axg-audio: revert reset
> implementation"), which went into rc3, and this was clearly
> the reason for using that as the base.
>=20
> Would it be possible to rebase your branch directly on that
> 5ae1a43486fb commit from upstream?

I've rebased=C2=A0and sent a PR for a new tag reset-fixes-for-v6.13-2.

regards
Philipp


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC14C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 22:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayENqWRYykqKMSaDdgouWzzeeWpkub6h14X1CWsUIWY=; b=0MISlLrcSOAIrhb7GRrygKT/DW
	n1/B297dJndzIzhK26lPaUvIh10of/PA6LHtQNWlwXhaDr9VffVNxNccGw346OIl9Qg3KK+BvKS1Q
	tkO7B+mLKI/OjZbPQ8F5Uz7jestk23H2LO9bGAqwNdmmtlyFSpcp22Sy1sZVJN+5AQLTcuhKxy3aJ
	Aa6RRqCnm/9kakyNbe3EGsBlPIbBTYHKuBvLKZM0vTgnhgsvAJB4+UOTyaJDL6Lv4bftaENdY//FB
	OeV/NfE0LXaQUoBiOWQC2X4a2jHw11l08sANctFare9CQ6UBFAXwGxy2qvBrQxO5dcOsD2Wyo6jBh
	SpXJSdkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqqY-0000000CbTF-0ENk;
	Thu, 13 Mar 2025 22:16:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqos-0000000CbIy-14DN;
	Thu, 13 Mar 2025 22:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ayENqWRYykqKMSaDdgouWzzeeWpkub6h14X1CWsUIWY=; b=hbr+6sOMUOohmJsjF5BXVys2lg
	oAuBs8vSReUdYyq0GZhOT2JLtY1OqxHtEr/x+5UWWm6gv1s8mp0pJfTALrWhkrSglwOhiN4MDu9P3
	HMyRbLQvdy6BndmlF15t7lsziwXrqLiUQ3qeUAAtlpIuOVtrsIj1yvX76MNcduysfwTtMclHwZDE9
	o95TkLbPWNQxgDpskFxwkFzncrMHnoyj8lwD6RpWXqcb9uD+M0q0BwGv2yUGug5/kRC4CR2zXRRJD
	g3jFunuwzDFkcbuBmkkcy3NNdf8e1y0KelHXl5i4xSLU9AH6aydSqNfZGmJ5YcpUFh8RNOfXmktkJ
	0UnKXYaA==;
Received: from i53875bc6.versanet.de ([83.135.91.198] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsqoi-0002tC-Ns; Thu, 13 Mar 2025 23:14:16 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: amadeus@jmu.edu.cn, conor+dt@kernel.org, devicetree@vger.kernel.org,
 jonas@kwiboo.se, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Thu, 13 Mar 2025 23:14:15 +0100
Message-ID: <1819496.VLH7GnMWUR@phil>
In-Reply-To: <20250313071031.1840032-1-amadeus@jmu.edu.cn>
References: <7779050.EvYhyI6sBW@phil> <20250313071031.1840032-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_151426_307334_44089600 
X-CRM114-Status: GOOD (  12.96  )
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

Hi,

Am Donnerstag, 13. M=C3=A4rz 2025, 08:10:31 MEZ schrieb Chukun Pan:
> Hi,
>=20
> > so yes of course the pinctrl needs to be default - simply because
> > that's the only pinctrl state mainline supports.
>=20
> > But judging by the fact that you're discussing working vs. non-working
> > below, can you please check if we should drop the patch for 6.15 till
> > that is solved?
>=20
> I suggest dropping this patch first, I will send v2
> when this issue is solved.

I've dropped the patch now.


Heiko




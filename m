Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C37CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2PlpbC6DOPQ9Ag/NqmWzOb39YBV/wCJHBS+fST6+60=; b=cqyfwQnslylMTQVOQwJH49gZ9M
	OfVK4m9ORM1yojbNnEroj+zBULuSW5B4H1fi14wKMLdxFXjlYmNxxHmbjnMxrEGsqubLXs2N4Pay+
	pLV00d5l5x6U92glbb7uBCqhQTvYswjrADPbLm9hvgNFZtHUtIrwPMgtESLpD1POuCT8c7NyYiqbe
	c3Eb3IrRufVO+wHDrt89QFLrJDdg0h7HG85pVIKDck35EiGLN8ddDBMr9AC9AH+cBYUnzgK9831d2
	1sZbRcOL8RK8qS/5egFPGk/Scn9427KX8LXchy/yl3cKAm+loZxiQ8k+Jd/nOqI+Qj0jg05KOpZ5T
	XOypDRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2FE-00000007YzE-0LSx;
	Thu, 23 Oct 2025 20:49:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2FB-00000007Yyp-2a6W;
	Thu, 23 Oct 2025 20:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=q2PlpbC6DOPQ9Ag/NqmWzOb39YBV/wCJHBS+fST6+60=; b=zCYlvIKkaYPMPFlwDGw2mH+kHy
	ji2uFpc/zpY93YkSDpu9FoEHpcDKIgoLk3d1IJTG/hzYq/5XO3MmKUS6f9fNoEikBVPAWc5Vl+lzi
	3KhZBG2O91EzgXVm5p5so1G2MAY6t1oR5MkW/QY7Q+PkYFd1kqWnH7pSywWjMkvdujQQA/Plf79ZQ
	s8/pC2lPPs0WO2E9So/gzntHoL0cOf1DvFa/GswS6M03aMshumLFP2Rg20GIgpDkmUlsfJMQVKeT2
	EEjPhtFv8LuUNwN3Mpyt/p9Ic1TzdZuGW2dLOV41Xqm5dFDtBS8sJvd3R9ulA+lEZn/3nY1h0MZwH
	H48fS6tw==;
Received: from i53875a07.versanet.de ([83.135.90.7] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vC2Ey-00069O-2v; Thu, 23 Oct 2025 22:48:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, jonas@kwiboo.se
Subject: Re: [PATCH v2 5/5] MAINTAINERS: add dwmac-rk glue driver to the main Rockchip
 entry
Date: Thu, 23 Oct 2025 22:48:55 +0200
Message-ID: <4664419.8F6SAcFxjW@phil>
In-Reply-To: <35567cda-0f49-4784-b873-97e378fcee16@lunn.ch>
References: <20251023111213.298860-1-heiko@sntech.de>
 <20251023111213.298860-6-heiko@sntech.de>
 <35567cda-0f49-4784-b873-97e378fcee16@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_134909_672585_0D356FE8 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Andrew,

Am Donnerstag, 23. Oktober 2025, 20:57:50 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Andrew Lunn:
> On Thu, Oct 23, 2025 at 01:12:12PM +0200, Heiko Stuebner wrote:
> > The dwmac-rk glue driver is currently not caught by the general maintai=
ner
> > entry for Rockchip SoCs, so add it explicitly, similar to the i2c drive=
r.
> >=20
> > The binding document in net/rockchip-dwmac.yaml already gets caught by
> > the wildcard match.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>=20
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

just mentioning, I wasn't sure if your review for patch4 was still
valid after I adapted the change to Jonas' suggestions, so only added
the R-b's from v1 to patches 1-3 .

Heiko




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F213CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRX9VFqsFae2vPxGWuGUUsxAvvpVvr+5mUCJSaVrxx0=; b=24et1sh5Slhjg2kgx69HewXiKp
	GZJ3irECDNxdRy7atFOLFAMWo7yO6GJt0kZyGpnLjqX7sonKIj5OtBsF6HvCFk/xqcEZ9KZVIEi4y
	i8GKXYmDBcZa8PY3q90qh9GBXsurLOaRXrkZe3tMY2iKkUTgliTVhAWp/pvqI7KYJWfi9OYCkZrNt
	5ZLYEbdeF+STrctzron/Ukft2rOqzWzBXO/8rskcX9NmZKmt5hg2EeGqS9SU5L435VnLyYGRahrI1
	wLPOc5Kae4nvUI1zpDvDGCs96CFm/6di9gGXlO33QOptOlTgjyr4MAQMZVmUGotwtUfzBBVdaabao
	lCTGBvJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Vo-00000008Npm-1Wms;
	Wed, 12 Nov 2025 08:47:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Vl-00000008Nox-2ZLS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:47:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vJ6VZ-0002Hl-IX; Wed, 12 Nov 2025 09:47:17 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vJ6VZ-0003IF-1D;
	Wed, 12 Nov 2025 09:47:17 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vJ6VZ-00GPvd-0q;
	Wed, 12 Nov 2025 09:47:17 +0100
Date: Wed, 12 Nov 2025 09:47:17 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Add support for Skov Rev.C HDMI variant
Message-ID: <20251112084717.ea7fchu7jcz6dzsi@pengutronix.de>
References: <20251107-v6-18-skov-revc-hdmi-v1-0-595549e5b496@pengutronix.de>
 <176278493286.154609.17548604407386943510.robh@kernel.org>
 <20251110145256.pxgfw3zu7wocguqs@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110145256.pxgfw3zu7wocguqs@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_004729_652661_B40C5FC6 
X-CRM114-Status: GOOD (  29.98  )
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

On 25-11-10, Marco Felsch wrote:
> On 25-11-10, Rob Herring (Arm) wrote:
> > 
> > On Fri, 07 Nov 2025 15:49:50 +0100, Marco Felsch wrote:
> > > Hi,
> > > 
> > > this small patchset adds the support for the Rev.C HDMI board variant.
> > > 
> > > Regards,
> > >   Marco
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > > Marco Felsch (2):
> > >       dt-bindings: arm: fsl: add Skov Rev.C HDMI support
> > >       arm64: dts: imx8mp-skov: add Rev.C HDMI support
> > > 
> > >  Documentation/devicetree/bindings/arm/fsl.yaml          | 1 +
> > >  arch/arm64/boot/dts/freescale/Makefile                  | 1 +
> > >  arch/arm64/boot/dts/freescale/imx8mp-skov-revc-hdmi.dts | 8 ++++++++
> > >  3 files changed, 10 insertions(+)
> > > ---
> > > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > > change-id: 20251107-v6-18-skov-revc-hdmi-1e8d4bbac26a
> > > 
> > > Best regards,
> > > --
> > > Marco Felsch <m.felsch@pengutronix.de>
> > > 
> > > 
> > > 
> > 
> > 
> > My bot found new DTB warnings on the .dts files added or changed in this
> > series.
> > 
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> > are fixed by another series. Ultimately, it is up to the platform
> > maintainer whether these warnings are acceptable or not. No need to reply
> > unless the platform maintainer has comments.
> > 
> > If you already ran DT checks and didn't see these error(s), then
> > make sure dt-schema is up to date:
> > 
> >   pip3 install dtschema --upgrade
> > 
> > 
> > This patch series was applied (using b4) to base:
> >  Base: 3a8660878839faadb4f1a6dd72c3179c1df56787 (use --merge-base to override)
> > 
> > If this is not the correct base, please add 'base-commit' tag
> > (or use b4 which does this automatically)
> > 
> > New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20251107-v6-18-skov-revc-hdmi-v1-0-595549e5b496@pengutronix.de:
> > 
> > arch/arm64/boot/dts/freescale/imx8mp-skov-revc-hdmi.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
> > 	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml
> 
> This may be a valid issue, but it's rather an additional patch worth it
> since this patchset doesn't touch the imx8mp-skov-reva.dtsi include at
> all.

FTR: If I get the binding right, the regression is caused by commit
https://lore.kernel.org/all/20250918-ksz-strap-pins-v3-2-16662e881728@bootlin.com/.

Since this commit, pinctrl-names always need to have the "default" and
"reset" value, which is wrong.

Regards,
  Marco


> 
> Regards, Marco
> 
> > 
> > 
> > 
> > 
> > 
> > 
> 
> -- #gernperDu #CallMeByMyFirstName
> 
> Pengutronix e.K.                           |
> | Steuerwalder Str. 21                       |
> https://www.pengutronix.de/ | 31137 Hildesheim, Germany
> | Phone: +49-5121-206917-0    | Amtsgericht Hildesheim, HRA 2686
> | Fax:   +49-5121-206917-9    |
> 
> 


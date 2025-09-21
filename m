Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A12CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5LxHj+jPu7S0zSFcvS+0o91OUJpB0BwGdBpvy6NSxs=; b=VoQdGy+GvlGnKZYneuZh0tcmNZ
	1BrlVxcJb0Rp+GqKa/b/amBmz3Y4WWoqekr0wGpl35xkQf/FxGSX281iBQlY4k3CQDRkmaNFlXZZq
	fqNm+FnTWECbedrQSsV2RfQxAYgnOYuxzPLQ02RC/V9XrPnSjQgJWYWTAR2O06BuwTllr6TsDNuBj
	fuPCNTGCnslAJRJlSeQKfa0yOuUxIl+WdDXsHTG/twlWJZJwcGkSjSKJTIMHYQD1gtXuz7Vtio0Jp
	epVhkfaZlO9gmQSMXySmRMoaMXMSjaoaHB81CfFTg5FQ+/03nAnNYHHgnUZaoFiP/YHFl8FgWl7EB
	jkJbSfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SaX-00000008LW8-1yww;
	Sun, 21 Sep 2025 22:31:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SaT-00000008LV7-0HIH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 22:31:21 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2A13F10C4;
	Mon, 22 Sep 2025 00:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758493793;
	bh=Fv4UsA9MkASayxLFf2BzUM2Q41JcLsrAVhGMdS029aY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRxgE/yzzKy+tegRTdD1tm0SvZJgiQsG7fnpyEUqkQH8mO+uzHDqhPLl4pWjG5+RW
	 5FSnNJoc+Atqas0jh6T12AEGoiIvvY0fwvtactdch/GLjXbJI3OkI8ffThWHhR+WGa
	 JaputUJRpWEY0wsGKwJa62Q98KqrJqwyoSId8os0=
Date: Mon, 22 Sep 2025 01:30:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: "G.N. Zhou" <guoniu.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alice Yuan <alice.yuan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/5] media: imx91: Add ISI support
Message-ID: <20250921223043.GF10540@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <AS8PR04MB90801C7CE8D06EDC8CAA6750FA11A@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <aM2AurOTxTB4raSg@lizhi-Precision-Tower-5810>
 <20250921160704.GA29453@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250921160704.GA29453@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_153117_252068_A11A0215 
X-CRM114-Status: GOOD (  28.32  )
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

On Sun, Sep 21, 2025 at 07:07:06PM +0300, Laurent Pinchart wrote:
> On Fri, Sep 19, 2025 at 12:11:38PM -0400, Frank Li wrote:
> > On Fri, Sep 19, 2025 at 02:40:01AM +0000, G.N. Zhou wrote:
> > > Hi,
> > >
> > > Could you help to please review the patches which I have submitted
> > > some time back to linux media community and move forward driver part
> > > if possible.
> > > 
> > > Your feedback will be very appreciated. Thanks.
> > >
> > > Best Regards
> > > G.N Zhou
> > 
> > Laurent Pinchart:
> > 
> > 	Could you please consider pickup these patches? Consider these
> > related simple changes, is my Reviewed-by enough?
> 
> I've completed a set of other reviews and will get to this patch series
> in the upcoming week.

There's just an open question on 2/5. It's about the commit message, so
it shouldn't be a big deal. Once I get a reply to that, I can apply the
series with the small proposed changes, there's no need to submit a v3,
unless you prefer doing so.

> > > >
> > > > Add ISI support for i.MX91 chip.
> > > >
> > > > The bellow patch refine code, no functions changed.
> > > >    media: nxp: imx8-isi: Simplify code by using helper macro
> > > >    media: nxp: imx8-isi: Reorder the platform data
> > > >
> > > > The bindings and driver patch for i.MX91 ISI.
> > > >    media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
> > > >    media: nxp: imx8-isi: Add ISI support for i.MX91
> > > >
> > > > Add parallel camera input for i.MX93 ISI.
> > > >    media: nxp: imx8-isi: Add parallel camera input support
> > > >
> > > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > > ---
> > > > Changes in v2:
> > > > - Update commit log in patch 5 to better describe why introduce it.
> > > > - Include two header files in patch 2 since kernel test robot report build
> > > >   issue when arch is riscv and compiler is clang-22.
> > > >   #include <linux/bitfield.h>
> > > >   #include <linux/bits.h>
> > > > - Link to v1: https://lore.kernel.org/all/20250827-isi_imx93-v1-0-
> > > > 83e6b4b50c4d@nxp.com
> > > >
> > > > ---
> > > > Alice Yuan (2):
> > > >       media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
> > > >       media: nxp: imx8-isi: Add parallel camera input support
> > > >
> > > > Guoniu Zhou (3):
> > > >       media: nxp: imx8-isi: Simplify code by using helper macro
> > > >       media: nxp: imx8-isi: Reorder the platform data
> > > >       media: nxp: imx8-isi: Add ISI support for i.MX91
> > > >
> > > >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 13 +++++-
> > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 50 ++++++++++++++--------
> > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
> > > >  .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 18 ++++++--
> > > >  4 files changed, 59 insertions(+), 23 deletions(-)
> > > > ---
> > > > base-commit: 603957ae903e81fb80d3788297c0f58a68802dfc
> > > > change-id: 20250826-isi_imx93-4a59288b33e4

-- 
Regards,

Laurent Pinchart


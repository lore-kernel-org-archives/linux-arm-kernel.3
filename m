Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A144CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhzdAZOaWpxuyYfbyjDwLLdmvc3mx6efCZmHRqEr7CM=; b=apuhRiwgWU1bPtZFgHFD1QbAuR
	G10M3pcVGedC+bL7Kc5BYG+E7cisgByalNgU5K8b3go9yGKG2wzR9gNhj7ALtbG9z1DJassftHjB5
	vfXSunZJK4fMH7jcEKMzF6L7dDZao9nyF5I8dfvouE/jkNBapbNAreeL9fzUz7psKhUP7o6PCAXwV
	jDuC8BTcDRUzCRBNtLr/b8zUFknUSHqR4QcTlAlLZpeFq3BxvRwQrte87DT6lwUnsyzIBgX0cxbcM
	7Fwoym6YdEZ8cH+LdCo/RObwKn1wtju04tvrF5OyUu3f2jh9CLtV/z7hWdvdLHmXjx3I9dRph91ws
	aa9z+O9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MbK-00000007iW1-1Lbb;
	Sun, 21 Sep 2025 16:07:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MbE-00000007iOX-1llv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 16:07:42 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0D213169;
	Sun, 21 Sep 2025 18:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758470773;
	bh=SOxfcuAg/wHY4zUhpi4EhLnADzgpkX8Jpg/fLpNoMp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guX3vtQ1J6g5ihr5dodogs1eocaF6XVcFMrHKbETIm77ZVJ4vxZmz0NpdkPI5dPm0
	 cUxdWnS6ZUV3qibeB2k+tpUYHZeUi5ofnrlM/fyCEwrkR0POjH2DiqY2RGv9ifDbbr
	 +u0TxG79fuLkHvu2k3X3vcw0vCj8/3tackr5WAmg=
Date: Sun, 21 Sep 2025 19:07:04 +0300
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
Message-ID: <20250921160704.GA29453@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <AS8PR04MB90801C7CE8D06EDC8CAA6750FA11A@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <aM2AurOTxTB4raSg@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aM2AurOTxTB4raSg@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_090740_987774_4C8C38C0 
X-CRM114-Status: GOOD (  24.75  )
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

Hi Frank,

On Fri, Sep 19, 2025 at 12:11:38PM -0400, Frank Li wrote:
> On Fri, Sep 19, 2025 at 02:40:01AM +0000, G.N. Zhou wrote:
> > Hi,
> >
> > Could you help to please review the patches which I have submitted
> > some time back to linux media community and move forward driver part
> > if possible.
> > 
> > Your feedback will be very appreciated. Thanks.
> >
> > Best Regards
> > G.N Zhou
> >
> 
> Laurent Pinchart:
> 
> 	Could you please consider pickup these patches? Consider these
> related simple changes, is my Reviewed-by enough?

I've completed a set of other reviews and will get to this patch series
in the upcoming week.

> > >
> > > Add ISI support for i.MX91 chip.
> > >
> > > The bellow patch refine code, no functions changed.
> > >    media: nxp: imx8-isi: Simplify code by using helper macro
> > >    media: nxp: imx8-isi: Reorder the platform data
> > >
> > > The bindings and driver patch for i.MX91 ISI.
> > >    media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
> > >    media: nxp: imx8-isi: Add ISI support for i.MX91
> > >
> > > Add parallel camera input for i.MX93 ISI.
> > >    media: nxp: imx8-isi: Add parallel camera input support
> > >
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > > Changes in v2:
> > > - Update commit log in patch 5 to better describe why introduce it.
> > > - Include two header files in patch 2 since kernel test robot report build
> > >   issue when arch is riscv and compiler is clang-22.
> > >   #include <linux/bitfield.h>
> > >   #include <linux/bits.h>
> > > - Link to v1: https://lore.kernel.org/all/20250827-isi_imx93-v1-0-
> > > 83e6b4b50c4d@nxp.com
> > >
> > > ---
> > > Alice Yuan (2):
> > >       media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
> > >       media: nxp: imx8-isi: Add parallel camera input support
> > >
> > > Guoniu Zhou (3):
> > >       media: nxp: imx8-isi: Simplify code by using helper macro
> > >       media: nxp: imx8-isi: Reorder the platform data
> > >       media: nxp: imx8-isi: Add ISI support for i.MX91
> > >
> > >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 13 +++++-
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 50 ++++++++++++++--------
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 18 ++++++--
> > >  4 files changed, 59 insertions(+), 23 deletions(-)
> > > ---
> > > base-commit: 603957ae903e81fb80d3788297c0f58a68802dfc
> > > change-id: 20250826-isi_imx93-4a59288b33e4

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40D2C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6bjjE8MyCav7ckmLTNb9JRa4naTxSPm+UshKCPlRm4=; b=lbRk1MhCTnQk8pdM6wZ9OL+Z2X
	AatRsPnADrkICfDCOQ7f85X5Kz5LS2nfP/AH/xtDauVE/VM3fIwkep2nk4UisnGmN2xRiwBOix9My
	+eE+lQZ3JHqt0qjCbwLkr9EwnQ1lU85IvYpaHbTZram0mV11g2xenULa6HPTQWMeoFe695IsBZFAK
	AvVO+jK/8ZiRBEVxQmM11V/jjlsldAlejKLbp3VeUd2QFQhQw8lXjFEWoCx2pd0llHCIHhDPkyAHv
	u1trIEFStPZJX5crB9Fcs63NoL10dRd0IuqQOwzKyr/ENH1NEdyjM0dlwRHNIvflF6oPxt08mRfqf
	8ew0jVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUfg-0000000BbQm-1dTw;
	Wed, 22 Jul 2026 10:59:28 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUfd-0000000BbQK-0Hm5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 10:59:27 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 93F491FDE6;
	Wed, 22 Jul 2026 12:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784717959;
	bh=g6bjjE8MyCav7ckmLTNb9JRa4naTxSPm+UshKCPlRm4=; h=From:To:Subject;
	b=hffUt9VsGA0OSrvL+rdaUUo0MdY+KrxYAgPaZPMMNYTtwSWC4ZD4+UcWZLf68hUwA
	 zk684/lV9MCkbCc2vj2yF9D07AFXvpaBNHNfvHf4dWmBDwG1HyeHR8YVVB2fBYQ5qg
	 F/J76FsaJ7LTkAdf4kj9FJZ85czCdJRUacuJ6JP+u68Q8JOw8DTEkJJOMRKF/+Mx3j
	 iH3jdFGY4SEjjfQMxE7sCrr3hY3l6XzZ9jjoB2SjTUqLy4jZxsn8dPPHoZ0Xdnut5a
	 bvcnn1p/7RfBQKCdMpieu6COQeeDuU138P9qFDuGmyyEfh9SNo7UiA5O3MJeknefD9
	 SNqr+auMsPQmw==
Date: Wed, 22 Jul 2026 12:59:14 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Frank Li <Frank.li@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <20260722105914.GA72270@francesco-nb>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_035925_730637_F46184A8 
X-CRM114-Status: GOOD (  22.07  )
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

Hello Kieran,

On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > >
> > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > >
> > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > camera module.
> > > >
> > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > >  4 files changed, 119 insertions(+)
...
> I think with the Toradex ecosystem there would be some value in
> supporting or helping with the ongoing dt-connectors or dt-addons topics
> so that we can abstract the hardware which is being 'added'.
> 
> I think it's important that we tackle the problem of combinatorial
> explosions of overlays when we can add a component to multiple
> platforms.
> 
> For example, your OV5640 camera could be added to many different boards
> - and each board could have many different cameras - in different ports.
> 
> We should not be copy/pasting overlays for each combination, or we'll
> have 'thousands' of identical overlays.

I see your point, and I agree that it would be valuable to move this
topic forward. I will raise it internally at Toradex and see how we can
contribute.

At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):

 | DT connectors have been discussed for the last 10 or so years and three 
 | is still no real progress.
 | 
 | I would be happy to send a follow up patchset which would convert the 
 | DTOs to whatever connector implementation format lands in the future, 
 | but I am concerned that waiting for DT connectors will block this 
 | patchset from landing for a long time.


Francesco



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18DEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 05:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiskDyrwXEN+kIr4FUm41x7tvccZKQs6stoJI+7Vkas=; b=ilJvzbn2Lymu9Ap+Ic2pjP++mN
	r3G/BqR+DB3aM3+yuIvo+CAR7K/7RS0K2vEjU8AjajfEc/Dwy5aRwaQ+PILqtfS7mFQw7+3t65Uh4
	NrVYI2yUfTLGVEyJirNjq+Re/4WKIXHTASi9gE7aflbcrbI7nnvELklqr5Wt2HsUd98SdSyP5xfFh
	9yW+FwUf/sDrDbPEDULy6pnl+4t+4Smtkzdgw4702WyZaR5PVr2VEjWFmzZP/09nNrNSnE3FhT0GY
	vY3eFEQBE5ntFZLpt5aY+R06rydiBrboIEyXw6LxlrsINP/bcYYRigRsZnD6Pf/JkcuRKEMwspnma
	P1XhgV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whL6U-0000000GNey-1aIB;
	Wed, 08 Jul 2026 05:45:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whL6Q-0000000GNeU-1pFe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 05:45:49 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1whL6M-0003gK-H7; Wed, 08 Jul 2026 07:45:42 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Shawn Guo
 <shawnguo@kernel.org>,  Frank Li <Frank.Li@nxp.com>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/3] arm64: dts: imx8mp-skov: support new 7inch panel
 board
In-Reply-To: <akupDXc1QA4uKfR6@shlinux89> (Peng Fan's message of "Mon, 6 Jul
	2026 21:09:33 +0800")
References: <20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de>
	<20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-3-dfc0c8827c02@pengutronix.de>
	<akupDXc1QA4uKfR6@shlinux89>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Wed, 08 Jul 2026 07:45:41 +0200
Message-ID: <87se5ukpa2.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_224546_496987_B98D6284 
X-CRM114-Status: GOOD (  16.85  )
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

On 2026-07-06 at 21:09 +08, Peng Fan <peng.fan@oss.nxp.com> wrote:

> On Mon, Jul 06, 2026 at 09:17:57AM +0200, Steffen Trumtrar wrote:
> >This board is similar to the already upstream
> >imx8mp-skov-revc-tian-g07017.dts but uses a different 7" panel with a
> >different touch controller.
> >
> >Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> >---
> > arch/arm64/boot/dts/freescale/Makefile             |  1 +
> > .../imx8mp-skov-revc-jutouch-jt070tm041.dts        | 79 ++++++++++++++++++++++
> 
> Sorry to jump in at v4.
> 
> Compared with imx8mp-skov-revc-tian-g07017.dts, the differences are mainly
> in panel and touch.
> 
> Have ever considered using overlay?
>

no, I actually didn't. This way it is easier to decide in the bootloader which board I'm on. I could definitely do it, if this is the way to go, but would add some overhead on my side. I don't see that many overlays in arm/dts/nxp/imx. 


Best regards,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |


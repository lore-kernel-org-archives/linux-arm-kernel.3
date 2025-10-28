Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15817CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 07:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHxjM5LMQ4g0r8TfjyC7UV5DiqKeWmastZlvJ1Y7vjg=; b=Z2b/xBOhK2YyKhhAvODxTfQRcO
	c+jH6y12KMuK+17DSg1C3ke+H9VEs5OqxlWhDKkN63j2/bSMsC464qal8o08QN38/3qZsTXHKvLB+
	VI/50RUqjFr4ALUg2wQ313FNPvs8BAQqnsTdE+JUtiEJdqdiMeH6FtkYR7Y0OP5yUvwploK00alzp
	WE14W/pWQQ1FkTbVsG48W6KBMUDnCxBqoq42ZAytsW4e65ICuiO7t5ZB8JbAk7d0z8i75R5MM8+H0
	IzHts7BiLUC8G86JomZW9WxS1Tw+B5EqnjcOMC/564nzx1iAK4pliK6eKxg77eoBfJXalPsoitmKR
	umozHLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdyV-0000000FOpM-3slR;
	Tue, 28 Oct 2025 07:18:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdyT-0000000FOod-0k0a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 07:18:34 +0000
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3FEB713BE;
	Tue, 28 Oct 2025 08:16:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761635802;
	bh=uwl4S+0VVmxOF+41YWBs/pcpifL5J3z3aL5XY8xuVBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AfcXcfvk823pXMB/CidGYHN1+aUyWZMHnwW+YXHN7FtGrmtU7EpVsZ8we+lcYbbDT
	 FlZGTyDd5lcEsVTYojCsUFJAhGR/5nAoG6nIL5u6Y+Ab8HFNd0e5xzzr/3/qkhz4P+
	 QdnRfbLjLaCVJ/fb+VmHF6JC8R8x/Yiuq+45APwU=
Date: Tue, 28 Oct 2025 09:18:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251028071817.GX13023@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
 <20251027234648.GC24987@pendragon.ideasonboard.com>
 <aQAVE96NAD4Z4lgt@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aQAVE96NAD4Z4lgt@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_001833_358348_0089FB4E 
X-CRM114-Status: GOOD (  25.76  )
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

(CC'ing Catalin)

On Tue, Oct 28, 2025 at 12:57:55AM +0000, Russell King (Oracle) wrote:
> On Tue, Oct 28, 2025 at 01:46:48AM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 27, 2025 at 03:13:51PM +0000, Russell King (Oracle) wrote:
> > > On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> > > > Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> > > > (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> > > > devices produces an interrupts storm. Disable EEE support to fix it.
> > > 
> > > We've finally got to the bottom of what's going on here. Please try
> > > this patch (it's building locally, but will take some time because
> > > I'd wound the tree back to 6.13 and 6.14, so it's going to be a full
> > > rebuild.) Thus, there may be compile bugs remaining.
> > 
> > I've applied it on top of 
> > 
> > I've started with a branch based on v6.18-rc3 plus "[PATCH net-next 0/5]
> > net: stmmac: more cleanups" ([1]) and "[PATCH net-next v2 0/6] net: add
> > phylink managed WoL and convert stmmac" ([2]) to make the patch apply
> > cleanly.
> > 
> > [1] https://lore.kernel.org/all/aO_HIwT_YvxkDS8D@shell.armlinux.org.uk/
> > [2] https://lore.kernel.org/all/aPnyW54J80h9DmhB@shell.armlinux.org.uk/
> > 
> > The base branch exhibits the interrupt storm issue. The patch
> > unfortunately doesn't fix it.
> 
> So it's highly unlikely that your problem is the same as Emanuele's.
> 
> Do you know when the interrupt storm behaviour started? If not, I'd
> suggest testing 6.13 and 6.14 as a starting point to see whether
> the phylink-managed EEE conversion is involved.

I can't test it right now (no access to hardware during daytime for this
week), but if I recall correctly my colleague Stefan Klug bisected the
issue to

commit dda1bc1d8ad13672c2728eedee0dd02d27a5314a
Author: Catalin Popescu <catalin.popescu@leica-geosystems.com>
Date:   Mon Oct 7 15:44:24 2024 +0200

    arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"

    So far, only WFI is supported on i.MX8mp platform. Add support for
    deeper cpuidle state "cpu-pd-wait" that would allow for better power
    usage during runtime. This is a port from NXP downstream kernel.

    Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
    Signed-off-by: Shawn Guo <shawnguo@kernel.org>

I didn't notice it at the time because my board was connected to a
switch that didn't support EEE.

-- 
Regards,

Laurent Pinchart


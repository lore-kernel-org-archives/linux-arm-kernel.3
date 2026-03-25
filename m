Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8704E103A9A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2YQAGejwfR5ZlCcWyHUSZO12iuE4GgPthnFZ7lNm/A=; b=mbDFrClv3n9L+g7QHVZVmNtsmt
	5eav+IdjTgoVVTRM8jtxfXnF2J4bemuZnp/bPRPDZKjFDFSF/VwjFb0KToPryeUHUZraxFlXlYO8D
	bWWyGiPlOAILETdGTS+MWOpra/Z9FmN3MBZeHbSoXsDnL7fSUcGhP9NPN3t4jtlW0XZgyAminQg53
	0oIYD762M8eOVaI1XIBDJQtwdzsb7qdrmMdF5Cw0P/7RxlySZIBH8g2wbTMhftg4QAMzWk7pKEm3U
	HZHClKeLerX5wAHe6S5AxcSqSJj02avbdMD0fd/NeD09LDo5de7tlshdPeHUWX9cz0AP/lbVWfKOZ
	A6mIRrLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MOi-00000003Fsp-27QL;
	Wed, 25 Mar 2026 11:27:40 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MOd-00000003FqO-353E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:27:39 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 802C81FD07;
	Wed, 25 Mar 2026 12:27:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774438049;
	bh=S2YQAGejwfR5ZlCcWyHUSZO12iuE4GgPthnFZ7lNm/A=; h=From:To:Subject;
	b=Lve7YK+wnl2mE3II7S1FEj7bjiLJ4Anor5/kTXKOzbDteEX6YJLbLp5sEpKgWs+HP
	 gnyqs4S3EqlSWVpUJcArFe5vDEH/5XWbhZs0AG7SdvZQBWwcAGYE4MbSA9rX+A4fEt
	 QNlw7RrLFYOmOkY+Nvx21bJMBhzkQWDgbiKMQ9gdkSpM/K9hLZl/ZJidD/H2FuUgFO
	 Rh2a1ul4NWs/P9Od/YJtMYi0O+mYJiNVsJNUqYN7T94SwQO1n6bjGu7cTY27EAsjTg
	 ixYp+Dyubh61gmf4Br4fuY2aQYRtLzjsE4nLkLTQCSLYGVJL0ilLkPuqEpYI+qUHSh
	 79tkNmj1ic8kw==
Date: Wed, 25 Mar 2026 12:27:24 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/6] arm64: dts: freescale: Add Verdin iMX95 support
Message-ID: <20260325112724.GA7964@francesco-nb>
References: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
 <20260313-verdin-imx95-upstream-frank-li-base-v2-2-bd488be7c699@toradex.com>
 <acK4awcokUyCHrG5@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acK4awcokUyCHrG5@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_042736_675200_A23369BA 
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

On Tue, Mar 24, 2026 at 12:14:35PM -0400, Frank Li wrote:
> On Fri, Mar 13, 2026 at 09:57:43AM +0100, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > Add support for the Toradex Verdin iMX95 and its development carrier
> > board.
> >
> > The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR4x RAM,
> > up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
> > Ethernet PHY, an I2C EEPROM and Temperature Sensor, an RX8130 RTC, an
> > I3C bus, one Quad lane CSI interface, one Quad lane DSI or CSI
> > interface, one LVDS interface (one or two channels), and some optional
> > addons: TPM 2.0, and a WiFi/BT module.
> >
> > Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> > Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> > v2: Reordered nodes alphanumerically by node name
> > v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-2-823fad02def9@toradex.com/
> > ---
> > +
> > +/* Verdin UART_1, connector X50 through RS485 transceiver */
> > +&lpuart7 {
> > +	rs485-rts-active-low;
> > +	rs485-rx-during-tx;
> > +	linux,rs485-enabled-at-boot-time;
> > +
> 
> Nit: needn't empty line between status and other property, suggest run
> https://github.com/lznuaa/dt-format to speed up process.

Please review Documentation/devicetree/bindings/dts-coding-style.rst.

Quoting from there
 > "status" (if applicable), preceded by a blank line if there is content before the property

I would be careful on taking every detail of such a style guide literally,
but your comment here is not correct and it's not helping anyone.

Francesco



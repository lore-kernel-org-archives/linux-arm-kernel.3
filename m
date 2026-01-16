Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E821C982CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jzKf9K6CFuNeCcOT9ezQxETaHyJXF+75vK3fagkWV0=; b=IePrQwcH8mzWSNRbxaTe3qnBIx
	xdF3SeZ9MS9WYCo8U+8GEovJ7yb3Bzx8yReAeAoGn30Dpdxo2BIjR6/8/T6AF3qYYURe3OJJWyWcg
	iJ010hFLT6mTx3Ubclpw4qX8azJhil2EJoMooJdJLOtN5hZFZX9kPNhy34bMTRsOeiP/eeOxnh+ss
	e348Nj4FkxkrhzETQF9lQIG5nFXIdQoKWLk0FFa2cgz9/xCvEPVNrtcbCRcVJ06S2Lyz9bRez615a
	wiEv3fALinTf47Lk0cdWilfjKOtuNAOvLJwabSLf9GVquqMnnij9kzqKHkLyzfNngPaFsH1PGJJun
	8FWPyIdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglbW-0000000ELW4-3DWe;
	Fri, 16 Jan 2026 15:19:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglbS-0000000ELUM-37aG;
	Fri, 16 Jan 2026 15:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=4jzKf9K6CFuNeCcOT9ezQxETaHyJXF+75vK3fagkWV0=; b=3O
	oSGdO79FDY0Jzz/pb91kj6GNBfN+05zx4fjlyVR47VhJnOlnIrsnwt+SojRu3D1cZ5jcekwumRGKa
	OuzysH1W9Zg2tHLFsBOODK3bCKYcUGeKBtYTf7zfaeBpqwHEZAh/g8two2dzOgngWP+jOpmjOrhfC
	RTCY6l9Jl3djMpU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vglbJ-0035XQ-MB; Fri, 16 Jan 2026 16:19:01 +0100
Date: Fri, 16 Jan 2026 16:19:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, vkoul@kernel.org,
	neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <6d27a8b1-1407-40ff-945b-927ef0a39eb1@lunn.ch>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
 <aV/Qha0CQ+LJHo76@lizhi-Precision-Tower-5810>
 <das6ud7gep5hrcdn4bnmoyl2pb7okbxslpnawch2osaezd6xm5@psbizlufjec4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <das6ud7gep5hrcdn4bnmoyl2pb7okbxslpnawch2osaezd6xm5@psbizlufjec4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_071910_784065_F90FDE0D 
X-CRM114-Status: GOOD (  23.66  )
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

On Fri, Jan 16, 2026 at 07:29:39PM +0800, Xu Yang wrote:
> On Thu, Jan 08, 2026 at 10:43:01AM -0500, Frank Li wrote:
> > On Thu, Jan 08, 2026 at 04:36:41PM +0800, Xu Yang wrote:
> > > The CR port is a simple 16-bit data/address parallel port that is
> > > provided for on-chip access to the control registers inside the
> > > USB 3.0 femtoPHY[1].
> > 
> > 
> > > While access to these registers is not required
> > > for normal PHY operation, this interface enables you to access
> > > some of the PHY’s diagnostic features during normal operation or
> > > to override some basic PHY control signals.
> > 
> > Simple said "Export these registers by debugfs to help PHY’s diagnostic."
> > should be enough
> 
> OK.
> 
> > 
> > >
> > > 3 debugfs files are created to read and write control registers,
> > > all use hexadecimal format:
> > > ctrl_reg_base: the register offset to write, or the start offset
> > >                to read.
> > > ctrl_reg_count: how many continuous registers to be read.
> > > ctrl_reg_value: read to show the continuous registers value from
> > >                 the offset in ctrl_reg_base, to ctrl_reg_base
> > >                 + ctrl_reg_count - 1, one line for one register.
> > >                 when write, override the register at ctrl_reg_base,
> > >                 one time can only change one 16bits register.
> > 
> > how many regs? how about create file regNNN,
> 
> >From 0x0 to 0x201F.

Rather than reinvent the wheel, could you use regmap?

https://elixir.bootlin.com/linux/v6.12.1/source/drivers/base/regmap/regmap-debugfs.c#L546

Regmap should be able to provide a debugfs interface for you, no
driver code needed.

This will also help you with the abstraction between the core generic
part of the PHY driver and the SoC integration glue. You pass the
regmap to the core driver, and the funny muxing through two registers
is hidden away from the core. If the next SoC integrated uses plan
MMIO, that SoC glue driver can instantiate an MMIO regmap.

Using regmap is a good idea for core generic drivers which can be
integrated into SoCs in different ways. It hides the SoC details
behind a well known API.

      Andrew



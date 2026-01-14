Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680E4D31A29
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vy+Qpos6BfwVSmvJaJmLRlVL5cSg6LQq62STe4yrVko=; b=2ycIVSxXBPNF2Vg5NEYfs+/1eW
	LUuasZUtEdis702e5KliSbxvyUmVhrQ+kaK2U8zNVZWAYHGsdsIyj3tfATnWvWcL4YN1mlJyA0dPT
	f1T9HtolEnyB8DkzV5gnHh5CrDcKuqs9JHcMu2lFzw6SMmWweuhdpaT5V+gNZotdvCAW4FMrS4lpl
	5RbQ7I1Ot1JdRtqzDXj89EbkOApi9NFHVgEwzoMcQtiqry5GZUsHxwq+TZqZKbtOmfxmjuktPZkOH
	XAmMMGPNhP/7tR/sMtQaektexPM2Ze1Qt9PnQ1VIXffB564KCfFhc8G5TRtVIRIW5tiiV4BcjGmaF
	RwbLxHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxMA-00000008bRj-3UKO;
	Wed, 14 Jan 2026 09:40:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxM7-00000008bQa-1CpK;
	Wed, 14 Jan 2026 09:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 327CB4060C;
	Wed, 14 Jan 2026 09:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2A4C4CEF7;
	Wed, 14 Jan 2026 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768383598;
	bh=+GXQQLnzpHEdyH8KVg6e8QZ98cpG2jl4DlcMTaQxuJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOL8KBixIXVgTe+D9BYckQmKoVUpnaAUZfvP1BgU+CVQ4OnxryOOZCeXNP0BbnxQG
	 PtwzHVlmYg5J2UQx40Uw7SBsmjuAcNELO2k+usPpSQxRtAyDNUU3l++ynQH3pXQh0Q
	 AabjR2o1neRVlyvRZUkFGUiMIoLHfxezprrbQOMnf8P/fKaWC+1vkN7fCnvgcCR66E
	 W1dvyV1Tfc/nz2z6btswtF/eWPM3M8740faP3Jnz0HcDypJUbh+yRIhmPO7z37NYR3
	 62LbgstAfhKeKcvkZ2wfS3YhQcSc1CEuFlfr6sTjMQdgXKI0d3B0XwdGeu6nPuhZSv
	 V9pE+8auOTNIw==
Date: Wed, 14 Jan 2026 15:09:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Xu Yang <xu.yang_2@nxp.com>, neil.armstrong@linaro.org,
	shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, Frank.Li@nxp.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <aWdkapV39bOArR-d@vaman>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
 <c1425564-9dca-45dc-ac5e-093150a3ff01@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1425564-9dca-45dc-ac5e-093150a3ff01@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_013959_343971_8326DAC8 
X-CRM114-Status: GOOD (  20.89  )
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

On 08-01-26, 19:24, Andrew Lunn wrote:
> On Thu, Jan 08, 2026 at 04:36:41PM +0800, Xu Yang wrote:
> > The CR port is a simple 16-bit data/address parallel port that is
> > provided for on-chip access to the control registers inside the
> > USB 3.0 femtoPHY[1]. While access to these registers is not required
> > for normal PHY operation, this interface enables you to access
> > some of the PHY’s diagnostic features during normal operation or
> > to override some basic PHY control signals.
> > 
> > 3 debugfs files are created to read and write control registers,
> > all use hexadecimal format:
> > ctrl_reg_base: the register offset to write, or the start offset
> >                to read.
> > ctrl_reg_count: how many continuous registers to be read.
> > ctrl_reg_value: read to show the continuous registers value from
> >                 the offset in ctrl_reg_base, to ctrl_reg_base
> >                 + ctrl_reg_count - 1, one line for one register.
> >                 when write, override the register at ctrl_reg_base,
> >                 one time can only change one 16bits register.
> > 
> > Link[1]: https://www.synopsys.com/dw/doc.php/phy/usb3.0/femto/phy/x652_usb3_ss14lpp_18_ns/4.07a/dwc_usb3.0_femtophy_ss14lpp_08V18V_x1_databook.pdf
> 
> Please don't ignore my comments to V2. Think about the code split
> between the generic IP licensed from Synopsys and the vendor specific
> code used for integration into the SoC. You want to avoid making a
> mess you later need to cleanup because somebody else licensed the same
> IP core from Synopsys, and need to put their own vendor specific
> integration code around the generic code.

Agree with Andrew here, please do mix, splitting would be better

> 
>     Andrew

-- 
~Vinod


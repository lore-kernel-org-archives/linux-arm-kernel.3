Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9915DD1D467
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQUgsMQ5jvqItU8dCXxHEIGvMiHPPcibzrzgNYGiwJA=; b=NtDyJhIug8WyfSdfb/e60g/pfk
	CICeRZEOE4L4jVSTiHA3h4d2IjRXhMhWu/bLEA7cEvcQIWv7w0DZldSyqYLN3M/01YBV0bj4EdbQk
	xf+MXXZGm7Va7mIO76WEqBMfYfi5bWBX/DYfTFdSc4iEw28WAD5nBz42GLHGHmMFbw/XzrPk0dDHN
	PlLw3xw1oDy0E95Ly7Sd13NhDbTQF+F8fWDq4q4Ywyk1pPum35G3gwG5gcEGCravBKU/APW+NPSQ4
	7tn5I72+Pf+R5SekgMwxnBQte6ITc1k1zAW3oGTAjumKy5/eCum5H4IsQYYiOotl7F4S59Gbt8qzW
	cju0Z66w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrIQ-0000000HP52-0QIk;
	Thu, 08 Jan 2026 14:47:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrIO-0000000HP42-3CKg;
	Thu, 08 Jan 2026 14:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nQUgsMQ5jvqItU8dCXxHEIGvMiHPPcibzrzgNYGiwJA=; b=AziNj+c7Tbd95wPVaRZR5mJ4Ky
	r8jrV22J1sGuoRXbDW5YSdk+4XUtq6kPFt9dW0Ln4yVdVr4ru7b/bFuq4Bc60hnBQs1JLcVpqs7qI
	eLTSt2cKvoun2HFmc7K6VSPEBium//IZ1AA83SlqXTNPmpRO20ZpgsimF3FK379ftN0mVyFp7ee7v
	iCJmJvFULQIT4DgAWYgDUGAavXUydFuSh+SjlJ1H8hP/9CoDkvvtQq71/jicSZdxac0Kk+5L4KRDJ
	TAV0voLqNu31MjbOKq0dleYwtMgSvg/lfdlAUjCpFvSjK8Gz3SAAEl/Cyw//m+Ul/vAbEhR8zDdS6
	bHmC5m0g==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrIM-0000000DPkw-09jP;
	Thu, 08 Jan 2026 14:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=nQUgsMQ5jvqItU8dCXxHEIGvMiHPPcibzrzgNYGiwJA=; b=fl
	HdKeHc0+XcPmpYUEA9fz7MduvxbadrOiIM5W5YDw2ab0FTSZgcJKREVD5H9GVO3/BkalG5jbYY5UC
	GCA27pJO/z3SsJ2leu9Qri705bymstZGiOkGCMI6rOobH/5pgtdudcczgy6GIlz4zH1mFt8ZdUVek
	+zlwn+btNPNdrLE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vdrID-001xo9-1h; Thu, 08 Jan 2026 15:47:17 +0100
Date: Thu, 8 Jan 2026 15:47:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	Frank.Li@nxp.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <0b61c962-9aa1-4275-a40a-220f6d7f1210@lunn.ch>
References: <20251224111716.2925597-1-xu.yang_2@nxp.com>
 <9870fd41-bafb-4ab0-91ff-8fcea53ca0a9@lunn.ch>
 <7bbvfiy5wceantklz6lav5rwak53yhasfvzddtsirqorcylrf6@rbcrocqftznj>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bbvfiy5wceantklz6lav5rwak53yhasfvzddtsirqorcylrf6@rbcrocqftznj>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_144726_161373_D4ADE5B1 
X-CRM114-Status: GOOD (  25.85  )
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

On Thu, Jan 08, 2026 at 04:22:24PM +0800, Xu Yang wrote:
> On Wed, Dec 24, 2025 at 02:51:11PM +0100, Andrew Lunn wrote:
> > On Wed, Dec 24, 2025 at 07:17:16PM +0800, Xu Yang wrote:
> > > The CR port is a simple 16-bit data/address parallel port that is
> > > provided for on-chip access to the control registers inside the
> > > USB 3.0 femtoPHY. While access to these registers is not required
> > > for normal PHY operation, this interface enables you to access
> > > some of the PHY’s diagnostic features during normal operation or
> > > to override some basic PHY control signals.
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
> > Are the registers openly documented somewhere? Could you include a
> > link in the commit message.
> 
> We integrate a SNPS PHY in Soc. So the registers are documented
> in SNPS doc. Anyway, I can add a link for reference.

Humm, so the registers are defined by a Synopsys databook?

Shouldn't this patch be split into two? The access mechanism to the
registers is specific to the imx8mq. But the registers themselves
should be part of the generic SNPS PHY driver which should be shared
by all devices using this licensed IP?

I should say, generic PHY is not my usual subsystem. But i've seen the
mess chip vendors make with licensed Synopsys Ethernet drivers, lots
of blind copy/paste, no real thought about what is generic to the IP
and what is specific to the SoC integration, and what can be shared
between different SoC integration's, etc. I just want to make sure the
same issues are not being repeated here.

	Andrew


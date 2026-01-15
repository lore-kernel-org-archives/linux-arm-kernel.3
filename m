Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A13D3CC8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 07:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbEuSfoC/WNUVqtU0A2Dex7ZSI1NDiP/B9w9lXMIyPc=; b=X1h2tL6lA6w7AhAy19vnK7MufA
	2HenlLtGb+MJ5ShFMYjj8wZq9rmhgm/y5GyHsRoXrjJDhniMRbSuXRaBlX70c1XZRtLHIt/AV0All
	ixKyjnVJpN/K+i4L9V5nxd3OZxBfpAW1P8LRioeAwtfc+5p6oif2bFV4GGg/WWCo3mjxW+t3paXGQ
	lVyG9n4d68VLMz/7rGIz8qjrunnzsBzIyqBEpTrMo7HXbK4ohRrgKloQEo3Cttn3CqSafapfrJMOa
	I/OqWnN8XDzPqkehEyY9RBv+nLb94U4mjtYNwz6DJSK0N5uDCt7ZnXAMeIt7sDjPqDOeOahhcJ0hO
	n7fY/b0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHsI-0000000BwFJ-3JVB;
	Thu, 15 Jan 2026 07:34:34 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHsE-0000000BwEh-2JuH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 07:34:33 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4AA641FB6C;
	Thu, 15 Jan 2026 08:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1768462462;
	bh=UbEuSfoC/WNUVqtU0A2Dex7ZSI1NDiP/B9w9lXMIyPc=; h=From:To:Subject;
	b=JoyFheb1cuMVGql9CA2LpqlWfMk7H6OR/doc2/8n0Dx9mO7plT2bjUdHET25mYSZ1
	 /6D+24YHDCONqoVkdoWsUV6J9x9YdkfK9KVpBdAVIJ8KIjvC2TOxtyuXlmoU118iWB
	 B3gZGRkyZZvb6RCbz1ctluG523jtrGS52mhzmwQhyh+sCzzTLuu0gE+N9X1QDJ4HqX
	 iJ+rYfkd5FyhcT1zO8THFCNiQIEWI8E8+TZLOi5HSpjysqoR+ycKGoUzc5l3mNb8wN
	 rM+u8Xn9XbBC22pAJBMyAliNS5Dcykkq352IrXhws0RpMdvCsQxO92gz0hb5Qk5pVf
	 UgxGbo+NwZA/w==
Date: Thu, 15 Jan 2026 08:34:18 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	kwilczynski@kernel.org, mani@kernel.org,
	andriy.shevchenko@linux.intel.com, bhelgaas@google.com,
	hongxing.zhu@nxp.com, frank.li@nxp.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] fsl,imx6q-pcie: Remove the deprecated
 "reset-gpio-active-high" property
Message-ID: <20260115073418.GA4366@francesco-nb>
References: <20260115071816.115798-1-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115071816.115798-1-sherry.sun@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_233431_943120_59BBE4DB 
X-CRM114-Status: GOOD (  10.19  )
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

On Thu, Jan 15, 2026 at 03:18:13PM +0800, Sherry Sun wrote:
> Commit 2e81122d681c ("PCI: imx6: Convert to use agnostic GPIO API")
> deleted the "gpio_active_high" flag in pci-imx6 driver, so currently
> the imx6 PCIe driver doesn't support "reset-gpio-active-high" property.
> 
> Let's remove this deprecated property in imx6* dts and the
> corresponding dt-binding.

Are you sure this is not breaking anything?
DT files from the Linux repository are not used just in Linux.

And , the property is still handled, see commit b8b80348c57b
("gpiolib: of: add polarity quirk for Freescale PCIe controller"), the
DT compatibility was not broken as you seem to imply in this series.

Francesco



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F7DD3CC9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYGV+NwzF1dz9CuqQx4SAArBW6pXJn6utmAZk/0qyDY=; b=noRVPuADZOde4EQTmDtHK9v7n8
	El95lsbmDB+rveAGjsKWtDlPM6mEcQhUSX2QYw3mXrzI1WwNKkO9JLPx+KN32yE4DVnBDXZt5TnmX
	rfXGrrJDriAEHZ9XeQfwQIm5UcNLXZi3/pi+akvpfe8kFnD7EOCIndlbKz4gBj7tfuFbOXLCz4wAs
	GX9qkeY+OVAtx1XNoRhIJMuF7hSqNwaHFxyhPVhKF3u9UCr5BA+xduVbc/dMlnKJMbhfTG7haU02v
	p3jlGy6dfOqEMtUlVvbKbEVCHd/YtFlFWRZ9a1CkrgKmL6yIWKgOleIimslgg/YsYT/iu1kUmRhEk
	fUheG5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIS7-0000000BydR-19JX;
	Thu, 15 Jan 2026 08:11:35 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIS1-0000000Byd1-0tcz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 08:11:34 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 134B01FC54;
	Thu, 15 Jan 2026 09:11:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1768464687;
	bh=QYGV+NwzF1dz9CuqQx4SAArBW6pXJn6utmAZk/0qyDY=;
	h=Received:From:To:Subject;
	b=N6GVMSqJjiwxk8xlrQZ0ahE2y+mzFxDaBDxtgJpIf55s9HxD/in1cOwyjN1OvyDvm
	 D0OiunZnhegfh8giYoPUiUwqEFHATwZFPfhKPrttGERSVSLcdk39KHNauKdjTUlcKf
	 FAYrFX1v6lbbPGPHWDga3VeRHT3k3wYw7SiGqRrchBk6tLNa7jDnZwFpsAm+bmGLtR
	 /WKlrrJCdm6plhRk3r7RQH671fbuNM9ckyBzzMzcISFZLy1hZq9NtR4faF3AbJYKrx
	 BUY1A/bhbWsbrxLbvCUPI/ybUHG5j0Aoq2XlRIBVtM0FiOONVSs+SnHJNIGP1Bbuag
	 Qoi4pfmA0zTCw==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id BA5E37F9C8; Thu, 15 Jan 2026 09:11:26 +0100 (CET)
Date: Thu, 15 Jan 2026 09:11:26 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Sherry Sun <sherry.sun@nxp.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, kwilczynski@kernel.org,
	mani@kernel.org, bhelgaas@google.com, hongxing.zhu@nxp.com,
	frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] fsl,imx6q-pcie: Remove the deprecated
 "reset-gpio-active-high" property
Message-ID: <aWihLru9aT75LCPm@gaggiata.pivistrello.it>
References: <20260115071816.115798-1-sherry.sun@nxp.com>
 <20260115073418.GA4366@francesco-nb>
 <aWigj011i0pGgTRi@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWigj011i0pGgTRi@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_001133_776813_273D5AC0 
X-CRM114-Status: GOOD (  13.49  )
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

On Thu, Jan 15, 2026 at 10:08:47AM +0200, Andy Shevchenko wrote:
> On Thu, Jan 15, 2026 at 08:34:18AM +0100, Francesco Dolcini wrote:
> > On Thu, Jan 15, 2026 at 03:18:13PM +0800, Sherry Sun wrote:
> 
> ...
> 
> > And , the property is still handled, see commit b8b80348c57b
> > ("gpiolib: of: add polarity quirk for Freescale PCIe controller"), the
> > DT compatibility was not broken as you seem to imply in this series.
> 
> This is a quirk and not a 1st class support. There must be no such property
> in new DTs, it's only present for the backward compatibility.
> 
> For the old ones, indeed the property is needed.

Ack, we just agree here.

Francesco



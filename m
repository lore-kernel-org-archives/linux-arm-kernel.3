Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7951AEF8FE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsHF1E5fpWJM63LeJ0TEjWwEk2jADMZzmvlLflpXUCA=; b=KId7LqW8RgIvOezgzLb3vpsKZ+
	dSain6xTfcgYSjVj6A2WAnKuXOSlSU/65iujNTWafGpxpI2nyMn4hmXU77kvEoRca+e3/azECiQZ0
	cd+NkAfMK/LyURxjadXEmaOki41B4b2vdiG3CMwRwrM9YPoEnBJuPNADw6dyy9ZN2RvZRfk3/hNgd
	Wu+BqTwNlf2bs27gEHZdApypYYYHCdM38XZFDAQEU3kNiuSJ6L6+Ym5FnaHOhWyhGANMWBTqYUW2u
	QvPIhJ+8cQZhYgFhaTQDz+stihljISLtIqbKNlfrN1W0LfJTBwwmeSvHrDVYTUykmrToaA6MQ3cyG
	manaSZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn7W-0000000HOHR-2mdY;
	Wed, 04 Mar 2026 14:22:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn7V-0000000HOH9-395t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C9946057A;
	Wed,  4 Mar 2026 14:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CDCC4CEF7;
	Wed,  4 Mar 2026 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772634156;
	bh=XKm6moUyJlXTOOVZmPNeLBVPA2JMRFGrzzFR2xdojII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Icj4syoo9HIw5PdWpFz83ztd/Ejz3d/63vXqNdecYSQuq6dV5ZLsI9B1IgU3ECLCx
	 Z0Ii2xnYl3585A7+ZmDnSniEuzEZ51yazRESvS+OWetHv1y+X3xQm6b3Zfj2ns6ipC
	 m85blEzI12GXzVcRGR6jmBsYcJZhESBKwG8VGF9/fbpCKwQ4Z2y0fctvdcEh4UaJkW
	 oVRRd2zN2BGNhBBch35/hTT8St+5vnnxtifDOG3Zgj/yHO+rYXTgbU2m/rptfetO9f
	 7w0xFp6mE/XoZP0IZX6Low9M8aWC8oqS0uj1Go7P3MTzZOIeJATPB9t9j6nV/FEUcL
	 PRmEHIMbbCeGg==
Date: Wed, 4 Mar 2026 19:52:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, 
	bhelgaas@google.com, corbet@lwn.net, cassel@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, s-vadapalli@ti.com, danishanwar@ti.com, srk@ti.com
Subject: Re: [RFC PATCH 0/4] PCI: Add DOE support for endpoint
Message-ID: <26wdt7pasned57ghi6jxgei2ho5akhmlwpycihygd77j5hwne3@tponymt2vudp>
References: <20260213123603.420941-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260213123603.420941-1-a-garg7@ti.com>
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

On Fri, Feb 13, 2026 at 06:05:59PM +0530, Aksh Garg wrote:
> This patch series introduces the framework for supporting the Data
> Object Exchange (DOE) feature for PCIe endpoint devices. Please refer
> to the documentation added in patch 1 for details on the feature and
> implementation architecture.
> 
> The implementation provides a common framework for all PCIe endpoint
> controllers, not specific to any particular SoC vendor.
> 
> Posting this as an RFC patch series to get feedback on the design and
> implementation.
> 

Just left some comments inline. In the next non-RFC version, please post the
EPC and handler changes as well.

It is OK if you can post them separately so that we can merge the common bits
first.

- Mani

> Aksh Garg (4):
>   PCI: Add documentation for DOE endpoint support
>   PCI/DOE: Move common definitions to the header file
>   PCI/DOE: Add DOE mailbox support for endpoint functions
>   PCI: Document APIs for endpoint DOE implementation
> 
>  Documentation/PCI/index.rst      |   1 +
>  Documentation/PCI/pci-doe-ep.rst | 297 ++++++++++++++
>  drivers/pci/Kconfig              |  14 +
>  drivers/pci/Makefile             |   1 +
>  drivers/pci/doe-ep.c             | 671 +++++++++++++++++++++++++++++++
>  drivers/pci/doe.c                |  11 -
>  include/linux/pci-doe.h          | 107 ++++-
>  include/linux/pci-epc.h          |   4 +
>  8 files changed, 1090 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/PCI/pci-doe-ep.rst
>  create mode 100644 drivers/pci/doe-ep.c
> 
> -- 
> 2.34.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்


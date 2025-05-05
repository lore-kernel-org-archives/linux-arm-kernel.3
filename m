Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80ACC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 06:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/onU3pytGq7Cti4enjejB+4KbBxk8UDjILs73f4T614=; b=YCCfuqQ0E1MK+dIzMmJ2j6Zp9H
	ENN61UnQdqCYYBGSrCcVSN9HYPQYIIaBBOvCJNX2bkEv9PsophDQwH6kmDNSupi/OZcdHx4gvUvZN
	Fv3QRnXiWtQGu+1E15VjIuR2WJgo40skBQp/C7XC/qElbgeMpQRFvsXxl5PTzGxI5I35IG0fR4x8f
	m4V23xmaKXTd8O3Vxb2jPK+HdHLAIyXvPy43hOCMipALiigdZnMBNdfRMw9/Q2DUYvvADg/IFufvw
	6nIQsDja9ASyLbSHpKPdzROcZL204iaAc0Glh18mlwhgzFK0ux+6KvvTU3wbG+RmnpJV/VNxGjb6i
	0lsHO0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBp4l-00000006VDk-3UNl;
	Mon, 05 May 2025 06:13:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBp2l-00000006V3y-0oHR;
	Mon, 05 May 2025 06:11:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42BA961126;
	Mon,  5 May 2025 06:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C00C4CEE4;
	Mon,  5 May 2025 06:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746425470;
	bh=/onU3pytGq7Cti4enjejB+4KbBxk8UDjILs73f4T614=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEq41/2bIMms9ypRF6tqEG2GaM8ZICDmeIYyf68vMNKTZAVWTaiIMbnxTJA2+fujG
	 LNyKY59iW28U9Uu8fST/vZqVMPmitZUSDjh7/GcBwmleRaLFCnYV+pN6gcdS9NFBT/
	 toijjkXxSxKbq40/PMFhmsy4Cy0kEhSFSZ+nr9FKtMMHnvpJ+0Lvq7OEl3f6417vPk
	 pMZ2UD2yZN6NHvgK5gHdWnECiokPa+Az1iTyBWgQz94OEObQVNFiA/Juh0a5YaYoiy
	 QfaXlVDtfNZqNTj8sDn+1BppmXnACwtdNM/I2iIEBIQxPTAEPLlW7S2abwlPEVXVqT
	 wjwXhvLhhtq4A==
Date: Mon, 5 May 2025 08:11:03 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Wilfred Mallawa <wilfred.opensource@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: Re: [PATCH v2] PCI: dwc: Add support for slot reset on link down
 event
Message-ID: <aBhWdySIH7jlIZMA@x1-carbon>
References: <20250501-b4-pci_dwc_reset_support-v2-1-d6912ab174c4@wdc.com>
 <aBRtNOLQ6R-5iOB4@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBRtNOLQ6R-5iOB4@ryzen>
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

Hello Wilfred,

When submitting V3, please change the subject prefix to:
"PCI: dw-rockchip:", as the prefix: "PCI: dwc:" is only for patches
that are generic (and not glue driver specific).

Kind regards,
Niklas


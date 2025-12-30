Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA39E92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jl+dptLGleNMNNt0ddspZ7Rpw4S0QeVkhBcwN35gCUM=; b=lwQCw7iDJitoD0ujwCztAv4a2h
	uLQ4V6ZnNP7dPGigDOG/Yvg+1GTQDQXroPTAdtNBHJRqe811ZlLJx1Zp3qTp2MQsYT5jodePQ+fSf
	uKs6hguRbTb8hxpUGeMFiYch2wA8tTN3Zgq9m/mVmcQFVgC1in1Krs3GNc9PtzHMr0ZSkQ4Shg4ur
	xWhWdT4iLcxD1OdBjDE3GCN6EgS/pPK7LxzHIiiz9n1WZOBbQszgtWnE7sSRKRLJemDrs8WlakGj9
	RDDmNqB+tJ10VDg5R7tURDnlXsSVLM3wUSYNa5NWXs4rfCJYsoqCpvSAWKcPB/0kHySvVZMwVFEkA
	3dprwMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPWV-00000004JKt-0EgM;
	Tue, 30 Dec 2025 02:31:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPWS-00000004JKW-2alY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:31:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4DA440505;
	Tue, 30 Dec 2025 02:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE71C4CEF7;
	Tue, 30 Dec 2025 02:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767061903;
	bh=PpmZYSJZUmcJSLVio/K5CzQLpAMxvk8XXs1hZULmZo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnZqKccpeffYdpN549CTIEwOOmr1YyKa4QV/+pvBpPl4QbVUh1LKPjgmHlt1Il1Zy
	 lxJplZMJRYpYQF3V6/l5QuoR/wch0lVTElbukOBOwao0OOZ9es1nxcyB9YMd5IALlS
	 Ljp9nFLloazOIC0cMR73R5GpfIjC0mjp/n8SU8eVsCWRbc+ub+ZikFKDiiAnNFflJ9
	 6PsOHyRqJXRBRAKfY6nTR6lz7oCKxN0pAX44YTbd3/mb9QY+0UgiX713XuFfBRvtoG
	 kNbKXCLfIjqKKrsiA7WALxwPLKD4qbO+FEw3As3lKwyzbi9ZI8oXha82NQEDdY33Nz
	 NE0UTKWCpIvfQ==
Date: Tue, 30 Dec 2025 10:31:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com
Subject: Re: [PATCH] arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on
 DH electronics i.MX8M Plus DHCOM
Message-ID: <aVM5iadHU5ipnQ0M@dragon>
References: <20251202134200.8397-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202134200.8397-1-marek.vasut@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_183144_680790_FB1924BD 
X-CRM114-Status: GOOD (  10.73  )
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

On Tue, Dec 02, 2025 at 02:41:51PM +0100, Marek Vasut wrote:
> Add missing 'clocks' property to LAN8740Ai PHY node, to allow the PHY driver
> to manage LAN8740Ai CLKIN reference clock supply. This fixes sporadic link
> bouncing caused by interruptions on the PHY reference clock, by letting the
> PHY driver manage the reference clock and assure there are no interruptions.
> 
> This follows the matching PHY driver recommendation described in commit
> bedd8d78aba3 ("net: phy: smsc: LAN8710/20: add phy refclk in support")
> 
> Fixes: 8d6712695bc8 ("arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus DHCOM and PDK2")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied, thanks!


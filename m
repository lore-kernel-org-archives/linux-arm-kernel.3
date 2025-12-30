Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42116E92FE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oS/u65DtVc43kWxAOmE27wZWLb+0T97SmKn991pfw7k=; b=oZTw+hGpszAJRKK3glGJsmLmZg
	Tw1rXKHLNI8/+PD6CPEiXNgbCIrXyIn3Fadfm6maopG9morEGf+RvP2WCBHsFX1tVYOnMjMr8hqO7
	rJvDbW8ofO1i0KoJ10bWKon7a5N4AiVCT3vuBpyCyQMxThRO7K1drCpiFZgRAranSEJUXmLQn85QD
	Mrg5OzuZTK1acbpkFeNRmlFNI7lL+fJY9y0zvb4bp0/U761s2QCk9M9EjH5jCQn0DIylE5pYfgv3Y
	lwvgnHooi/2YdTBZMExVJ5GXIx+i/QMs554aRHqdAE0yaWnlDyjBaM2LAaA/q6S0y4daLwkRGeyLd
	YT5Uuffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPZO-00000004JW5-2oKB;
	Tue, 30 Dec 2025 02:34:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPZM-00000004JVf-0Kv4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:34:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E2FA4425B;
	Tue, 30 Dec 2025 02:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2685C4CEF7;
	Tue, 30 Dec 2025 02:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767062083;
	bh=wJVGkSrJGS6nKQTsVQJ8xPBvCeoZSgJcaM+oaFSM/jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ktNMvPaOCjzqObrT8Wed4EYqEdN6p88QowFBNCc+ZyS9kc6fYv6uXAI3w4KHWd5gS
	 eTVSHihz2u+0N64QWEbFxl8EPUnA20jYo5ibiWosN9S0oZP6ODtFJK5GSpeTTSSeR5
	 elfzsA80ANBeKfYFTaamPDALAyR3aojZkaItz9QXU+r4oFGrOCOHlk8LIXKUZq6Pew
	 4yPxKYhuETrB2pERb5JZnIWPdNfflO8rw+PQwR2tGV7TDi5xw7qwpZjLUhypfj3sbk
	 rXc3Z2XagWu6CsOLAulAgE7ynmoTL6s+Fox1rgh1UpoIaX77B1ty3N+5L+ERL3hPGl
	 XFVGix9gBN8tA==
Date: Tue, 30 Dec 2025 10:34:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	alexander.stein@ew.tq-group.com, frank.li@nxp.com,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2] arm64: dts: imx8qm-ss-dma: correct the dma channels
 of lpuart
Message-ID: <aVM6O4OMk0I9F0Cc@dragon>
References: <20251203015956.116364-1-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203015956.116364-1-sherry.sun@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_183444_139064_132AE4BB 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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

On Wed, Dec 03, 2025 at 09:59:56AM +0800, Sherry Sun wrote:
> The commit 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel
> order") swap uart rx and tx channel at common imx8-ss-dma.dtsi. But miss
> update imx8qm-ss-dma.dtsi.
> 
> The commit 5a8e9b022e569 ("arm64: dts: imx8qm-ss-dma: Pass lpuart
> dma-names") just simple add dma-names as binding doc requirement.
> 
> Correct lpuart0 - lpuart3 dma rx and tx channels, and use defines for
> the FSL_EDMA_RX flag.
> 
> Fixes: 5a8e9b022e56 ("arm64: dts: imx8qm-ss-dma: Pass lpuart dma-names")
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>

Applied, thanks!


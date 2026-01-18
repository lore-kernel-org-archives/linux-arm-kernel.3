Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0753AC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 06:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H6qkcg7FpS+jbIKmcxBel645Dh8VrUL44OM243CI2A=; b=X4lq8s9+jAOklkMPT/W1VIYANF
	mImFNOsqcaLMB5BXbB2dK08PNqP0UQKt1EWd8yZH2MGkldAc23LaIpnE6tZTd73xqdOtnMwJfmVpi
	9p4jnQx2C81wkt47Blmj/v+5c7VVMjrfcj+AHMiEKc20Uy/Irm26w+1DHeW/CoUyqVcUmX4n6XFPj
	PfdC3ekb44R/BW5RS9xSGfWteoEAGEYW/GvSawaaMCKakpE2fQKnL8E7gyW+1HJ1D18kK7kta+/P2
	/TLw8AOD5fsKaRQpG2/zMwWCrfmvxIAy+zv4BO5ppTnafAKKvkBLbFV4tuy1qw0QD+dVDmOfYzei+
	9LalVfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhMKY-0000000Gupq-1QTC;
	Sun, 18 Jan 2026 06:32:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhMKX-0000000Gupi-08FL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 06:32:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 788086000A;
	Sun, 18 Jan 2026 06:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D89BC116D0;
	Sun, 18 Jan 2026 06:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768717928;
	bh=xwxFLFB+V+PALi90Qr98yNFTuLUgRc4/aKQHk3Dh4Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZICJ/9PuP8XqJ8eNIBY3QzoVGubh2h24qYSCNx0hjKx+MLu9oMBlfBtPfDx+d9a4+
	 G07nnNAYOw5hRlVDUqVlVMttV4aBOPp5Z8s99A0skXt864FYdu7blGUpw09DrS4sAi
	 zVjxwTm7V1s5nbw2w8FA7XSdspl2+QnPIBiB1agHrjlX9ujwdTSfF95nEeWTdddut0
	 IgEiAi2TzcQmTYmvNNOm0GhQw+gdYNwbBhXQqw6zqBlquXHFJvR3MBAFKWvHNsjYO2
	 S8UMug/9/fDIJD76T8CPAPTM89snBe13uhzhK3iH1FNeLzWAz8W2LBKrehSN0bcB4r
	 bnyjLCRFHiFQA==
Date: Sun, 18 Jan 2026 14:32:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Francesco Valla <francesco@valla.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx91-11x11-frdm: fix CAN transceiver gpio
Message-ID: <aWx-YmUJiu403JPM@dragon>
References: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>
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

On Thu, Jan 15, 2026 at 06:41:10PM +0100, Francesco Valla wrote:
> According to the HW schematic, the CAN transceiver does not have an
> enable pin but a silent one. Fix the GPIO property name and polarity.
> 
> Fixes: b4bf5e55899e ("arm64: dts: freescale: Add FRDM-IMX91 basic support")
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>

Applied, thanks!


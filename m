Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF4DCA5FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 01:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRxX0AhHkbpY3VorsRq73IrlcT0xpYFDS6c5YLiLkOA=; b=s6n6kRoAMnvJb/Ytq7LPjopP7/
	0z+nl8Yhuq4ETMZBhBnlY89wUntGvP00HP6gPczvcnP6uKhAJ5HkCdwWybcsLDWFyLJrGkw0P0FKO
	TbxFnMVL/7dAtY8c8+UwmzeRJZB6E+dj/fQpYRWBUstLXyrZ5N19ZAvQRDp/9msFvJyIppktD2l/X
	yK7I4f6HpUttphRbudW5KYOpFEeVLw7VcqAin865xsajxHv9Kuim+BAOQPCahWBMee9iiniuMkFmE
	86Rhs4mIWLEvBeng16vMm0Z+50T+jD7UheyAnksdLnFujBPEqfPWmT9TWrvRZx9bHOP67BD1G9pra
	3S58LnEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhI36-0000000GRlc-1qPD;
	Sun, 18 Jan 2026 01:57:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhI34-0000000GRkz-0Pui
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 01:57:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E38642DAA;
	Sun, 18 Jan 2026 01:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F70AC4CEF7;
	Sun, 18 Jan 2026 01:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768701469;
	bh=uv7zhOp4884/tuKtAkmrUryWBtd8KN/Cy4PHDVLMqy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yv/2Kb22Uhhp9sQTuFOCntQG0IhNQMPorxaELC9SUTyRyEQX8Kqjn8+HSOq1CUWT3
	 9jnFRdVhSPAMkvaIOjgIA0ykrmD9p06ldpN8seX0mNlwwfjMGGMy+cXBgvgMY2nfZr
	 IPexC6ehzffs1SJzwCcuyvA98fhqDlLl/bR6UT+gwKux3NaG5CmvhwIpnzqCIhNEXf
	 fMww4CXIu3Hnlo4q8PB51+k7+dDmVGCNwHqXgFKiHfYZTuWEiFw4zLNf2SvIIFBntP
	 pMjzpycKs+tBnvZctns+6uWckXLw6OQtUQbwtZrx5NrnkLe1AwYpV8Ym58R/dFlCP7
	 vIlShx+Nof+VQ==
Date: Sun, 18 Jan 2026 09:57:43 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: s.hauer@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, haidong.zheng@nxp.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-11x11-frdm: Add MQS audio support
Message-ID: <aWw-F5KS4YwzaQEc@dragon>
References: <20260112134712.464063-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112134712.464063-1-daniel.baluta@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_175750_158614_20C23CAE 
X-CRM114-Status: UNSURE (   9.89  )
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

On Mon, Jan 12, 2026 at 03:47:12PM +0200, Daniel Baluta wrote:
> Enable Medium Quality Sound (MQS) output on the i.MX93 FRDM 11x11 board
> by adding sound card description and enabling SAI1 and MQS dts nodes,
> together with necessary clocks and pinmux.
> 
> This supports audio playback via SAI1 DAI which is connected to the MQS1
> block.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Applied, thanks!


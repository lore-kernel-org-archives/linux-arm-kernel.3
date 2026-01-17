Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F98D4A5F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4f1OltOF8M9FDAWEzKw76BpHWK6Fh8W/Z3ClfMBRQU=; b=tB3hPLreyVhqzdvuNH62SucViB
	mOKHk8IvmgJEfVNgDdO9FWWGHEfWXBc3uIYWpd1lJ4/KWJia9d8+FotXuccpectPncjM2lllHCD0O
	MAe8EYLdY2IbMf11OBniXSuOhisI53C3So1j7UK2lfveGZTPVuY6xzUvd8TatSB+A6HfpF1S+x61z
	d98AIneiJXx9UAXXvuyavlqHWdEWoZnqR5BF8PPTKlgbdlrN5upO4xNkljgEmRzoLAU4TIvQxYGYm
	OJ4zxZ1zrqNMGfF+cGOdXc9EtniaSelzATkwxHfS8o1XpCo765QZ6K89d7fB3Oe5E8gLB2Pa9v0ck
	rQ2LhqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgyy0-0000000FIUq-2Bou;
	Sat, 17 Jan 2026 05:35:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgyxy-0000000FIUj-0Mgb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF66160127;
	Sat, 17 Jan 2026 05:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4074C4CEF7;
	Sat, 17 Jan 2026 05:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768628116;
	bh=ceJeR19228xDyeAf7C6ytS7EXYJ6ms0mb5AIMVr7rVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GjcOSWVIRQ1clNcdTf12UnxA2dLkPUV6bd8jHSggg3bYjltwQY6EgMzkO/wo7ofv3
	 Mc7+T4A/1R6lMhetZrejlNY2J5oVUsaSKaQKvGlCb7z/SUqCGPUbXAHDTMEBfYfVZt
	 e/sebQmpYqjhrfvxuRPPZua0O8LyDAoHV7RUqn5oduU0FIO5yS/GHf/Lr7rDcoXbij
	 BQhp+u2kwv4xfMBYIoP2OSa5t0qbumXrsILxU7LudZqp14zwwUTf9UnDjXmyUdoNIv
	 +I1FXS9aKFRmQ5Zk5WTHhHXSkxChrS6WqAcAFZBFbyXyJXqtyIYCrBUivJtuEJ/0Lp
	 q7ifkYnt7O0PA==
Date: Sat, 17 Jan 2026 13:35:09 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rain Yang <jiyu.yang@oss.nxp.com>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
Message-ID: <aWsfjTMz04r07bEU@dragon>
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129143220.14834-1-marek.vasut@mailbox.org>
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

On Sat, Nov 29, 2025 at 03:31:30PM +0100, Marek Vasut wrote:
> The i.MX95 imx-sm introduced new GPU_CGC clock since imx-sm commit
> ca5e078833fa ("SM-128: Add clock management via CCM LPCG direct control")
> which are downstream clock of GPU clock. These new GPU_CGC clock
> gate the existing GPU clock. Currently, without clk_ignore_unused
> on kernel command line, those new GPU_CGC clock are unused and the
> kernel will disable them. This has no impact on i.MX95 A0/A1, but
> does prevent GPU register access from working at all on i.MX95 B0.
> The GPU_CGC clock are present on both i.MX95 A0/A1/B0, therefore
> update the DT such, that the GPU core clock are the GPU_CGC clock.
> When the panthor driver enables the GPU core clock, it enables both
> the GPU_CGC as well as its parent GPU clock.
> 
> Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied, thanks!


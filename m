Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26D4F3380C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaK6Ll3LrTBTXiPHL2e5DRNcXYS1LaWckFHKGlZlTko=; b=xWxobu6dMK++D2iau/BrJm/OPd
	S9PYIninXEk81RTxDrpeklbs2rtpSKTslJJ+0TbLY8Yx8CaCy8W+LNaLRHsi0Z4BXkR9HxYRMvGyA
	oegNa0naBz+Fn0IqtK8PANcQiKxIV6O5/qmNy6yko2r96SHeHSnHoyh5fIDBOBAPUWaoByW11EhkD
	6fsvHd4MU1wpXQpCyZVdBB5ltczucxNLb4kjRBFX8I+dc2NmGdK2R8FLdj3lTRK7oCd8jMlncQmGv
	0mFjIYiKxE2XsXrJwK3/ZW8nhBAEg9gK8sNcFhPUF89R2860vau9zldCtDH9B9mSIHerey5qZ7fSn
	TV6AlATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2POe-00000005gtI-44ju;
	Tue, 17 Mar 2026 08:03:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2POd-00000005gsz-0d24
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 08:03:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D7A960103;
	Tue, 17 Mar 2026 08:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63666C4CEF7;
	Tue, 17 Mar 2026 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773734601;
	bh=C2n3Bh4IMnS+Db8fN1VzLFfIHd2WnC9Bb8dscoV8+YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=idjx2NFwSiLqX2HOhxAHnHgvc9dAM0s6kh/RGJTk6QtOqAn6dPXI458stw8Cyyqn/
	 nF1r8IWBF6PlOtGf6R4Hv8V5uLgIGtrwM9KpSXICqmEo5eCnw6Ph3LQ4DjUfWK4yIZ
	 t+/wePKghcIRf3gERl8EMEf/GUXqDpDkickBMwCd6UdE1bvXvu4X5+H+HwNUxeAOgv
	 G4sSwX4blcJ1O8/dzZ7hnCB1Ix66CZdAHPaJxVGWyFzvdknIIzYNggyRG52b5roUFO
	 AiwSSKCXZNxdaqbHNFprTDjPCmIiXu7uctdGHCaQznW0JpHYrmLdg+KvuvO4r1W8BU
	 0tWU9or2O+NFA==
Date: Tue, 17 Mar 2026 09:03:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: soc@kernel.org, arm@kernel.org, Fabio Estevam <festevam@gmail.com>, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [GIT PULL] i.MX fixes for 7.0
Message-ID: <20260317-jumping-corgi-of-defense-038bcd@quoll>
References: <20260312153557.3338430-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312153557.3338430-1-Frank.Li@nxp.com>
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

On Thu, Mar 12, 2026 at 11:35:54AM -0400, Frank Li wrote:
> From: Frank Li <Frank.li@nxp.com>
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.0
> 
> for you to fetch changes up to 04d00f57c168153758d2c6a2395d20aadc785e3e:
> 
>   arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V (2026-03-06 11:19:41 -0500)

Hooks fail.

Commit 587096ada520 ("Revert "ARM: dts: imx: move nand related property under nand@0"")
	committer Signed-off-by missing

Please implement basic checks from beginnners maintainer guide (LPC
2023).

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B242D35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqnHb/JXJSwe43lnwmw7bv2s1wwvoNWdSVpKNvjiEns=; b=L0YZgzFRNzUBtJgEtjwVk7DxkZ
	apz/6gSvHpBWPvMSn4GsehLJarIYcs9UsKyn4AbIhAjWoeMh7tZAF79aReM93V05UWIVRvVq5RtZh
	7P0dhFlzw1WexwNoMXm2amxoJKMQrrJy90GJSo8vyTNghbD+HsRHHfMDyjzUcQTK1IKoOd+UiQsiw
	Zi44YVm8EfP7+31g5kTTMbgpFVJw1GaEWwTI2TWkOzODbIbElTlXjVlRGZ3LS8F6TG1CEDb8EJhFr
	ghK6AvOethx+/HKyD8tQrXwJ5E7q2eVljAmlBowInwyLMg18X+QdXC7DXwsw6jr+eGR2UEzFmp8VU
	vdgunVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tim-0000000Edwk-2tfO;
	Wed, 01 Apr 2026 11:26:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7til-0000000Edwd-2PEG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A28E60131;
	Wed,  1 Apr 2026 11:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4BEC4CEF7;
	Wed,  1 Apr 2026 11:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775042810;
	bh=m8yKhzC3LaxWjfpfpdy07UdKE1XsSYKtP6Sim+B+8Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwaJapGr4tnl7p14mIb0FOFPVc6cJdGfKQU7XuiYmejgQcBwRMLwJNzfCTxrDlk8w
	 +ZJMiYl4CPbLG7+igfwiVF8dAU6V9VvH4lbBl6p5zMCM7kb+NXoPN0oUOqBF3/lL3q
	 Env03O7LT5/2jZg+8q3J1HdUqaTugS6ZSZ+Y/ddNteJ4/Rr3hZgPePzhgPZSnYoojS
	 EwDlnEvT3KbVDNt3S0nD+nutI/qcL5pSEzS+ja8UdyokLmHI49A4KYVYTk1qDKhBMs
	 ++699uVrcLPcOA/r7lCWCsXU1pBGtuFQ3znOiT2YmhISYxaxmCGYCvPiCqhYl64J/K
	 NDRvRy7C+Ab/A==
Date: Wed, 1 Apr 2026 13:26:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de
Subject: Re: [GIT PULL] Reset controller fixes for v7.0, part 2
Message-ID: <20260401-ubiquitous-brawny-camel-bfb1e4@quoll>
References: <20260324094255.3538772-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324094255.3538772-1-p.zabel@pengutronix.de>
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

On Tue, Mar 24, 2026 at 10:42:55AM +0100, Philipp Zabel wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit e0cf84109bc6c6768337123f1de24ff56b41c91b:
> 
>   reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it (2026-02-23 17:03:28 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0-2
> 
> for you to fetch changes up to a0e0c2f8c5f32b675f58e25a9338283cedb5ad2b:
> 
>   reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:47 +0100)
> 
> ----------------------------------------------------------------
> Reset controller fixes for v7.0, part 2
> 
> * Decouple spacemit K3 reset lines that were incorrectly coupled
>   together as one, but are in fact separate resets in hardware.
> * Fix a double free in the reset_add_gpio_aux_device() error path.
>   This has already been fixed on reset/next by commit a9b95ce36de4
>   ("reset: gpio: add a devlink between reset-gpio and its consumer").
> * Fix the MODULE_AUTHOR string in the rzg2l-usbphy-ctrl driver.

Thanks, applied

Best regards,
Krzysztof



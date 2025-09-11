Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9032DCAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOoaNmmCp0BzwvMOLv3DXAhJ6yBeHeViJm71oKOUsDo=; b=xNJVexa25l5iQIBxF61lgANtw6
	19BU+wFlQLeOj5xxI3QOYyoSJU1wUpiF+CQjyNFIje5YM40vaFsHQxMG6QPJ42PA70FEI2Dhj0+2T
	2zZgPvPXepW0QyClP4xwElDGmCRS3GDh7ts8axEOhUJ6wnk8+jsS0ou0ub9gYaxi/+tXlyGUBtHNc
	HwxeTEv05XMVRUK4WwdkiTtvXbjQNR+SZH0ZdnuKiembFYpwVGNikLGskVNPY0lPWVdxuMXpAHaG3
	LVUERGK/kiVWgwDHBJWMWn4diC6I9rMf3DUboWdKVs5n013GyjD2C4T67Y6C9eAG3uNcEXgOcAuBM
	OJTd0upQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweao-00000002ORD-1k01;
	Thu, 11 Sep 2025 10:31:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwean-00000002OQN-0C6G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 10:31:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7831F60208;
	Thu, 11 Sep 2025 10:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8575EC4CEF0;
	Thu, 11 Sep 2025 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757586712;
	bh=gS2weFUR+ncgV5TkM5dtRR0yU4ygK56P4uQOCMuOTVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPeidlrLVFVQvIMpDQUjBt7aE3/Koh8LezVfJHAhOLft/ifOxDs13u2ZqvtoWoplT
	 f8A0Ju+FqdQyY/Z0RsvmB72DQLhrT0SOkF3OG3WXG8Zkcs/Nir5ZQxaQyuFrCL0+80
	 Iv9ImkmL3OQign8E/ewgSOAr2XvyYORbC9IjV9nPd+WX7QRjRA7+NKWkrc5P9zsk7z
	 ia2CFHUPHpD1HslbGUD7dtuCqjl1jfN9FbixTEh/TLohC6cl7C02C2WEiEqzlQd/rD
	 LJO2XzZFnHJ+f9bCaLr27zvRUSxY54MzsimYXoxrZjaZiAavcQ7j24WcczVzXqWIpv
	 +1WPDmxyt05Iw==
Date: Thu, 11 Sep 2025 11:31:47 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] Immutable branch between the MFD and GPIO trees for
 v6.18-rc1
Message-ID: <20250911103147.GI9224@google.com>
References: <20250904130516.72266-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250904130516.72266-1-brgl@bgdev.pl>
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

On Thu, 04 Sep 2025, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Lee,
> 
> Please pull the following MFD changes that depend on commits I already
> have in the GPIO tree for the next merge window.
> 
> Thanks,
> Bartosz
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio/mfd-stmpe-for-v6.18-rc1
> 
> for you to fetch changes up to df6a44003953fb23ad67f82d299e439e7ff7150a:
> 
>   mfd: stmpe: Allow building as module (2025-09-04 15:00:53 +0200)
> 
> ----------------------------------------------------------------
> Immutable branch between the MFD and GPIO trees for v6.18-rc1
> 
> Allow building the MFD STMPE driver as module.
> 
> ----------------------------------------------------------------
> Alexander Stein (1):
>       mfd: stmpe: Allow building as module
> 
>  drivers/mfd/Kconfig | 10 +++++-----
>  drivers/mfd/stmpe.c |  6 ++++++
>  2 files changed, 11 insertions(+), 5 deletions(-)

Pulled, thanks.

-- 
Lee Jones [李琼斯]


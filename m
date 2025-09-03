Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3D0CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDJwnaz7Zs5+VMTXMTQeGTmc5cdrcpBQ2gvg3FL3kd8=; b=2mdlsq8FZO3NnxhT3PEfbCwvht
	Zm3tuRZUQ2DwOeqm5EFq0IaqXiE5QMKEoo5P8Zloz2cPyOy5Hq/g80/ajX5QLFDkZ23C5jo3yPeeW
	4o303m215vaAwcmOZOzKcBJim1zOWrUDcmt8QPuhi/y9JURUnsg+4ikINr11eExf7ctZ3rg26fIAk
	+AKNlTL/25NjneWksEsb7Y+iOBEfaORgQARjBTBCWoWJpp28xhXo255UEHQgFS23puX86qD6Mtqx9
	ITXAVRqBwFB50ZM0sPJimcFRG10KIG4dwAyhFZmWCYnlunfjjqrB7h/1kZKo+t+3LAWG09n0JragA
	AXgG+dtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpWJ-00000006wAF-1s0O;
	Wed, 03 Sep 2025 15:35:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utn1O-00000006Ttz-2Qqh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:55:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8FBD44569;
	Wed,  3 Sep 2025 12:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88660C4CEF0;
	Wed,  3 Sep 2025 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756904129;
	bh=BhWff4LgXnXlgt+WyYgGJOYpISIrkJaU/yaLsUYKaj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwIWfSKRaQkema1FW9jA7Mr7A32Nx66R0pHZKTk/sZEEnU8TfB40srHxVK6reVAyw
	 lsXugAmtCeMDAYggCNIlBTW3DguBZsYAZ3uwBO4ZpFdbf86k4PHn0xqgnH2hnI2fEc
	 9JZYMGEunXBn3BiMqqmGu3+4F4KOd8YenWK9LQPxv0FHgch1q3lQFVwZyBxixm949h
	 8ruMxxjFf+Gz9r0EzbYrGPlFwHzJwA9lxCsB0WnLbg7yd9z3ydXpDpJbX8ZKYXdnFk
	 j6XzWIqcvRTOI2IdCYt4H+QxbhKT+gDxSLF7j44u/cUHBdrI3ttLPUPjmd3LCKoVhp
	 pV7JpJJ0wxGgQ==
Date: Wed, 3 Sep 2025 13:55:24 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: [GIT PULL v2] Immutable branch between MFD and GPIO due for the
 v6.18 merge window
Message-ID: <20250903125524.GP2163762@google.com>
References: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
 <20250903090922.GE2163762@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903090922.GE2163762@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_055530_646871_6214F1EE 
X-CRM114-Status: UNSURE (   9.66  )
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

This time with the correct commits!

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-v6.18

for you to fetch changes up to 9b33bbc084accb4ebde3c6888758b31e3bdf1c57:

  mfd: vexpress-sysreg: Use new generic GPIO chip API (2025-09-03 12:45:33 +0100)

----------------------------------------------------------------
Immutable branch between MFD and GPIO due for the v6.18 merge window

----------------------------------------------------------------
Bartosz Golaszewski (2):
      mfd: vexpress-sysreg: Check the return value of devm_gpiochip_add_data()
      mfd: vexpress-sysreg: Use new generic GPIO chip API

 drivers/mfd/vexpress-sysreg.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

-- 
Lee Jones [李琼斯]


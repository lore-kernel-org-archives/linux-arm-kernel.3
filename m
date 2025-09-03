Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FE0CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgcggLkUGVL0QG5r/SHb9KMlMwv9arMWhjksaWq+HEE=; b=EeHYaPL/kX+xfNDdXO/cogZk0u
	dHIwGt3PFqBhOwXxt7Ji26Ja+DStCQf0cOdzlHlODmFOiqZWJOj2rpCeovqjvcrLKGqoCEt38d92y
	c5ndisa3qStBWsNx4ORbYJ4ps8tyzOBkS9JxIgJkBlpO4xud3VvO9QIJgqfYk2UNQVwZQ4A+mCB+q
	8bQ9rM8SkY0Ch6tvNhyJeX3EPhfstkzVkXp1QNA5xqW+XQKf6CjgzSh8yNbeLf9LyeyK/5UOdjlQR
	Xu/+hb9YKAPDjlYALJNGrsOVtFNwcEGbw642TsKoCRSeY/GVCnj6L0f1wPYi/KQVWyTZ+3+mYdjEE
	qN0nevoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkfn-000000065mP-0vcp;
	Wed, 03 Sep 2025 10:25:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjUe-00000005t4R-3W60
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10F3F6013B;
	Wed,  3 Sep 2025 09:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA8BC4CEF0;
	Wed,  3 Sep 2025 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756890567;
	bh=aaP//DKoTyXw9b8rEWxNVUG0MySjvFrbnX2ldK/9x0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHzxVUEcYuKnulw79ljez7oeIjUJNNWNO7i528aKEPlAl1ntv9ggYy+XnTmo/exA2
	 KD0r8/E3XdmFS+7VE0JbmOE/xOVelb93O6LJMw4hC4XM8Hr8aD3nNJ2tsRUvK+OEKu
	 4cTIHW801CPMzmNxrI2HXBvNJr6SVKAkVXQEC9eV+mfxGkHfpzBtSZE/swbSyfmm6c
	 uXqZV4Tu8n7sQXCOHDZM+y+BJ8Oftf8VbMU6qAj4OxqxsUAWmkUpnvm7dbirnXWPyV
	 jQm1jZJ8rI9Mc/JCdLTVJm8USFnuyPYwIDGM/u33ik6coOnlxV6tKZ1KOMWjRVCxHn
	 7o0XhIH0JnHyg==
Date: Wed, 3 Sep 2025 10:09:22 +0100
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
Subject: [GIT PULL] Immutable branch between MFD and GPIO due for the v6.18
 merge window
Message-ID: <20250903090922.GE2163762@google.com>
References: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
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

Enjoy!

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-v6.18

for you to fetch changes up to b7fe89d2ea0dc9c823b103ad982f97a00d50e04c:

  mfd: aat2870: Add GPIOLIB_LEGACY dependency (2025-09-03 09:08:48 +0100)

----------------------------------------------------------------
Immutable branch between MFD and GPIO due for the v6.18 merge window

----------------------------------------------------------------
Arnd Bergmann (2):
      mfd: si476x: Add GPIOLIB_LEGACY dependency
      mfd: aat2870: Add GPIOLIB_LEGACY dependency

 drivers/mfd/Kconfig      | 2 ++
 sound/soc/codecs/Kconfig | 1 +
 2 files changed, 3 insertions(+)

-- 
Lee Jones [李琼斯]


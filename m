Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DD4C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=OzhuWVvi6ylIFalbJUtNaxu1PqHlN/XiMXr2kWsThCg=; b=3o4RSh5Hqj/kx3
	GMo4B2MaVIKqu/y0fEmWbVY/iRhkEcRLaP5GUlemX41L/yd7bZndQFiK8a6rlz49tYzk7AJ68HmGL
	uxdSMuVZvJouLR26xqKTGdbbsrzGBiAJEoh0vcHBbcot68vhK5uRjb/tdEZKjHhixDaHdyFy53wxr
	YP9HKiD0Yq2FIv0xZV17SZ0MoBFz8WCdp5QyA/J0vTEageAkGE0cCApWu5kBxnL1xX9QPe18nKAdb
	O6cYxppgOs56g5BMeQrnPv2juXyI8/1CV5i2EBXPKCkbJ7OyGT2TTADt97bHOfCUzC29ucd1Jrc1K
	getvzphnfbEKP4camY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NmA-00000008VTe-3XqF;
	Wed, 23 Sep 2026 14:16:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Nm7-00000008VTJ-45xf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:16:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7320D152B;
	Wed, 23 Sep 2026 07:16:37 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 551B43F86C;
	Wed, 23 Sep 2026 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790173001; bh=pjn94+QqUnplTf/Lw8dWChtvZoqbVQzZ8y3uw2QFkK0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Gx8orI2ClszWd17W6QarNcdz4HjWcAVSUfocdkWWupY7BYnCdOl1+ghmFEZznYJ7X
	 rZUKyAfbgqhAIeBAo+EAgkpUgGl63WGXSVl8onWaaUU6DzMO8L3XdhAqijee00jNWV
	 IDeczs3B4hH++oOrlYSfwTCms1AeMaB4V4aEJ8qI=
Date: Wed, 23 Sep 2026 15:16:36 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms
Message-ID: <arPfRFC5jzVaSQvq@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-arm64-have-shared-gpios-v1-1-31af942ab30f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_071644_074860_4B98119A 
X-CRM114-Status: GOOD (  16.14  )
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

On Mon, Sep 07, 2026 at 04:50:34PM +0200, Bartosz Golaszewski wrote:
> Shared GPIO management provided by the GPIO shared proxy module has been
> enabled for Qualcomm platforms for some time. By extension of the
> defconfig, it's been effectively enabled for all ARM64 platforms when
> using the default configuration. Bugs discovered initially after the
> feature was first enabled, were fixed and I haven't seen any new reports
> for several months. Make the feature enabled by default for all ARM64
> platforms officially, which will allow us to continue the removal of the
> deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/Kconfig           | 1 +
>  arch/arm64/Kconfig.platforms | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)

Since it touches more lines in Kconfig.platforms (2 vs 1), I'd leave
this to the arm-soc people to merge (I also got a minor conflict in
Kconfig.platforms).

Acked-by: Catalin Marinas <catalin.marinas@arm.com>


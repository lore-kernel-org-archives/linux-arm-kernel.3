Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C63810706CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfsxpX2Rasu5M6lOP54anj3EUxKKXUqSaXOCQbWHIZI=; b=XSAA65kfKzManR5Ppq9jnqcZO+
	sHSZAt+tW5WwryXA+TovOLZH5AnAVq4eHT5EakK3jDvKBtXVEM1C4Bnoi+s1IGQb3/OW5pA4FaKep
	q9GEChwknDHk1Lif4yowH5FUcwUyj/e4kTUFQz5oXh9omXn+7bT2TjoiU1CYJlamvY7OfhucnXbOn
	W2rSD/gJ2Owxuiy0sMdsi6yDaGfuzEKfxO99GutOaumq8OU6DiFgkaGDsNkCwFOSFXc5Eqfxj6vtW
	W7oLil89qVTuId50hbZQ1m8dKEC9kus+fEK5V/B9HgjkZKFFJ4dq0Y9yZgBLZOVhylUh8PFBRKGb1
	hd7s2Sxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MzY-00000001mKA-0ogw;
	Sat, 14 Mar 2026 11:17:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MzW-00000001mK2-2Lck
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 11:17:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7300600CB;
	Sat, 14 Mar 2026 11:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D991FC116C6;
	Sat, 14 Mar 2026 11:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773487029;
	bh=H/7h0gPFrDlitXMFs1sPT5rW+JyCN0I7ORuwPhfuYpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHIr2U4fGsapnSXWsvQ/rnm+Xbsyk3/g+u7XWWSOxjtRVrFjFX/Rtto/iExGOMDSE
	 UNFTcN92EMWlGlMo2oERUDQgxMk2hFWr65TukadtBpLttTb7O1P5lNBLuV6Qm84Ijj
	 QLgqYojh+1eXerw/2NbbXCBnrxNufsVEqfXd5+6rHWZ4JTlscae1x720bJYyuHk1Uj
	 1ESOf3i9DwwEqOBP5S69LFfsOEWc6IM5singAeA2IT2cXeXoQwYuYgVpQQtBbqIHZ5
	 sp8hia/H2hJceajfOzyycP3d9mj4Q6gcKq/bkkwIw2XL84/6QXcollIqE8OM9CoN23
	 uSxEVVcVPyW7A==
Date: Sat, 14 Mar 2026 12:17:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v7.0 (#1)
Message-ID: <20260314-illustrious-origami-pronghorn-964508@quoll>
References: <87sea3680w.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sea3680w.fsf@BLaptop.bootlin.com>
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

On Fri, Mar 13, 2026 at 04:53:03PM +0100, Gregory CLEMENT wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v7.0.
> 
> Gregory
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-fixes-7.0-1
> 
> for you to fetch changes up to edb7efa767da8bb82d724b85178be251ec4e060e:
> 
>   dt-bindings: arm64: add Marvell 7k COMe boards (2026-03-13 16:41:11 +0100)
> 
> ----------------------------------------------------------------
> mvebu fixes for 7.0 (part 1)
> 
> - Add bindings to validate the device tree that has already been merged.

Merged when? Why is this a fix not a development (e.g. documenting
something 10 years old)?

Please write informative pull requests. You want to here provide the
context WHY maintainer should take this as fixes.

Best regards,
Krzysztof



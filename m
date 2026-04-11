Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61783F45A1B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 09:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yy28/MczXqwVyD41La5AHPL1Yo3fFp0Zz3Pe/duyaCU=; b=NAErhVOJi/OyHx2PBVtLNlBy3h
	Wam4cU60HfupUUPWgDQ7ALIslMwaDBxKKJu7OY0+l2UgxV1jnHJNfuvetgss5soEuYdVU9wlp5Gor
	a2un74eqWYTgbDnbbMQdLRx8Nm7JfWU69+CmHBARscg4T4xtOpJe0X5aVsuCPu1SO3gIMb5yEjxbw
	/nTTQvDT566gI5IkWfjZRUlwfEdw9r4tmuAkDaO6IUkOrnlCLnUK5/Z9Mfpl7xjXL3Jss/KhOn3mK
	DHvzDGWU+pJUadbsMZ76VxEuzaxZoWWbjkh8kBp9HHFw3UqQOxIjzzvY2IpoBMh9Tu3OATDDmoVFS
	pmOQ8WOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBUes-0000000DJjJ-1cTE;
	Sat, 11 Apr 2026 09:29:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBUep-0000000DJit-3F3z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 09:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC2DE43E68;
	Sat, 11 Apr 2026 09:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4808CC4CEF7;
	Sat, 11 Apr 2026 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775899778;
	bh=waa66iiXwVjYMPwroTuW2sKA1unznzskqc+15JbWTVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSKMF89bhbsJ/Sv4SzKBFapQ/3P5mpm7jjE6WXT4uuYXjX67uFLWQ6ZX2rUsWSh4G
	 9vk3RNql4bBrTeEuX/iLHMWrT8V1um7/4DSuMBJ/6IcrzRytGxEzKX/KkpI/PjhnHg
	 +OCvY3BWJy/c/MG83ad2LK/a+Y4yDOHhSwJ82FaaBUuyA2cyB+4B3h2dQeTAkqI5Ts
	 KE6Dt0s+i/cBJlBS9Ob7fo/2jsstYjMCz4NGB6gTQLp/UzeiIbkrNrf9TnqcucZHQj
	 cMaYifbLJ+BXRyY0+MNzC8PwR7UCxkPmjOFgvUOPMfBpRdxdI/i+Z+HMS5G5FcNRID
	 ruL6/hESiJNIw==
Date: Sat, 11 Apr 2026 11:29:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: dt for v7.1 (#1)
Message-ID: <20260411-icy-inescapable-cougar-ece4c5@quoll>
References: <87qzoo3412.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87qzoo3412.fsf@BLaptop.bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_022939_856759_BAD36A50 
X-CRM114-Status: GOOD (  10.55  )
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

On Thu, Apr 09, 2026 at 10:56:57AM +0200, Gregory CLEMENT wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v7.1.
> 
> Gregory
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-7.1-1
> 
> for you to fetch changes up to 29d8a380643521422a9907f3e982e142fe22d19e:
> 
>   MAINTAINERS: drop file entry in Marvell Kirkwood and Armada SOC support (2026-03-02 16:24:43 +0100)
> 
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof



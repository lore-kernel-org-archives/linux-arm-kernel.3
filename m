Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97247E88D9F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdlhROafgeFV3lrDjQvOufXHI54qA+PqdUd6sqxfkX4=; b=d7RjsZPAWogmuwRkA/Sw1Xck8R
	w1hMQGxDlntAb9mKQ4aAEbPhcbNTR1lFO1gsVSxYhq0jtrBB2SBV8Rk7WygiShZkSy6EEDivTHuOt
	DgHGZgF1pBHGwbLBS0Tg4ikcGhoBQTKiz2lZUePXeMVNl7yVa7VrYetfCgrcCP+aeI57eUw5NfQLH
	fBoPSLYwJqf2IlAj7lj6XJgQq1L2wrkeuP3Bx6ZSPcZvKOwPEXPAzA1t7S6NSEI+QDgUIAO8CbYqH
	ODkF+l79QZdH256F4ZwnT4BeulRoZ0OQ2WYDHViFL7SwcGTCsTAm0Zqk8WDrsVniwTF1JY+l4Fx7v
	rAkd7ydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92vC-00000003Yzm-1k60;
	Sat, 04 Apr 2026 15:28:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92vB-00000003Yz6-04XL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 15:28:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B35F60008;
	Sat,  4 Apr 2026 15:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D96C19421;
	Sat,  4 Apr 2026 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316504;
	bh=UA6bly+AQF5v+iWuK0z14Apl21P8Edj1tf0r96yuACA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tk4LRGy+4yKS+P21boxRJtOVZDeIw5q8LnMR5HJ72EPi3vUx2F2G4qxLS+7XSNzz6
	 N3CyMnXwIaRX4uxpp3avk9Xc9N583TsDJ/ioW4noyUjeO3eoU6ApOz3UiBwC43Juph
	 c3Sz/uuVarwZ1vVimrfzXgfbVYIZ9V7u6UsGr7+sJBN2dmU8THDgP3g9i7WNJn6l95
	 PCs1MN5dfaWHxCF1ox9gHIvFqyOdiCIS8MwgJzHr1d2GCcJp7yx0Dx8OOk8R98UKap
	 IvMdLqpAnyThNal+0iOqn8ot/AfoO54+6BysOyI4cqgxxz9cMUSXu0pjtn4CE5HEUq
	 c+To3jbqRbJbA==
Date: Sat, 4 Apr 2026 17:28:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org, arm@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Microchip AT91 device tree updates for v7.1
Message-ID: <20260404-tricky-seagull-of-vastness-de462d@quoll>
References: <20260403070327.2552867-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403070327.2552867-1-claudiu.beznea@tuxon.dev>
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

On Fri, Apr 03, 2026 at 10:03:27AM +0300, Claudiu Beznea wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-7.1
> 
> for you to fetch changes up to 7d7a9fc1310a0ade8ea61c5eb4d8b29456f8d604:
> 
>   ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node (2026-03-24 15:35:37 +0200)
> 

Thanks, applied

Best regards,
Krzysztof



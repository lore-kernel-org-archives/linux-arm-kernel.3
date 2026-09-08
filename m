Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B70C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 20:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFWxiyY5H8hOede5cRFpSFIe96EI/yGkDhum1y9SsnQ=; b=VpODVr4453EY2i5H0s7iw6x4P2
	iauDHePT9Yu0en3wp9eQnPS+ecsykOFNzr194uFjjgRHS3ge1yCWuzjuSEh+G5rUOktOALnlq4A63
	Gqd23u/CDGYbmzaDUJQhoIXlHZ5bgI+zum2MHeT8sQl2ON3cimCR2vo1Y8j7CrJY0oOt+dOtjXe63
	tdSvt8l40ECsuAT0IiGfeyqtkvQXEMqnHjH4QSTBqonLBwATf8UNeolPWAzAQDphZZsf1W10ketDM
	M2tV+ekBGAdUEjZU3qg7GfA1iddrPbw+Y9KhQ0l2efVe5CZ6SLKnCHEhv+9F7E4cND4/RtN0Rj1oa
	ZGtjeDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x422O-0000000A8C7-1LRl;
	Tue, 08 Sep 2026 20:03:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x422M-0000000A8Bj-42lc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 20:03:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B6E7B40823;
	Tue,  8 Sep 2026 20:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073851F00A3A;
	Tue,  8 Sep 2026 20:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788897802;
	bh=pFWxiyY5H8hOede5cRFpSFIe96EI/yGkDhum1y9SsnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CJWJhJzT4WIzog+TkmaZoDqZ6y2nCk/DOgZjyXeI6PED6WOT83ZL95/ReIHI5qQJc
	 kJOPhLQnFHEUP9Nvpj3jreO4Wq+Q9OoRvrCjRuReiV3Q8kK4aT4WiUZGEaLTmpa4Bl
	 MBFyo2mYn2Erae3OJ83Ior1pAtB5imBjAIq6hgCK37lifLROHL5hpojZ4aL8s2hmKs
	 ATyq5Gj4jPJWp2fCPn/xxvkx/ZFlXsjSN7ed0HydaBKNnwomiC2nc3eJDRvbtU+4QS
	 +s0Yba3G9KMUh8WM9I/4AfobgkYN4sJRIvwFW9lQ/fdqNMvxJE4wzPNxCF6lQqszMV
	 OHjHqpa4hvdYQ==
Date: Tue, 8 Sep 2026 21:03:19 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: Re: [RFC PATCH] firmware: arm: Group interface drivers under arm/
Message-ID: <20260908-interesting-stalwart-wombat-0beafd@sudeepholla>
References: <20260717075224.465618-1-sudeep.holla@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717075224.465618-1-sudeep.holla@kernel.org>
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

On Fri, Jul 17, 2026 at 08:52:24AM +0100, Sudeep Holla wrote:
> Arm firmware interface drivers currently live directly under
> drivers/firmware/. Some use an arm_ prefix while others use generic
> names. More Arm firmware interface drivers, such as
> [1] Realm Management Monitor(RMM) Realm Management Interface (RMMI)
> [2] Live Firmware Activation (LFA)
> expected soon, which would further crowd the top-level directory.
> 
> There are couple of other interfaces whose usage within the kernel was
> challenged in the past or is currently being explored.
> 
> Create drivers/firmware/arm/ as the common home for Arm firmware
> interface drivers. Move FF-A, SCMI, PSCI and SMCCC under it, drop the
> redundant arm_ prefix from the FF-A and SCMI directory names.
> Update the Kconfig, Kbuild, maintainer and documentation paths.
> 
> The resulting hierarchy provides room for upcoming interfaces without
> continuing to add Arm-specific directories at the firmware root.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
> 
> Hi,
> 
> This is just to get a feedback/opinions.

Arnd,

Any opinion ?

-- 
Regards,
Sudeep


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB7AC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 06:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbFkV6lqccTbXZt/718jdS6/biUEoNqIpW7cYSEldt4=; b=n/PROquAiooJC69taQpRp0fcK4
	j7Jd/xDKUygnpE2EXOnT8RawxB6q/IFipuQHiMuUAc3PmbcFF+2fZXW1qD/O2KzQdIaxASzZhCof2
	UxwxWmTas0S6sfruiSJq5PC5ky3g0wetfYMHwj7VhwJKknL6zDOAlIeuL3/6tZs9UzepSUqqHP4vU
	AIbg3hnB/bZYM/3fTfv8oisPI5TW3T32Q0lAX7LtqWzSZ9TRTYgqgQNxj/kYbcP0F5KiI9X4CMNWL
	ImZrKl3e+D7aRss+gUiqPCOthNybCp09Mhb+5rjrBF0kEVXZEo/BbOx+KE1nJt64VSPSNn5c6eAVM
	+aosmnJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5L1-0000000E8Xn-17cX;
	Wed, 14 May 2025 06:11:31 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5J1-0000000E8MV-2f9c
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 06:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mbFkV6lqccTbXZt/718jdS6/biUEoNqIpW7cYSEldt4=; b=MQ8SveNwFcfGS52HabIGjYk6bn
	TlNR8xzJfYjUM4MlKAstP8vCUsBUnjUPkI7j00sqMWaYBhGj21N5aCBSABv8R0m+Nt5cFwbszsyZh
	mlJZtCpVRhkV60RV7rsWxxj5JssGiuYe47O09Ydegvvu6CjGX3IWAnpxiy+tLtbVpT0sCQqhk6Cpq
	IAMaPS5Gmd+aCD3FX2xwrwzmZNqWX26zcTQfuSCqEU99Zs/bvo+rmbGIjnO8cj1jnFX3SM6r6KPku
	yiEXw/wvQRscWZR0lzZPFIF62/uxcSM9js50oXLMEoIEqYhQ8w2YptXGJo9K0znk4R4nAiR3QQAPQ
	ej9updgA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uF5IB-0000000H5mu-4BWo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 06:08:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C66551688;
	Tue, 13 May 2025 23:07:45 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28EF03F673;
	Tue, 13 May 2025 23:07:56 -0700 (PDT)
Date: Wed, 14 May 2025 07:07:50 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org
Subject: Re: [BOOT-WRAPPER PATCH 0/3] Enable use of FPMR and ZT0
Message-ID: <aCQzNi9115Fq19YW@J2N7QTR9R3>
References: <20250511095211.1638852-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511095211.1638852-1-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_070836_561040_B0382E91 
X-CRM114-Status: UNSURE (   8.87  )
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

On Sun, May 11, 2025 at 10:52:08AM +0100, Mark Rutland wrote:
> When the kernel gained support for FEAT_FPMR and FEAT_SME2,
> corresponding support was not added to the boot-wrapper. Both of these
> features require some (trivial) enablement to avoid traps being taken to
> EL3 durung normal operation.
> 
> These patches add the missing support to the boot-wrapper.

Applied.

Mark.


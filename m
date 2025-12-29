Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABC1D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Q5cvG9N8oira246Z7LjtRI7eXT4zJ3tCsEgTCKVwe0=; b=T6FWRqWgBlqGtEJfJgMgBmOq5c
	wR/tKZssBu/w4apHobHDySrrD4MOvuR/fyHYKgT03EbmMo9Ub5wGtcpa3CYVuORJgVGcjcrB01wKZ
	b2l+bXqB8Dbcp3v+9lE/XMTfrwfJIPyMHQyRV1XASEPQ0apDAr+D5qNHy6p+DCrHmfLwP1vvQujwl
	4ldYMKD7tjgMzFLOUQa/GEaNqbkU2g1g6zCeF4cKC4pdsn9bqYk442pkVOQtHWjL7i+IeRaKUYeE8
	Kho+87o531s7K8NT7sORTMIhNc2d5tgt3J3P8SKtzJliumQEDtZ9wAoZM1LqKFpShjyiGzoenvi8i
	8exGQXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCry-00000003ikO-1zZX;
	Mon, 29 Dec 2025 13:01:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCrx-00000003ikC-19r8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 13:01:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B50BB60018;
	Mon, 29 Dec 2025 13:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A0DC4CEF7;
	Mon, 29 Dec 2025 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767013264;
	bh=mmjJboZKrZmMHhATWamcObm/1IvNb8WQs2oweHCNOP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3NDcquiBoavGRJbcVpmy2lzbQuLgx9RqhNPLAFWSz7SGNqOgbKh48WV2BXovpVW1
	 WF0TiokarvtZb+f8KIVdPxs9nkfDw1u+RH0qmdQxiWJ416KXHu87XUU4GHBzlZpe7H
	 Up7wMIQYNgveHofGUqo9M10X4okTh2SuKZDjYLHctBPEK0pFnG737H1SLJeOpf4xGO
	 X+HQJgEdu+xXOw21Ejf4vOpXopFGqmIzRyu5e+meUhLlZbI2MNf887BVkHHTQeTta3
	 wAWYhsShAG0XY/PNB9huEi61CtzAgXrPC4cMOP7LNV+64omg6rLR0SR6a6bKFJYcVr
	 7RD6+W7g6uDyQ==
Date: Mon, 29 Dec 2025 21:00:51 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Daniel Schultz <d.schultz@phytec.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: imx8mm: Add label to thermal-zones
Message-ID: <aVJ7g9bcilXJEbND@dragon>
References: <20251124092242.3378017-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124092242.3378017-1-d.schultz@phytec.de>
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

On Mon, Nov 24, 2025 at 01:22:42AM -0800, Daniel Schultz wrote:
> Add 'thermal_zones' as a label to the thermal-zones node.
> 
> Without this label, it is not possible to add additional
> trip points in board files. For example, to add an active
> trip point for controlling a fan.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>

Applied, thanks!


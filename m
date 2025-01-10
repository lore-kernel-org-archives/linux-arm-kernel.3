Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B2CE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45jiLkAhkWB1RuL3KdJfFgsGLw1BunysUsD5FtontzU=; b=Hkf+2olSRyG/wU5v64FTgFKe2j
	54xThzuWoisJvbkyhCUPVkwV9Xbn5eoMC+wNF4lCzGTKXP/q48P9WheWLxmdemryaZ24EpxaAf69A
	TFvAkLnkWv/ymgHTLKjwnbADUC6Z5lETLKDlOQbSvhrfStk2GdpaJQUoB3HAPdbUgnyeSYQDWfBHY
	TU2FOR/NbuUmRQbWNgZ1Iwdm7qqYM4/2e54kmj7WR3Hzgx6UbATE1beYyYA7hAJlnXrM0x3vLeD5E
	bBDR6I/C5HJqAPpmz0dy5KokDhCZ+5CZztdSzQ1mO5k4qMpf1b2pkW30Ypa+POXr8+klq5Lxse2S1
	0jOwK81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHbG-0000000GAJ0-3pHP;
	Fri, 10 Jan 2025 16:11:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHCx-0000000G486-1CgK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 15:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07603A42076;
	Fri, 10 Jan 2025 15:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96B3C4CED6;
	Fri, 10 Jan 2025 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523958;
	bh=QfmaRoHcJUdGvJKJWhaJqO0KNHOHH67k1vAJT62x7hM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ur4ru0aeMO1UPqUMUz4EgMGX/ni3ypzALyQ2ZgQF6bsm1joJ7tjl+xM1mCybt7TQa
	 x/p4KLyKxKt+EZ4YodzOhkZv2Yk8vmhizyCAUOxmNltvpoJpTKBT9Ady5aVakQD2IU
	 YO7B+Fl6oGTYYBkUyynpGvvpFwQohewEONwavwSBuc/bCXqCyZj5futz+KFEFwoNSC
	 3OKikCx21msO8bgmWGN03E7tQ/0Bt5zNbSwHgpjYa+V3C4GBQ94rNzXHLzY8uD18xq
	 XhPK1NsZC/ZPiSgz7GUK3IzsLManGKV/VElWNhz2NZB531JkUp6GADNr4aPyZ6NkJH
	 gyDk9xvrQCzMA==
Date: Fri, 10 Jan 2025 09:45:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	devicetree@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Lukasz Luba <lukasz.luba@arm.com>,
	imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] dt-bindings: thermal: Correct indentation and style in
 DTS example
Message-ID: <173652395667.2926063.1624072219753897598.robh@kernel.org>
References: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_074559_398070_70420B29 
X-CRM114-Status: GOOD (  11.41  )
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


On Tue, 07 Jan 2025 14:10:26 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 48 +++++++++----------
>  .../bindings/thermal/imx-thermal.yaml         | 36 +++++++-------
>  .../bindings/thermal/imx8mm-thermal.yaml      |  8 ++--
>  3 files changed, 46 insertions(+), 46 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



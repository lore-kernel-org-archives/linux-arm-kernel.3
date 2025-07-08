Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C9EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtuXvXAYaLoIlesBBs7sH9sPUnylvYq104PGqKFHcU4=; b=iUGPVAi7CfISZJx3IMNwSUhJX8
	uNjg5kRRvirVLZ6i+TYAcw3icjUcGeby/7llV2cV6I8AfJPfVjfr1W9gwHxJt2By3gg4qsV65B32W
	DXMB8BNoaQwDTY4KMMf9szDl7FmJWnKtX1JO0FTIHKBEQll4R2fCDGDrjCPAL7dHNKyT34WEN0TXG
	wBe0NDHTMOoKIuXmWCroC41YT307IDVWaHxhX96Gq5gg02aCTSzDjQxlEym6N9rE+LEKaPxZ0ffxL
	Wqp4ZxZR/3M1ift+3i6ZWjyUQatJmE4wzPUC7i2MIHAhc5hD2nH6ymrOH/DJJZNPP8RDoXuUVR/MR
	uQShZksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4Fk-00000004qOF-12yp;
	Tue, 08 Jul 2025 09:04:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3rN-00000004m2g-0ptL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:39:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F8225C62E0;
	Tue,  8 Jul 2025 08:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADF6C4CEED;
	Tue,  8 Jul 2025 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751963968;
	bh=AgF/cWa8tyl4lX11C1ELXJPj6/yeF0Nvjn6w56HxM2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1elsLSuTAVqQrj4csDgKcoib/rCgA+uxml22fkkRBDTABgwtDHHkCGH087jr0DMB
	 CON6nvJ/lBgoCgdpXcz8MBqAfSOPEKm9HgkDb8BNyJkboISFMTgQG54ZWCWM1/nIeo
	 qXc/FocCcUTyWjhMMP56VDYnY1azjS+LVwcy/0KM0WjXD4R+hGtQXcjfTYsnlZM3IH
	 dm1cUvymqd++wfoTLvyfs9rQvNqTrGG4lrUuHMF696FG4IBAWDMKgSC0n5Rdt+ihyH
	 82mYO8brI+We01pcfyRzLJywrk2oU7lwdx7KKMofCRbOXwuaWFy+b+U6si7PogTJWH
	 cnhEpuEavWN7A==
Date: Tue, 8 Jul 2025 10:39:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stuart Burtner <sburtner@d3embedded.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Spencer Hill <shill@d3engineering.com>, Sebastian LaVine <slavine@d3engineering.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Sony IMX728
Message-ID: <20250708-kiwi-of-delightful-wholeness-cc90ea@krzk-bin>
References: <20250625-imx728-on-6-12-v4-v1-0-cfc6e18c3e23@d3embedded.com>
 <20250625-imx728-on-6-12-v4-v1-1-cfc6e18c3e23@d3embedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625-imx728-on-6-12-v4-v1-1-cfc6e18c3e23@d3embedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_013929_269277_C9F0025F 
X-CRM114-Status: GOOD (  14.68  )
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

On Wed, Jun 25, 2025 at 02:20:03PM -0400, Stuart Burtner wrote:
> Add bindings for the Sony IMX728.
> 
> Co-developed-by: Spencer Hill <shill@d3engineering.com>
> Signed-off-by: Spencer Hill <shill@d3engineering.com>
> Co-developed-by: Sebastian LaVine <slavine@d3engineering.com>
> Signed-off-by: Sebastian LaVine <slavine@d3engineering.com>
> Signed-off-by: Stuart Burtner <sburtner@d3embedded.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx728.yaml | 95 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 ++
>  2 files changed, 101 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof



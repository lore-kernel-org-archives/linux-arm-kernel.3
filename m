Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C19C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CxOMIcpv6UU7bDiC8pBqM9CBeRXVyrU0ukgcGoh1PI=; b=KN2VAIcjXXhO7ztz1D/ATyTZV1
	iz8KH61BgwGv1hrSlk8P/ZeTLGRESpvSksHzaA9ldmAy0TIAByC8xT5+wh4/Y1s4xgbEYX29OOcJg
	oNCEdnltsvEmMZkYWszejL74ulv+6coVf8vw7+Amum3wVZOamInGYRx1netI48+aOeLbiqVCIeosE
	UEFyBicWeKVKAytegsY95zkykirPUj8UbFyKMjNeS+rFHHxxzgtTQAdONFK/jGXzWQ1smQ//cfWXb
	wVSDSQkhO+jiUxXUfCB3h00Q02/MbMzKgIHDzpd4nLeS2HQxyoDeNgAWPODTUqZd5KyAsB5pxXynf
	9AQxo2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVjs-0000000E71b-31Hx;
	Wed, 07 May 2025 03:46:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQ2E-0000000DSBs-0pxY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 21:41:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BA4561165;
	Tue,  6 May 2025 21:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE152C4CEE4;
	Tue,  6 May 2025 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567664;
	bh=6CxOMIcpv6UU7bDiC8pBqM9CBeRXVyrU0ukgcGoh1PI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hsDqP3HTq9F3YgduRkkoD1jG7NR5pmNiXauc816FjnJfiHybf66sLUg6VoA5HFMnj
	 MBM4buYPnrFnKLcgu5mhv92E3GXUb9KMQw70uQ3i7S3xj6aQ9o23/uIyzwzRMkZKqy
	 38nPeTIyBdk4DoalPfCsgqHue/3nlQCPkC34yRL7ARXivweCYKnGCMMBlWd7k35X1T
	 MbFSo2GvEb5fyAqNMqB+zbBicGzPmgvrxczaXZELjXvkkjvUCktfsXsJ1qh8aH9hiR
	 B4BGEVTOsy+8/eGQ77EqZgNPN6qWq8bZCFg2NXOInIvydgcB1d0iqn0tcP/k8sayNh
	 ByAYq3QE4qf9A==
Message-ID: <600cd2f78ea76dc60960cca8bd69faa5@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250415185614.16292-1-wahrenst@gmx.net>
References: <20250415185614.16292-1-wahrenst@gmx.net>
Subject: Re: [PATCH] clk: bcm: rpi: Drop module alias
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Stefan Wahren <wahrenst@gmx.net>
Date: Tue, 06 May 2025 14:41:02 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
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

Quoting Stefan Wahren (2025-04-15 11:56:14)
> Since commit fbac2e7787ac ("clk: bcm: rpi: Allow the driver to
> be probed by DT") the module alias isn't necessary anymore. So
> we can drop it.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---

Applied to clk-next


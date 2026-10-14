Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E360CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 10:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ms0PTxP6Fn+7FduT+1LZGX/NpLoqIlaekHwZSpzjspc=; b=fIcEhoo2OoCaSElKdP+FYoG9+f
	DnkS3B+JPwTq25zFbkePE5laWQUEZHEDdIwqXUizf5cDwj1LXzQxWM/AOPj4rgAVFeZuHOisSnam9
	/J5mXaV/TGL/YlxjDCRbPL5Dxn+NpcxATTut+2wv4cP54YCod5x09AunNdKmEewa4T9zCilIqkIQj
	xwDDmRKm+ZlflMYQ8UxEL9c9RKw8kae1AXaSv68yY+hf7FeifWlz1ShJ7SJKH/rbvGhXku6EN36Bj
	uSpFqRIaQ5acWQ+5+gsm1ynprw875ya7wYYF08D+5MCiJPbSRC5tSs1pnDHtP0qeIZw+LIcS+X2VY
	5fMgkU9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwFJ-0000000FDPf-2kQr;
	Wed, 14 Oct 2026 10:30:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwFC-0000000FDOR-2ZIq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 10:30:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F7C441E51;
	Wed, 14 Oct 2026 10:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BA71F000FF;
	Wed, 14 Oct 2026 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791973798;
	bh=ms0PTxP6Fn+7FduT+1LZGX/NpLoqIlaekHwZSpzjspc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i1zB3pOEleb9x/mxtYAh68IHFxwsSKwzeONf4sjGYZq0WwOhNRHLAwpb3dY656SL7
	 goNuT1uiTz74GLQTEeUDZhn3+t/UZIwpkGQFLL9MVJxSs5DzeeIazCp54zqeJ/ms7q
	 Z7sVR/uIYmPfkCR5hko2ps/htsw5meltKzbRld0o1t7rF5YxLemb77ejc+d+Bv+jZL
	 /GOBSjS7qxSkAsCaQrVCbe+9KiEc12z8q2A/ZZnKKi+8fbURKBXhjNw8ES15wQwjSy
	 yAkEiRJ/yf62K38IGncKcbZedM6a4C0M5FWZjHjaNeyp0SddMQDe1buhZFNaEbrrBX
	 LoEsRtiMGUmtw==
Date: Wed, 14 Oct 2026 12:29:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v11 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
Message-ID: <as9ZVx9TV5NpW1cK@zenone.zhora.eu>
References: <20261001075101.489660-1-zychennvt@gmail.com>
 <20261001075101.489660-3-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001075101.489660-3-zychennvt@gmail.com>
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

Hi Zi-Yi,

On Thu, Oct 01, 2026 at 03:51:00PM +0800, Zi-Yu Chen wrote:
> Add I2C support for Nuvoton MA35D1 SoC.
> The controller supports standard, fast and fast-plus modes,
> and provides controller/target functionality.
> 
> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>

to me the patch is fine. Sashiko has pointed out a few things
that require device knowledge. Are those concerns valid?

Thanks,
Andi


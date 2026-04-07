Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE27FF510C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFPlwZhGCibGfIhPfsAXX7aGS4GxCi1OrJob/BvRqUk=; b=bOT4Iuu/ZMwYzuG02VVYzOLJwm
	Ax1rChrpN+yTui8Soy6nTllENoG+q2n8e8WFwhHfGAOY546PjcqgXn4Bxj+mUXjulg+UdhTSVMZPu
	CU4AenZY9aFKbsT9FmgvsUKnqm4fGl46fjaFIklzsVUU2Yhhmxj+QmZYEbHhwt/oiM3ZuZn67p2zT
	re52lX5hmSHoDT57rUNdZSZ5vPgwaeIfS5hrGwBtw6b+cfpbq2VDI9DfiyjIQzfnIsKWktTPCZYl4
	kq7sIOkj2YV3EoffNm+BBQK7SNZTb6GDFvD4guMCxzI1lWvD2Zn/aAfzxYz1lEjWT5iQl6uHOsuUn
	jDLbXd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8xe-00000006lEz-0ZcY;
	Tue, 07 Apr 2026 16:07:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8xc-00000006lEO-39v0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 16:07:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB501600CB;
	Tue,  7 Apr 2026 16:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C401C116C6;
	Tue,  7 Apr 2026 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578047;
	bh=PeC5naBBK1FeWu9bbU5Wh9SWJPCNfdcAAENIH6WbzAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TgUdQPKiI7+sUGUYqoVbVSoQJwGUCcM+skVp99Ax7Y6CHnI3QY0QuZ7QUP0kEz5Zr
	 NmpSCseM3p6BQu4dXM2pnPTDnSXsV6fggo4YsrHNv53xc7CAndXTN5zx+nzEoL+rp8
	 IRHA/XryRhKtEhrRk9KtCt0yPLwISGHXDwe3dmbz9LD984cwsos/ii+MXujyUfzHW1
	 kxIuio9dIwIWiSRiS6Xr4KV9vRqiIiTZVcDSv8blGw3UxPQYKjMAyI7M2ON36nAzh9
	 YOdTMIEaE2xDXW0lhsJ5U6PGFKEtq9boshHS1jX/AgAU4zvKGtbSY6K1Pg6ab8VUji
	 /bV2K6UakFnXw==
Date: Tue, 7 Apr 2026 11:07:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, asahi@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-pwm@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-watchdog@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: arm: apple: apple,pmgr: Add t8122
 compatible
Message-ID: <177557804504.2661217.32030940173770569.robh@kernel.org>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-2-5842e1e393a8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-2-5842e1e393a8@jannau.net>
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


On Fri, 20 Mar 2026 13:23:20 +0100, Janne Grunau wrote:
> The PMGR blocks on Apple silicon M3 SoCs (t8122) are compatible with the
> M1 and M2 predecessors. Add "apple,t8122-pmgr" as M3 specific
> compatible.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



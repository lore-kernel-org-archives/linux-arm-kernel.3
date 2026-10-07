Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BDBCA6004
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 21:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YitjMsQtpWgJ49ALoTgzL7XoEIJ5d18PdiRpr3rLGfc=; b=eRfMdLYcsRqwgmrx+KXQiaaFgM
	FpmPOPfvVUvgx8fbDqFU8F/jI3eCkVli5godzu5R6cOCscGk6kJlEdFMlyxHlbHOh7rc32+y4qY24
	8HZQ0Y/W3wt7A8SWJ7uIM4uNxIIMZjJqJtWHda2dUt4SvWL/mFJGen7mneceWtRJ4sY9g0IaBfcqs
	vM8vOKFAe1DSGPL4ICXsfjV7gpFx7QGOeZcwCjPJT1gumm6mySdbS709LkQualgniEjKIDFSkmWZh
	wSWvbwDnD72LnH/KDDukGzUb04BkyKYWh+wbdvuO6Aut50V9mS94bM/9vfErMS/GD6oy0kDImK6tV
	fDtIbogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZ0W-00000003BA2-07IA;
	Wed, 07 Oct 2026 21:17:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZ0U-00000003B9i-2Rb0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 21:16:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D11660A6D;
	Wed,  7 Oct 2026 21:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C6E1F000FF;
	Wed,  7 Oct 2026 21:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791407817;
	bh=YitjMsQtpWgJ49ALoTgzL7XoEIJ5d18PdiRpr3rLGfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Me47hgyKJk1aV1S8wWVLWR097Apon74PZCF0U26x+TiHBXq9fc4jX+hIBzx5hcQ3Q
	 ph22Or3QHnC9LeE/d/UKpNSoSPi3SlzEx/5E4+I64nfnghXFdxJapEIKDMCyS9Tjk9
	 MHhqrGHKQwr/9pW/Mztmd4xeHRFe4VrWracZe00WKuZNqqVdFqGcPQOdx8tavNZXC5
	 5VGzGAbSJNi6B25n5kb8eNZfR6zk5sQBn7br8pxO4Aly6b6maMufW1YpZIWkQdEAzJ
	 WaIvZL4AwK6VCMyA6DnV/1pcI2oXWmRuRHPKhkO9/Yz19FvzA3QyUO84oQDdUvR5+G
	 GhSzTZSQFydMw==
Date: Wed, 7 Oct 2026 16:16:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: linux-watchdog@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add
 Allwinner B288
Message-ID: <179140781657.375821.13519310768770397051.robh@kernel.org>
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-10-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005202731.153971-10-pmazzini@gmail.com>
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


On Mon, 05 Oct 2026 21:27:29 +0100, Pablo Mazzini wrote:
> Same watchdog as the A31, which it falls back to.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



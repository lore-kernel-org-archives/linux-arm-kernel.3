Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFE6C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HP7UjX+DtpEUbmWbHviNN3/DeHT2bG/mTGPvkZbqFx4=; b=FtA062WHy/3V9geQXXloqmeqaA
	p/bseclzXf99TPMPW+qwJKPnYkaG3rezlj7g+HSfELp5zj0Q1ThvY1EReekCSjtDUD3vYnXMBgZNW
	adWjuXkfXl5y+3+g/NxFxsAp6B4OXj6T7slGwd5pF33wCACLisnja0WUKaCw1fZYnn5T5i4u1nUPJ
	JwUqzBenevo7pOQScRxa+i1sRqx1P8XrRSypGMV+6/aM3ckfB3H2pDQEh/vDZIgiegZZpn1nue5Wd
	fVLTjzXVo7ZWHE6X91Cu5JJy1f4ubDKixetcTK6h1arAoBZkFtKLEq5aGZpy6+16RL/vbPu667+8z
	HdIhTNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WM0-0000000EAim-2b6h;
	Fri, 18 Sep 2026 11:02:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WLx-0000000EAi0-1jOL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:02:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C3BD060A75;
	Fri, 18 Sep 2026 11:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420A11F0089A;
	Fri, 18 Sep 2026 11:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789729320;
	bh=HP7UjX+DtpEUbmWbHviNN3/DeHT2bG/mTGPvkZbqFx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UAzketc2xQ5aypvUHuxBFcw3BN5vF0aJJd5JnQjMNIMd4GzmIVkm6GHeyAHdqq/H2
	 sl0PNZHiUu0MR9QYkq3nf5EO18txsXgTNR9CzM9NVgiy9y+QKY87SSByHbHM975dqg
	 rwhdSKQ3IOu829Av9Bc2Q7FUdiUk3SzL3CoT6d/XwJJD6smcz5hCYvWQhBR9RmRpEj
	 qWEP1nw0bQEAl6thZiHg3OYV+goAbLTj31/aVVq+r38zEHt2v8GPluad2YFhJA9l1/
	 QSCk9ZYxK0WJKXIEsfKMGk8IcXT8e6BYEuiRYRRDLMzw8vsA/KydSi3K8np8JhRBYu
	 r8G10EPQ6Mc8Q==
Date: Fri, 18 Sep 2026 13:01:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-can@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: fsl: Document Data Modul i.MX95
 eDM SBC
Message-ID: <20260918-hidden-phoenix-of-speed-daa5a7@quoll>
References: <20260917062543.534416-1-marex@nabladev.com>
 <20260917062543.534416-2-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917062543.534416-2-marex@nabladev.com>
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

On Thu, Sep 17, 2026 at 08:25:27AM +0200, Marek Vasut wrote:
> Document Data Modul i.MX95 eDM SBC board. This is an evaluation
> board for various custom display units. Currently supported are
> serial console, ethernet, eMMC, SD, SPI NOR, USB host and PCIe.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



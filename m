Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D395AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 22:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaD/ZZPRq5qylZJ3bxCPZHwAd0ZY1s4cnxM96OZroHk=; b=exGRzsOrszESH/qIFl17g5kENi
	UnGCtkeK2nmw3+nV1S6SHHZeoixW1vXYbLIZof+9U1IeekpEs+ziiZjcwPj1pJ+KoYY8M4QZTeT/E
	+EytfjiMHi/HXgIKOBVxlA4tCguXGr0Asq4JrbcOKYtPeAJ/M3o6oZePiZOvqp0IDwDQY0KMmPT/y
	0XuZ1x9/lQFfumok1Uj3Z6JRnyuWRyrQfayF9KmU3oEarixlVcA0CS4eyG8tjEWWkLjx/Z2CZZJUf
	Lvy3p7er0Cd3itPGzl4XXDbFtyB94417J6lct04LzpaKlY66+hCGE3OL3oRxe40Fj+9zzO4z/7KaJ
	nrVKbIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiKJ-000000065p7-2aUY;
	Wed, 23 Jul 2025 22:52:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiDX-0000000656o-14E4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 22:45:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74492601D9;
	Wed, 23 Jul 2025 22:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E77C4CEE7;
	Wed, 23 Jul 2025 22:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753310742;
	bh=DRFNNor9xetjNiwB4R389Nfb+5tJZq+R1Aro9dByQfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwxmoRomU7GrGGtJSXA4s1kJdftFcy7FZPWIm/HLgZAVbK7nKpDOiNgw2Awe3exDu
	 6zs+jrw+nWV/vHGz4/O7JVec8VY7TU8D07RE0RcCh0zOZeeqOFuKUOts/nGojMqs6p
	 3PeHoiFfgiqwk+kioCLOQmMUzokDjx9vY6Q+D7UbRf2lAX2IcnIWNGeL+MhMcF0+Lv
	 t4UEAj3RxUM9LeJXnOalgXdOiIuw9/CZfAhUxC7XfePulNByggMv3i/RYTBAsEkjgy
	 V75zdGT9DdSPwCFl+1pJ0NP9CqbMNZGj8Y98ANAzeGIBeqrpdncvex1vyjpA2opMfg
	 uVmtiOtlUpNBA==
Date: Thu, 24 Jul 2025 00:45:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: i2c: exynos5: add
 samsung,exynos2200-hsi2c compatible
Message-ID: <cpurwsy6vfu2fxkks3upcwzla7kldido7ro4vmq6m4rij4lmk6@mwbveb7ftpdv>
References: <20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com>
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

Hi Ivaylo,

On Tue, Jul 22, 2025 at 03:14:34PM +0300, Ivaylo Ivanov wrote:
> Add samsung,exynos2200-hsi2c compatible, reusing the autov9 support
> since it's compatible with exynos2200's i2c controllers.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

merged to i2c/i2c-host.

Thanks,
Andi


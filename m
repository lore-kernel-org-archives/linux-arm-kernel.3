Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D178AD43349
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWy454JTOGwB3Dt5B8irjoHMNnCGPA3U2n8E8e3Bk0M=; b=Hcwr/zx+LUpvUbXI9AvZcpaFjI
	gWKcukKJGUhXb8loEJlXFl0glpwUPlHY0N0t1mxsHkQWFWSx4soAJGBKW171yBL4uZe/wU1OLdNKW
	6W3BCDkUlwSwHVm9FZUdwYgMrESHGKApNGLpEdKXpiMAjzi5Hioc70TZExA1Ea7yPH7s6UyZPdlca
	zRMGaWArFqtB8CKULV2LGStAt8VkKrwu4MyPvdT72DV/sudB0Z2VDK0qZa5nHzseHCmKulHQleWVv
	Q7Sy+MQiBghnh/SVWrk6cie5C1WGBquFbQwK1GyzAdNCrerXC4Y4SNtTvoU8gORiS34JTVj45qJop
	emZAD7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Oj-00000006ciR-2CT9;
	Thu, 07 Nov 2024 11:09:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90MJ-00000006c8V-3JT9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 11:07:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61344A4378D;
	Thu,  7 Nov 2024 11:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3D8C4CECC;
	Thu,  7 Nov 2024 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977624;
	bh=wWy454JTOGwB3Dt5B8irjoHMNnCGPA3U2n8E8e3Bk0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWZa3o68QMtmlz5POUfbiLm5sYgt9IukvYZXN97Djjp9HIdmseiG15pDIVmBC6RiA
	 m2POD/vZ4N06dRngbW2hegsUAdIFmM/r86xPqXoLUPY4D0BTkQ7Y/W8jjnxYLKRadn
	 6pvdun9SekcnvlcAE/R/faCsTcDAueuGZXcpO2ZLfG8SL4eFlNWtJWzUnykueK3CFa
	 0WJ23Z+8RlCz9+fPUa1uNv2z6pXpFbOUj+9ORYnifzISrGxwQEEuhJ+OC3ft2fv0DD
	 4asM8n3W0BkaqI4fbNgICo9Og/FQv+ZgLBWjyjAJwyR6vibJrt85QY2gVIiO4Mq1oC
	 H5F67hRkq2pOw==
Date: Thu, 7 Nov 2024 12:07:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: Fix repeated words
Message-ID: <huswmfhrf4mfewxchalts4chpddo4z67bg3kmsr3cfhhstob75@pzzuwfcvoiay>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-2-xandfury@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107061124.105930-2-xandfury@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_030728_820052_8B482B5E 
X-CRM114-Status: UNSURE (   8.40  )
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

On Wed, Nov 06, 2024 at 11:11:23PM -0700, Abhinav Saxena wrote:
> Fix unintentional word repetitions in devicetree binding documentation:
> - usb.txt: Fix repeated "two"
> - mvebu-devbus.txt: Fix repeated "from"
> - gpio.txt: Fix repeated "Both"
> - pinctrl-bindings.txt: Fix repeated "device"
> - cavium/bootbus.txt: Fix repeated "one"

This we see from the diff. This is trivial commit, so rather write
concise commit msg.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

With changes above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



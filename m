Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DB0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMywXCAJz15ivj4H2yrF+Rr9wh7+wfvKgGEen90TIAo=; b=kEY/bsTyTV0mUhomqtzxqNo294
	rfYRhaaVhasr900Z52pejd5fCvN1BuZsPBdnvFV5Z91xt3jz+uUWTj6swkGNIo9YZGXGVDon0JOKe
	ne2ZIYWj/cSDjEHD0652i1/Kyq78YNCzsNVeUeOOyR2PdtrWpppFdyoq14aGh4FzUdztUPpWYx+Uo
	eLecxhEkHEI33v4ECdHguyrww9IpxqXfs4Hx8AjBo48EYNI7PkcjmcHW3nrx76ZYM6Y/MFp516Nit
	qruvYBgtjYnE+IMA0+bNMfT/suGDz/aUf8jKpH9ek8LLUJaeFfsPX9ouUNhoYOYBpA1jxzRVT1i87
	c4Xaqw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmmg-0000000D9pS-1g6n;
	Mon, 06 Jul 2026 17:07:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmmf-0000000D9pI-3Cx3;
	Mon, 06 Jul 2026 17:07:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 85C1F40840;
	Mon,  6 Jul 2026 17:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B3E1F000E9;
	Mon,  6 Jul 2026 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357625;
	bh=dMywXCAJz15ivj4H2yrF+Rr9wh7+wfvKgGEen90TIAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nrRzVFjCFJ2aQrk5qM0YNR/8+vCzDUz+4tXHVhST8RziP4UgWJBGo3srxngw9ZNIX
	 rVeeuA4uD/N24HrvD2PkypQ0cslwGau/JrHHJZQsLUtH4Up/vzTf6xuncIppAU0YFH
	 W0K3TOc7XJ/kJqAEQgXVpNvErUIAts2Zrszbi7cD6msPVYzWT50oAuWk3Q1fdKt7RP
	 W81qpnnHmyDjkmbRlu/kmWCaS6z0JS2H49ZqIhk9EfQcD65wXKa0OR/LjcJFfMLfqK
	 hW+yD004h2o4SDB0Lhcrc+XAybjpeld72/gd32LkAWT5sVJw6RELAIXhByDLgEY4xe
	 d44eYiG5uvWGw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>, 
 Lukas Schmid <lukas.schmid@netcube.li>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
In-Reply-To: <20260606205452.2386930-1-lukas.schmid@netcube.li>
References: <20260606205452.2386930-1-lukas.schmid@netcube.li>
Subject: Re: [PATCH v4 0/3] Add support for NetCube Systems OpenNMC
 (dobermann)
Message-Id: <178335762241.4010120.15331558144606875972.b4-ty@kernel.org>
Date: Tue, 07 Jul 2026 01:07:02 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sat, 06 Jun 2026 22:54:40 +0200, Lukas Schmid wrote:
> This series adds support for the NetCube Systems OpenNMC.
> 
> Sorry for the quick resend. This v4 includes the corrected Makefile
> target name.
> 
> Changes in v4:
>  - fix the ARM Makefile target name for the new board
> 
> [...]

Applied to sunxi/dt-for-7.3 in sunxi, thanks!

[1/3] dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
      https://git.kernel.org/sunxi/linux/c/9995c8146bb9
[2/3] riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl required by NetCube Systems OpenNMC
      https://git.kernel.org/sunxi/linux/c/5b0fd777eb34
[3/3] ARM: dts: sunxi: add support for NetCube Systems OpenNMC (dobermann)
      https://git.kernel.org/sunxi/linux/c/9dc45b17fb85

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>



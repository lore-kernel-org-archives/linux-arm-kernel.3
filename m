Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1BFCCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 19:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aAM7Hp5Jm60nOfGjjqk6DwACB1CtbmXGzqxf8iZzJ8=; b=vRyzk76YlND8NIjAC7agVEXY7y
	X7jBvE8jG8/4CkJhlBOUeUZpCcqFYrg3ZimWMsNhn4fvrOY2lrB4hQWKyRsvr7GEGbS+yZW1kpD7k
	3BE9IjVrDGBwdeGi0Ugm/LAG3aFs2I0a8NSCavNjFUJ3eO92iYqx60LvOk61P/MoSY2sp4fAQ9t6Q
	ypZSAUU9aHJ1J0cKg6GJTmrQdu4VIrHGGkyAGPC4IZSqiAu/hV2CVWmatAyo6M37/owqwlxSTlTLg
	wDgfwb2i4WG6hxWOFknIvUgNycWvLJ2m301ewWWc/a/KmY9FCdQCjZMwL1ZYY6UozYWFdcVPIIJos
	bAlzOj1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBeIc-000000046gx-1TXO;
	Wed, 22 Oct 2025 19:15:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBeIZ-000000046fg-2PC8;
	Wed, 22 Oct 2025 19:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3904543E95;
	Wed, 22 Oct 2025 19:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEF0C4CEE7;
	Wed, 22 Oct 2025 19:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761160499;
	bh=Jj4YEIsqQhqZWmMJ/tIr/DjyokV4153P61w7wWugois=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NmziISPKLTWkjCzS7qn2h1p24U8fSEHKoVmBSHvaLDq4gssyxrReLIDLmVGaOy/Mr
	 PVBqSguvH0YP+NZdxwCKnpHwVE1Do4lLS/X3XEJNHcekRHUUy2wlJEeUr/S3mfkHFu
	 JbSmtz9l7WhgoAaxYIT/bP+TEYWtfXLkibySvA+rbBwIPvgREjpbjXWIwt6ZQdIHjR
	 fzwMbvLIagfOUPypz8M9HRYm2Mz26PMD+gbbHeGRDwobMUMZW0qDO/gFzFWTHwiY2g
	 e/LvMqvWZVd2tK2VJ3VjsJiBc3o5QJXCNzMeHBrtjmmwf03fxAJB988//DpeB4RBJ7
	 eP+V37QA4m2uw==
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251022004200.204276-1-heiko@sntech.de>
References: <20251022004200.204276-1-heiko@sntech.de>
Subject: Re: [PATCH] dt-bindings: spi: spi-rockchip: Add RK3506 compatible
Message-Id: <176116049600.324570.1351275211432564524.b4-ty@kernel.org>
Date: Wed, 22 Oct 2025 20:14:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_121503_666175_98450932 
X-CRM114-Status: GOOD (  12.22  )
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

On Wed, 22 Oct 2025 02:41:59 +0200, Heiko Stuebner wrote:
> The SPI controller found in the RK3506 SoC is still compatible to the
> original one introduced with the RK3066, so add the RK3506 compatible
> to the list of its variants.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] dt-bindings: spi: spi-rockchip: Add RK3506 compatible
      commit: 1b824134261d2db08fb6583ccbd05cb71861bd53

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark



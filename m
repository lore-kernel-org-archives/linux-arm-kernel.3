Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C55C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 00:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuKbasbmLO+vlsVS4iWMUf121DkLZLFAM447m/RAZ38=; b=LNbnhq30frv7ZhYvKT8Xqdy68L
	zuGQYs/Timeh+hB51VKghAFZ5HaX1oMT0VSNdvh/HzxJpK3PD8SmktnBRoKBePNWwtNdrfRrJ0q4Z
	Ob5TF0wk+FJgpxRCgx0fMMtZHWUg1g99fX+656o2voxlo6L6pcVykmKxLeJW1YvijdQRNFFRDV0sq
	NZTTLORg1XnfXx1e6tz5+C4vsLY4s60RuFOHF+hRmDood7G4oPHdRVp+y7vlLwkFFVK9aNr0xO4Y4
	UrdjNNCiJ+0/+epdFNJx2Gx0FvNgsp6R5oQeYYtiO4U82iYzjIwUTt2l6QKs823lOsx/Rksdffo01
	tRZrKBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYBq-0000000AO4s-05RV;
	Wed, 19 Feb 2025 00:43:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYAL-0000000ANkQ-1yIO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 00:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFF935C5850;
	Wed, 19 Feb 2025 00:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48261C4CEE2;
	Wed, 19 Feb 2025 00:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739925736;
	bh=5ATz3qoZO0uyhjafPNvrVGduTAInvw9k8D3BQjGQMP0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rUE7ym6cpVcQEMakXZOfcKvSri/zFYTON7R14QqaiGdHeREJV3kluIb5L0feThZQt
	 WSV5HqbJVVH/+R4AUcM71jPqcyfNg/1tA/hNwAr19YdJz4GOnFkq4AcF2q9NdkBN+0
	 5X2EZBB0+hpd5oQjlM48XTt8bKNs1iZX79Sirk5PalU1nOV4cMdo/wO6dXCARqmlz6
	 q8JsnDDjxhyPL7aTO6VeJsinXBz+ytQBxCjXOHPhWYd6lmtab6pEZd27hqc8d5Molm
	 YUE9d/34f9TPO7c4rYgPDyLQr2b74D31VL04ZfYzpQoUg7P3PCfzFStghTkVYD5OAt
	 qlnVLf4ilKHkg==
Date: Tue, 18 Feb 2025 18:42:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: gakula@marvell.com, sebastian.hesselbarth@gmail.com, andrew@lunn.ch, 
 linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com, 
 salee@marvell.com, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de
To: Wilson Ding <dingwei@marvell.com>
In-Reply-To: <20250214065833.530276-1-dingwei@marvell.com>
References: <20250214065833.530276-1-dingwei@marvell.com>
Message-Id: <173992515450.2064904.7377620309703204862.robh@kernel.org>
Subject: Re: [PATCH 0/4] Add Armada8K reset controller support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_164217_592748_B93FEC73 
X-CRM114-Status: GOOD (  13.76  )
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


On Thu, 13 Feb 2025 22:58:28 -0800, Wilson Ding wrote:
> Armada8K has one simple register for unit soft reset, which is part of
> the system controller register area. The simple reset code doesn't
> support register access via regmap for the syscon devices. This patch
> series added new ops for reset line operation to make the simple reset
> code compatible for syscon device. And add Armada8K support then.
> 
> Wilson Ding (4):
>   reset: simple: Add syscon device compatible
>   reset: simple: Add support for Armada8K reset controller
>   dt-bindings: cp110: Document the reset controller
>   arm64: dts: marvell: cp11x: Add reset controller node
> 
>  .../arm/marvell/cp110-system-controller.txt   |  32 +++++
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |   6 +
>  drivers/reset/reset-simple.c                  | 126 +++++++++++++++---
>  include/linux/reset/reset-simple.h            |  11 ++
>  4 files changed, 154 insertions(+), 21 deletions(-)
> 
> --
> 2.43.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/marvell/' for 20250214065833.530276-1-dingwei@marvell.com:

arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1/config-space@f4000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1/config-space@f4000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1/config-space@f4000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1/config-space@f4000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1/config-space@f4000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1/config-space@f4000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1/config-space@f4000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1/config-space@f4000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1/config-space@f4000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2/config-space@f6000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2/config-space@f6000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1/config-space@f4000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp0/config-space@f2000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']
arch/arm64/boot/dts/marvell/armada-8040-db.dtb: /cp1/config-space@f4000000/system-controller@440000/soft-reset@268: failed to match any schema with compatible: ['marvell,armada8k-reset']







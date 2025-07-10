Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B17C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDdQMQUS9tcQYKSqfEQzsBrO/rxHXvoUgvUl0XBT0YI=; b=bt8eg29WOfFtDVeQADOm7ZsXPb
	uvHmvT/IWQw2CTs6fz/65XomxMRi+wlYrWWaYmzCqIuL8mCZjNoWDcuiskGwpQF6z4ombfPFMzCO/
	xSWvM7SmVmA2c3xybpaXUIz7VG4TAQXAPuskWes5mW6Dwfpy72Gz0I4CDUWHCw3B8FW0y5srovpQn
	r7xEWoPiZnAM60zeCtSlsrmuNTTwJPgI6Y/fgIstaNVh/ALImE8j91yEFXxxZVhKZcnTpHOvKtYQj
	a5Etv7WuBGOvYti2IgbaN0Ycs0msjCfhEcWxzwyF5zzqIcKHk0Km3jad3FtAemQ/+6z23CDqxWQBh
	O+MmDmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2QS-0000000DQZ9-1uCB;
	Fri, 11 Jul 2025 01:19:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzmm-0000000DA69-1rm4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 22:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D50525C59C0;
	Thu, 10 Jul 2025 22:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1B1C4CEE3;
	Thu, 10 Jul 2025 22:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752186635;
	bh=XwqwZqp7HuX7RcyuJ6RcS3EZOjo+k033TS6NfqYifjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIAuBUeI9kHse8pIF8gKTTgBrcwPa8tqm5mzxwbYiDTvgLLWdD5NlFqYEVmqzFRyP
	 dHbWbVnJfaHd0bRxy8lEj+WD/L+bs8W222PdgKISqaI8kY3H3LhHgyvjjEQ4TEokV9
	 l8p3FaOQYPuzSGj4Y445VRFrLHoUZMX3y/rwCPnkllrfM22ku9JfMR5VzHYO7KFHZD
	 OKD5xWTLw2ImE4jv1nG7x+FS0xLpHHQ6m3IRzyfKPO5zR+MyubayiHjO1/7i35E0ou
	 +Q52D4SrwrqD8L29YB1u6QtjZrREfLx8jeVSvcj1V9CZ1RrYG20rHD11pN+XRPljMH
	 vFCDCTlCAMGJA==
Date: Thu, 10 Jul 2025 17:30:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: power: Add A523 PPU and PCK600 power
 controllers
Message-ID: <175218663372.4188922.16230112848863911974.robh@kernel.org>
References: <20250709155343.3765227-1-wens@kernel.org>
 <20250709155343.3765227-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709155343.3765227-2-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_153037_042989_EA2E6ABA 
X-CRM114-Status: GOOD (  15.91  )
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


On Wed, 09 Jul 2025 23:53:40 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The A523 PPU is likely the same kind of hardware seen on previous SoCs.
> 
> The A523 PCK600, as the name suggests, is likely a customized version
> of ARM's PCK-600 power controller. Comparing the BSP driver against
> ARM's PPU datasheet shows that the basic registers line up, but
> Allwinner's hardware has some additional delay controls in the reserved
> register range. As such it is likely not fully compatible with the
> standard ARM version.
> 
> Document A523 PPU and PCK600 compatibles.
> 
> Also reorder the compatible string entries so they are grouped and
> ordered by family first, then by SoC model.
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changes since v1:
> - Re-order compatible string entries
> - Fix name of header file to match compatible string
> ---
>  .../bindings/power/allwinner,sun20i-d1-ppu.yaml   |  4 +++-
>  .../power/allwinner,sun55i-a523-pck-600.h         | 15 +++++++++++++++
>  .../dt-bindings/power/allwinner,sun55i-a523-ppu.h | 12 ++++++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck-600.h
>  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



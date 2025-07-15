Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9282C83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPEPbvFxufdT7/SYzEfT1Bx3fsHouovt0EggROV4YbE=; b=zToSwuVGX1/zei6x/MRWP2mRW6
	11qjnhKqZ0I0G1IMvHqkBl8CtaFDyPFuj5YyWzW0Jof6mEEK8aZhbfSOzmhEheOorqdPEJlOtUhfu
	b1yZY2i4ConYzve+U0MkptSpIgbzpRgAX0bLGMrMHfh/ZaZaXCe8AhoTynOg7VGPgdaC2kQPf4dj0
	OYtwO1Xy3Xbe0ncDXyB38w15BrC5XsxraB45aDzZ870XTTii6STenYstUmEHFgK/xtUFFpC4KFmP1
	fpQ1hLfZNF4+eZsB43FttYE2z14DF6hvebKbvYacyL+AVwcrKv6LnSWXqO/5mUZigB7lmeMombIUl
	AVGwiFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBZ-000000061aS-314u;
	Tue, 15 Jul 2025 19:19:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubigC-00000005lRo-2Awn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 16:38:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EC005C4A02;
	Tue, 15 Jul 2025 16:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31492C4CEF4;
	Tue, 15 Jul 2025 16:38:55 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id C986F5F7BF;
	Wed, 16 Jul 2025 00:38:51 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
In-Reply-To: <20250712074021.805953-1-wens@kernel.org>
References: <20250712074021.805953-1-wens@kernel.org>
Subject: Re: (subset) [PATCH v3 0/5] allwinner: a523: Add power controllers
Message-Id: <175259753164.2390274.11809107564152769710.b4-ty@csie.org>
Date: Wed, 16 Jul 2025 00:38:51 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_093856_598370_D9C228A6 
X-CRM114-Status: GOOD (  12.40  )
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

On Sat, 12 Jul 2025 15:40:16 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi folks,
> 
> This is v3 of my A523 power controllers series.
> 
> Changes since v2:
> - pck600 driver:
>   - Fixed whitespace issue
>   - Added explanation about possible PCK-600 lineage and document
>     references to driver
>   - Changed Kconfig option to tristate
>   - Rewrote Kconfig option help text to make it clear that the driver
>     is required for certain peripherals to work
>   - Made it depend on ARCH_SUNXI or COMPILE_TEST
>   - Made it enabled by default for ARCH_SUNXI
>   - Renamed PPU_PWSR_PWR_STATUS to PPU_PWR_STATUS, and added a comment
>     to note the macro is shared between two registers
> - New patch changing sun20i-ppu driver to tristate, and enable by
>   default for ARCH_SUNXI
> - Fixed pck-600 header path in dtsi file
> - Link to v2:
>   https://lore.kernel.org/all/20250709155343.3765227-1-wens@kernel.org/
> 
> [...]

Applied to sunxi/dt-for-6.17 in local tree, thanks!

[5/5] arm64: dts: allwinner: a523: Add power controller device nodes
      commit: 3b430dce33a8b48ddcae4e26991b2516e0431e84

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>



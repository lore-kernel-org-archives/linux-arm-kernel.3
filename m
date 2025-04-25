Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF54C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 02:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruvbd3UY4X4U0+8/ltcAvWeeAo0BcSM/Aa1A8T/LtKE=; b=dW5cBniFssWXo4yQOYmX+wCrLx
	9prVwRz3oAlNPn6iuffefTBuNGE641HbLdSgWPGdZluCql7FJDjsmGkv5CrMwqofLObAJnHiJ3dTU
	IglXQqgWggFsX01enDBjOBbry0YmtRiUuUjCdpiRmJfUDWTuQtswVatKo50NFWsnOPjuqAopIfWuv
	pArrXxqEIVGvh/zAeuRDLmTLQryroOEG58Wl2Xx/uAPxUFIB81g/CBuAKKBNuwcTgL43Qz0QZeDQs
	YsBaFvMmZD0+0nzP2hBjmtLoAWoz/Z82V+5NkWlX2HcB9QobivJrFS3Lcgyzz9S34Xi+hrv/n3vQg
	BM3Qzptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88wR-0000000FnXe-3q1L;
	Fri, 25 Apr 2025 02:37:27 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88ub-0000000FnN1-1PFM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 02:35:34 +0000
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8484234133B;
	Fri, 25 Apr 2025 02:35:31 +0000 (UTC)
Date: Fri, 25 Apr 2025 02:35:27 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
Message-ID: <20250425023527-GYA50272@gentoo>
References: <20250416100006.82920-1-amadeus@jmu.edu.cn>
 <174551712323.4050580.15085872783453662439.b4-ty@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174551712323.4050580.15085872783453662439.b4-ty@csie.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_193533_400703_2342B02C 
X-CRM114-Status: GOOD (  14.11  )
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

Hi Chukun, Chen-Yu,

On 01:52 Fri 25 Apr     , Chen-Yu Tsai wrote:
> On Wed, 16 Apr 2025 18:00:06 +0800, Chukun Pan wrote:
> > According to https://radxa.com/products/cubie/a5e,
> > the name of this board should be "Radxa Cubie A5E".
> > This is also consistent with the dt-bindings.
> > 
> > 
> 
> Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!
> 
> [1/1] arm64: dts: allwinner: correct the model name for Radxa Cubie A5E
>       commit: 1e5a69d67d1b3c55c9b0cd3933af1436b5d52aa1
> 
It seems I'm a little bit late for this, but while we are here,
Can we also append 'cubie' to dts file name? e.g. - sun55i-a527-radxa-cubie-a5e.dts

for the reasons:
1) there are already too many product lines from Radxa - Rock, Orion, Zero..
some dts file in rockchip already adopt this name scheme:
  arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dts
2) there might be more products in the future for the cubie series..

Chukun, if people agree on this, could you send a follow-up patch
to address this?

-- 
Yixun Lan (dlan)


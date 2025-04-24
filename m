Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB73BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmsW3dleKru6huU8RUJcmv5jKqIgjH1kYPEJVtM56iw=; b=UAAiSsFByPuZDf7G296MZPZNL4
	54iUTeQsD1ZVRdCkzN6j9Kes3ENfDDC9JZxQ7XFPrHfq3rp3Ytes0l46RmzoC9V+OjTdNbLtJFvH6
	WIW2MeLcWcCGGclI9c+oCLTQL2oX7tLqkcJ1muAPlaXOCj88WhEOco9WJzfGT6vVFAs3wp3hHolMy
	3E9cw5WNq0kC4If4QmqbHM54Yxn3Vwavf224CijN5L/YSDP7SLFajeOh3aaREikxkqjy2Bi5Tf3Rr
	N/Dd0uuXzH0qXwxdIsoyxRcDIrnk5VbTPCbeUfnj/djwTvyg7D/wSNy8T500Yz5snPo0QlMry0ESs
	hMHpBCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80ni-0000000ExT4-01GT;
	Thu, 24 Apr 2025 17:55:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80k3-0000000Ex3k-0RmB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 17:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0495C5C64E0;
	Thu, 24 Apr 2025 17:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BD3C4CEE4;
	Thu, 24 Apr 2025 17:52:05 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 15CF25F71D;
	Fri, 25 Apr 2025 01:52:03 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, 
 Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-pm@vger.kernel.org
In-Reply-To: <20250416224839.9840-1-andre.przywara@arm.com>
References: <20250416224839.9840-1-andre.przywara@arm.com>
Subject: Re: (subset) [PATCH v2 0/4] arm64: sunxi: h616: Enable Mali GPU
Message-Id: <174551712297.4050580.7389706092232508624.b4-ty@csie.org>
Date: Fri, 25 Apr 2025 01:52:02 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_105207_196618_FFCCA484 
X-CRM114-Status: GOOD (  12.49  )
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

On Wed, 16 Apr 2025 23:48:35 +0100, Andre Przywara wrote:
> version 2 is addressing the comments I got from the reviewers (many
> thanks for that!). The list of power domains is now separated from the
> per-SoC data, to avoid going over the list twice. Also the error path
> takes care of removing already registered genpd objects.
> Based on v6.15-rc1, changelog below.
> 
> ==========================
> The Allwinner H616/H618/H313/H700 SoCs contain a Mali G32 MP2 GPU. This
> IP is from the Bifrost family and is already supported by the panfrost
> driver, so enabling support for 3D graphics on this SoC is rather
> straight-forward.
> However Allwinner added some bits in the PRCM block, that control the
> power domain for the GPU - on top of its power *supply*.
> 
> [...]

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[3/4] arm64: dts: allwinner: h616: Add Mali GPU node
      commit: 8e1bf57ee67d0bcd78c6f7e713f98795e378497b
[4/4] arm64: dts: allwinner: h616: enable Mali GPU for all boards
      commit: 0836bb7e2521dac3ce764613dd9c5d22f5b368d0

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>



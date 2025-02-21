Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC3CC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 23:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzwjCGFLas9YG1EuHfsuQPAlEHvr/0bdbEfOWWtZqKM=; b=E0mDL0mrw7YhdIB+y6ZoqaSQV5
	Lmn24zqEIFhmm5K2x8Mmx9biEp2nmZeLsN8TRMrM/gPXAUb6hV8scAhAQVvPLRTaQ1rxQu3UFDskP
	9qiX9ebiX0DDI8kKiI5FAuXMcQ0/7iwE68zEm39TO2/QoKaZyuhrGmeRBDNwJzMv47IrMui9VnzJ3
	KJnIK6GfVCOuCGEV3BuD1putFdczrJvdPd0WnlUcWmcFcar3kfdL74+yui/y1ury96rywbRjA0cxh
	XxwZOGX9W+8ExQktK2UcM3l68rlA6bMTvha+/aQsMPaSpsxvZsF2Id4w95xYW5t7aJEjO/bcv5cIs
	EflZUcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlche-000000079y1-1oyO;
	Fri, 21 Feb 2025 23:45:06 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcgC-000000079p0-22zx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 23:43:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E345E68349;
	Fri, 21 Feb 2025 23:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2AAC4CED6;
	Fri, 21 Feb 2025 23:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740181415;
	bh=GigKIqugzG3RnBUJxgRg750/c4rFtzjUiyDG9IUNwbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUAOYy+/YJy7QI9SjZaPQFB33Job5VD8SqGBh5+UJAK7Fh1/SYsbAEjVu94E40ZIP
	 1G2zYt5QKpK09qUmMWzl2nUbiPFq+oz4cKl33uDY6h5UmvRL4JqcZIB2IRTdYMn60f
	 VMtAUlH+CYQs3lnMjfaI5Hy/zg8G8rP79DfOEnfvzzj4ivsU1FCx7GMyA1nAUObN+7
	 DXba4FJo3HIbqQQhT3HMvPjLklpHh+qId5Xl32iS1Oxlkb/xyDt/PsvAD9JqRWZ3To
	 tXKN9NObT19kEXAxLKrKtkw2uzgUzFVMSNyZXniFs3yCNxEVO1XraqooJS/EBhyegr
	 nsN43cCRgsIVg==
Date: Fri, 21 Feb 2025 17:43:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
	dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
Message-ID: <174018141298.394778.13629046631332003048.robh@kernel.org>
References: <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221005802.11001-2-andre.przywara@arm.com>
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


On Fri, 21 Feb 2025 00:57:58 +0000, Andre Przywara wrote:
> The Allwinner H6 and some later SoCs contain some bits in the PRCM (Power
> Reset Clock Management) block that control some power domains.
> Those power domains include the one for the GPU, the PLLs and some
> analogue circuits.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../power/allwinner,sun50i-h6-prcm-ppu.yaml   | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



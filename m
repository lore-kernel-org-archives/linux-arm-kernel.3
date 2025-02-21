Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5807AC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 23:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rNHwqNe+PFFQ934OAE1M5yJwtf95poV0qIyH5tZCPA=; b=WiaYwxf8Misc5eU2pSnh/eJfUZ
	BvGQSxDquZ6Y21OCVZdCJYe5yjzeajmtCXtzIvr91Xjs+kVB0yNJVNTmsZYyprW40OKQNRufpcfQJ
	jiB3K1zzbtLgnIsiy2nXfp+RdNyZvtw6OVO71T+GQ15t5K6/utlrTBcn0n/Any+qG0bWLntyxpvBL
	SbED3/dXCQabe9rLReraioKfWJ+vZZAlnCY6O8JSUWZyBQR8TYNhp0IKa1kKg1r5mbgfg+98fpak6
	PUJqrOkfWIpwZVNjmLWCjOsZOgwWuVd723l4MUq97vI+oB2DJ8pH/uFFmgE6FGi+bHbgN/xlBeEBt
	e8VcnO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcj6-00000007A5r-0KSz;
	Fri, 21 Feb 2025 23:46:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcgp-000000079sR-2AIO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 23:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27CEB68340;
	Fri, 21 Feb 2025 23:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7310CC4CED6;
	Fri, 21 Feb 2025 23:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740181454;
	bh=LPuDk+6EvEIOleZ6HMXz7Q2USX7ef9j+avusUpmJAsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G2gZlZNJ4nhnlglQR2Ul7LtTjncW3SSm33huoq+mJ6vI1LF+w3HUJDumaw0NGpT/J
	 3oi6hEO+LClIxqCIMNUIRHy3fFfvGd1/vDTSey+O4d0QCqMyNrn7GZiPN+piVN9jEa
	 hE0t6mSe49fbNVKQFbkany8o+WWZGT/FO8dgW+fGYY0z31hk76aKztqqwl+YvjxvyH
	 4B77FUdncY/A1ir1+kGuY6SpKVq24iRVU4H9GrjksTBqizc+BEeRvZYaSpFPp0+1Zg
	 7oS49dcHefUDGvpfcDnjGg39MXowMS8ApT/u+FKHDmvYO0fYvOjcbZ5njkM6/qHyIi
	 JlSmnuuT4f/DQ==
Date: Fri, 21 Feb 2025 17:44:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: gpu: mali-bifrost: Add Allwinner H616
 compatible
Message-ID: <174018145089.395682.15107324899674215035.robh@kernel.org>
References: <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221005802.11001-4-andre.przywara@arm.com>
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


On Fri, 21 Feb 2025 00:58:00 +0000, Andre Przywara wrote:
> The Allwinner H616 SoC has a Mali-G31 MP2 GPU, which is of the Mali
> Bifrost family.
> Add the SoC specific compatible string and pair it with the bifrost
> fallback compatible.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!



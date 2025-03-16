Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53CFC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WEtGxZK9UfZyD2ouxIIniz0wdcp7drumPvQShC8mJA=; b=3GFOq/zQ1f5y6f7sxIdcCxL2ZL
	pSRTR4jkjs0tt8plySrohI5i35qH9Ps3ULTi83/zdi4hkvdwT0m5+SqnTFpWR7OVfECv+RzZ3Jdc4
	+R70s5EEML8nT4M2ee6D1wooV/TbZE5TWyLn031z9VXsRNnrn75GreojCsuR/hH+lLQKZA8sny9kH
	VtHwYx4jX3vmOPEwK4oHX/F/s1u55foOgy8dhydpX/7UxCzo6m7nPvBmSXqIUIQYXdGkWeFGwgUNQ
	vKZ/pULcdE6bORZVPZSeihzcHvdGPfLeWtJEs3blYfQrGJXz4jGQ7TUJI++nxyM6ZMUKOJTxsT506
	HLdR09eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttrgG-00000000PoY-0NlL;
	Sun, 16 Mar 2025 17:21:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttrea-00000000Pcf-2zxT;
	Sun, 16 Mar 2025 17:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C96AA48C21;
	Sun, 16 Mar 2025 17:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E155AC4CEEA;
	Sun, 16 Mar 2025 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742145599;
	bh=eWdR67b6ix179Rxy3aXvjo2umckSWRuMZDSIyOoE/8g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Jz/bwj84Ai7VdAGrIP0RsEvCTEDnpDlbIPEzXbk3l9G6eWrFUT2VNqLj8bkwyuKrl
	 CPTOoy2nilVn4904n9ech4E6c+cgPCL4fcJqlb4VsNzOJNF/9Zc5H3vQTpjX/Td8zY
	 pccAdyEOOnd/hgyABAyjJOw27sWAxxlghLS2113sHupjxnBxuFaf/XXqmt/CB/+kr8
	 dUyaaYkQReYDGlvlwrRuGt5viiSE4ig25Kiz9D4ClpkreNFgr7X7ZzjjlTCBxw4/or
	 Tm3GC+lRDhcZKPUm75BW9ekDhNKlmnf4mSUzK4XKYqBLD8ar2E/9M8wL8/1wv7VIIg
	 Nojj3jQInFlqQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quentin.schulz@cherry.de, sebastian.reichel@collabora.com, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dse@thaumatec.com
In-Reply-To: <20250313134035.278133-1-heiko@sntech.de>
References: <20250313134035.278133-1-heiko@sntech.de>
Subject: Re: [PATCH v8 0/2] MIPI DSI phy for rk3588
Message-Id: <174214559552.644495.17738101369641908083.b4-ty@kernel.org>
Date: Sun, 16 Mar 2025 22:49:55 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_102000_827297_7FAEBEF0 
X-CRM114-Status: UNSURE (   9.00  )
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


On Thu, 13 Mar 2025 14:40:30 +0100, Heiko Stuebner wrote:
> This adds the phy driver need for DSI output on rk3588.
> 
> The phy itself is used for both DSI output and CSI input, though the
> CSI part for the whole chain needs a lot more work, so is left out for
> now and only the DSI part implemented.
> 
> This allows the rk3588 with its current VOP support to drive a DSI display
> using the DSI2 controller driver I'll submit in a next step.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: Add Rockchip MIPI C-/D-PHY schema
      commit: 301587cf4e771aca8c5ee05a6ba8d7d8f548e478
[2/2] phy: rockchip: Add Samsung MIPI D-/C-PHY driver
      commit: b2a1a2ae7818c9d8da12bf7b1983c8b9f5fb712b

Best regards,
-- 
~Vinod




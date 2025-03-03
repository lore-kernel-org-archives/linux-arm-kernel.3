Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAF7C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rj4biKGywk4ji9YAvi4TBUEVIX9SRkwFamPNNst6Ml4=; b=NBVvUI20ZUue8+8lycvno1Cpsr
	W7VffVaNXDXpAQ4j45moQykRRM/VxXii7KVAKgsfprBBDasgWanvtri1KvkrluG/F2gBwpC8wAhJb
	uJ/0KnHHfDcFP9P1ga4N/v6dJ+OH/tt9ZeVLCPKwbb/nsL1g4mC4+gPVbfqmD/d7fohLYK3Co6Lsg
	/6Zhdigv8rOcwXeCZ69DRSlOEdywrS0w6WNoxG0tzBPJVLABHlLDXxd0kWO3wl0I0gmLtYgOotlBT
	HtJyPyk6gO4vM2WB3wTAeAs81WeeAj9geZj5KHJ42YCmE2Pdtk/sD15UhdxbQ2rLut8pEi9eY9Xtx
	xGTj9B5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7TN-00000001F3P-3AXM;
	Mon, 03 Mar 2025 15:12:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7Ol-00000001E8d-15RE;
	Mon, 03 Mar 2025 15:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D11155C56C4;
	Mon,  3 Mar 2025 15:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFCBC4CED6;
	Mon,  3 Mar 2025 15:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741014482;
	bh=QXXXpM12v1Agg2tcKYnCNN9Fi/ZUI0fcZtVr+dib87M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8vu8jKVtVkaax/3iuOuOfKU/3HnSsCmaKySsoT6PALcEPxBy+y8yK+W8lfyE8Uw7
	 dmqxSwIboEJ/vwRPjoK+kAT+o5/hb/CTxkm2K2JUweU+ePZXinE/wGTlY3Kl+s+9aH
	 q0fO2g84QhR08VPuN2bX7ukj7W5tYBfHpNSUF5b/RTX981lvHIFyZz6xxn7pR127WR
	 uudEWCBY+G5PZnMUbCotLlKuAzm3XBFTMcSe6M6vvQPHuCPkc4DDNDKQPEmG8L96CO
	 pkUkjLGW5ui6nYgp0MBSZfha7tD2iJEM1kLqyYCu50uK5A03yq354BTyPxtwxiqC3V
	 t8LtqpjF3UzuA==
Date: Mon, 3 Mar 2025 09:08:00 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-rockchip@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org,
	Frank Wang <frank.wang@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-mmc@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/8] dt-bindings: soc: rockchip: Add RK3528 VPU GRF syscon
Message-ID: <174101448016.1859733.11356021795380428935.robh@kernel.org>
References: <20250301104250.36295-1-ziyao@disroot.org>
 <20250301104250.36295-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301104250.36295-3-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_070803_358454_D5AF7508 
X-CRM114-Status: UNSURE (   8.29  )
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


On Sat, 01 Mar 2025 10:42:44 +0000, Yao Zi wrote:
> Add compatible string for VPU GRF found on RK3528 SoC.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



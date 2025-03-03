Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0D3C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA/5ehNmY+38Vy/sfqjjk2Pw7OcSjjJmmaQoq0STkKY=; b=AoXtk9UGkYazAIUsN77h3ObV8r
	OB/ay5BjccaMpmXxC0zuMyl8eZp7knbXem4Ww+bv6+Ni6C5aiddAKiku64Izt5+bZNDX6QEqScAIr
	qEVw/qoa2/fwXvd8xUJ4p2cgdl7d7747EHZohPwI4vQBgifs47v/wztha9wsRfa0PZyTRnd4bXxU3
	KPPeT8hay54hggmzJPzoj/jyBT0nueM07izi0rrhihMe9o+rwdB6W8vLZF+JzebmntHoQDQ0ohssh
	5BHs2BSsv39Sqr3ZxQhujLMFStCtcBPbNS1RgaTfKbA8Nq34/QxfK/YdFhpD40pg7U5glUEwt7cH/
	mqAzT0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7Uv-00000001FM5-3AlZ;
	Mon, 03 Mar 2025 15:14:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7P0-00000001ECU-39wj;
	Mon, 03 Mar 2025 15:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B54F611FD;
	Mon,  3 Mar 2025 15:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1CBC4CED6;
	Mon,  3 Mar 2025 15:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741014497;
	bh=wxHNAItkFHIncMThkMK3x96fLiyJc6WQRTjToXorc8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XWtGk6wm+ybrOTF2kYZjc74q2++XFn6YSLPvBiSLIHKYwonzQoe9rIG9MkZeQeI0i
	 9kA7Qbt7FwITNhJRIKd1t3lcKguy8eqX6COl2wI+Px5cnZgJJa49JM3I9zqtKxyLbv
	 5TMqlaLHhJPCLq+fDu4h3yGDhIdxPxBwG6V6EOpA1MkixHN0hm9qXMEY+2GrCBeyt+
	 jDy0VwSSkmVnof2xU9oc3LnZu77kj1ZztDybehJPtcewmbkaERYfg40QXhlqxrESDy
	 5dQ8xYobvzN6aRx7YUsZqilxAaLIQAalok9cMSI88/N1ga33n6tZNGXltdISPZ4sl+
	 bICiNAEKV+7Tw==
Date: Mon, 3 Mar 2025 09:08:15 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mmc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-kernel@vger.kernel.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 3/8] dt-bindings: mmc: rockchip-dw-mshc: Add compatible
 string for RK3528
Message-ID: <174101449502.1860172.16789001197573661761.robh@kernel.org>
References: <20250301104250.36295-1-ziyao@disroot.org>
 <20250301104250.36295-4-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301104250.36295-4-ziyao@disroot.org>
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


On Sat, 01 Mar 2025 10:42:45 +0000, Yao Zi wrote:
> Add RK3528 compatible string for SD/SDIO interface.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67061C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFCk0C1PHYDgDyjSFCdL5tgsYY89k39dtAR/yGLSjKU=; b=nNkw6ZZqBKcNi/pnJyrEXMMnJK
	kV2BpmmCyg3hguQisPLiGHXHQ+Q1JQp5JQSXk90vSkTcTbYML9zk2D0jjqFsr4zd42ZE5g4PT6pAB
	oM7/NHglLOgsl8kEHNp/bHIgQnNU5VqySrD6GccAqGL+m6LqdmNQXIZFMXnz0sHp5T87qRuvuglhU
	HcDAMYyvjo/wFSw8NxPegfrfsX/nmb9MfX+HYyJ4epCeAfKPe/YBWWKZRnkHs7TsLu5mLEDh0cB+c
	dNUbSMi3HJB+Ev5OgWJC9C1WRf3BO1x4SiFQ76OisseNKUxJs9Rkjx5ack/FLe+v5blw+uxL2yPCa
	dN7ejVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6gd-0000000CW5h-1sij;
	Fri, 28 Feb 2025 20:10:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6bb-0000000CUJ5-0IcK;
	Fri, 28 Feb 2025 20:05:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECECD5C6500;
	Fri, 28 Feb 2025 20:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429ABC4CED6;
	Fri, 28 Feb 2025 20:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740773105;
	bh=HDPVRdH19vPfCCs97GSQak1exPAHADd+I22PDOk9eb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=umF7mFGl1Mo44g7j0rA6LTCTSCSWwgpr/Z6ciUI9f49V1ESicqnt1UEtjQTudAmDc
	 kOglbAmBebRqtFHsa9L4L3DXWfj96AWd1yarvOAGoIM0soehAInAn1aPvS+tVrxtOD
	 tFauEBXxgDDMRI8zVHAwN9pfb+e8ZcRdkrVXY00zwdnjTRWs2mZgWeTsvxl4Gbnk4I
	 18ITn0CC/ONbUlcxwNtT1/SSds7c7zXpx4LxCzcKkZu8Bciez0yaXaM93NzUHhXPgY
	 LfXk/o3J6eaqM3YynhfFVAtMHvka+RFlYljNHtMLDCvdWZ4YYElPAi+MDUVqtQQiiO
	 iFg8lWwv0zq5w==
Date: Fri, 28 Feb 2025 14:05:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, heiko@sntech.de,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: Add RK3562 cru
Message-ID: <174077310259.3472233.9078765224911917357.robh@kernel.org>
References: <20250227105916.2340856-1-kever.yang@rock-chips.com>
 <20250227105916.2340856-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227105916.2340856-2-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_120507_164362_B6320226 
X-CRM114-Status: GOOD (  10.50  )
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


On Thu, 27 Feb 2025 18:59:14 +0800, Kever Yang wrote:
> Document the device tree bindings of the rockchip rk3562 SoC
> clock and reset unit.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v3: None
> Changes in v2:
> - remove rockchip,grf info
> - Update file license
> 
>  .../bindings/clock/rockchip,rk3562-cru.yaml   |  55 +++
>  .../dt-bindings/clock/rockchip,rk3562-cru.h   | 379 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3562-cru.h   | 358 +++++++++++++++++
>  3 files changed, 792 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3562-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3562-cru.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBECC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtB9non29hRNLgvRCAL7imjnJZuCLYnA5wQkDM/C5TQ=; b=gqdcHRfXzHunpV2gcdP/ZFXTpF
	gRMomNwFQdMv8dcSfHgBm3dQo/MENB4jx35CZRDE6QIutlGfibmL/NUj5F4M0IRyQrqLR1or+uG7n
	IFHFIgJQn7hk3G3HvTOhDypC6gOB9ya0BhifjTO05J4XZuyhaS9CJmIRU63CfnV/1me8zZLjYjTC6
	PfxbZTKnP8oY30GwHLNyBwxwHQ1SGeNJ8JVQjejKuc/WtybBW1xsaxMdxJos5pDibDj+J0kEVoscc
	6gGxMn2Rxerh/4B1WTDfrg22zBtPq3OYchYY41eV0Y17o5507el859iK0y+B6GEwQf45fr4IS0bT9
	2Jk+rupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7NR-0000000Cez9-2AgG;
	Fri, 28 Feb 2025 20:54:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6pI-0000000CZAF-3MlT;
	Fri, 28 Feb 2025 20:19:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B5325C01DB;
	Fri, 28 Feb 2025 20:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DE8C4CED6;
	Fri, 28 Feb 2025 20:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740773955;
	bh=Fu7VUqbWek0xFIvF5VwKiqUP47YqKbMOQ2CxOz+pi2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FXoaFVsp2V5IOYcc5hyR5NeXNciwKRyigEjZt7DoL+WNuGY04iXiVGlh3M1rffC93
	 FARIu8H/YxwQgnVzIbfqYxJtpGWnsknMG4ukgVwP0tPzmGpUy/qXnsXdePogMO7QDl
	 d5Pdg0hcTeZ3ud8AlG+gnf97ZpOUYYevLh8budL76pFsmohTH6G5TXCxx309oBSp0K
	 j0RmM00bWeJKlQ3lbqvtlz8KUZmclKYWOLf8gCMHIBupy+5ROtv9ZVukaBoRrp3LcC
	 L01ck3B2ieAzRJP5mGIPNWMCEGsIPhKDm9ql+ICQIPwAC8ncD0qhhwdpY7JLWHPo+5
	 d3bd86uj2P4Dg==
Date: Fri, 28 Feb 2025 14:19:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
	Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org,
	heiko@sntech.de, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/15] dt-bindings: rockchip: pmu: Add rk3562
 compatible
Message-ID: <174077395277.3611819.7689063628418129415.robh@kernel.org>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
 <20250227111913.2344207-12-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227111913.2344207-12-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121916_880611_9F3776AD 
X-CRM114-Status: UNSURE (   8.99  )
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


On Thu, 27 Feb 2025 19:19:09 +0800, Kever Yang wrote:
> Add the compatible for the pmu mfd on rk3562.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



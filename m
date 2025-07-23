Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56E6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 22:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLECL2NQ6DHF9R0qbKSYpPfYGN97nTM8wZbviCsPTYM=; b=nUgX9P6L86mshdyAuj4v/3Yw/1
	hnojnXnVlbahOojufoNi5RYJx2VhdWThw2ExYtnHKLqzjBFpkk2joZMXLya/JVMauh1cOqPVGs4je
	loTh+YDrfJzL1bg7LbziMq6PaFH8IGFITcL5O4ceIUrGlyclH2Bw2EefmPFbRwg6h6cIzsVT94EMR
	UTRp6BBj9RNtG0n7i/Qn+7Eco2hqgqk0sKDfSer22vOI3g7RQk79gO86YXXiJqAMy1448KsnVJmwY
	tU5tjeO/Z5AJW+MhW58XE6q84l9QX7hw2j3rWh9jG+LSjRDQcMXrDRtYy7Fpcp9XuvqxYKkAz2dP6
	+h8yZ97Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiFV-000000065Ko-2ygG;
	Wed, 23 Jul 2025 22:47:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiD4-00000006524-2I1j;
	Wed, 23 Jul 2025 22:45:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24970A55D56;
	Wed, 23 Jul 2025 22:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B87C4CEE7;
	Wed, 23 Jul 2025 22:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753310712;
	bh=nTH24QInstBeSS9klIPJ9Tu6HAN40AwJTI9RN1z/Fy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKTw81ZVFdjj3tth36AXNrQ9C7QjHe9ODLhBLwnYa1BdrNrfc2puj2As/ssrX2huQ
	 V8jFST94jYBYC8wjxyblaHYVUkkwpBXRv0fRPsDLE+LQBJtX+w0Yy7ZqYTF2Ejeoge
	 6mM/e4SBpDTRu+CGv1F3kAnWaqnsKDMRMrB71P+Ifrr9KdOm+mgIaXT56y14wwS0G9
	 LSsNfm5Oc+LiAcdUisYrdOBo3ViQ2xpguhq/bBCxmjH199jag9FvJOxp6wPTNzeXOC
	 A68WTAySVdqetVcts88Q0hC3WMXfDc3K4u4ERbiXoMLpH7zOnEU/qdD6MLRsaNJsU3
	 JndhPTrDqN2Tg==
Date: Thu, 24 Jul 2025 00:45:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, 
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: i2c: i2c-rk3x: Allow use of a
 power-domain
Message-ID: <os7rxycm2tsganlvrffxvkcnkj2dcccsfcfxv6mhesvekeu6wb@ui6msrjmgtai>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
 <20250723085654.2273324-3-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723085654.2273324-3-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_154514_648330_D7AD2EE7 
X-CRM114-Status: GOOD (  12.57  )
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

Hi Jonas,

On Wed, Jul 23, 2025 at 08:56:44AM +0000, Jonas Karlman wrote:
> The I2C controllers in most Rockchip SoCs are part of power domains that
> are always powered on, i.e. PD_BUS or PD_PMU. These always powered
> on power domains have typically not been described in the device tree.
> 
> Because these power domains have been left out of the device tree there
> has not been any real need to properly describe the I2C controllers
> power domain.
> 
> On RK3528 the I2C controllers are spread out among the described
> PD_RKVENC, PD_VO and PD_VPU power domains. However, one I2C controller
> belong to an undescribed always powered on power domain.
> 
> Add support to describe an optional power-domains for the I2C
> controllers in Rockchip SoCs.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

merged to i2c/i2c-host.

Thanks,
Andi


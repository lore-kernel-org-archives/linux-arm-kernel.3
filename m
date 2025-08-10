Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469BBC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 19:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/soDWhpMt3RVF92VZU87TSiyMVjxrW/cTu3woF57XwI=; b=exvxQbWhkcygjM/nqwoHoIzuDJ
	ALLVx2ONbMHA23yQu8vNfB6i6Isdvr/l3dFr6Ax6Nv6hHXBjNijlx/C9S2RdXUdxkTwxBn6Io2nHX
	77g1hvzArCYDOv/VS8Cm2auyxnW4+z+Jqctwm8bqNDYkRPEN0WHS0uNnkyKvJzs++0T98qLvF4csa
	YO3qsj9MuYF2Om8XSeRrBthuEj5fuQTIJX0ZbKColDMdFWknUh5gdQUV1hLp2RPHDJpS32rHhNQHC
	5svySfwFdaEomWVRudES5kl1Updk4VvVrcQgd4S7H0cebyfR59OlZbXlnCqt+dO/s1ojuZvyn+wEl
	iBtfFB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulBfp-00000005vGe-3OQd;
	Sun, 10 Aug 2025 19:25:41 +0000
Received: from luna.linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulBdE-00000005v9v-12yX;
	Sun, 10 Aug 2025 19:23:03 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 019474955FE8; Sun, 10 Aug 2025 21:22:54 +0200 (CEST)
Date: Sun, 10 Aug 2025 21:22:54 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Niklas Cassel <cassel@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Alexey Charkov <alchark@gmail.com>,
	Patrick Wildt <patrick@blueri.se>, Chukun Pan <amadeus@jmu.edu.cn>,
	Diederik de Haas <didi.debian@cknow.org>,
	Chris Morgan <macromorgan@hotmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: Add the vdpu381 Video
 Decoders on RK3588
Message-ID: <aJjxjgG1gEaKBVwE@desktop>
References: <20250808193602.142527-1-detlev.casanova@collabora.com>
 <20250808193602.142527-2-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808193602.142527-2-detlev.casanova@collabora.com>
Jabber-ID: linkmauve@linkmauve.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_122300_434625_666956A0 
X-CRM114-Status: GOOD (  11.94  )
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

Hi,

On Fri, Aug 08, 2025 at 03:36:01PM -0400, Detlev Casanova wrote:
> Add the vdpu381 Video Decoders to the rk3588-base devicetree.
> 
> The RK3588 based SoCs all embed 2 vdpu381 decoders.
> This also adds the dedicated IOMMU controllers.

Back in the VEPU121 enablement series[1] it had been decided to not
expose multiple identical cores yet, because there is no infrastructure
yet in the kernel to schedule multiple userland processes on multiple
cores, or (more relevant for your usecase) to even combine two cores to
reach 8K support.

> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 

[snip]

Thanks,

[1] https://lore.kernel.org/all/20240618183816.77597-1-sebastian.reichel@collabora.com/

-- 
Link Mauve


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6270DD5E379
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 18:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSKanQf0BmxKHhIhUXq0enULNI1TVd/OdUXWSMftuIg=; b=HGysRl/+p8jJDkHO9MYU5Hfxz6
	9KgSKbZH1/PtMPaG5JHOaYRCEUAXVdWDZz0U4C/sl2rxWCZLv4q98OIarjNT048vlCtBTgcTM+7Wn
	SP82BehauD9tbDk4SyDxI5BFHIc2DUnml/wH4HIKVX5SMC3PILLdaHCq54ZtJVpq7JgQuJIFZ/JOe
	AlDVb++X8xa4AU8bHx/qspJ+RXeAoSRA64MHNHoVT0AolPFzLA3QqIEq+Itll4HAQoQBhgz6lB7uK
	d6GPbpLPP0it7ZVzF6z42ne0QgMOtuUfSRh/RRwodYmqhX4Hx2ey7raMtF3ua+lwRE80kHorssW8G
	JU/p7eow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9qQs-0000000DpeV-1cWr;
	Sat, 09 Nov 2024 18:43:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9qBR-0000000Dnh8-0qRV;
	Sat, 09 Nov 2024 18:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gSKanQf0BmxKHhIhUXq0enULNI1TVd/OdUXWSMftuIg=; b=qOsnP34HUawU0TWZvm8UKgXPaU
	PtH0PUeyFGjxsY68jFjAgi7Z2b1uMHTIggP4rZ6TLw6c2TLNY52E2Xyc/Qn8YlPWSWW7rJElcVpzP
	vmPdfQRRNkLhRNF3g8oljkfDR3uoro0B2dsMY2noEc+TyYMKf2rmt2kBBaN526eqbVJAXZ2Kz3QbS
	afynPjHmGxBxDrFjzWtWQFnZdJGrFiGmvBYX76vF7Du4CKsEFn9LUs65uweBLMuRleNiohljYMGUf
	uSED23GccLJK6fLSeiFTwRajwDhDc2itsvvPuL75XMe/Irdtq3o9TbL9qUctVuEqYxSso99Y2K7Ro
	s477Oy1w==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9qBH-0007Km-4h; Sat, 09 Nov 2024 19:27:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	didi.debian@cknow.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2 0/3] Update, encapsulate and expand the RK356x SoC dtsi files
Date: Sat,  9 Nov 2024 19:27:11 +0100
Message-ID: <173117675956.1131306.6435149045133652112.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730516702.git.dsimic@manjaro.org>
References: <cover.1730516702.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_102741_263848_9A02D569 
X-CRM114-Status: GOOD (  13.01  )
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

On Sat, 2 Nov 2024 04:08:58 +0100, Dragan Simic wrote:
> This series tackles the Rockchip RK356x SoC dtsi files in a few different
> ways.  First, it updates the lower and upper voltage limits and the exact
> voltages for the Rockchip RK356x CPU OPPs, using the most conservative
> per-OPP values for different SoC bins.  This is rather similar to the
> already performed adjustment of the GPU OPP voltages. [1]
> 
> Next, this series prepares the RK356x SoC dtsi files for per-variant OPPs,
> with the RK3566T being the first new RK356x SoC variant to be introduced.
> This follows the approach used for the RK3588 SoC variants. [2]
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: rockchip: Update CPU OPP voltages in RK356x SoC dtsi
      commit: 0e183fcc92b0eaa13b33b39846d86c3d65b8330a
[2/3] arm64: dts: rockchip: Prepare RK356x SoC dtsi files for per-variant OPPs
      commit: 853f9632a17624e9264c68be5c9587f13d04be54
[3/3] arm64: dts: rockchip: Add new SoC dtsi for the RK3566T variant
      commit: e4832d190b4fb69cf28630543804825bf1636ff1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


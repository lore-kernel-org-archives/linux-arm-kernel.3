Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59984E9B36B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6SbFLc4f+0AUJqjR/btDT2FjgfxgT/jHR66a8XfvPI=; b=fcd26Pd0D/LEY757npAFMiaX8w
	dc9fGHE44qLuws+pz9PhjAtWUqd4lE+O28MGmi5tbS1spGCFatudQLVdwA8up45sUZLJASf6+trgs
	GpFoWRjRRba7vEQ/0PXfWaOCTyVTAzXuyCudG5v19hia1x5NAcLQ1+sHhtlluAB+vOut/k6wCqBjt
	YEzlunx9+VA1WsblMBh6UrLAjyXGptk4iDTkw+87bT/qUjJ3iFqos/uyqg9igNUfDgVVRUPP5R3c6
	ERmcPtNSvUAA0WlJKcHyuFPm4dOo79y5AAyQDN3GLvArXS2SRez84mWKReJQPIYMyb/0eUoN7PGPS
	D8Jl8COw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1d7-0000000CqJW-0HZT;
	Mon, 02 Mar 2026 11:40:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1d4-0000000CqHI-3l6s;
	Mon, 02 Mar 2026 11:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=X6SbFLc4f+0AUJqjR/btDT2FjgfxgT/jHR66a8XfvPI=; b=i4pxbl/EziIQJQ95nSQYiOuP0Y
	8J3wCX42+B7zdlERRorGAoeX4/7/12mb6stlJG5v8IadafTiVYDmdkVdUKdWKW3WElIVbofNupyY1
	pncxKs7tnlMKKUwHubUV1HxU00F8adyPqfuLrEpbskvRXymdU73fdwEg/dBPv7c++nhqLCAUphTjp
	Ea2qQ7eqIqlS/RcqAsdWv4NJIZRQQ+o2NqrdQluuBih6d2CozW6FMk5Xo4FI7otRWVEqatdOCfXPl
	c7TpAOKK2TZSXPALa1I62pbDhPhaEI+3lWoUaKP0ztwdvsvtKP/NDxO7DJUWS+wqL/CHjEBlBk0Me
	bGYbUceg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] ARM: dts: rockchip: rk3036: Move PHY reset to ethernet-phy node
Date: Mon,  2 Mar 2026 12:39:52 +0100
Message-ID: <177245158235.769695.1602082585848546152.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260228013257.256973-1-festevam@gmail.com>
References: <20260228013257.256973-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_034002_975146_B81553E3 
X-CRM114-Status: GOOD (  10.42  )
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


On Fri, 27 Feb 2026 22:32:56 -0300, Fabio Estevam wrote:
> According to rockchip,emac.yaml, 'phy-reset-duration' and 'phy-reset-gpios'
> are not valid properties.
> 
> Use the valid 'reset-gpios' and 'reset-assert-us' properties under
> the etherne-phy node.
> 
> This fixes the following dt-schema warning:
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: rockchip: rk3036: Move PHY reset to ethernet-phy node
      commit: 6b56706cde50f64382df90a244e9fd3c345c9917

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


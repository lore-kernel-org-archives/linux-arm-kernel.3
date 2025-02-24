Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776D3C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWEADniHRGWcnzqbekRTv6/vtyL/MFZqYvazyCcPL/Y=; b=P7k65dJSY/k5yoiH7rH/M5YkEx
	kPgzjbBzj22XhRlY6NurC8aFxYgFIbcUqXqWiry9jiJpPXc9tDWGxpzTKhieUDmFm6SDRUejIYGQv
	dW3g3fVcDDwQRi6iKjNnL9Xwj+u5O9OLGbdbGOrM7EKSSzsFTZ7K/NyR0GGHnPDMdGAaBuU/5YiDb
	PKDrOAj+ml29GRWCdQGzq89supSqWPbm3ZMyCN/Xu/FrXY2Ekw1M4+IORMRkFB35aS+1M1fFn6f8k
	Fazb2vkCQxAvHbfoS4zhb0rCrucj0hL7LHtsRzfCTGio4zxhhrkE1WNPu6fSTpbIxXVxSV8GwXQjD
	n0a91+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUx0-0000000CxQ9-3bmo;
	Mon, 24 Feb 2025 09:40:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUXv-0000000CrEm-0GgV;
	Mon, 24 Feb 2025 09:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XWEADniHRGWcnzqbekRTv6/vtyL/MFZqYvazyCcPL/Y=; b=C2Fa0CsgkZ2/azdEMvlOzuYSf7
	k3nUPkbtzi80jhqlddLODTZArqrjOaDbkhu6v27OfN1fu15qYrE1R7QEaDmBLvJTpwOZuImxSCdlv
	PT7OHUIEehio+7EhaWCLkC5l2t1hnzwI3nK3xiD5mN1WzY9Ka+RgqS0uWK29Azt0pT4VxziiuCJYS
	3+2l23UyPbiwiiGCJJ2j0ecmxMejx0hIixnJwUe4ao8qPsil05p4lQCEFfZyV9tyVszURLYogUaFm
	F4EZIRXEQXn/DnoDqOooXtpsFYdHDBnzKB+LhJ2uBs5gGKOt+rhPaMwyRhRKK9AWlvUvhOiODeSmY
	AsSi5PrQ==;
Received: from i53875a0d.versanet.de ([83.135.90.13] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tmUXo-0006wL-ID; Mon, 24 Feb 2025 10:14:32 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock,
 reset: rockchip: Add support for rk3562
Date: Mon, 24 Feb 2025 10:14:31 +0100
Message-ID: <2920539.yaVYbkx8dN@diego>
In-Reply-To: <28dcac28-9060-4f65-8167-64f6a0e4532d@rock-chips.com>
References: <20241224092310.3814460-1-kever.yang@rock-chips.com>
 <z7jb32foci6bamqqddkkp34hazi2itp6uclarsoi5pkrgso2go@bxflagkaciq6>
 <28dcac28-9060-4f65-8167-64f6a0e4532d@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_011439_104452_0C9E5152 
X-CRM114-Status: GOOD (  26.32  )
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

Am Montag, 24. Februar 2025, 09:47:40 MEZ schrieb Kever Yang:
> Hi Krzysztof,
> 
> On 2024/12/27 16:28, Krzysztof Kozlowski wrote:
> > On Tue, Dec 24, 2024 at 05:23:09PM +0800, Kever Yang wrote:
> >> From: Finley Xiao <finley.xiao@rock-chips.com>
> >>
> >> Add the dt-bindings header for the rk3562, that gets shared between
> >> the clock controller and the clock references in the dts.
> >> Add softreset ID for rk3562.
> >>
> >> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> >> Signed-off-by: Liang Chen <cl@rock-chips.com>
> >> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> >> ---
> >>
> >> Changes in v2:
> >> - rename the file to rockchip,rk3562-cru.h
> >> - remove CLK_NR_CLKS
> >> - add new file for reset ID
> >> - update to use dual license
> >>
> >>   .../dt-bindings/clock/rockchip,rk3562-cru.h   | 377 ++++++++++++++++++
> >>   .../dt-bindings/reset/rockchip,rk3562-cru.h   | 360 +++++++++++++++++
> >
> > No, that's not a separate patch. Headers *ALWAYS* go with the bindings
> > patch.
> Will fix.
> >>   2 files changed, 737 insertions(+)
> >>   create mode 100644 include/dt-bindings/clock/rockchip,rk3562-cru.h
> >>   create mode 100644 include/dt-bindings/reset/rockchip,rk3562-cru.h
> >>
> >> diff --git a/include/dt-bindings/clock/rockchip,rk3562-cru.h b/include/dt-bindings/clock/rockchip,rk3562-cru.h
> >> new file mode 100644
> >> index 000000000000..ad07ad3a12ad
> >> --- /dev/null
> >> +++ b/include/dt-bindings/clock/rockchip,rk3562-cru.h
> >> @@ -0,0 +1,377 @@
> >> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> > Why not using license requested by checkpatch?
> 
> The checkpatch does not report error/warning for this license, and this 
> is the same as many other SoCs.
> 
> Which license is recommend in the header file?

I suppose

/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */

According to [0] "GPL-2.0" and "GPL-2.0-only" are equivalent, but I guess
"GPL-2.0-only" simply makes the "only" part more visible.


Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LICENSES/preferred/GPL-2.0





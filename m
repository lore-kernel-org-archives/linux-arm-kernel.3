Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E48E92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpxP2vNfkpZZbd9zsRHxayngZTjlIglUmQvt1A/hrdQ=; b=Z8tJOfZAljvwzdfqzxkDbz3GeS
	KHHQxdnkq9P/RBScYTLbq8J2pH6haGl9W+OsDKQLAaIt8UAVK/cwTw2Efw2yjZDv6RvCZ+mNGtHPz
	zX6MToo8WIQHz2xY5vi9Y9L7xMi7XAAIJH8VTrVEH+TyGdh8cLM7SgM/fRjpm1brtnfYwP8z0vIYh
	+44mM2mziwDx4uuhddVM0vEgseYKrFofSujv8OamjjKhJ4dTerYwxauspNQzxIyuGhryChlaLeewB
	rb8+Gcga6PChi4d3DgFGT9RCLppmd/2k6JOgfwVaqD1JURfdlxAhqD66quwxnZv6nWnozQ4EKNBzX
	8oLV7moA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPOF-00000004Im6-2fnX;
	Tue, 30 Dec 2025 02:23:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPOA-00000004IkP-0PZu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:23:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59006403F0;
	Tue, 30 Dec 2025 02:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF22EC4CEF7;
	Tue, 30 Dec 2025 02:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767061389;
	bh=JJBLWrKZJscwjA3cx9oGiJGVinABxL8hJC6q1izjjk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqYbwLcCSdqZrAaL/5UsPcAo8T2EDLTfE1oTIkzwEfPaJdrUnSmDDV55LSKJ47gcj
	 YBFLWcMkGwLr3aFXJVHwprtarb3yS9dlbYMKYiM4OqhCIxxs4Q97Ek/XhiqlRPx1Sv
	 nDb2mTjXDgfzKwjRgVeMZFPprSPZqqIcIPaqNquB/3MJ1DqmTeQ2TmY0MftLWCNTl6
	 cqGmi0dIvmVXdrDj6YK8R56n4hKb8eIBpFwSV1Kk7z+4rqNQmthXbHcx8mzUAFA6Jc
	 DSD9co6p2wVqWwFbmKdRhUNdRodck8eHI5Nhd7DM4s2KfuXFVKjEH+7ipHXly8CiUr
	 bBu6+rzZ9g9NA==
Date: Tue, 30 Dec 2025 10:23:04 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] arm64: dts: freescale: moduline-display: several
 fixes
Message-ID: <aVM3iCWrKkpcqe2N@dragon>
References: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_182310_154356_63E8506F 
X-CRM114-Status: GOOD (  12.79  )
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

On Mon, Dec 01, 2025 at 12:56:49PM +0100, Maud Spierings via B4 Relay wrote:
> A couple of issues where discovered:
> - compatibles should integrate the SoM
> - the eqos mac address is stored in eth_mac1
> 
> The first one is breaking, but it is early enough that it can be
> corrected without causing any issues.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
> Changes in v2:
> - re-add the old compatible to fsl.yaml
> - expand the reasoning for these changes in the commit messages
> - Link to v1: https://lore.kernel.org/r/20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com
> 
> ---
> Maud Spierings (3):
>       dt-bindings: arm: fsl: moduline-display: fix compatible
>       arm64: dts: freescale: moduline-display: fix compatible
>       arm64: dts: freescale: tx8p-ml81: fix eqos nvmem-cells

Applied all, thanks!


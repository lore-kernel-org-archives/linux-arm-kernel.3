Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99450C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 23:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSr8G8/oq1uMJWdSbWxYJTtVspOc8Aw+CKrjWXDle8c=; b=qhTDVP/ptkgQ4iCWBQrbwhPQvE
	h3SUMezp2XqtVMQD+Pw9JgCbYTLyCI0AgZvechQzCF0uRpL3+/Dd8s7FRXFAXGIMxT6oxIDrjgqC3
	dexalJw2jLFu1FXP6XDpxr4FOo5Zk+tPIm7ScdRpYEvT43hlIWM4BP5QRueHuGAVjqgi721fBejG1
	d6ZZHiPhGwSn2zscug9ZXO5Oid2YFg/4yw1fhBT/aI+rHOhAsjlVUhcduNZqv1HKUAd/0kXNXdx+4
	ZbwfX4uIuNWIxJefFudberkNRvDV11xLscknEoy3isX0p1s0FylPYHN/7Un2jMx9ebIJt5YUySK9C
	S6c9HtGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddMS-0000000FpJ6-1ADe;
	Sun, 20 Jul 2025 23:22:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddK2-0000000FpEG-1gep;
	Sun, 20 Jul 2025 23:19:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4B8C5C3C30;
	Sun, 20 Jul 2025 23:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF8DC4CEE7;
	Sun, 20 Jul 2025 23:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753053597;
	bh=wVP6Z5f3CrPZapJWrOI/gGK/1g0Dd6+93XEM5STFPvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IBvQUalOB1OsRlwAFKLx16AuV2nIykJ7sogpc3QGHUvaHinHxByeixDl9cMxQLMhw
	 q6NWYjlQDWM5Wy8l1QOLfVA3Icfqe1PpsQ6zjozz8iGk1m3PiktL9Imtmrn5F9xXm2
	 51JBEmP95tB13ZW/oxRyWlmtcnyNKlsBFDdCl3/aqPp6JQMYobVEjJ8qGVg4WGm78u
	 9aZkIScTC7ee6L5V4OX/6+DahsTXxyB0CYFMfZJ8HqDiw/jFWWxc7QZhFLQXf9MIvQ
	 ppe4ne0gwdnixA+Nyc4I+oSGF5J/jBwwFehkv9PSTTYsDQQY50/QZgE13sTNWrACDK
	 rUQan6BEuK0zg==
Date: Sun, 20 Jul 2025 18:19:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	damon.ding@rock-chips.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: add RK3588 DP carrier
 from Theobroma Systems
Message-ID: <175305359610.3055587.5271062385138916700.robh@kernel.org>
References: <20250716185027.2762175-1-heiko@sntech.de>
 <20250716185027.2762175-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716185027.2762175-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_161958_476996_FC605E7B 
X-CRM114-Status: GOOD (  11.21  )
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


On Wed, 16 Jul 2025 20:50:26 +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The DisplayPort carrier is a very simple baseboard only providing serial,
> ethernet and a displayport output.
> 
> But its main functionality is that it routes the Analogix eDP controller
> to this DisplayPort output, which allows to test that controller simply
> by hooking it up to a suitable monitor.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



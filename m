Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD6AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvY161rd+Ka3GULwGpboXzkmyIJjDCQGmO/Oaxs+61w=; b=EhfYEp8wBnl5BpK7BVeNlHc69w
	m8wTEeYNrJ9NhBGqNYvwJKcFa7R3VSkfPatZxY+9qvCYBr8dFDCFoSVwT8fKZDGSqkw2cItUk7Q3C
	p5iJaIgj5TsDDARUPqfiRO8hegP1/hPt71A8DCWxbhdMbmirpe8Xv+ReiK36rykx9xe3lozUCj3NY
	+xpm6A2WWX3w9dJg82FBtey+4+PBfo1u/Kz4Osfdvc2HY7vJ5h9Y5qqTX2quUj5NgsPznranX23+6
	tPzNFyICCuHEWKxCycG9FVP4oMI4q1UJ9JALtJDeoHDbPjfyvT9t+3iOjQE2gvkNUWWJrrBvkZt1y
	v2lHSY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tktJ8-0000000FeJb-453w;
	Wed, 19 Feb 2025 23:16:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tktDi-0000000FciJ-3WyI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 23:11:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C8CC5C5AAA;
	Wed, 19 Feb 2025 23:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E1FC4CED1;
	Wed, 19 Feb 2025 23:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740006670;
	bh=EGlWTDM/xU5sb1Qa92jq7OnxARIjGZpdIKyoEfe4RK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YnAmaDmz2k2RnZD4YVcRH5gn4OiCV1pkDySn13421Z9PDrP6AphTLVsO1XMxD7h6a
	 JAFKVKcdcSdvOgFjiX44qzB00YdYLzzuDhC0WlbxnN1lvjPE+L8g/kqkPkPegjpirR
	 BzJlMvRt99ymBfwDpLz76HBx4xvuBcCA8fa3z7Cn6n/P2aLoFfgIJiba38/mg2PpKl
	 l0G0ZxHZ0P3x7NFc6Y8+z9MAewXZZdCJPQyYEu7fRhWdTRRepxYZ8Yza5DIj73w1iN
	 w8bnT018WicR3PcT99Il4r3JIIeU5I4Qijr48/bxCvfT9Ctvla1+00YzcRYKzoH3qD
	 PB+C/l9rEB2JA==
Date: Wed, 19 Feb 2025 17:11:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Chris Morgan <macroalpha82@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 3/8] dt-bindings: allwinner: Add TCON_TOP and TCON_LCD
 clock/reset defines
Message-ID: <174000666818.3147824.9907877642001632634.robh@kernel.org>
References: <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-4-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216092827.15444-4-ryan@testtoast.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_151110_926137_255540CA 
X-CRM114-Status: GOOD (  10.13  )
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


On Sun, 16 Feb 2025 22:27:10 +1300, Ryan Walklin wrote:
> The Allwinner H700 exposes RGB and LVDS pins as well as a HDMI
> connector. This requires additional clocks for the TCON_TOP and clock
> and resets for the TCON_LCD LCD controllers to be defined as per the
> T507 datasheet (which shares the same die).
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  include/dt-bindings/clock/sun8i-tcon-top.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720D7C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0D+A8tFnTL0umDDhEiz0cdm740P/K+LVQTW1NDrMaA=; b=JZ2dkatQkEsmCIYdEKHldnFsHc
	iS+XqKMyiJJmdqWIkR7MWTR2SJiPGdp4P5dlbRGsTqFruIeQARgiOTbtpdyzH90yuOWTChkZ07+Qo
	QpZA+J9A1bzwhvuVuEBIaaASLP+/+1Ti6eDNBDQNJC8LkWXEF3uDbvXcsJDzPTar/RhFHmAzqv0nc
	s+FFfaXuP88txoo3WtD3IpfqlPYCQz38a4EJpwaz2kcaXorJ5qfxZB0lahU9Ay6likDd1v1X1mKC8
	FR4XgPlN9o6qLWR0uLuClBDYSbv/vMCyorWonP1bO+XL31URvLwetSyxP0QiqqerPbjYp97avVzjl
	+h6I/BTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETKj-00000009a0E-1Xtf;
	Mon, 12 May 2025 13:36:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESb7-00000009R8z-1f0P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2311B4A95B;
	Mon, 12 May 2025 12:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0539C4CEE7;
	Mon, 12 May 2025 12:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747054173;
	bh=Xul2N5TZdLPJDaY9qEes+2SrQ7lCw1Xec9sr/RkvLPI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HUkjBnBPVRlfJwgczJvIz95ZeTA0Zc56cGxjb8KjZS+WMVCE9EiSSeUG9GURRr1m+
	 9AlggNLcLnqOSv15GWgnmv9xxRTneOuVXX6fhrR7bPfM4BsQqRekdx+At9paamyIjv
	 OBbsV9kP34hDxnAuOCRI4T1d9IkMFDTpa2yFKBL6GjrBaHmU4oev+ZxBN0VrgUS/Rm
	 b7/BE8fHI9CjGp+t+sI7MEGxHTnhtEbPFXcEth1fy7Y0wVWlwuwfH/2T8HLXq1Pjd0
	 jyg5n0RIj1AT3WGQ+9GDOspK9Jxd6mx/ZEMzz2W+Gk5U1lwWLxIRpGNOkCzoFyjplh
	 k4uiNPp+SJXpg==
Date: Mon, 12 May 2025 07:49:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: netdev@vger.kernel.org, s.nawrocki@samsung.com, sboyd@kernel.org, 
 mturquette@baylibre.com, linux-clk@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org, krzk@kernel.org, cw00.choi@samsung.com, 
 richardcochran@gmail.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
To: Raghav Sharma <raghav.s@samsung.com>
In-Reply-To: <20250509131016.3173048-1-raghav.s@samsung.com>
References: <CGME20250509130035epcas5p36c784dcbbdcfb708c12fdfc67eecfb49@epcas5p3.samsung.com>
 <20250509131016.3173048-1-raghav.s@samsung.com>
Message-Id: <174705404323.2941293.7491177381588935328.robh@kernel.org>
Subject: Re: [PATCH v1] arm64: dts: exynosautov920: add cmu_hsi2 clock DT
 nodes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_054933_464869_CC2D224C 
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


On Fri, 09 May 2025 18:40:16 +0530, Raghav Sharma wrote:
> Add required dt node for cmu_hsi2 block, which
> provides clocks to ufs and ethernet IPs
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc1-6-gaa833db4b822 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250509131016.3173048-1-raghav.s@samsung.com:

arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/clock-controller@16b00000: failed to match any schema with compatible: ['samsung,exynosautov920-cmu-hsi2']







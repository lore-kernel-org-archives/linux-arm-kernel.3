Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F05EE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 11:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzL9Apxx9PBwEi1gxO5jcG1dhq3hPMCgrw+SZsgCon4=; b=Bs8HJsweLKpHLzmVgSNXS4RXJo
	4r9dBpAGV3ZEk75Q1AQJkD6S2N8LuZ0Yrkvg6uio7SfLGoCp0UsYUoVm74i8+dGH45oEnBh3Grqix
	9Q7b56mn3/9Dm54zhWOQWboVTwFg38Cgpy5nj9tNq9dqriIP1stOMh947lZf5+cJQkhwc0pdA50IL
	lc0b7GTSVwSAe9YYfcaTWjXrqUHnp8LjQwbzLbKKcR3qmnIfc4+VpfLz0pIVlBi70kIpvw/ykDrRG
	3RU7EYass5LsWnfABN/6urCr2TADoqc7XCJRmryKDkzRBaRzCmK9BRUMIqeN4DYd8GQF/XgH2H+yv
	3AJY3R5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTyW-000000089qW-1N1L;
	Wed, 08 Jan 2025 11:11:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTqz-0000000882P-3MR3;
	Wed, 08 Jan 2025 11:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yzL9Apxx9PBwEi1gxO5jcG1dhq3hPMCgrw+SZsgCon4=; b=Ylbh2QTaU8quP4cFdlfsmw0sSi
	HvsL9hrKYUTXoghA79EvxZq5M4bIcYOoujtYJAhTol4h3881Z3+/73XykMiH1e7qlRDoan2nYLQcC
	Up01P+t18nySj04MnsBY5BhqPKsF5//EI7/Hy4WAzjcmbgAIYkMolJbuQbnIL+WvM/6Ni472pNY5E
	nfnv0DDyBBNyOvb4To18LXuE1EzyNIXPEyC4TpXVrCx1Ic3Ccg2YteRLzb5grnV7GXEYdHEPdxBE6
	vKVDSJ8BVX/nXqwrQK/8psG5n3EVFFlphCF8qaL8izjgUrsyl/Zwn+9OFcrneuxvbyhRQA3b9GS59
	b4rye7pQ==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVTqu-000507-Aa; Wed, 08 Jan 2025 12:03:56 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Chen-Yu Tsai <wens@csie.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
Subject: Re: [PATCH v2] arm64: dts: rockchip: orangepi-5-plus: Enable USB 3.0 ports
Date: Wed,  8 Jan 2025 12:03:46 +0100
Message-ID: <173633412683.2758244.11920236524646659506.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241220161240.109253-1-wens@kernel.org>
References: <20241220161240.109253-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_030401_853237_91E9700C 
X-CRM114-Status: GOOD (  11.15  )
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


On Sat, 21 Dec 2024 00:12:40 +0800, Chen-Yu Tsai wrote:
> The Orange Pi 5 Plus has its first USB 3.0 interface on the SoC wired
> directly to the USB type C port next to the MASKROM button, and the
> second interface wired to a USB 3.0 hub which in turn is connected to
> the USB 3.0 host ports on the board, as well as the USB 2.0 connection
> on the M.2 E-key slot.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: orangepi-5-plus: Enable USB 3.0 ports
      commit: a15d12f36eb78692d5c3ebd8a5db7fddf3ea160c

Renamed the regulator node according to convention (regulator-foo)
and moved it to its correct alphabetical position.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


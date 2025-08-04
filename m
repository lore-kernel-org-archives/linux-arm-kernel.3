Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F5BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 01:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ2GTvtdLR4dKtuUYv6XmG3B25FHcvC5Jt/WkbqgpN0=; b=U59HYMDSUsuGyqLd94CbaVtxRW
	QChIv+xRtQNb0whUs/pnDHOk1Z4eJ/2GniEg/PrljBH72UhMafrYOcKE0ahPq9e8nQHR4uobi6VRf
	d2bpX3xFt5f9SHKz6ATOxBwkOn5LoTvyS21pSoTDrQBMEbfTN731oiyrN4R8WmwdSSxbgjDkdaNV3
	xVioEtgf2Nb9yzuXr0Mm/pAM36hjsxR9WEH+EEiYR4gACbSVD1MKQHfQLfGHvD231TR8b9z+29/+f
	6bk6BLF6Oi5c7yGwtoZC54zaCuHnDupgxEwgY14uiHJ7Mu9jf/f1f7nuGDo8NggW3fF2FsjNHlpM9
	nLop58Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uijq3-00000009PYk-3w0N;
	Mon, 04 Aug 2025 01:18:08 +0000
Received: from thorn.bewilderbeest.net ([71.19.156.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uij8Z-00000009Lh6-1C2X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 00:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1754267587;
	bh=rZ2GTvtdLR4dKtuUYv6XmG3B25FHcvC5Jt/WkbqgpN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+4UT2bm2WHVQ46yE1uRgn0S4VP9FzC0oNr5wheu+bDu1L8wmbe7jR+n2sjbi6pCo
	 p6SKJ9JiagEp4DE4NOWOOTeHERCb3/dafxI/GDL8dyQP/FpuKO62aK6r8T7lhmNZ16
	 jS9Du+WwNr6ych95GqYrsyGZ/1g9IRdoleKWod2k=
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5f:8500::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id EA55D198;
	Sun,  3 Aug 2025 17:33:06 -0700 (PDT)
Date: Sun, 3 Aug 2025 17:33:05 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Tan Siewert <tan@siewert.io>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: Convert remaining ASRock systems
 to NVMEM layout syntax
Message-ID: <4a58b9cd-8c1f-4a93-8c84-e8f625e1b6c2@hatter.bewilderbeest.net>
References: <20250803151822.68080-1-tan@siewert.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250803151822.68080-1-tan@siewert.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_173311_467919_7B752F66 
X-CRM114-Status: GOOD (  12.22  )
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

On Sun, Aug 03, 2025 at 08:18:16AM PDT, Tan Siewert wrote:
>Hi,
>
>While investigating an issue with an ASRock Rack platform, I noticed
>that most of the ASPEED device trees using NVMEM cells to populate
>MAC addresses still rely on a deprecated NVMEM binding syntax.
>As a result, the MAC addresses are not populated from the
>device tree/NVMEM cells properly, and an address from "the chip" is
>being used instead.
>
>Commit 76c5533925434 ("ARM: dts: aspeed: convert ASRock SPC621D8HM3
>NVMEM content to layout syntax") was the only system that had previously
>been converted to the new layout syntax.
>
>This patch series converts all remaining ASRock Rack systems in the ASPEED
>device trees to use the new NVMEM layout syntax.
>
>Tan Siewert (4):
>  ARM: dts: aspeed: e3c246d4i: convert NVMEM content to layout syntax
>  ARM: dts: aspeed: e3c256d4i: convert NVMEM content to layout syntax
>  ARM: dts: aspeed: romed8hm3: convert NVMEM content to layout syntax
>  ARM: dts: aspeed: x570d4u: convert NVMEM content to layout syntax
>
> .../dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dts | 12 ++++++++----
> .../dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts | 12 ++++++++----
> .../dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts | 12 ++++++++----
> .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts   | 18 +++++++++++-------
> 4 files changed, 35 insertions(+), 19 deletions(-)
>
>-- 
>2.43.0
>
>

For the series,

Reviewed-by: Zev Weiss <zev@bewilderbeest.net>

Thanks Tan!



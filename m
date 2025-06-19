Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CE2C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWufee79LmCp4cY9NcorLs0fohV01FS8UrEAxvFpX8o=; b=Hvg5xTnxsI0lGfMQIi4GTtzov8
	QQTizIKiWWdxNNhsuwP/ztRg5M4fRPN1/0IV3ttXjhOXJyT5Z2llK14bfIUnmZ1gmld+R114Fnfwp
	cpPvfcZipOVP77t8bjH+D1+CKFZRI2jyP/a7mAAeaqdh9pIIrTFgWC+DTyZr8uw3/y6G1upKyBg+D
	+7P77YTe52/WWQxJO3gpD1B/ZWGstjSkYdsG7qSw6VP1pF9exWVyAFd0m6vzKFDO25JY6DtHVgKmk
	HrJWS3i7M1J48s+4RlnUls4xXhqJOh2CU5KMy6Rz+CNm8+5A4l7tD35YKrNDn+zknDw6KnS7TA/pB
	zG58nWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLwb-0000000EEFH-1FNg;
	Thu, 19 Jun 2025 20:33:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLLK-0000000E9n7-1iXv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:54:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 011C45C66FA;
	Thu, 19 Jun 2025 19:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270BEC4CEEA;
	Thu, 19 Jun 2025 19:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362877;
	bh=rWufee79LmCp4cY9NcorLs0fohV01FS8UrEAxvFpX8o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SqCYK5Rz8YvF0vcvtzOdxJftdiR4Ku5Kg/+UB/wt9lfIapBdM7EgslJXlwWARdpim
	 WvT2mH7T8ciXJGF3uluweqCm3Dalpgbm7YpT9JASuSX9V+RHXPljTPtkuPZj2QnyzP
	 9Y75A50hutA0AjWGlMXh7V9tWiuA2uvHAAPcFTvLINIACd2KYBWnDQm2hbr67FNhXs
	 w+0K/+KIOJhuz1To6GWST7NjPRJPFULHggPbUYeR94Hfpfe8qbJXfAT4MTBK53smqp
	 zMbTO5YDNVWIpEug9qO7Prg6iRNc1DleXUDZafIa3NPKyB8uVR9sd8qZSKhyZhIU2z
	 6YC/4iy+AHr2A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250619171025.3359384-3-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org> <20250619171025.3359384-3-wens@kernel.org>
Subject: Re: [PATCH 2/2] clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0 reset
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>, Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>
Date: Thu, 19 Jun 2025 12:54:36 -0700
Message-ID: <175036287647.4372.1701190769589982450@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_125438_486481_C22BEC96 
X-CRM114-Status: GOOD (  10.85  )
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

Quoting Chen-Yu Tsai (2025-06-19 10:10:25)
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> There is a PPU0 reset control bit in the same register as the PPU1
> reset control. This missing reset control is for the PCK-600 unit
> in the SoC. Manual tests show that the reset control indeed exists,
> and if not configured, the system will hang when the PCK-600 registers
> are accessed.
>=20
> Add a reset entry for it at the end of the existing ones.
>=20
> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM C=
CU")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>


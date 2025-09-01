Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99210CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcF0N/bi99qz2h4JHEZUPV7xy3s6mxegRB1A7pcMLwc=; b=crxvXhiNLjVkXG/6qDIM922LRA
	7tv7K+9o2YVeBeqGP53iblNqfmG+VBXbS8E7pqqp/ncHM0hHO/yA7Lotoa5tkEty/nl5CXXzhwmWC
	H8TM9Qi+5VPtCsAq6FDhDVK9JLo7bA0dlOPri1zrVcFkZ/PTyg1rQsTYRjO3KK0f0P+s67Q6lk7zW
	SMCOkmHiTOqUc/HNzRmaSxuFEUvYmJqWqCkx2cns+O+fqgTYtSaL7dqd2cy7MYwjl1mAIYIUkXX9K
	p2cgoJNu9Ztck9wvBWM1yObdi1u3UnRSGYKil4MaQ3cw+kzCvS44Mkpll9zZMLWZ00aWkTDVlHOzx
	OTdNLxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFH7-0000000EZo0-17vi;
	Tue, 02 Sep 2025 00:53:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utC5p-0000000Dydm-2Zlx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 21:29:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F20B601E8;
	Mon,  1 Sep 2025 21:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774FDC4CEF0;
	Mon,  1 Sep 2025 21:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756762175;
	bh=ZGsW6Cp4Ck4odWBXZ5+9TBl7XqmtalvaRxUlMKXaYDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FnX6XK/kJwr4KXTTulE927esfbGKIfTFa9LMyQOAnCxQe4R3CLqISXTaig0QMwmNh
	 OvnPUQUHKKNzkm3VHCsAlS4Q7Etp5UjxS3MKpqyif8YWPfWBfXeFoJylWxKCnC49uE
	 nKm1qCf4FWpoDJkRSdIxB1zkWBlgQZA7tWjPUg+bW1+ecvwVfKZAYqMh/ltU1QeXzB
	 FaqfaLtnMa/peObR9YdewZYGWengxAvZrAfB7WOTFUtivGSLikE5OHv4gEPDwsnoUB
	 /aP2qYLucTSbEbhKomRcfmhYau/FN27iU39gRqiMXGkDa3r0FVdKAWsNWKoIpboTzY
	 8xD7XBi1yP5Dw==
Date: Mon, 1 Sep 2025 16:29:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej@kernel.org>, devicetree@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: clock: sun55i-a523-ccu: Add missing NPU
 module clock
Message-ID: <175676217387.375469.10664750906350656739.robh@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
 <20250830170901.1996227-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830170901.1996227-2-wens@kernel.org>
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


On Sun, 31 Aug 2025 01:08:54 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The main clock controller on the A523/T527 has the NPU's module clock.
> It was missing from the original submission, likely because that was
> based on the A523 user manual; the A523 is marketed without the NPU.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  include/dt-bindings/clock/sun55i-a523-ccu.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



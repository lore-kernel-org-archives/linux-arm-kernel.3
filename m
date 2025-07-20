Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA4BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 22:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMg16FkJ4JtuaR1KqVosugWvsGTszEW2AmSJzfUqIoE=; b=TGqXtPa7QG5c6C+K9j1RRFPFS2
	G23a6tAiwPgWoMR97I/NLwVqN6i086eEDK71ZTlORFO4GYKw5XN109CB5EjyOgVpym9FjpF+skN27
	4Aw1RUN29gSJKLBuPYYKfAOdWvN+aZ5rZ+RsjnZjlXf2UoBSXTu4ypxf5zILIm5lihsy3plmtYH+Y
	up7SPyxFhxaLAmg/uqIe7yhc5bDZ+iUndB4NwpVNEnYzWwMI23KSv7CVJFMJ1lVERklXHA38It+W7
	E5+h1mjLTNMCU73zeuI2BCeJIrN6TL5OLZjIbDwfTAfh1ZmhaNCLQMGJuAj4zR7ozno3KEwYtg8RM
	C8CaKkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udcba-0000000FmtN-3Xym;
	Sun, 20 Jul 2025 22:34:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udcZC-0000000FmYu-2ZAt;
	Sun, 20 Jul 2025 22:31:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A5BB60051;
	Sun, 20 Jul 2025 22:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F18C4CEE7;
	Sun, 20 Jul 2025 22:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753050693;
	bh=50iTg/SAsC7EhohLsSHiAG2N4JR8waxyUPKg3blf/d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIE5+0nREUkQvqWy8homaCWmQE3s2zz3WH1Eb3qCG40Otsm5ZTRc+5AnFpKULX9+e
	 osNJPXQPubkkRHKCnZgbuIokYe8dDlP1T+oxRrM2z7zgNEesM/U8vbzfEGmJNDNuyc
	 wlhomREK1io+vaSYHWf3CXnB0uCF27zLVZybUeINF2/2nQWiozYDKuiIyHw2KpueHg
	 SzacHO6cfAAmRofkLE/kQ4HxeI9LMTBD356TeKYA0QxQG2+bFRhsjOGt9kCPUO5Fg5
	 gr2Amws4KLywEFZGTpzV2agGaspvIJ/0euQ5arTjjSH7q8vPuVt0QYOmbVf6g6KtNq
	 ticKY/n0+zv5A==
Date: Sun, 20 Jul 2025 17:31:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: add video clock indices for
 Amlogic S4 SoC
Message-ID: <175305069251.2909158.8930383532423770218.robh@kernel.org>
References: <20250715-add_video_clk-v1-0-40e7f633f361@amlogic.com>
 <20250715-add_video_clk-v1-1-40e7f633f361@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-add_video_clk-v1-1-40e7f633f361@amlogic.com>
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


On Tue, 15 Jul 2025 20:51:38 +0800, Chuan Liu wrote:
> Add indices for video encoder, demodulator and CVBS clocks.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



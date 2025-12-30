Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D3FE92FE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1dPLv7u+8dOr8JeXMSA5l9e7FtcQyw81ZoFJylnkEY=; b=Nbb8/73sqOrEsJo61w92noi6rM
	5Ar8Ji7/mYyij8MLpw5dYhSf3KVT0j9L+VK6T1f+vZLDJqQzrwaS4quBBKSwa18suB5PLCSuqNX0j
	l3rKald/MsBOlIHMBQZxZiolFgZNT+AdlsGrSGbLFJ9erLL1a5B2Z8nL9LssqtUc/CnszHGCTh4JD
	LpYABqXqTNjl2ZtO+XaI7hupFvOqzhm4jQJE3m86VyRdwpTjrnwRyfQybiRzERBNfWTB58qVMpZVS
	qfA2YaQO9L3JBKKtxIlptZ0yox9cIz90Dw0suRbCWqb/sdEwk4oH+92xVUk+i7SK2FTt4UxrU8PLu
	22KCgTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPpC-00000004KnY-424x;
	Tue, 30 Dec 2025 02:51:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPpB-00000004KnP-1pIe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5332660010;
	Tue, 30 Dec 2025 02:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED9DC4CEF7;
	Tue, 30 Dec 2025 02:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767063064;
	bh=Oaw8zlbEKeCp3Er7YfTJQKyFYMc/kre6qSyFVumm2vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ol6ETTKuuppcnaJb/fk6kB2AseOHnZigYn18blBEr/H+pt4dbJkTUas0IzNtWCzJl
	 Q8QTapWlROn0G5amvtxKGvftdarHO4X/2cdeBSU5iJmyvrYZ+BEev/gJhaLPlFqGDd
	 lPbZubZlGbW+pv9npvF6pb3phFMjBcDnB0qgY+qGvQ632ffNOwnGgkHJMwJTg3YlI9
	 ggRTYZvaK7OXTepkMOJr1yNwUtp/WAKFQPJiJKE9rCzj4oc0Ac6aKMbxid1ZR/6lkc
	 JSZ9AFAyZe6fMITs5HYKBIm6yElMNsYseEqIX3FLLz1mmfUsgK+Npv3E6xREM359RV
	 Iuk1G0Hz58WBQ==
Date: Tue, 30 Dec 2025 10:50:56 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, upstream@lists.phytec.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Teresa Remmet <t.remmet@phytec.de>
Subject: Re: [PATCH v2 0/4] arm64: dts: additions for imx8mp-phyboard-pollux
Message-ID: <aVM-EKLH10KzU1ks@dragon>
References: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>
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

On Fri, Dec 05, 2025 at 10:33:24AM +0100, Yannic Moog wrote:
> This series adds missing miscellaneous hardware description to the
> respective device tree files as well as a bluetooth/wifi expansion
> board.
> 
> - i2c3 (basis for camera overlays)
> - missing supply voltages
> - PEB-WLBT-05 expansion board
> 
> ---
> Changes in v2:
> - improved wording of i2c3 commit description
> - removed regulator-always-on and regulator-boot-on properties
> - rebased
> - Link to v1: https://lore.kernel.org/r/20251020-imx8mp-dts-additions-v1-0-ea9ac5652b8b@phytec.de
> 
> ---
> Stefan Riedmueller (1):
>       arm64: dts: imx8mp-phyboard-pollux: Enable i2c3
> 
> Yannic Moog (3):
>       arm64: dts: imx8mp-phyboard-pollux: add fan-supply
>       arm64: dts: imx8mp-phycore-som: add spi-nor supply vcc
>       arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-05 expansion board

Applied all, thanks!


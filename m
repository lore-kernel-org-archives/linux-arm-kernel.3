Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A39D4A5F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 06:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zm/IdFeKx95mkXHSNwsvDY2GwGA1ubclVYLTkuNn6zs=; b=4EU5bLfLT34JD0K8tZly9TP/y6
	seM8qX0AwCvDZcKUvmr7GpzHqPfKpYyQXeEcxfc5wq3tixTcfaCRk0OOESnQasJyRpgi0sZavVLTd
	ce/r07Gkq7cWQO0wdjKXCbmogXGTUuoWwhuOczPjsepdRBz4uXA66x5P0L1Nkz2vUKUtXM3ZcyONY
	w1WFWmCvqwAgqBQso9AXOk3rLLWkuYJPwKHnksT/yaxAO0hTAFUjYmkV/xM/kzMLy/U46urIQJbeW
	TxR8mjunm85ELIdlsIDNmwBNL+jy33IWHGplVBtS2sAx4wCBtVUzrTAyQrW1H0SgKxBftBYEMHWmI
	+OsIEJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgzPe-0000000FJfO-48rc;
	Sat, 17 Jan 2026 06:03:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgzPd-0000000FJfG-3jZT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 06:03:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CA4160131;
	Sat, 17 Jan 2026 06:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621E0C4CEF7;
	Sat, 17 Jan 2026 06:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768629833;
	bh=6ddEruK33tCOrSpo624USqxMRpdHroIeTURI2A/1r6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTzQ5OCK1lmTwJ5IWsEbSVwWH/NvKtCHbdwXWFIx77jQszzEp+1kaaxNXjUP3SYk8
	 CosM7jZez1GA87Ndx52YFs/vK0kHdwv64FqYhInBKShIUnlJxYJhEcsZtuJ2Me5ow9
	 VTi0wtx4+3RKbzdwirsS3Ll6mGN9nUhl80+ZQd9FUoKfZiZGWqjRBL2lAn+oC5TGQW
	 aCnyUhIGSr4aFezsp0FPvTMnnofUehUKl7Up3PstIPlxQhm+Z0fEJPL7ZIzfRy6w75
	 s6LAssFl7PnA0fsxjhvDTJf/P65S78Z4Ey2otkzwePsCrcCnvHE7tJdrFt7s0Kkhkd
	 887rYqOv7lvfQ==
Date: Sat, 17 Jan 2026 14:03:48 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/7] arm64: dts: imx952: Enable various node for
 i.MX952-EVK
Message-ID: <aWsmRNvuebqNeQQS@dragon>
References: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
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

On Mon, Jan 05, 2026 at 07:48:39PM +0800, Peng Fan (OSS) wrote:
> Peng Fan (7):
>       arm64: dts: imx952: Add idle-states node
>       arm64: dts: imx952-evk: Enable I2C[2,3,4,6,7] bus
>       arm64: dts: imx952-evk: Enable UART5
>       arm64: dts: imx952-evk: Enable SPI7
>       arm64: dts: imx952-evk: Enable USB[1,2]
>       arm64: dts: imx952-evk: Enable wdog3
>       arm64: dts: imx952-evk: Add nxp,ctrl-ids for scmi misc

Applied all, thanks!


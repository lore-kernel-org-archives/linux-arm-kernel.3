Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB249CA5FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 01:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mH8bnnTZK51FG/i/weYk7ZudGwRNESZchfWya8iq4ss=; b=rIe7M8bAH+H4nO/PgZ86zwJFmn
	INjbB/ESUZ8CHN3nWXR9oz0ZRudZu0T/vizpInL4cQMpVqIE7EauJ6Oq1sn4DR1z5EbL/Yu+lywoA
	n3zyRR/eNSXdgDczdz9mOWYc8eijTyRSfV5C1M0OKh2p/bRm8kahlWC5hIduw6IqiJsGiiXBICqI5
	eX6ytxitQuygUN8vO0NjVaEEucAaMk6Rs75kfLvtM4iBhukbMvHmBgFsB3VZSHQh6HiPiB63wj9re
	ozFkmnvtzx8XLBtFNzjVmwvPG/XQAiz93FbewDuhYeLu0w0B8VP0tKfZK1Ee0Hwz0zN3sAjN9rBai
	gpB+/Kfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhI1u-0000000GRbC-0K35;
	Sun, 18 Jan 2026 01:56:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhI1i-0000000GRZM-3rho
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 01:56:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C5B244007;
	Sun, 18 Jan 2026 01:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FE4C4CEF7;
	Sun, 18 Jan 2026 01:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768701384;
	bh=Ey1iQ4sQRIkaUAfNR4kv55EUH+aL6cNSU4wVIc1P1l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OeEODHHHrODHCSzuqR2Rov1lUXuxspmo0SHBfQy7U81fvYldZcrUXIbjhINr1aKUj
	 mQV1tbqlp9GWe1R6NYiC9/x1xBuFYtgdLHLwRuf5E2E7rty/7rb7PaGCmhGgZZcvtD
	 +D6IhhMwhfKEHp7Aj1/pnkHp0OFZVyMtr/1YeYSSOLydIO9NobY/rqLW68xWLnV0gl
	 u/JW1ipDxdqYSj6hicOrG0lpqGqgOAAaa0ks3z0cqvR+4SBoyJC5rYyDs2WK1nqe0O
	 38qnZq29uJ/NwuMfwTEaiulY08dcNnakIUPISCxX1a9X6QiZwwlsftGgSUyTqqVe+E
	 SqmdUohOago0g==
Date: Sun, 18 Jan 2026 09:56:18 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v2 00/10] arm64: dts: imx952: Enable various node for
 i.MX952-EVK
Message-ID: <aWw9wvbCJO2C7bVi@dragon>
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_175626_981998_8B921C83 
X-CRM114-Status: GOOD (  10.62  )
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

On Sun, Jan 11, 2026 at 08:40:06PM +0800, Peng Fan (OSS) wrote:
> Patch 1: Enable cpuidle for A55
> Patch 2: Update sdhc pinctrl
> Patch [3-10]: Enable wdog/usb/spi/uart/i2c/tpm/flexcan for i.MX952-EVK
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Sync to next-20260109
> - Update Copyright year to cover 2026.
> - Update spi7 pinctrl.
> - Add new patch to update sdhc pinctrl to DSE4, add flexcan and tpm support
> - Link to v1: https://lore.kernel.org/imx/20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com/T/#t
> 
> ---
> Haibo Chen (2):
>       arm64: dts: imx952-evk: Change the usdhc1_200mhz drive strength to DSE4
>       arm64: dts: imx952-evk: Add flexcan support
> 
> Peng Fan (8):
>       arm64: dts: imx952: Add idle-states node
>       arm64: dts: imx952-evk: Enable I2C[2,3,4,6,7] bus
>       arm64: dts: imx952-evk: Enable UART5
>       arm64: dts: imx952-evk: Enable SPI7
>       arm64: dts: imx952-evk: Enable USB[1,2]
>       arm64: dts: imx952-evk: Enable wdog3
>       arm64: dts: imx952-evk: Enable TPM[3,6]
>       arm64: dts: imx952-evk: Add nxp,ctrl-ids for scmi misc

Applied v2 instead, thanks!


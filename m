Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F07E94120
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftzlqZSC/EDl5TDittffVsaYjgFyKtoffm4pqgnbL5E=; b=DkymgJfrI5muGKV6qkTtU4OHfw
	W0WDLwKRqznCdEoj54dhUdrv2RvScVKlVXPlDvWoAjDcyoTOiARwvhS8WhvlCCiMUEtfVbHAKaK9M
	AtxgwjPX1jDenyXhGtvl//DSix8iJTOcvXnNc32yTTfxcErF1WdT8DS37LaIOfO8Uvtcfkf5zpKwH
	14mwHhHNTzPmm/plOo5cesfzMmpMTPWFhhuvlroipdrPspAr3MCuzZ4p7en0sKKvTpmvM6PqPv8hf
	J1hpejGpRKhXe8FJXr/imopVTqbK4YIUJQYVh8nddLOGLSLpXprNoMKVjEWGyRPjMy/tyOmPD+WLm
	Wd4ypOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUiP-00000004YMw-16ut;
	Tue, 30 Dec 2025 08:04:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUiO-00000004YMq-0pNc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 08:04:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42A286000A;
	Tue, 30 Dec 2025 08:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DAF0C4CEFB;
	Tue, 30 Dec 2025 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767081863;
	bh=Q08bVrOXBn0J8Dkl4GIa1FzTrlpHKFrCvg7LbSXNWB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IA6+ouMdlCbClyjjI9hRDhtNX5RA6DZdPx+UMv8bTpVSDKg1lg8rFXKXlP7QMedLM
	 iMv2/XaobuDY8mWNKwt49Ny8GArAK5UsijNrZHdTH4umz8dQ4k95pCbXIwdYMeRKti
	 B41RzLiu+gPDRX5YmCRcPv1M80tfGS/e1ajQfoQ7sXZO48aFCTcH4es4QaayByBRn1
	 7U33kXt8Rkkl8CCgBhhxzgsKzICZJvzpTQjJJG5U6jSdDxvLazTzMYmxkoDeFqPeu1
	 wNTiqSdDkh2b9qBlj24xi09J6bS7vRa3cSIWB0NCGbx3TxXJ1+UQXV3eTWi7Oy7KLT
	 2w/5WIeBtHWCw==
Date: Tue, 30 Dec 2025 16:04:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/6] arm64: dts: imx8mp-var-som: align DTS with
 hardware revision
Message-ID: <aVOHgR1XEo5zqOIz@dragon>
References: <20251214215256.5812-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214215256.5812-1-stefano.r@variscite.com>
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

On Sun, Dec 14, 2025 at 10:52:47PM +0100, Stefano Radaelli wrote:
> Stefano Radaelli (6):
>   arm64: dts: imx8mp-var-som: Move USDHC2 support to Symphony carrier
>   arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony
>     carrier
>   arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
>   arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
>   arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
>   arm64: dts: imx8mp-var-som: Add support for TSC2046 touchscreen

Applied all, thanks!


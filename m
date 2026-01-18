Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A0DC9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 06:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvYzhwSAvlDiC4mQFiQOawKhAsIX4EbboKc6+/aHWZ0=; b=xP2C5vDjLCvU1wwNIcxHY4Ryp1
	004n9UsmWbpckmSmZ0dttxOsw6RLCLNHpMeOwG+cDkHmR+6ls0PhfNGAs5lf+CbLUinTDMdDiNbBF
	7GQ4yr9+nLVUdRV90sSP8yvbyT57Yf0ewTwn/6sk7SBRXIKRGnGGJvKM0fM5TUDqeE5OhtjCvd/N+
	zbxuAKpDiIXkerSqg2vDDq8j+SBM/iaxDhdgKv9CoKFcQLJN/fjtCBjst5tLUuI2hl0ag/WKnjnCh
	s+nNdOawqdTHWII8opYUl+mlnii2Dlp3s6GpM2RfR0sirQOz4+iE3RUERPREGFti2lReMi8QUyxEZ
	N2cJBqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhMJH-0000000GufQ-3kQo;
	Sun, 18 Jan 2026 06:30:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhMJG-0000000Guez-1l9L
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 06:30:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79F3F60010;
	Sun, 18 Jan 2026 06:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86BCC116D0;
	Sun, 18 Jan 2026 06:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768717849;
	bh=XxnJLDJ6FviMVmSxBBVjWlMCbe7CLqe2DDs1wGal3Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMjH1DGaD4kJWPdrF7CEMcD0P+c6LqWy2JyagGfXNDHdqnaFbZUmRKPbiocVoM7fq
	 ZQRDGpjcujvKhfxV2E0u0SkZaMt8OdU9euAQDGN47TepfUuHhqY3KYPdwm8FUBi5WQ
	 Mvz53lRIdbkefH6Bstu5D5JKtiyk8eMRs9+E82ALIKJ1RP//a4p93FrOgC574AI9/a
	 7GbNYLXFk/59FiSs5nkxzGVA+l5AIODukzewkMwDZ4HoZovZ6yHSB//QN+f8Z/wC0S
	 XX+CVqOYLD5wjAOaVpSi2FwsrFOeWvzKThQrAzDK34srn7tORzEe0vhGfZ1WwBskN8
	 1E/GI5PG+dgrg==
Date: Sun, 18 Jan 2026 14:30:42 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Francesco Valla <francesco@valla.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-11x11-frdm: enable additional devices
Message-ID: <aWx-EkSr1m4o4Ai6@dragon>
References: <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>
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

On Thu, Jan 15, 2026 at 06:11:34PM +0100, Francesco Valla wrote:
> Enable additional devices on the i.MX93 FRDM board:
> 
>   - CAN port and associated transceiver
>   - Bluetooth portion of the IW612 chipset
>   - WiFi SDIO port
>   - user buttons
> 
> The WiFi portion of the on-board IW612 chipset is still not supported
> upstream, but since SDIO is a discoverable bus it will be probed once it
> is.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>

Applied, thanks!


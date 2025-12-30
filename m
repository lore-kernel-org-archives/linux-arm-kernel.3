Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62240E95A8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 13:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjNQ+qeFpDK5tgz3CrcfoDKvncY0og5rANZhiaT5xuI=; b=Ear8KOBQGilrFcNw9bQMTkvfoI
	jTt754j0inmOME+fITY7duWRkvmeJysA7wNO3XQIAepxFLAP38Fked0wfFmwEEiiOa/6zCjG8TV7V
	6rCqsRmETNjNvpHPKaoUgZON/xLxk0cheSh7aIXSM7CFyuRvvLLjkHNgKQHDsJwDtd3QVo2Uerqyd
	42152AztE4YzgTkKzWfmZnHpnPHT7vxYMpzqbNQn2C00VSk16HpYnuTlSu9dp0PdW2nXJwV5MlE3D
	14XSRI4E3cgLM7mXDSYdoKZrEVDobPltOmBE5sSUHoZT7Hftiw7ZviAfbzr4w40N2Gz43JxpOoHzk
	ZMHigiDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZRd-00000004qNa-30fg;
	Tue, 30 Dec 2025 13:07:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaZRX-00000004qN7-3Jel
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 13:07:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19C4060010;
	Tue, 30 Dec 2025 13:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57D6C4CEFB;
	Tue, 30 Dec 2025 13:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767100036;
	bh=PLCqksB3Cr/KKLSapdZxMx0M+d7N0LhJwagXWlsMxT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABEAb+OdfPXHA06ma9GXw9C7cH9A8WhWMfSRQ0Lw7HOq1U383L4434uwVE0SkIrHV
	 q+5CXGZdUUNwTpDAWuzHD7+VRwZF8GbGNOLF8r1EUojKY6IRmKN+NWg06uj00wDsvm
	 QFFCstEg/ad1iOG2mHdSBiJYOnJ32HCJHZ6Bvwkl39DnSynP6Ufgd6Gm62F0NwXFWo
	 KCSHTGwwcSlqNlPb6PpWHcgXauQeXC2xbmVgwbQAH6/F6CpbfdjAxkIL1Kbac7CAuW
	 RcZcnxUI7H2hrJfEQ4EoeD1JvORt7skiRCzuPSl3AMiXiO5tJr5ySZ2fqpQVQyPE+2
	 /zHf3tq6UCw4A==
Date: Tue, 30 Dec 2025 21:07:11 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: tqma8mpql-mba8mpxl: Configure multiple
 queues on eqos
Message-ID: <aVPOf2Ny7Zr0x0qa@dragon>
References: <20251222081812.1120998-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222081812.1120998-1-alexander.stein@ew.tq-group.com>
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

On Mon, Dec 22, 2025 at 09:18:08AM +0100, Alexander Stein wrote:
> The MBa8MPxL mainboard has an integrated PHY connected to the EQOS
> ethernet controller which can support up to five queues. Configure
> these queues in the same manor as done on the imx8mp-evk.
> Setting DMA to threas mode is necessary to prevent FIFO overflows, see
> commit 0bc3e333a0c82 ("arm64: dts: imx8mp-evk: configure multiple queues
> on eqos")
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Doesn't seem to apply to my branch.

Shawn


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92DCCEBF8A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 10:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSXMUQZ+cQGwThCwg/X7IsHfqb9HKFGadesoe/E5owM=; b=HyZRdf5gRkxkAHVi9MFEq6+8Lp
	H76IFeEFiIIp9j8i5S3B7K+UszkY4KETmQlj2QISs473x3TGPscKlmAOkN7CrocBjSidquL6RwNQn
	xr77r8e9X6lXoNztuLBydho/HqFYPX1d0d1pyD+e3N0xzSPFc35rWvjlxsS5JgUTw5GrDEBpJoprz
	hCisA3nQqmHOJG/A4bMin+FpfztjtQ6jQG6P4B7YKN5lWIAY0KpSKrXnKXKyFGPXnj20tcAXs3nDe
	Flwf5Nj1lAt644rQ52bB7byckwlKbsiDgvy0uiyqI+pWDKb6k4vnxC2hBUwWBpTkSPdI5hUgT6fqt
	RRRYnSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZee-0000000EXNJ-3Hzi;
	Sun, 16 Nov 2025 10:06:44 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZeb-0000000EXMr-0cPE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 10:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oSXMUQZ+cQGwThCwg/X7IsHfqb9HKFGadesoe/E5owM=;
	b=WIqzmsVZIXzL8XMF6+jO0JEfLj3Y3Wrkk8wPgIcZaaRntdsT3bZODjcbFJ6aj0
	FCcjE6cvnzPQ3YHeMzaU5wyDml4RlwvuPta7/6aMYSVvOacoclk7ygOfNoWCM1Q3
	sxav9Ixie2dWVbQYMvCEpNxGdDHY7gGKX2wMwDwsyrLlY=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3d7AaohlplIkWAg--.7944S3;
	Sun, 16 Nov 2025 18:06:20 +0800 (CST)
Date: Sun, 16 Nov 2025 18:06:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/19] TQMa95xxSA DT fixes and cleanup
Message-ID: <aRmiGnQYWHF2ja2g@dragon>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: M88vCgD3d7AaohlplIkWAg--.7944S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw18WrWUZFyrtw1xXr47urg_yoW8Gr4UpF
	WUXrs7tr18Gr4ruF95ZaykK3yfJ34xG3Z8JrWYqrZFvryvyrW3XFZ8GFy3WrZrtrW0va4Y
	ya1UJryDCryxXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UcqXdUUUUU=
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBxQtWkZohxfMwAA3v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_020641_582361_C7626E2F 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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

On Thu, Oct 30, 2025 at 01:49:07PM +0100, Alexander Stein wrote:
> Alexander Stein (14):
>   arm64: dts: imx95-tqma9596sa: reduce maximum FlexSPI frequency to
>     66MHz
>   arm64: dts: imx95-tqma9596sa: increase flexspi slew rate
>   arm64: dts: imx95-tqma9596sa: move flexcan pinctrl to SOM
>   arm64: dts: imx95-tqma9596sa: move lpspi3 pinctrl to SOM
>   arm64: dts: imx95-tqma9596sa: move sai config to SOM
>   arm64: dts: imx95-tqma9596sa: move pcie config to SOM
>   arm64: dts: imx95-tqma9596sa: update pcie config
>   arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for flexspi
>   arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for i2c
>   arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for usdhci
>   arm64: dts: imx95-tqma9596sa: add gpio bus recovery for i2c
>   arm64: dts: imx95-tqma9596sa: whitespace fixes
>   arm64: dts: imx95-tqma9596sa-mb-smarc-2: Add MicIn routing
>   arm64: dts: imx95-tqma9596sa-mb-smarc-2: mark LPUART1 as reserved
> 
> Markus Niebel (5):
>   arm64: dts: imx95-tqma9596sa: fix TPM5 pinctrl node name
>   arm64: dts: imx95-tqma9596sa: move USDHC2 config to SOM
>   arm64: dts: imx95-tqma9596sa: add EEPROM pagesize
>   arm64: dts: imx95-tqma9596sa-mb-smarc-2: remove superfluous line
>   arm64: dts: imx95-tqma9596sa-mb-smarc-2: add aliases for SPI

Applied all, thanks!



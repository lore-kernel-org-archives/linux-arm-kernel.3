Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E035E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTV6yH7IladKybilf/wld1Db1RLYLZoByDZtglH21+c=; b=S2rMewaT8E4dewv2UkD0a31Q+V
	xfmpkE/4sBR7VnWGU+31WExpF+6B+HAyGsTECvuaxCLqoLRJoU8LXLriNel5Q1t216s/mDn8A+mao
	7QYhT5QzRJg73rXT7R4TGwI18rL4yWvJMz3oEk9/aiKBD0VghGRfwKPGVhdFWvMFK0iIKNqOfRAsr
	Go64PtKgbKFeHhqLyilq5RrYYaGZ1jB4wlMpupV9uvYI3VrDAp45c7JnVoxDtuKrFaUqJGkn2ercQ
	6GKr8JAoqs2DQtRczKUxhQtgOFwifRuUy3Ygn13sTBCty0qwUYwH3Rs3UCu5Gnjx8OfPy6xPRHda3
	6Dtdbq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaD4c-00000003jff-1FUM;
	Mon, 29 Dec 2025 13:14:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaD4b-00000003jfY-0u48
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 13:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A434160017;
	Mon, 29 Dec 2025 13:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B74BC4CEF7;
	Mon, 29 Dec 2025 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767014048;
	bh=O44SR+2KGRGZGizPtObgsC457xqX4X2YLhEMs42dTf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3JwbpEXQ8ZmjCxv+TntOpc8Fg6NNH0GD4yC+/RzQVupEo9a1uqABH4OwLb7SBjjY
	 QNp2fIsNDcEcA756iBWKUOfgJgA338pBq3v+ei9Lzuf+irrfHYEeYX5Lt4X2LkZaiN
	 GkYG1kEWVM+Zygfi95Y9806oqCH1vc9E9eio4SCY8Qpo69eJBb/Mc1TDUcL+z4su3a
	 c7tSxatNMlhjO8iQbnLYy0HidC5Wf3BxGfWOUh9Xti2ARyIbqcfanMRH8dADtlHzj5
	 ye1hFZ2c28DNWbQzrhL6XwvD0tfjPbvDZHakY4ofVqJkYN+sn+rufEJRqhWHXfSWVX
	 BnQBXtfVE49dg==
Date: Mon, 29 Dec 2025 21:14:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: imx95-toradex-smarc: Fix ethphy1
 interrupt and GPIO labels
Message-ID: <aVJ-mpr3bHw2Dmv8@dragon>
References: <20251128150030.35931-1-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128150030.35931-1-ivitro@gmail.com>
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

On Fri, Nov 28, 2025 at 03:00:26PM +0000, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series fixes the ethphy1 interrupt configuration and corrects GPIO
> expander line names for the i.MX95 Toradex SMARC.
> 
> The first patch changes the interrupt trigger type from level-triggered
> to edge-triggered to match the PCA9745 GPIO expander hardware
> capabilities.
> 
> The second patch fixes the SMARC_SDIO_WP gpio-line-name position to
> line 15.
> 
> Vitor Soares (2):
>   arm64: dts: freescale: imx95-toradex-smarc: use edge trigger for
>     ethphy1 interrupt
>   arm64: dts: freescale: imx95-toradex-smarc: fix SMARC_SDIO_WP label
>     position

Applied both, thanks!


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B93D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 03:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zI/cQTvItPomvGR+xd1nuKp1eFUmUituu4slRt0PTvY=; b=A9brVoJk2WrUv9pM9aMbX0otYm
	8c90vkMVcpi+JvPeoER5uYoiKpM2IAqmU+OLxW2T7CBTpcEXm8xS2EBx6sh0Tcgk+g7joahll6exQ
	Jgs4tYbwPFpnSsj5lzw8S3N/LnSgVv6ZsDiZNpP3vp/pJa9ZLG3j45zPgOTWvVq6RtuB2jR0avpwq
	qiJ+CHEb3TX8emHXw67UmfxHQPUbi+4Ee2TFapCIUzWQdgZkqy102Yat1QF+0rNy12NvrSCBtNBqG
	Ldkoer93M5OX5YpophMvDFAdCy60Fv0MWWLhTDwnylbFQrStcYpWes52zu2JOmsFOVdytOBZbMKdc
	EOD4SsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va4J5-00000003IXt-0jiv;
	Mon, 29 Dec 2025 03:52:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va4J1-00000003IXj-34dm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 03:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C98F36000A;
	Mon, 29 Dec 2025 03:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15266C4CEF7;
	Mon, 29 Dec 2025 03:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766980346;
	bh=ezn1FFAVejcWb2Ph+OCNWvgeCdNaFxMYoOlGpUhfphE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRlMsGCXC/tjL32XLZnb3pNElbygxoxMHznflI0/0QMgnfvPRyyji521sr50KYqDF
	 02+oKfiy+WNZOljdk6EvTFlT8euSi52T6zRfEsopFGouniDFgtrQSX0UmP8wcWnVp7
	 Q27BSMz9a32mY7ydDXchmh76sbG0TgbXeKRzAvojUJAC1xRDwcrIv7qDzKCTesz+ne
	 +v0gtfUG6jriDPLv+ybNySuYp4le6sn3hOtnscZX4PVvSmUgAu6oKOXOscz7jZURQ0
	 w8ZZVfPWQXivFDEAxt4IXH2r3Tm6hs9Ejq8AK8ve3bDMOY3YjXQExMsaJoBBcCJsi+
	 8iXEpX8fBeHJg==
Date: Mon, 29 Dec 2025 11:52:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Yashwanth Varakala <y.varakala@phytec.de>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de, peng.fan@nxp.com
Subject: Re: [PATCH v2 0/2] Add and Update display overlays for libra
Message-ID: <aVH69fio_tx5XR2f@dragon>
References: <20251117124515.26675-1-y.varakala@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117124515.26675-1-y.varakala@phytec.de>
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

On Mon, Nov 17, 2025 at 01:45:13PM +0100, Yashwanth Varakala wrote:
> Add ph128800t006-zhc01 multimedia dispaly overlay for the onboard imx8mp
> libra. Update panel node naming style in etml1010g3dra onboard dispaly
> overlay.
> 
> Also add the PEB-AV-10 expansion board overlay that can support audio
> without the display.
> 
> Update panel and backlight node naming style of the i.MX8MP Libra RDK
> devicetree.
> 
> Yashwanth Varakala (2):
>   arm64: dts: imx8mp libra: add and update display overlays
>   arm64: dts: imx8mp libra: add peb-av-10 expansion board overlay

Applied both, thanks!


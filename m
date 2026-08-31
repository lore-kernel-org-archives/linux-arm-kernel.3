Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458E6C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 18:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaJF3oD+0clIlNcWRoIsYOSOvk9RIhKNGI1WsmVwAt8=; b=Wkkuynq1jI6t4y87PBpvZsKvEi
	v/xCTZ4LDn2Qe9wTW6Gfvs8pzDuk60hhC2qKQ6nOni4CJjLCiwvGqqLi+EFh/gtnhzCzVmLpgzXV1
	0BqPid1HQKvhizuV8jc6T8/k0qG29QOCRjZ83ZJzR49OLksykIcG20MolCJMEXtxxIBTInF0Tg2Lu
	Qqp/s7cmQ9ZkGH36cikWUuVF8y/Oa9xRePO9ZascJijPqX8jUkZbM1Hs2PXlBi6jlg8sM0FU5w4ew
	T/RHlbZifJQjD0RWtcLlXR4+WsxCF5IqhelHsxKX6SoZxKMZkjGCqNypgbmBuX0vwJ656kZVhpvne
	o0qBW8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16ed-0000000AHLq-0n6w;
	Mon, 31 Aug 2026 18:22:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16eb-0000000AHLV-1NuJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 18:22:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 71C8D601DE;
	Mon, 31 Aug 2026 18:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079081F00ACF;
	Mon, 31 Aug 2026 18:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788200564;
	bh=HaJF3oD+0clIlNcWRoIsYOSOvk9RIhKNGI1WsmVwAt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cPTPB0vtHgtGu/VwOiF6qqCXq4bG6mz+IQi8Ibo22xpI4CDsJ5h/faf1VhxaztNPZ
	 4W/b2BKzMlZ1EPXOMTCCncE0qxTSgDcCI88aIknp7UMINpzlaXiQtGHTk1kLhaCcMS
	 w+8Ue1tEkwadHZtyZ/rGJrWjKbo3G6XyXAY2mGwUT4nhhxgbPbTscMTNrkPzZ45nAa
	 92O4QaqKxCZAqJ966Kve0QQ/T4QsIoHmnSmi+AR9P0u5uzFdBdRDjFvZ04+orr6vai
	 cu5I7AhrpDDi+q8h2MZmiKC4HDtYTUIv6Ug7O5lTTtSSaBOIc8UGPuu1Q6/rF1qNrY
	 U0w6fwL1FPoNg==
Date: Mon, 31 Aug 2026 13:22:43 -0500
From: Rob Herring <robh@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	=?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] arm64: dts: imx8mp-skov: add new 7" variant
Message-ID: <20260831182243.GA955466-robh@kernel.org>
References: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
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

On Mon, Aug 31, 2026 at 10:17:37AM +0200, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
> 
> This variant uses a different 7" panel than the existing ones.

The sashiko issue needs to be addressed.

Rob



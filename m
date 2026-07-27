Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2215CC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gn1LMmg5xd/1wmch3JmNgrwmjfmtCzeFUam6KU6FCBY=; b=GXbNgjkEkbiD5YOAia6WubAz8J
	eFa+6pSooxDnm6h8oNE/wqRp1JzeC/fuSIvsO/1xOBzMzUfju+GBCU8xMIkcdbm0yqO/adXCmtMO/
	fETDxSRZv2+MDVzNLZO4k7zCp9FpXhFpBveoH+aWz2kCIi2/PduWuCpoxPvBer3v2h3mX3KqpXp+4
	O1v93GDvU4PVMq3f2J+QVJ2RUhWvgyJ26wL+gZtm+IXKGAnnZgpu2Akdc45wLA3X1bXznZQy1bUO6
	VIi00i63wcMJ0ZOktYl/0eWR9Pi6UbKUrpjMV3kLX5ImkHyahOSZgVPndRhbSkwbAvrutDJUdkHd5
	FKfxAiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRmV-00000003owi-3bu5;
	Mon, 27 Jul 2026 20:18:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRmU-00000003owR-2TsQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:18:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A3B8424CA;
	Mon, 27 Jul 2026 20:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0741F000E9;
	Mon, 27 Jul 2026 20:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183514;
	bh=Gn1LMmg5xd/1wmch3JmNgrwmjfmtCzeFUam6KU6FCBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hskR9ZyybGADQ5axPG8gT6HgVQn0kfO5Ne4Us7xr+1b5OGm2CajuD2kdweBtonFHP
	 R3j4rTrZOplKopZ9UFsLxp8QnbVR9HvOXF+W6w5EFxrrGmclhkkbMAevEHTc/ap7jF
	 E9dOoQz6IdMXKM4vNuecpnv3/4cyORBvLb+4lsGJOJf76gh+YC8H+JgoyiBKV3iYUO
	 AlluXjUWaddeanbMdTQHi6Vtqt3Roq7uzRA95j8Da0GJwWuwHalvIcB4uqypudcf9V
	 LjShjji8zWrDHda8ha8kjbjjdFwy28h8N2z2FjG2MEdjAmMSpxxlP5i3vIsE7TqFel
	 MXq90TJ05IoJQ==
Date: Mon, 27 Jul 2026 22:18:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, =?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/5] arm64: dts: freescale: imx8mp: fix sort order
Message-ID: <20260727-immortal-acoustic-buzzard-932ab3@quoll>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de>
 <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-1-ca8a0446166a@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-1-ca8a0446166a@pengutronix.de>
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

On Mon, Jul 27, 2026 at 07:31:04PM +0200, Steffen Trumtrar wrote:
> The imx8mp-skov-revc-jutouch should be alphabetically before the
> imx8mp-skov-revc-tian variant.
> 
> Sort the entries in the correct order.

Please sort all the entries, not only 'skov'.

Best regards,
Krzysztof



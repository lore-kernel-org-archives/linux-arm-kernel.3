Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A9ED72359
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keTY3ioHlOqXSAIsxRR/eH1e2ai+np791dxdbzGpaTk=; b=gwqqBdJojIc9lkrReP+YtWVkDF
	HLHn9d3SYSOfKlZA3UBZ743wBKJD3SLBBSR07juumFWBwCK6JpHbJPdnaSHIuFKNToxZTdPhJOEMm
	lPM5omCiqsqGxJvGkMSZgq1vw+gKE4mj1p/PHVt9q3iQT7y0WjipNXQ3hoBRnTaZtcALp9+DBmtup
	aYsRRvXKmasfljmBF6nED1cfmxrrA+nshS3uqriBGcMCsLdsX9rG70f/p6vtwrxmL6pEL48pD9syu
	vCNZewXny1YoW2KKAQVOM7vMwAtVDgX5tKdEMUeNwMWk5FMeuqQFyK3GZBFQ6LyXwTzcTCTX94FSm
	hglHa2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjD1y-00000008WUp-19SM;
	Fri, 23 Jan 2026 09:00:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjD1x-00000008WUS-1iPA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:00:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD2DA600C3;
	Fri, 23 Jan 2026 09:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3956C4CEF1;
	Fri, 23 Jan 2026 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769158836;
	bh=rqpHCY0UZ9Bi+mBISQ+KV7wmWiiY0F+JIqbEBubEN5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+j9DT+VQ0UfZBjHzOZAQGPfV3W6xsZo9tdEfqlftDIoTB+TdgCwTU/cgn+IFClCb
	 c9rpetTu1sgQB03j5mrIKZ9lWruBDB/vfsq1x+QnEuuroVx88rdwTD4QKCqT2zjgSb
	 NBHeBkza4fkea415oImiLQUZArpFnk40pIBDOe6iDH+8PrYcZgdvmj9txw34EtdPvB
	 AqJmsdQIEnXaPP4oBTm0tmLSpbJ7Tw8MC3acnGRhaThk+R/XNAlL1tBYiCe8ykGdkj
	 yW38a63gAcYeMBvJgoKLN5iDx/VhCRjDqvPlb0psnfqMbOPO0ot0bxkk1qf33WGsVT
	 lrP4s+TUVpKTg==
Date: Fri, 23 Jan 2026 10:00:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com, 
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, 
	y.moog@phytec.de, josua@solid-run.com, francesco.dolcini@toradex.com, 
	primoz.fiser@norik.com, kernel@pengutronix.de, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: arm: fsl: Add i.MX93 Wireless EVK
 board
Message-ID: <20260123-hallowed-authentic-scallop-b388c0@quoll>
References: <20260123024448.3909345-1-sherry.sun@nxp.com>
 <20260123024448.3909345-2-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123024448.3909345-2-sherry.sun@nxp.com>
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

On Fri, Jan 23, 2026 at 10:44:47AM +0800, Sherry Sun wrote:
> Add DT compatible string for NXP i.MX93 Wireless EVK board.
> 
> i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
> Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
> functional and pin connection differences.
> 

I will leave it to the platform maintainer whether SiP deserves its own
compatible. I imagine that yes, but don't insist so:


> The detailed differences between i.MX93 Wireless EVK and i.MX93 11x11
> EVK board can be found in i.MX93 Wireless EVK DTS patch commit message.

Drop. Do not reference other patches in terms what do they provide - it
serves little purpose in git history.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



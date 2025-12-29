Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E24DD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 13:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6PmCnrMakjj2S95OzQptpVFM/X91yePuihMK8QbnBY=; b=tG2Pe7P4LmEUeEKNd8rrTZUPsr
	v2A1LJV/ZxgOchdRcXqGtN3OcOfovJjKzU56/FMAYJDb5j85+30SR6mcS8PhtjLOEGfCm/5U8QyhC
	sDzgVCKXuFepAPuxiqGjCB7cr+KYcMv1HuhaGL1uLYSG5mOhECKfU07vRxDSPO+cKK9kYSpyLVqYF
	jtil/cNPCgYpsOvACe17DVpnNgLVTwQbEsC+vDoS46jizSS18tZjxFP1LbP1eaE6ZhfWh61cDz+Xl
	XvSUdWOTiLgfmEtQ4sTbGK9QrvOomVJ4K1yaGWUcoGCprbBd2uKK6BpKO8iT0ketM4/8vi00H4P2I
	kHv7envQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCxJ-00000003j3e-1AGf;
	Mon, 29 Dec 2025 13:06:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCxI-00000003j3W-2lc3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 13:06:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB22B6000A;
	Mon, 29 Dec 2025 13:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8DEC4CEF7;
	Mon, 29 Dec 2025 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767013595;
	bh=jFjGONJihAmwyKW/OdcckuNuD2NA2N1p4mECotiyJ1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W02Q513yWJ4xTob9HVRF0Pq1oILBfNCX6ovkVjNReBP7ZYyglHoXoDUVrdUHBRCFa
	 XKpZBjMKD7zeRzFQDmCoRQTQ4J3DYW836MytLhZqIFgkXbR5NEKpMgnfLvRFYEccUZ
	 LM3ZHRrtG24hRvK0cETDY7+edd/0SyL70yAPOESwGe/35tq3h3nzI85DgxvVxT81EI
	 /TJFSJcWzUedMSe8WC/m9zjLDNbiyIK5shV4in7weh5bAudNqdSPkjZIiK/VCIzgz4
	 VyX791jSKwiR2JOvZ0q9mWqC+p+dDxp9eFuSr4AMbrxXiylOM1JzUJSZoCRtiogXGv
	 5RNAFZu4VswxQ==
Date: Mon, 29 Dec 2025 21:06:28 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, frank.li@nxp.com
Subject: Re: [PATCH v3] arm64: dts: imx943-evk: add flexcan support
Message-ID: <aVJ81FF64kmAgOOG@dragon>
References: <20251126-dts-v3-1-7545d957e795@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-dts-v3-1-7545d957e795@nxp.com>
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

On Wed, Nov 26, 2025 at 04:06:44PM +0800, Haibo Chen wrote:
> Add flexcan2 and flexcan4, and related phys support.
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied v3 instead, thanks!


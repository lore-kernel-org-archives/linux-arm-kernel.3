Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515B7D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5k+ZBfpSSoOuK8YV9MP3Uw+KoWQy42oU2WoTsiA2FeQ=; b=JUrvulPNgFNa/3qoPh8g0wyRjd
	iAWKyBKqeBo3OdV7l5DLxhmLA0v9WEdYRSIp/8JiMwi+l9hcmEV28OsBMnPr1yBDCJqy83V1ZG4Rj
	Mnvi8jJL+EqmpDB/JNMh6bxQRg6HppJEGO6Eufr69qLK19DEjs7Zved6j2SeQ/jinIt/yZOVmxyy9
	N+r0pFTzwF3kTAOZ6eM9wcEo7gNwg1LH/TyOjv9inaBmG0wRwX3lKx4GQ7E2UWUfKjmGIyIuS1yQF
	WejjbEjUxkyLzT7h76Ea4Y5Ohpgi+tDE+pSHZbHHSV5l+wLeS53448AhRjk/1YeuWhNO/J7fEyfw1
	M5XiA9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8Ks-00000003SUV-0MkZ;
	Mon, 29 Dec 2025 08:10:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8Kq-00000003SUL-3V0t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 08:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0232C6000A;
	Mon, 29 Dec 2025 08:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7A1C4CEF7;
	Mon, 29 Dec 2025 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766995835;
	bh=JOVBKdncGtJtP31diX3aS+NXDdXFROexEapDwpZmu4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBatk/IaPnAv4G2MWEho8CuYY9/Tu/UGckh78JyFHTcdbnDPeSlwwexP+rTcAwZLZ
	 MspxoNmhNC/onAo7Klc0rd85gYkMydGue3elVp06ymrDePZgHnHs1hyp7iOzWEfLpM
	 f8GAR4DepR9yehzw2wi4kTD8XM6U21NNxb1JEKwGNyTalh9QtRjq4LRKyRL4VvRry/
	 VJGeGJTGCyne13H2WCwJZGtpcRlmwt7RvUXaW0Ct+m9QcwREqKFkc+wvYFsZmL1r3K
	 b6hFFvDjpMt/ntVM5ldopNaHnurvAuyHdDaZ5l9ieXKIO82ue6rF+rHAmN9Hyt5a5R
	 qPZMjweAxy9Vg==
Date: Mon, 29 Dec 2025 16:10:29 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: fsl: add TQ-Systems boards
 MBLS1028A and MBLS1028A-IND
Message-ID: <aVI3dRAEh77-PVND@dragon>
References: <20251117130916.803047-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117130916.803047-1-alexander.stein@ew.tq-group.com>
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

On Mon, Nov 17, 2025 at 02:09:12PM +0100, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 
> Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
> Layerscape LS1028A.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!


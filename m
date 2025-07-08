Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8000CC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UCTXSBd5DpomrNGhIejZUsaJTenygRs5Wre8DvM3x0=; b=EzFXyIQBl9N4R9iUFtgWMZ19wy
	B9znMOoXIMRzdctOILfANFmaxoF5u6dDfx1BJu9Nk8V8m44H8pyn/FFIbn9y22ZKFaUBDPbEFbr1f
	9N6mOhndbJvOckny3oCailtbMOS4LD4pGf/Wx8Tb9WKEryAo8999tM36nWN6QkoY2hN5CVbeN7wzp
	kybgpJ6e0v7CqSUQ3BwEFbQ0x6KglvSc8nIDEQC2bbUr05sZtwNRQpngHUwy2w64GeWDETgkRMV3n
	S5gdPCiqFghKIQdHj28A9X8SM1UCIqX21W9/z3UdvfkuM+8jsmk0D7i+PAG7Ly2F4Rtby5cAgpGrz
	20P2yuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZF40-00000006XIp-2bov;
	Tue, 08 Jul 2025 20:37:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEdh-00000006TCi-24to;
	Tue, 08 Jul 2025 20:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7E786112E;
	Tue,  8 Jul 2025 20:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36164C4CEED;
	Tue,  8 Jul 2025 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752005404;
	bh=ku8L98emvYfIz4KPutlqA+m9OYjVsmlwLx2UjJrAYKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IfgBvxJrGxsZR5xYwilNvEoJfRN3Bh0FtmvTXJ3vipPzA7HmlrqkVHD8Wdyf8pyer
	 YqLQlLGQwahwyhNPrFb2a7ku9wh+7fvUUjSEwlyq5rlZdDoaqFJW8LAsf7nzEsY8GO
	 4uKVJqrc9MM16llgqXaNZy3Iz6hpTMma8ykcHTIMnshnweFeoQyW5cB9tFrMhNLXd9
	 NYs4j8xWouuv5h0+weX7gwkS9hU1poagWDZB631nCit1Hpyk6PACUPoh6Qtvb2FRSJ
	 53cNnOotNo/Q8dUqEuTBhZ8yeqe5orammUyInVm6dt5363qKvFh8cN2hEz4VOk84NR
	 ZyhB9kzoKR2LQ==
Date: Tue, 8 Jul 2025 15:10:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: tzimmermann@suse.de, nicolas.frattaroli@collabora.com,
	hjc@rock-chips.com, maarten.lankhorst@linux.intel.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, andyshrk@163.com,
	quic_jesszhan@quicinc.com, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, neil.armstrong@linaro.org,
	andy.yan@rock-chips.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mripard@kernel.org
Subject: Re: [PATCH 08/13] dt-bindings: display: rockchip: Add rk3576 to
 RK3588 DW DSI2 controller schema
Message-ID: <175200540168.891369.12402940753218880108.robh@kernel.org>
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-9-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707164906.1445288-9-heiko@sntech.de>
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


On Mon, 07 Jul 2025 18:49:01 +0200, Heiko Stuebner wrote:
> The rk3576 controller is based on the same newer Synopsis IP as the one
> found in the rk3588.
> 
> Its external setting bits in the GRF are different though, so it needs
> its own distinct compatible.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



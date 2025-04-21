Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C508EC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhe+SbYbJp5claNB2JYrTv7+Uu5yfGVCEgLDmkNyFUo=; b=s8C8tF9chTYU90euTWkNq2+9zP
	8SSDuZS/7nkR89NENqOllHIyftib5eByjnl2VD2CbngTp9MXoN1JTe/YwbFCNKBUiRVsfjJ5r9P0r
	55XtyEBm8oKJVn4tJNRDagY95Zf42aQdD7EaH3KBAthcOYIvsZnjHSl2qK+5bP+Km9mcQKRpPAAqb
	IWb1Vl4AxtyS5CXWj3oahVMWwWu4U6rlyCeqtmkbwf11p9SGdvFIKzF42+FEBtT2HGvR6Fi33vl9i
	Ien7zeaJjePmT3mhHOZGhbjTAGKbfZEdYzMDRF3jaRDwikzYW5OzWmQPMDTiS4Of1pUmIV5exGH4a
	HATe+50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ypn-00000005C21-36IZ;
	Mon, 21 Apr 2025 21:37:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ylW-00000005Bas-2SQh;
	Mon, 21 Apr 2025 21:33:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 751F261364;
	Mon, 21 Apr 2025 21:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F67C4CEE4;
	Mon, 21 Apr 2025 21:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271201;
	bh=Xx+6cpWE1kjaraijDBvdCNjbdF2zjzXih7eBRZD0yvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9pGxRxH/UgCZOvI4Zk6EjYMfXppgkIHmHzfoJwkNRNCrBdMyStejGKUfMBX+5fXq
	 VCpxF1jSKykmzz5K0Sw/qysXNVzGRoVelDA2CKPHMsLuRCYCsJDEFBYmY5hEMGDKHJ
	 lfk3nbi3MlnvM5TEPX0r1HD3EYwCGB6xKz/PiFTb92bS0JbC2+XrnKwv7ZUCyHJ8Xq
	 0DDSU9KzunyA34JF8VqV9MI+jgg0yEQ4pky0afnTTCpZ1lCv8/rif5RTpByyHlaXaN
	 3+7hq2j/kuLyBTqIeL0dT3vSLJOYAWUG/0thc9ZM8VH1mjFLEUtqm/JuZ3R34VlAIk
	 Y4rXO++chZKyg==
Date: Mon, 21 Apr 2025 16:33:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, kishon@kernel.org,
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
	vkoul@kernel.org, linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, p.zabel@pengutronix.de,
	chunkuang.hu@kernel.org, conor+dt@kernel.org,
	chunfeng.yun@mediatek.com
Subject: Re: [PATCH 2/2] dt-bindings: phy: mediatek,tphy: Add support for
 MT6893
Message-ID: <174527119912.2965252.1352584821821232964.robh@kernel.org>
References: <20250416120220.147798-1-angelogioacchino.delregno@collabora.com>
 <20250416120220.147798-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120220.147798-2-angelogioacchino.delregno@collabora.com>
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


On Wed, 16 Apr 2025 14:02:20 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Dimensity 1200 (MT6893)
> SoC: this chip integrates a MediaTek generic T-PHY version 2.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



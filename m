Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A7BCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 07:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faCo/cP1fbB/YubBAIQplrenmSol9sfrVtsV4ftsiIY=; b=XI5Xjr6OaysrQGbyBdzKT8k2wn
	CU+bbgqBDu6UpCy50VaFNlGkawFjyuNsjmwsOEa1vzAu4TCiK/z7nGPZfu5vegSRm5jZjWPjXhzrn
	KZvZR7miaz4ID15mPJfxM40Bo47z8ihV8hjGUK32a/LJvUIh5cgmUIVKFvMHSO5IePzsMNVc6nFMp
	oiut98jAoaOI1KG5IQN5uz8NRWnGMuF5nY85UDz6AUacEcXQeXFwvR71DGi7HJh4xUCAogC5NykZD
	6PXJxVG/P8Plj+tWzmFT1aOCwC3jBGLW93jZrRZqppEf7XCKrUqoQhy5bkk/izLGeavSSy3SbSPfz
	6b953ZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMRr-00000004tvc-2vOg;
	Mon, 10 Nov 2025 07:36:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMRq-00000004tvR-1bSR;
	Mon, 10 Nov 2025 07:36:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40EDE6014D;
	Mon, 10 Nov 2025 07:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44809C16AAE;
	Mon, 10 Nov 2025 07:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762760180;
	bh=y+wG/rw2tXAG5zLwj0mDQigKy7jfvT4bcUlh+zg3SdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H2FVL5kaQjTDPPrF4gGMzntCN89sGQfM3jiiro+diCD7zESTrd099Q1dZ2QXjI/a5
	 +KMPhtSX+i6EagnhL1F/DBKdSVoXl47j8TA1NKkd7oOdzrAjRTdL6zWKmwBtSs0iNa
	 OG+cYCyWjbpsW12P/R0oZosv+/7EUiy9+iX6CA5F5zjCPVpF/QuPFaR3dNvROKnl4f
	 dBLn2mDm9kZek6h4Nu+nmW69rnzNh2lfyOv4FcfCRrdI+t0dLSBoZc2jhlYQ2MNM1b
	 6f/fauO7bThPmSbxskrrnpnA2YxCjksTSuFbwsX6Bpg+t8Nykdq29+gesqmBZ2gXU6
	 vfSjXyc2DbDHw==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20251030-mt8189-dt-bindings-efuse-v1-1-1148e474a9f5@collabora.com>
References: <20251030-mt8189-dt-bindings-efuse-v1-1-1148e474a9f5@collabora.com>
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: efuse: Add compatible
 for MT8189 SoC
Message-Id: <176276017278.17598.8750030991108782000.b4-ty@kernel.org>
Date: Mon, 10 Nov 2025 07:36:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Thu, 30 Oct 2025 11:26:10 +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for the eFuse layout on MT8189 SoC, that is
> compatible with MT8186.
> 
> 

Applied, thanks!

[1/1] dt-bindings: nvmem: mediatek: efuse: Add compatible for MT8189 SoC
      commit: 11a4220f789fb8a75b5941a5205d866da4fe39c2

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>



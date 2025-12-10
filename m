Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DBCD3E77D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 21:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqMX/DYizvwd2K4GsER0cPhvZeFYwLoj+hNGHHSCxO8=; b=eXQQHRt2Cr41fcKjMQS7+KUcqu
	UNuRBo+F7paFX5Eleg8Fn5nZnO9AxBScueZsJ69FcHLWJlEdipAxm15c7plG3QCnBrNk9R3xigbVO
	Pbn1HLmHsg2qlaA1FUdXK9KD2zd9P4uD3xi+pcnE7pKaCUsxj01DtS9arb/MHeqIiCIxlbSIdQ+wW
	u3d3ONZ369pD9DHObo0vUTxCUiEyUePgLbzHJO5XsX2r88eaG0odYJrBiras1Gq8AU7uVr2RDAh1P
	ssVBhwltV/Q1FIhQsSxar0cNT7akOJTGW2/Jo2+Uw70raVptNpXn3aBt2OfsLvXNLilM+5B1GLiA+
	7ycvcDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTRUn-0000000Ft9s-2dkb;
	Wed, 10 Dec 2025 21:13:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTRUm-0000000Ft9Y-2NEY;
	Wed, 10 Dec 2025 21:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 83EB1600C4;
	Wed, 10 Dec 2025 21:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E75C4CEF1;
	Wed, 10 Dec 2025 21:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765401191;
	bh=aoyauFYLJsKITX5t2VCmjFrbwcJN4/7MVdS0dVL08zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogTMVIEld+8E2EIFT3MZeHr2NYaQ1fE2HrZ6Oi7xyw7qYP2t+mVVmOPSI/rGF95Hh
	 cVVQ//NbvBMC+K6sLl8XuAZ5iPqi9ACzQ0tlsTkSlD0fIpiqkGLEC9Ma9C6b4M61jl
	 WNivE8HWCI7LJMKwR9TJ9i5Hedu3o7b4GGOVbEf4bIJXCSVsgqTXAkusc6FXrqu4ZF
	 GbqGIicMtSDG+llfICte7jJrUVCsLtrEdCldMLqC5mv7AAsNeFos9xUOW7qgBF4KCi
	 TEcQ07RMrg4dFm9BgRPhVoizMCMEhKlaUGF+9zX+eKJdGm4Gksg8Cur9VtqzCvpqNy
	 c30hNPsjGl3AA==
Date: Wed, 10 Dec 2025 15:13:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, kernel@collabora.com,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH 01/12] dt-bindings: phy: mediatek,hdmi-phy: Fix clock
 output names for MT8195
Message-ID: <176540118761.3352108.7929645042751556704.robh@kernel.org>
References: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
 <20251209-mtk-genio-evk-hdmi-support-v1-1-9a6106effba6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-mtk-genio-evk-hdmi-support-v1-1-9a6106effba6@collabora.com>
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


On Tue, 09 Dec 2025 17:34:31 +0100, Louis-Alexis Eyraud wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> For all of the HDMI PHYs compatible with the one found on MT8195
> the output clock has a different datasheet name and specifically
> it is called "hdmi_txpll", differently from the older HDMI PHYs
> which output block is called "hdmitx_dig_cts".
> 
> Replace clock output name string check by max item number one to allow
> the new name on all of the HDMI PHY IPs that are perfectly compatible
> with MT8195.
> 
> Fixes: c78fe548b062 ("dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> [Louis-Alexis Eyraud: splitted patch, addressed previous feedback from
> mailing list, and reworded description]
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



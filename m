Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD62E6688C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 20:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbeFMOrTNRZw+sXivUqYIrL8vhKl30EHMobzjJSF+zo=; b=yi3C2xTHtZjCzB9WpgKLdcWzZV
	6AAMYk9r2wfpF9JyOfzMgH598W5DC/Qch0tnxP/KcuWg7GbDZlZJ9AQo4p8j4IY9ytEGOh8Dgb0wy
	KSCGBLxQ//r3jz5Bsc977BXUexUrMoLQP6OGgq6kmrg2PYkfqBbhjRQc6yjQQlXllteYvDCCLXtWI
	3DxaMTr08rCZMs0KEIbAAI0zqpsrcx6DTnjkq35pBxa3+jsZEWfrrbMppdVNUmV53hp6zyS2jKAhF
	YAQEjpw0a1a7plq2bmIhwUoL82texA9lf+6ClT5s9IISxJJiig6czxx8gWAhiW6V5wnX4h0A7y2qD
	vUrsaZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhSP-0000000AyJx-0lWr;
	Fri, 19 Dec 2025 20:52:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhSO-0000000AyJc-1wkD;
	Fri, 19 Dec 2025 20:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D45860008;
	Fri, 19 Dec 2025 20:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7098C4CEF1;
	Fri, 19 Dec 2025 20:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766177531;
	bh=IfN5Dcnu7w/fq70aai0mm7T/3vR0HXA+EKmz+kfT6XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jq1tQtSS/JSCOocX/vIVsiOD5D9gS1yjIp+Grqn/3RTPO307bYj+41/DcUdH6/GRe
	 YIVF7sjtezyVdaSW1ztPfWvX2kXCnfnd7QwoimHJGaZDeVUDmBvd0TE2jCCoqPY3Q0
	 Y5GeDEipTvoQOAzB3uRM81xTft9LfvBxybKkCteBjB1woJ47kbihrI8NJ+mql6jQX0
	 3kYNT8JCuQ0aKutiRFVaZkfXGnRMPBrwXF36aNPqxNyQZqoeEf78p0WVaK2C7YKc7f
	 uuoa294UBUMFCp9e+GdvHgPulI5N1UmQY9BJG24oJgTMlixqXdN14Bp8KGSpd6XLLv
	 D3vyQsVNbdGsg==
Date: Fri, 19 Dec 2025 14:52:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Guillaume Ranquet <granquet@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	linux-kernel@vger.kernel.org,
	Chunfeng Yun <chunfeng.yun@mediatek.com>, kernel@collabora.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 02/12] dt-bindings: phy: mediatek,hdmi-phy: Add
 support for MT8188 SoC
Message-ID: <176617752769.3912550.11182398487708653155.robh@kernel.org>
References: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
 <20251217-mtk-genio-evk-hdmi-support-v2-2-a994976bb39a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-mtk-genio-evk-hdmi-support-v2-2-a994976bb39a@collabora.com>
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


On Wed, 17 Dec 2025 11:19:01 +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for the HDMI PHY IP on MT8188 SoC, that is
> compatible with the one found on MT8195 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7895C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvNmUb4ZS1d9lyY41zp5YX8a28fQAoF6vPrsy6o8k9A=; b=LFXBXGH2TdsNHoBai9SVyLttJo
	oltie8svHpM3HDNppktxnraH+oBI5593424+4TnnKUrr39ZeyJzr2N4EGvgKLDArWk5X1mUEjP5tm
	LvAbmNf7bGGrGHLQ3icvCatK8pvrsj2lZZYh24KrigjmJ2s1K1SLIC1DFlXf822KK/FDSJiZjpaFF
	qsDc7oJPxM+uoB2bmHyhP3h3ZJJvlxUMcNhWu86sSBkiwcsvLPpN9cIFHS7ti5as1s4JxiW+mgD/W
	9iGeCyZwJ5MRTJtJrxrjze6E6jgJZ8gBlPHY0MIaR9jarVrRavKaPX7baH5Z3TGPac52C/6S8Vp43
	VgPu9ODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobYy-00000004Yme-3jT9;
	Tue, 28 Jul 2026 06:45:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobYy-00000004YmS-0u1M;
	Tue, 28 Jul 2026 06:45:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B56B4115F;
	Tue, 28 Jul 2026 06:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AC91F000E9;
	Tue, 28 Jul 2026 06:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785221115;
	bh=MvNmUb4ZS1d9lyY41zp5YX8a28fQAoF6vPrsy6o8k9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mS3iWNsCxRFptNaGej/d4kOdk/edC/2wt6OD25drgpgWUY5v64YiFZkp8kyoHiTw4
	 ogq9mBBNRWVpWcIXTLLt3mPbWXVYdpJSYUfPFulB3ZgB4ULvdd09prYNtTdclJRraj
	 jrxZp4IifxPshMBKheZqnHQLD6bJh3jr0dqrXR4s4OmH+wUCKLHfEfmN0Dkw1LBoyB
	 UzpbtZ/asPoQLvePIAltatTPjiLgaZKWOigY6YbUWfkJZbWXMkvpwUYxHRGNTCA0ew
	 zmnCXARDFvJtzDY9pCbNKG5arkQodN5lJo2JVO4SA9Ss2u3C9EwnZgyMyI3huuJKae
	 GwLCNaeeJXHtw==
Date: Tue, 28 Jul 2026 08:45:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Document MT8196 MediaTek
 PCI-Express Gen4 S-PHY
Message-ID: <20260728-upbeat-invaluable-perch-bbb938@quoll>
References: <20260720152654.92216-1-angelogioacchino.delregno@collabora.com>
 <20260720152654.92216-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720152654.92216-2-angelogioacchino.delregno@collabora.com>
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

On Mon, Jul 20, 2026 at 05:26:53PM +0200, AngeloGioacchino Del Regno wrote:
> This adds bindings for the PCI-Express Gen4 S-PHY found in newer
> MediaTek SoCs, such as MT8196 and its variants.
> 
> In the current "revision 3", depending on the specific port, this
> S-PHY supports up to two lanes of PCI-Express Gen 4 and both EP
> and RC modes.
> It is not clear whether revisions/versions earlier than 3 have
> ever been shipped in any other MediaTek SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../phy/mediatek,mt8196-pcie-sphy.yaml        | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



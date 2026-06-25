Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D77ECDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PDUFJY+QkYuzeyqufzPcDKr537ip/E8/10wMnMLTxE=; b=r+OuiA974nQRbJR32k1ltIHuRI
	FwASPzZM8pAuqUSMQgABLjZ6NOO/uH2PIc/GoTZizHnpSTnRs4ko8s9TvnQJOQ2zFE3DaLdng6fdZ
	S0EeK2HwOjcPUGiiH3bPkxbAfBc1nKBzZlukvwrqtQwBzjp8haYnJzHy5GfIHoQzUEwBNn1eyGuje
	ERK1LbvJWseRW/0iqPi86MHmaaVwwSH87KlHdnQJFcFEamEBIy3uzLtPtb8WIDf+UWQg9kfQbURAc
	KXqtBGrnQuYX32StIAkPDKtfIskBaqwEeP4R7HWM3Yjj5c0ACNGy6PRHZHAz28NNOvk84AWlXaXAH
	zsRREQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceZp-00000008lgD-0ZVh;
	Thu, 25 Jun 2026 07:32:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceZo-00000008lg4-1QbM;
	Thu, 25 Jun 2026 07:32:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA15640570;
	Thu, 25 Jun 2026 07:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC211F000E9;
	Thu, 25 Jun 2026 07:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782372763;
	bh=2PDUFJY+QkYuzeyqufzPcDKr537ip/E8/10wMnMLTxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WGaWB+TEKRegrwE1IO45sU7ItXBXq1Gn8JBMf3AFDiuAUUxqN5hLyJATlw1ESZnjb
	 BAC9dyP0NBKiPsSQN6fAEA4x9GFVRwK5jTjNiLXPKzBbINOa2iYIMli00DBp80O/LX
	 Ahm+4gGtwPoNgV0plQ31PRByta3/AXwMCSsfoJI9ioOslrnivR9cwpa5rvZlTUbJyh
	 qkMM68IshjixlGLMOUUMWdUFiXbQJ3Kyc9K29Wm7UbZIPGkvQXqQ6hlFKrn3wHJR4z
	 9Z0Fi4Mb1+2yx/KwiwCb4Gnqyt138YqtMpcdjwFU7qBD9+lXdphxasHVDMYzOpXMzc
	 dnalbqRSsBwfQ==
Date: Thu, 25 Jun 2026 09:32:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: mediatek: cec: Correct the compatibles
 for mt7623-mt8167
Message-ID: <20260625-likable-aboriginal-ostrich-d717dd@quoll>
References: <20260624173627.19785-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624173627.19785-1-l.scorcia@gmail.com>
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

On Wed, Jun 24, 2026 at 07:36:15PM +0200, Luca Leonardo Scorcia wrote:
> The HDMI CEC driver for both mt7623 and mt8167 is actually the same as
> mt8173-cec and the mt7623n.dtsi board include file already uses mt8173-cec
> compatible as a fallback, but the documentation lists them as separate
> entries. Correct the binding by adding the correct fallback.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



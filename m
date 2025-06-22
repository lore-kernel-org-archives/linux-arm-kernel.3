Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B0AC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 11:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41m+e5xtpTI2sxj9fd3I/0T6OcqfGzBPTB2tJcXr3aQ=; b=0Xnf/sISLcB4MXc9ZIBj420KHG
	umwvc0iemycXF+sQlbt8B752gLCpYBrytSBUP8hpdhMdc4NSOpFg9h0d4w1a5GHU+/Q+e4NwHxqyA
	erzVd4DwxpRkrK0svx5LXxr8EWnfCRb1eUOZky0FcLhwF8P4i9V4g7Si+ccxzuP9WOpoDJIfFs7Fz
	7Vt+oltdb8SR+pLajo5M0gDUCqExy5A7jDDkc7bVvUQPcRAKsI1+89OZd4JIM+1kX7gnMLw/SpBEg
	U7KZmCFGdvVDhZSparDLL2vPh3TmR4R4vhsgq9ctSiyGc9lEgqtKie/lBrRq5XhCC6Y3hmp3uwRaF
	tt65fqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTIru-00000000n5C-3eR4;
	Sun, 22 Jun 2025 11:28:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTIpe-00000000n0F-2wt3;
	Sun, 22 Jun 2025 11:25:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7B3CA4CB6F;
	Sun, 22 Jun 2025 11:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F844C4CEE3;
	Sun, 22 Jun 2025 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750591553;
	bh=vwzHuDsB0/SdFuQt7+V1uPfJcognh02DJouc4VcjdcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPMQSNwRH9NOz3dM62atPvYTlKypMvatdggN6H24SQyi1z+aFn61P922wOcyciZlZ
	 diTprVJeGg5I5eWZJQYdobT8ASj7MOoU/hS4DAKsdqfxtWDlkeB88Ko0RjC9/P33jU
	 sBgk4fbOzXkQluVAA7+xiZvlJdosLJ1dtnbdVhtuteyWoEE667Tlnkdispa9DxLYkH
	 AfNnfyXMaEzrgtvpJzFCoe79iAfs5BNbIYylmC1GwYpBBacQK/LOtqtDyDTokJO0pG
	 +lKYzkIpMBHVexb36GBab8KJlHf110/SMytiqtwWW1OBp/1A2DgvNUQZ380mYggfSa
	 unMccCxWyVC/g==
Date: Sun, 22 Jun 2025 13:25:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 10/10] ASoC: dt-bindings: mediatek,mt8196-nau8825: Add
 audio sound card
Message-ID: <wagq67zdc4vak3rs4fne7tree3g6tsvj7fvrgfmd2oq7ottudb@w4gunlglta4j>
References: <20250620094140.11093-1-darren.ye@mediatek.com>
 <20250620094140.11093-11-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250620094140.11093-11-darren.ye@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_042554_811626_1541420B 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 20, 2025 at 05:40:43PM +0800, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add soundcard bindings for the MT8196 SoC with the NAU8825 audio codec.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  .../sound/mediatek,mt8196-nau8825.yaml        | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



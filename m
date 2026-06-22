Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA188CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=it2a5Lhot1D6sJkUxvzSkxITZ69xCpsKj8U00d2pQtQ=; b=o/DleIrK1w+wcF3mcVta1OC4eG
	htU1UpW/yEGfmSs5UiyJyYSXMinT7lSJeqoAjrLHkJA5Xs86/5Dyxxcj+2JSF50VGcVSnMMBbgElu
	p+ofl2Z9r0NfITk/AxrSrcBFXPe3EgY1TAsHbTaVrVukcxxDfog5cbBOl9RKR09lPaTI72ePQ1XTJ
	W8ajY0PbbnUL4i3EsIZewjJv4wpKPCHEawwz+BKDoGVKT4/4ij7zo3vD6QBuxOqGLIMKm84uTbV5A
	gqKPBoa73Gnv436gjIViNxdpN8/EqdO739DjIsAI3NI8aNF8VY6u6IlsO2SDCkTW9zWpp9X7xSSI3
	xkPk1JdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZ0Y-00000004XMY-2X0t;
	Mon, 22 Jun 2026 07:23:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZ0X-00000004XMP-0X5u;
	Mon, 22 Jun 2026 07:23:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 949F540AA6;
	Mon, 22 Jun 2026 07:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9A21F000E9;
	Mon, 22 Jun 2026 07:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782113028;
	bh=it2a5Lhot1D6sJkUxvzSkxITZ69xCpsKj8U00d2pQtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mKmPMHJigyGKwHQvkfxGIk5bMlBXb+Wfu6oIr0wD7ulnBDBKafgQdovQuaa0JgT5Y
	 Ani8ggNCaWkzN2T/5nsjvABt6uto+kYQpakYVpbjrtrrkeDu7uuFGNNMFtaIQkrHd0
	 9l1Xpr48XFOuuCnRRve20afdEibkWJlShi6XC8KhTHt578TAj6iULqzJ2Uhjua1AbZ
	 yg3P+909LS1gUZRS0+9ob2R9TFyrWFqYnctLqX4GTnDcPs2rQui3/cNc2zMug1SAFj
	 YPIwO6jzfT10cNC9BZTv2sCri/WfAIvNicSogTwwBRyVzNMFOYI/o3dmi5ByCXvr4i
	 eqOALBAX4VpNw==
Date: Mon, 22 Jun 2026 09:23:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Message-ID: <20260622-authentic-numbat-of-development-a98d4f@quoll>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
 <20260621081634.467858-4-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260621081634.467858-4-l.scorcia@gmail.com>
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

On Sun, Jun 21, 2026 at 10:13:28AM +0200, Luca Leonardo Scorcia wrote:
> Add bindings for the regulators found in the MediaTek MT6392 PMIC,
> usually found in board designs using the MediaTek MT8516/MT8167 SoCs.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../regulator/mediatek,mt6392-regulator.yaml  | 112 ++++++++++++++++++
>  .../regulator/mediatek,mt6392-regulator.h     |  23 ++++
>  2 files changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
>  create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



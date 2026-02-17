Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D263E8385B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 07:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4S1StqiRHcU3B5femduB9iv4YjaOamzHqdPaHqsEfg=; b=eUI6Ea/BwdKVBroMm6pLhux3Db
	qj61EtasSPcLV4Q17HhfxgtRFzxe3CaMMWg9HbvcF/zS/Ojg2zhY1C4c1WqcCzP/KiHCS2/54TeEA
	+5uqqgVWXdSnFASZCNh+EhN+xUtecAm7/78yogfqSHqWODhBzQfgWGBLp+PXame/fPT1VrzlZEAjf
	qXBb9SomIICjnnqx3j6biXm9bWpN1JAyStRBU2GpPYE7W8+BJkzKJIsf7snRlsh4RIIBkBPUYRT+H
	V8IFXjkWjbjpWtooW5FGgRG/nUvqK4UY1LUhknENAvN4nScFJZ1fK+2AATD2sEeJqX85A+IvvKqhZ
	s984yTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFvr-00000007nhg-2JII;
	Tue, 17 Feb 2026 07:55:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFvo-00000007nhU-1QKb;
	Tue, 17 Feb 2026 07:55:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 659B760133;
	Tue, 17 Feb 2026 07:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88372C4CEF7;
	Tue, 17 Feb 2026 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771314939;
	bh=RIT9q7ZjgzCwi6a+GrgVFx/hK7w839qVlIXKzRBoBTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=poNW0uGENYq2wzDEQmx/QG2h3DW3WMtP/85H00VmpkKRZYXeCqxKcDvdv7zelcSIu
	 9OzMybvVH5HZdXRi+IPnvxTAte4yRnClsBb2uUWlyWSJonI+RJlvYRQuYgY5F1IsVM
	 jHr22nyGKprUUznuHfXtRk1+LR9WZL6NGbAObmVXnOBm9EoWaOONVmuMluUJBSagU2
	 AVUMePee6iRG8nrOy8BPTrO4bpz79Volj5zoYsvalQQExcA+CMGkOuvGRcH8NqBXaB
	 lfhxsk5EUgStGEp0I7Xf0iqt9VsrMMtLu8T/34DvHcKfbIJ1ow0vK4ps3r6+iObkNx
	 L8TbvrTbqu0rw==
Date: Tue, 17 Feb 2026 08:55:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jitao Shi <jitao.shi@mediatek.com>, 
	Fabien Parent <fparent@baylibre.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 4/6] dt-bindings: phy: mediatek,dsi-phy: Add support
 for mt8167
Message-ID: <20260217-loyal-rapid-firefly-edcdf1@quoll>
References: <cover.1771258407.git.l.scorcia@gmail.com>
 <66fbd5dd3604ffc4fda45022c1db68e4e0be6714.1771258407.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66fbd5dd3604ffc4fda45022c1db68e4e0be6714.1771258407.git.l.scorcia@gmail.com>
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

On Mon, Feb 16, 2026 at 04:22:15PM +0000, Luca Leonardo Scorcia wrote:
> Add support for the MediaTek mt8167 SoC: the DSI PHY found
> in this chip is fully compatible with the one found in the mt2701 SoC.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



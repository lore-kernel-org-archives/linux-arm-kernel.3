Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EF6E8385B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSCmBoyIfaMQvSouN+JWXP6An+Ww8g97pYUcejHGHIw=; b=NYVULU32a8hK9v9llNQdak0gl1
	HT1XwQ46absMxUHSX5hLExg8y861CJh40JswnfpRAjYw74MruM+BHRQ6ywepbw8zJ49Lp+V6ZP2zm
	QxH1Ju6qdpsZxzHD1n8jqt0zD5v29vsmkeBk8ypIFbgIifAZmz8oU8BJf5JPbHHT979v6lcJzI0y2
	WQf+6JvNOVehYx6jEkxrnu0nBOGJX5nX7aIMpuhFgzcRa8NuEOfenHORy3wFx77dFxsq4Hnmjj0I6
	q/OOM/oq7RSyBJ50WW24GpVRoDHnLFO9wOQG+LE2ABIg6jgjt500vvUJ1Dlo9ADIHSSkT8yBdNZD0
	NCgtbn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFyT-00000007ntO-2TiY;
	Tue, 17 Feb 2026 07:58:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFyR-00000007nsi-2wXk;
	Tue, 17 Feb 2026 07:58:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E83FD61339;
	Tue, 17 Feb 2026 07:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CC8C4CEF7;
	Tue, 17 Feb 2026 07:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771315102;
	bh=9aqY/yhZWXO2CxYiklCZabTtP8Ya9dOUEw5jP19yryc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sbs2aSBbKi7EeT2eYI44w0WYnYW6SAca4VY+PNyH9SmbHfWx17g5aQ/z1Ou1GSp76
	 mK5R5d99G5sCm2g+JJbcEexHljxznkMN63OE6FFnMejvbqamq6yq5XR2QFwxvs8vNJ
	 j3KNup3XsvNQxiCdwMGxzVd8C4PHnSqpeasZfNIh8qb0KGBBLYeeVDwnimfmS/B/jO
	 vgZtqb9YlRJ1L8VQ1vGk+QxsZIZYOVfb9KWel/w4+DHPfEBR33Brm20RU6ml7iwx/b
	 s7Qkb1RS2PSIjIGW3jtjK66ljqcJ28HzXyjDK0VdVHxCXbtWEhadUNckF7717fcGha
	 Zi//j4Cj9yZQg==
Date: Tue, 17 Feb 2026 08:58:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jitao Shi <jitao.shi@mediatek.com>, 
	Fabien Parent <fparent@baylibre.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
Message-ID: <20260217-stereotyped-dazzling-loon-f06e18@quoll>
References: <cover.1771258407.git.l.scorcia@gmail.com>
 <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
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

On Mon, Feb 16, 2026 at 04:22:14PM +0000, Luca Leonardo Scorcia wrote:
> Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
> describe it as compatible with mt2701 instead. It is safe to do so because:

You are not doing what you wrote. The dedicated mediatek,mt8167-dsi is
still there. And if you want to describe mediatek,mt8167-dsi with OTHER
compatible (mt2701), it is a NAK. It is wrong and not allowed by writing
bindings doc.

You just added fallback, didn't you?

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> 
> - Bootloader doesn't rely on this single compatible; and

Does not matter. You still CANNOT remove a compatible. If bootloader
starts to rely on this single compatible, you add it back? No.

> - There was never any upstreamed devicetree using this single compatible; and
> - The MT8167 DSI Controller is fully compatible with the one found in MT2701.
> 
> Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")
> 

There is never a blank line between tags.

> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml   | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Best regards,
Krzysztof



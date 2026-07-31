Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2BDC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3BFrWnxaX8dliQODHPD0sKK2aXDS18uJQppXfWMLDY=; b=QqmCYKazSF6HtY0DyW0UJNsme9
	3MpD459RTft2V5bOPI5uCQSims9kYQ/ioSjr9IIReQEKrpa4Wd/bw68623bLg+Q78oZJ0AYVb6nn7
	rrucHxqNXSrfqsAMUWTYyGOdXKYZSSoAADLjEdRn89RIVcLwnTo4DW4QfI8hUOz/X8KYvzTZvn1uK
	fxkQpWtCEoYnZlNiRyYsKr3Ugx+WSzMmyqmC7EpjqW8j2300B6BfQxW2rO95YfjVhvaXFf3+oxhMA
	RHOA1pjwrQHuCD0nhihU6pUy1yyE7SfAeX1OC/B8fXG7l3pHfHSdljot3KW+Op/Hv+HrsiVfF9Xjw
	A33ryu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptGV-0000000DUXU-2LSR;
	Fri, 31 Jul 2026 19:51:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptGU-0000000DUX6-33n5;
	Fri, 31 Jul 2026 19:51:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22B8342BB8;
	Fri, 31 Jul 2026 19:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF17D1F00AC4;
	Fri, 31 Jul 2026 19:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785527490;
	bh=o3BFrWnxaX8dliQODHPD0sKK2aXDS18uJQppXfWMLDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P6saVW2TP/ewMybOOhg+ZAiHLo4WBnb8IPGuG46yQQQXd99tg7F5DJUlfDpzOExW4
	 PjvpA5pca1fG4cJALKD/JHlXWMWbQMvJl5aISQGKf94d5/Sb2LRoQh9NWqjAI9Ln6m
	 P3XvwgrKcF8O6mqz/yeFtnxiaERNjdBnQgEJ8S2iXgoHheyd6G9UiZB8HS8NXH8Ih8
	 e554OU1Q5b/B9eTOeIJR5uFMCdi8/Ka/wAj2I55uhx2qvxZSyJ1ummrT2J37k1OTlx
	 zlvmg17+auc227rmQmpHm3wD3ED/ZpiBvdOdCZ9wd7VvhWlGvoT7/86pXyH4BovBF+
	 Fr+ZrfaUmZjOg==
Date: Fri, 31 Jul 2026 14:51:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
	Rosen Penev <rosenp@gmail.com>, linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Darren Ye <darren.ye@mediatek.com>, devicetree@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Jaroslav Kysela <perex@perex.cz>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound
 card
Message-ID: <178552748845.1454226.10384095469875054349.robh@kernel.org>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
 <20260731064326.2284228-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731064326.2284228-2-ansuelsmth@gmail.com>
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


On Fri, 31 Jul 2026 08:43:21 +0200, Christian Marangi wrote:
> Add YAML schema for Airoha AN7581 AFE SoC sound card.
> 
> The AFE handling on this SoC is very basic with clock always enabled
> and all the power saving feature not available.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



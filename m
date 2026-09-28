Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B3DC9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEjQlrzSz/9hZuS61/C4rrXkgZDZGf6FR93QXOJ5zaI=; b=jF1LbtiAIuAPflE+nj/AsNvlkA
	psKHbJxdLRmRkMlB9nyhKeLgc/vBlMaqkAUhHcA+4savtcMUV27nCqdsiMFe9RbEf2yB0zneKzrs6
	7x/JTB6RJQFf1IMjyAidpnMHhG1WS788Podt+ltarHX7DVl7necCPE5H1dhdna7IFghVaJlQ0Ne0s
	KQYfVmlA7bkGXoh6Tbik69ibiOkX3dIysVoWWK8vhujH+YYNTroCYgV6mbuoA4esIgATV/ASvxPVf
	J0h5nN52kMTJGZlhXhAowNXQbujQwcY4hpZegJASFkJXUdbFsqermebgqtgYrQSCIB9EXMgOPGcOR
	dH0ZajMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBIV-00000000dXT-4A7M;
	Mon, 28 Sep 2026 13:21:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBIU-00000000dXH-3Sjx;
	Mon, 28 Sep 2026 13:21:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4781043CAD;
	Mon, 28 Sep 2026 13:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEAA1F00893;
	Mon, 28 Sep 2026 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790601694;
	bh=HEjQlrzSz/9hZuS61/C4rrXkgZDZGf6FR93QXOJ5zaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kBIWwKhKOKv0kENXFht5TnHNyc/xxKjRaW/+GLhf57CIOyN+wF8fOqR/FxGJes4Er
	 LwfWrpPgvf3Tq7TshK9fauFjWnKX5mSJ4kZI+OsZhtBf2MumTuIdz7ZLzbkbKEHJWx
	 C0b8ogppypPbIxH6jfGNgQTH8wjTehOK1BeVh2IpB+20YyJxMHYA4TtWQx/QbHjdl9
	 m0utuPUqZ3GcfP2TkVaNGSMjm5aQJwLukKkxkvGqbHnCApNg+H88AXrCWGVLdl+JIG
	 F7nNGtqBCwftqTt7/ZPFmRlvAgkduXpNIGqoZBMFuttMBEtvbN7HpuIGbk335C/F4A
	 RZVTkB3oxT4/A==
Date: Mon, 28 Sep 2026 08:21:31 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve pinctrl subnode and property descriptions
Message-ID: <20260928132131.GA3950360-robh@kernel.org>
References: <20260925-mt6735-pinctrl-v9-v10-2-cc042983c565@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-2-cc042983c565@protonmail.com>
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

On Fri, Sep 25, 2026 at 06:52:57PM +0000, Yassine Oudjana wrote:
> Change "subnodes" to "subnode" in subnode description for better
> grammatical accuracy, wrap all descriptions at 80 characters, and remove
> literal style indicators from descriptions that don't need their new lines
> preserved.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml         | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

The threading is broken for this series...


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40692C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhUVTQj42y//P1Vg6BUOQL8RosJqKNOqghEIqM4Zenw=; b=skis6JAGO7eHOmp7LnTDPiI28p
	jj8xjuwpV9BnCfDqn4/fE/kIxFYQDMW7OR0JAsZH4Mw+BBBHIu3rqG0fdjkA1GR/GAaHg8guqY+5C
	uZMxRdcNADLhQpgBv2QbTtO4sW80RGmFf1rx8FdsuNBepTk37JeJKkoOuDPAhFyTleFv4uE7e9RaA
	5BW752uTH4Hua64wNOBEAaGihI9+wbPlzj6NEFui5KYY7kGnQ5Sq8ZMz+HbMUpAvWVTsphL7uPc/P
	RgOQJGDsHMCUmDcafpp7xR6AMrYwDnOc/ApOmVWMM8zVxV1i2TiAJCHct982GPg/lCPm7T3KfFK8o
	kbDXHWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYr7-0000000C9LU-2A4q;
	Wed, 22 Jul 2026 15:27:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYqt-0000000C9Hd-1YH6;
	Wed, 22 Jul 2026 15:27:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37780600AB;
	Wed, 22 Jul 2026 15:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912391F000E9;
	Wed, 22 Jul 2026 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784734037;
	bh=dhUVTQj42y//P1Vg6BUOQL8RosJqKNOqghEIqM4Zenw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mQWM+KEEeV7Yvns05CC8tUwnqtwyIjIKVg1JkyYxYIqcZ8yV4pAfLmIn98RUgufR9
	 fHrs4zyb/4/q6nBbHsuqYQrI+USsAKtwAVfpx2p2EUOd8o5cUEHsFLwDwrAxGYsFOj
	 1am8Z/4enG952QU8/IemkYoeta9oaymVlmBaoW5S4B4UVEe2LbHML2jcOc+f2Bw351
	 3ZUOYu5DWJi+ExAqRWo2cdl/qJlLL4k+o9ObKvQPMiWIsa4zis9Vhc7ZI3GY/fzhOn
	 GFMBkOqvMWWr6vUC0nb1JhKl8XgRpHvTelHe/1Rf2DN7sEZM4qh5qxbLbN4+XcRtg8
	 xFQkA5cHbkBnw==
Date: Wed, 22 Jul 2026 10:27:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: mt7622: allow gpio-hogs
Message-ID: <178473403449.962632.12615541678335814089.robh@kernel.org>
References: <20260709193927.108105-1-chenyou910331@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709193927.108105-1-chenyou910331@gmail.com>
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


On Fri, 10 Jul 2026 03:39:27 +0800, Chen-Yu Yeh wrote:
> Commit 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog
> name with bindings") renamed the asm_sel GPIO hog to asm-sel-hog to
> follow the GPIO hog naming convention, but the mt7622 pinctrl binding
> only allows child nodes matching '-pins(-[a-z]+)?$', causing a
> dtbs_check warning:
> 
>   mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl):
>   'asm-sel-hog' does not match any of the regexes:
>   '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
> 
> Allow gpio-hog nodes in the pinctrl node, following the same pattern
> as commit 9322da935c9a ("dt-bindings: pinctrl: mt7988: allow
> gpio-hogs").
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



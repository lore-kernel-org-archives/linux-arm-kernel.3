Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0DBCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sl+jzIVY65x8T0Pt2I7VlkDlhCHiRh/X8cMGKKSNoEk=; b=mhgggbWtNEoBrUufTIVbvE3oKP
	Pvq1LF02aUZup/AlDKqvikrhlkeFRIJcW5aXAMcqormTzNF7n8HMCqXU/UZtYbvFiAwOGxC+r6YYa
	baLkUW0Isv54gyKo+lQrleGzxxhUmhbIZSYQ6QnluwiG92sb2IeO68yI/1w8bXYOtmCqME/1cdYhq
	wcUsb/NzFH4cNlU7birm4znuvMjkLAe+jObXj5DxaBy4rk8QICCaLuoEBvLxPJ8RHIjlANShcXHlQ
	rLcEEeKSyUigjRGAjeafXfRQQ0UmqNVcl8LAf44VVntmXB5iKakfiv5l2vkg9a9r5PP6LoxD6fV3t
	p1G/JA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3YH-0000000B8MY-11xz;
	Fri, 12 Jun 2026 15:12:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3YG-0000000B8MP-1SHP;
	Fri, 12 Jun 2026 15:12:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2BE46008A;
	Fri, 12 Jun 2026 15:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8721F000E9;
	Fri, 12 Jun 2026 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781277127;
	bh=Sl+jzIVY65x8T0Pt2I7VlkDlhCHiRh/X8cMGKKSNoEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FgnGNNKn9s23sVBUqi+FNBIVrp421ZfG9YP4QYf0TpFAoU/OlFoN49seTeUlgsjcI
	 MFJaN/+4bQhjtNySxXNi3WBVvylt3D0q7OnDJWP3KG71lBAmNXOih94Q+g+NzkrbJn
	 RpmlRjororN/hCTcX+zubWuXfcLXF4MYFRl+HNNRNaxvDsUuAOIHu3TyhcgVIHegEa
	 QFaNaH8JlRrS5zM5uDrxTzjq93e+8533nyBeeZl9y5h77bFZT/gqn/SShGYfPqjtx5
	 Auvu8CttajYHsdtJV1yO/ZxlEji9coZlFoTgjfKMK02vx3VZpYaZloAHkiE/qVs+N9
	 bj82rZjKoSFRw==
Date: Fri, 12 Jun 2026 10:12:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF
 clock descriptions
Message-ID: <178127712594.1038565.14609439013063781178.robh@kernel.org>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
 <20260602101608.45137-2-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602101608.45137-2-phucduc.bui@gmail.com>
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


On Tue, 02 Jun 2026 17:16:04 +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Update the binding descriptions to match the actual clock usage, where
> 'mclk' is the controller clock and 'hclk' is the bus clock.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v2:
>   - Update commit message based on Krzysztof's review
> 
>  Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



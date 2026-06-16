Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B657CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 13:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8iDUL7W0TQmeYxpCd6HKXwGPJyYmHCMd+sglFpYlvw=; b=Nytd/cucAznL3Cpm0X8ezZaT0+
	Nf17mpJ/hiaiOd3k62tLcbJsfbdEzpuDrJ/A9CfawRqU+/V4XTC26bh0EOJQ9RE33LyIr1nGkfChx
	+nyHejEJU6+UjoMqXjxBZnXNkkXvW0tvmusM6dUp8EjssTxsCfMv6l4DQj/OakWyt4NuHbBLSJ5fZ
	AQOtuYGQUh1fZUDe/Bo3i/hZWXiX49AfTA+3FgT5RQ9VrZk+mtYMFBepWJXurDpbInq94aNRV+vBG
	pLTnp9hIEv+YYn2F1JShU1Jp4hDUDMIX0USHxDj4SGX8I7hQVOrcG+FrcaLkvARIyrIHPSR1qqyPP
	azrfRuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZU4n-0000000FrV2-05sM;
	Tue, 16 Jun 2026 13:43:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZU4l-0000000FrUf-3FCe;
	Tue, 16 Jun 2026 13:43:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF3FC4366C;
	Tue, 16 Jun 2026 13:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0801F00A3D;
	Tue, 16 Jun 2026 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781617414;
	bh=q8iDUL7W0TQmeYxpCd6HKXwGPJyYmHCMd+sglFpYlvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nbB3m3hUDC1grbUUzhtcl3F2bp9B05pmaVgqTc0TdCizZL4tT2ccGPTgm7LgN032i
	 Qy1vIIQ9Kz+3G2zNDUFggwOIe2HemGDDfQwBRxIyAzYQHanjtp6ribGBv7iZniToS7
	 AwgTQzHyAkvmJiHSPllY1D2Z014kz+eLivVu4EvN1fN3GFxBdlVzfkJFc7WmqkPGzm
	 KrCOFwoETXL6cN4B9qA8wzzOVQSTLROLxiS3C9n4atqef9vSelS0CQGINxmrvmmN3s
	 IBw8MYRXJk11S9TuqDc9dK1mYQoPPJi8OAo9Lb0o3xri7dbI2mq63CYYxoFTckerqX
	 4Y3+TRA0Ijs0A==
Date: Tue, 16 Jun 2026 08:43:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	linux-kernel@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>,
	linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	Sen Chu <sen.chu@mediatek.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Message-ID: <178161741195.2350422.8190069791847704503.robh@kernel.org>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
 <20260615071836.362883-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615071836.362883-2-l.scorcia@gmail.com>
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


On Mon, 15 Jun 2026 09:16:07 +0200, Luca Leonardo Scorcia wrote:
> Describe the MT6392 PMIC and its RTC and regulator devices. This device
> is mostly based on MT6323 with some similarities to MT6397 and is usually
> found on boards using the MT8516/MT8167 SoC.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6397.yaml         | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



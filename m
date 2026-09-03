Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1797C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbIaSZueJ9L7aZ2SFykAsrRHq34CEJ8hDtg94f4lxLA=; b=Cw+mDpSVrlak0hCNaqgzDZOWUI
	gHusD43f5+kzzYIEexogxhILkzHkPkKC1eaSdYEJUCaFxXOYSPsyX/NqZW3tfQDrMrAEXuoPpKaNZ
	l/dO+E5lDPG+r0k+RK88f4u648GyDdJkaezoHYz1NYoyZQqipo1ygs565k5x/S91/O0IJXNQk/IU+
	0GguQtO3rQDgnjaxI/wQvA494+mCqxz3XzDEHWLxo+/c6ttlebpmvWkn5KzuVvQ/G6F0Ug+DGhWUU
	HIyDVKRF98lRanTpo4Oisy77/UDmPVeDuzV5pIRlRDWWSlz6tT0FVvlyXpEr+iGu5Z6NpSLwTo3bf
	3h4lS1qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22kh-0000000Gmcp-2DPA;
	Thu, 03 Sep 2026 08:24:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22kg-0000000GmcY-0OZA;
	Thu, 03 Sep 2026 08:24:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7867360229;
	Thu,  3 Sep 2026 08:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349611F000E9;
	Thu,  3 Sep 2026 08:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788423893;
	bh=fbIaSZueJ9L7aZ2SFykAsrRHq34CEJ8hDtg94f4lxLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zla5GHHcxSaHYLPcV7hDLgmsoz99LeWBz4LNzJGRDna/m4IQQN+EEDM1op7tVD2Lm
	 OkYqsNGRl2ZFvclRMCzqO2geS3EHyWwFGN9eiVXLz7ibSjlrS3aG2y8AdsdVklpXql
	 TTCs5EEVlAsYYTAW8jVLHvBJhfWPjsZlmwcw6noz/kePfzDRDtqWJLnQpu7WHT3HCw
	 Z6S/3xlKd/iXYSekmNL+Mw3yDWCk4PYvN4YpDsoV4YwO15Enzpz5iRIl1yxaX6NG7i
	 tFu1e6SBmaaR/dgf0DovIlUEEj4uwNpL3AD7HhyPHNg5GqLnxEXVSNkuw66CgjO+5H
	 EgwDen6DuDT7A==
Date: Thu, 3 Sep 2026 10:24:49 +0200
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
	Julien Massot <julien.massot@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Message-ID: <20260903-normal-electronic-bonobo-3f71eb@quoll>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
 <20260902193351.185771-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902193351.185771-2-l.scorcia@gmail.com>
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

On Wed, Sep 02, 2026 at 09:25:37PM +0200, Luca Leonardo Scorcia wrote:
> Describe the MT6392 PMIC and its RTC and regulator devices. This device
> is mostly based on MT6323 with some similarities to MT6397 and is usually
> found on boards using the MT8516/MT8167 SoC.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
> Previous version of this patch had the PMIC device declared with a
> fallback compatible to "mediatek,mt6323". Sashiko pointed out in [1]
> that it would have been wrong as the fallback device is not really
> compatible with the new PMIC.
> 
> Since the change is significant I have not included the Reviewed-by tag
> that Krzysztof Kozlowski kindly provided in v9 of this patch, I hope
> this is the right thing. I really want to get the bindings right as they
> are harder to fix in later commits if the need arises.
> 
> [1] https://sashiko.dev/#/message/20260820125850.3B34D1F000E9%40smtp.kernel.org
> 
>  .../bindings/mfd/mediatek,mt6397.yaml         | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



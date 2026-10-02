Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D512CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efL1+n1dK7AWhH37EQ0nV3a1HbjScxl8OApVSmAnV5Y=; b=uDuS8xe1uNXGokwKHmBblKB/T2
	/MbII8X/cnQvWvNxWPNqUOzsfoV8coEY3xRr7R9sGX89B3RFXbQe+qRBN57aFjXblWZiVcZHJ1UoO
	TW9goj1e4y9kBvXi5LywQr1AGVO4VDsSucWhi8UfuvQysepSYx9R7qptybHFSKHSlEuJ/cx8PsIdf
	Sq8MW4F8VCd7ivFxIZwhnsKkh6/fhQVJMUtJrgLy/yeJzK3AxVPF2EkI18MQJq2mUcOYgmp7oVLQS
	P+ps1974EpHVDCzgy5+7vxzF2mLm8o/3Qq8odJWbXQ3zcVP4wl8Mu9l0JQqYzAaqIg70+Pa449vUh
	oaZW5bqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZmX-0000000BBaM-11jD;
	Fri, 02 Oct 2026 09:42:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZmV-0000000BBa7-2X7M;
	Fri, 02 Oct 2026 09:42:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54693418ED;
	Fri,  2 Oct 2026 09:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFF31F000FF;
	Fri,  2 Oct 2026 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934139;
	bh=efL1+n1dK7AWhH37EQ0nV3a1HbjScxl8OApVSmAnV5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hplXPbVjlKdXr+GoZfnOiYnK7paer287vF1PjzJuXNqGHk2hI3obnO02CDrcdGcOC
	 HK0+DIDKOLVNjLw2DN1zOqahPNYa8UOA6GgCTLyHb1TMm4eWTLxK3l+IwiCCj0WcdG
	 K/KF7BRyR/753FfsARs8g+QsOR8V/w9pJM+XPkoAfPzroz/IbU9AXeCSuFvR4jx2JN
	 UFRk1Rg2GVY3Io83a7GKi6X9FcMh84ihpZ+p4SY2dyttmgeyTrweuukhb1VGbP8XJo
	 mfHL3EKRiVulKZNm4OrmxazNailvb1lPBZNNxFkgkHa0sA4jHlU7hZX9bquzVULvbp
	 C+rW/hCzUPCrQ==
Date: Fri, 2 Oct 2026 11:42:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
Message-ID: <20261002-curly-bold-octopus-ade53b@quoll>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-1-2476646118b5@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001-audin-v4-1-2476646118b5@baylibre.com>
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

On Thu, Oct 01, 2026 at 06:06:26PM +0200, Valerio Setti wrote:
> AUDIN provides I2S audio input support to the Meson GXBB and GXL SoCs.
> 
> The AUDIN block on GXL is identical to the GXBB one, so "amlogic,gxl-audin"
> uses "amlogic,gxbb-audin" as fallback; the SoC-specific compatible is
> added so that differences can be handled later if any are found.
> 
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  .../bindings/sound/amlogic,gxbb-audin.yaml         | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



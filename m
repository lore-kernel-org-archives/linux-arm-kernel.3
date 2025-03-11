Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507BCC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVWRhm1fbSLumeBvIluuHMHLgdkFbm2wHpuPWY9uk/8=; b=a9qkVgqtp0QS+b2k5XBzXkCB0Y
	xBW8YCblkragCEHI9MAzvVdUEUuKtej9dWpjb2KH4cwG4ciWUqiiMQ4vY12V3bOIZDepQjXUcBbo6
	UuKqLftggAm5+WwIB3IUu3iDwIH5dwYwcVhzuUCWy0Ei+Uq1rXftf4NJhybYcNSD7u0fM5VrTpRgZ
	dW7fWq5jFkynA+Sa0KhQmMBV5ZwtyDDjHtd266Dim8FLkSGaREqxKhg1F059Yl1QI35HRPbB6BjJ5
	T5MXb4m4uLq5vFBzkBkoU4htiqBAD5VnGdAkPQ5oKRqWIQoAPRDTaeeYOylb335uUCExxHF/2KIv+
	rzMQ6HbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5HM-00000006lzN-3X0O;
	Tue, 11 Mar 2025 19:28:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5FH-00000006lfx-1pwq;
	Tue, 11 Mar 2025 19:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D824A464C4;
	Tue, 11 Mar 2025 19:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD70DC4CEE9;
	Tue, 11 Mar 2025 19:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741721190;
	bh=LXvcff6ovrE+lWjEH283+ozibg6lrSmGszx8SWB2Els=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gd8ps7tULO8XXkXmP6AJtLdw+gDpnZW1O7goGVI+cGeI/JW4cOn6A6JcyERONifij
	 9gBP8rzLd+fParVkgKJ94dsTCp+tvIWhI86mTGjq9wbs2D2wGQRWf24o7MYCzBxyFc
	 De8dxrxBsCVzhjG+aTDtSvTtUM1XPOMFoqW4f2qLAF/wFPdSx5yavcD8t+7CsmKoVA
	 FsHsVOHQ/XeNAotS4vJEelArSnl8OPrPDvNE7k86Wd0Bq3C8V4oz67X1FUSvpSWGw8
	 0tMR5lTtsVic6R/dQLOAldO0FPK33H86W6OHkrmP8T5kazlUs5yShRi4fl4zWj/X+1
	 Wo0ie+Nrl/gAQ==
Date: Tue, 11 Mar 2025 14:26:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] ASoC: dt-bindings: meson: g12a-toacodec: add
 support for A1 SoC family
Message-ID: <174172118794.4169317.149338949275613581.robh@kernel.org>
References: <20250309181600.1322701-1-jan.dakinevich@salutedevices.com>
 <20250309181600.1322701-4-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309181600.1322701-4-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_122631_541073_EC700336 
X-CRM114-Status: GOOD (  10.69  )
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


On Sun, 09 Mar 2025 21:15:59 +0300, Jan Dakinevich wrote:
> Add support for "toacodec" audio component found A1 SoC family. On this
> SoC the component supports capture streams, additional DAI ids are added
> to configure this feature.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,g12a-toacodec.yaml     | 1 +
>  include/dt-bindings/sound/meson-g12a-toacodec.h              | 5 +++++
>  2 files changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



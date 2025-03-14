Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CE8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 00:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpWtuodVFaXP17CG+rrUrsfh1mNVa/1nuG/xxIbRCRM=; b=hVyLp7Oxj8Aa51m1S8BdlrRFje
	dAEOkbR2vJosV565aHPcxmq8KNSwqHWJ9mPTav0wG8Xv5KXB2gPqWl6PG7GrW279CZNvbXSdR2YO+
	7KNJ+iUI2DYr3G9fOu2qHShemfRCkTS7Y0TxEpkfdwaCt/hFa1f/qbwcl41SBPN91X1ctYYl+ynI+
	1ZDtRicBwUN35sq/pqIzX9nhh4eGuZPqLSRsGiJcYRuZNQFtUAUNyXsdk3I6ivehWjYfdCsrmh03e
	1aIRLdvIxrqztdCrXlQ9ojo+Ho4ULujYOqSNpHhRNpOE7yJ4C66s2NeDfXYozM150CGuGnpPQrIy/
	UyD/25Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFk5-0000000FcnT-3qpi;
	Sat, 15 Mar 2025 00:51:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEgg-0000000FX8z-0MGa;
	Fri, 14 Mar 2025 23:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 830AEA45982;
	Fri, 14 Mar 2025 23:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73A8C4CEE3;
	Fri, 14 Mar 2025 23:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741995813;
	bh=qQdDxdb0afkimp72/QzJMmAlfH9sg3FLL40dNEOcaSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3KIhIdFYxnlhnp3CKEjKYiHImna2sHEMJSURXS4lFJZSdDbeFAvVIeDqJC2QtImr
	 lS2bp6fnCA6J8ZwYZP9qXb/S2/K3ehFic6SCUrjOeMB02QjsdA+fMsEdR5EQ/6/eo1
	 imfmTUv83Ihu3WybfiVbFEmtFQZ7ixhP+0+lhI1bs0lyUaAQEU/wbbR36wAa/G7AIh
	 e8/jPR27tPADSOke2jocd0gYLCta/KFU0ppltjYYLUwabuHvlakDEabncqNcHMnKgj
	 MjGi48jWOU1sLM8gvjKyzRcWsnBXLmrqKbHe+dAtu60+SB6QyWgMgaa0zl2M2eDxwx
	 PpfEEU4P+HmGg==
Date: Fri, 14 Mar 2025 18:43:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb
 entries
Message-ID: <174199581084.2541058.17920956442449315665.robh@kernel.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
 <20250312104344.3084425-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312104344.3084425-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_164334_189749_156B0E7D 
X-CRM114-Status: GOOD (  10.80  )
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


On Wed, 12 Mar 2025 18:43:36 +0800, Chen-Yu Tsai wrote:
> There are only two different SKUs of Voltorb, and the only difference
> between them is whether a touchscreen is present or not. This can be
> detected by a simple I2C transfer to the address, instead of having
> separate compatible strings and device trees.
> 
> Drop the SKU-specific compatible strings and just keep the generic
> "google,voltorb" one.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



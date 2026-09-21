Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399D5C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNgzQJQScPoKdJ7NXfNKwN/QrHOdyClCEVMG1h6U6Ko=; b=bjH1bW3WG9vP0+cOnp4+bHV18v
	WA1hri2+UOmUPf5kw5FdjhlLR2NyqXyPRCOb8FBM0KuNJs3RBGBVclGhb2ShdVjCS+oLROIxGr3YF
	b1KcH3KKnx7IxQzg1Mqt05Eil8hzfmCuIkglnSEzeFaybEH1uO04Bq7c8XsrhWWSva1pqoKy9dNky
	PwILj6nx8nqskNcocmF/EdUlVXGfsIlHv8+TZZZFjGku9ZbD8mRCrBsOjJAUaTtI8NCGnjJefgKaE
	7NirMpt/AoQwc9IBglbb/RVi6bWWCaLlqYolXSBjSHaWBGgvTqP9dfjkI10BPM076fcVUFtvAgWF7
	rTHxn0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hPF-00000002vNY-432H;
	Mon, 21 Sep 2026 17:02:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hPE-00000002vMt-1TPV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 17:02:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB36F40564;
	Mon, 21 Sep 2026 17:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA991F000FF;
	Mon, 21 Sep 2026 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790010135;
	bh=BNgzQJQScPoKdJ7NXfNKwN/QrHOdyClCEVMG1h6U6Ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AsEMimN2DPXql9T67EgdRl4kCRW3sXR2+DctpxlAcE4IXBHGQcwkej99joBGss2/6
	 Vrtp/hhqjVrJsOtY20z+eHlTODUicsOXEOVFi9vNSwiumgxV957aT6upVchSmaa4mc
	 bAi4SdzNZpnZBzdzQFm6CjTSwczP6b3ksYaEK9LVloC6EtuohFFnVa8J1ELTWAEmHq
	 Mw/qMiWYiZkEtcoL53bvTSxPgezIUAgcHBsQJrMiTAiVXt6gJ91q4phhdtgl+YptUG
	 vEHfRovd2/ogSq67aXncjPpnrAgCb1cnfZdDN3Dr/99jfY32QVLk5kzFQ6ggaoUbxs
	 Lqjw+I+1DxnSg==
Date: Mon, 21 Sep 2026 12:02:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	Janne Grunau <j@jannau.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@kernel.org>
Subject: Re: [PATCH v2 5/7] dt-bindings: watchdog: apple,wdt: Add t8140
 compatible
Message-ID: <179001013341.898071.239546470879636582.robh@kernel.org>
References: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
 <20260911-apple-a18-pro-initial-devicetrees-v2-5-08d06cf011d4@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-apple-a18-pro-initial-devicetrees-v2-5-08d06cf011d4@cyberchaos.dev>
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


On Fri, 11 Sep 2026 18:58:42 +0200, Yureka Lilian wrote:
> The watchdog on the Apple t8140 (A18 Pro) SoC is compatible with the
> M1-M4 SoCs. Add "apple,t8140-wdt" as SoC specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



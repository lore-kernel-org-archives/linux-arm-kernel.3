Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31400C54FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDZx31Yzb+3KQ9sF3N/ebw8Imf3fgRe0XFGJM7tnvhM=; b=u11ieIgRM4cEnQ0VZfzQ1ISn4w
	uNX0QgRPhQ5fNjjycUkj/DKCaBuxni/gNEPdEvkB3RIPFajJLmZY+AMi1OS9IynchY16Xsms3g/vz
	rv0Dj23izBZUSpRvVVW8kyF0eBOyveRNqghtWw6f/PUt3sVQS6WyTJRM77hrsIsofV2knWfWnyypu
	11AJ6YLRxg6G0KJIyh33JelStm5YE7yZoRw3n6VGZV9uFsA4vpf3OmMLJxhBVxTudC0kCDKgMjtVo
	RRnWCo4wpNXOlouCSf0nd2i7WFv3a7Sjh92rsuxxT8wHcyfyx/aGdXPh8P+NbuVFL8mCwb1kkIIef
	K+HkVSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLIY-0000000DMwO-2jR9;
	Fri, 20 Feb 2026 07:51:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLIX-0000000DMwC-29AH;
	Fri, 20 Feb 2026 07:51:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78D3E6184C;
	Fri, 20 Feb 2026 07:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DCDC116C6;
	Fri, 20 Feb 2026 07:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771573896;
	bh=8BzeL6OtW1xxqVp2So7EwtUL67QY4V4CLXtCVdlFdxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVA3/mirqgpBxJmHFHRCJfTR3WchRt6JDx56pu/c0fhaRRaQHhLv1cs91yoCh7SLT
	 iQxgk+fihDthjWCJVWHPZcfXMBFdZk1SYRLxG3JgbonusxmJttgelxUbJvnqbrC3o7
	 fTNarmpKj6OfBwst6A4NcbFmoqDtz5jf7ZIj7Va4cGJrTzLKZLur5qtBMGGymEljxw
	 Jt4q3IuYFT8sCNgw2p+TGrjNoy3KCrkuNTyqTlRaAR5zJQJLXn1sAd31ScHU8Is8K+
	 qvRY9cc2Tb8iNCgmhi7XW7gnnEfrcM+ea4oCx8hnE/L/Ip96ICEQ0aBB5ovq1k/fZu
	 m8yah7z2u4khQ==
Date: Fri, 20 Feb 2026 08:51:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: regulator: mt6359: make regulator names
 unique
Message-ID: <20260220-bizarre-tricky-stingray-94db2b@quoll>
References: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
 <20260219-mtk-mt6359-fix-regulator-names-v1-2-ee0fcebfe1d9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260219-mtk-mt6359-fix-regulator-names-v1-2-ee0fcebfe1d9@baylibre.com>
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

On Thu, Feb 19, 2026 at 04:55:30PM -0600, David Lechner wrote:
> Update the example devicetree with unique regulator names for all
> regulators. This reflects the same change made to the actual .dtsi file.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

Subject: regulator

>  Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84711D46956
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cOtO/b7kpWMWTgqVX7lkPllp4tIW+6cWZySoxBvc7w=; b=yEMbMxBv8+CqH/bArAFk3EnlVv
	cmRoxynSIMsqMeiT66s9dqhoLBAtyZU6ayaK62y2bMxlbVdQNDQv4rFbqQDj7JMjFouihCCBhOBU5
	llYOezf2sqsGbcr5vd26WG2fmZfE3gwqzGEvvz8UVyVYRubt7K27D+KM9tYYGlDV9QnYP7XmKaGrK
	8Pv8n9t8z8Cx/86mjomInYYCIHwrcGOjCHHxT5kOf9Ps7n7o0UPAo7gw8eDyFkraHy9zU6wqnKLqu
	N7bRf8N3yYzFg5E8WEIP96fT55HLcBtO9uW0cdI6EKtxUdB+DltH5pjoiHHMipZ5T5pPm7Zxht957
	wHK5id2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibQc-00000005pSa-02EJ;
	Wed, 21 Jan 2026 16:51:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibQb-00000005pSH-0kp1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:51:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CFB660134;
	Wed, 21 Jan 2026 16:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEE3C116D0;
	Wed, 21 Jan 2026 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769014292;
	bh=OD2weKQVu5afNnnaJHsVFj6sjP31I+KsXAHkql5SBio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pxe5dpW0oV7Fx/KuG/gqoY+j0avJFpVC5BnGQS2ndGimBq9yonpL9y3R0BBJdjDmd
	 DqIUk375l2m8leReV4e0PWxAf6FnKbdJiKgqEPpcWrqt9TodnFFi4koktffWlY4d35
	 3OGz1/3lYObDwke9GTNIuh97Od70tes/vONMugxRMq+dkFbtAeXAGp8Akha4Cb1WSh
	 WKlhMECAHKPKVHn6ZrTLo6KZzofQzh9dL37iDoDbtslHAvqhZFan/Ktx5J3GCExbjY
	 XGzQ8R2HcMj5RIKvk5YLNK+1QhUG/nZzVjD7LgocOGhND1obOHGl41Fmn3XwShNRA5
	 5n8Xfg/FjNtlw==
Date: Wed, 21 Jan 2026 10:51:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>
Subject: Re: [PATCH 2/3] dt-bindings: display/lvds-codec: Document OnSemi
 FIN3385
Message-ID: <176901428941.3446132.15166576906093812833.robh@kernel.org>
References: <20260121085347.10368-1-marex@nabladev.com>
 <20260121085347.10368-2-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121085347.10368-2-marex@nabladev.com>
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


On Wed, 21 Jan 2026 09:53:20 +0100, Marek Vasut wrote:
> Add compatible string for OnSemi FIN3385, a FlatLink LVDS transmitter.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!



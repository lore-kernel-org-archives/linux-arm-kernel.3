Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D65BC61DC7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GtGc5XU481HY1RkNJwA+hKA7bsxUsuivKCYU3DiUQc=; b=t67mT9jGEaDTVz95IS5neB7VpP
	zNygu8viH9bkfUPIj6m+8ed3funudwHzBS+Hvn0R2ixl3ZuxbkP4Vz1eAaZ21x9Y7d2V7fJL4pGaa
	A+xgOfeKppJzoU8A9VEwxPnNhRSnAu9w48liN2r+T+BQRHgCdBgkArmxnQqRK9xwqaHPanYqRDFRG
	aZbiEbnT8/+r8a3GWbDkc9wVI0cnEafedWQllgCUsOhIuDCtiIR3BT84I64/6b9s/aEuSxuWxQD9g
	TBBOOPtVx5pB8q3KdaYI+pfkIJmQeyE8yGeFH3MsRUFdQvYM6XN3KvLVhA13H8Dv/TTnB69tWCBa3
	GKWrWxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZYp-00000003zhq-3bFY;
	Thu, 27 Aug 2026 12:50:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZYo-00000003zhW-0AOw;
	Thu, 27 Aug 2026 12:50:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 777704063A;
	Thu, 27 Aug 2026 12:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCAD1F00A3A;
	Thu, 27 Aug 2026 12:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835025;
	bh=4GtGc5XU481HY1RkNJwA+hKA7bsxUsuivKCYU3DiUQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZS7YSSTKr7N6ZZMqitF1pSbEXNHoZw2WXHKNPPrEJCKJ5mCC9Jqm3zbwCKoWQtFg+
	 nuUx/Hfn6rxAiGnRCw0f+H+jAVKd2ZiGZWUEuVOD98kTCKRYiNbowevZ6QTZb7xEpZ
	 Y3L/oman752U9vUR4N4BKjeTaoCWDUMh10lps9TPF6AVZe+73SVtUDF4/hhaFHgO4W
	 BM43qX+1RkMCblITdfljC3mj0e/xLtBfoVajYqbhD96br+oW9fJQzuDu2vx0MMITLW
	 nkpYabqS7iSLLgK65P4UOIJ1LSShwiS1ickF2fLCEDCelyqyQ72P2rfppKDRKysG3c
	 eroF9gSosb4aQ==
Date: Thu, 27 Aug 2026 14:50:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Marek Vasut <marex@nabladev.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 13/16] dt-bindings: arm: stm32mp2: allow child nodes
 since simple-mfd transition
Message-ID: <20260827-micro-junglefowl-of-contentment-8b0c6f@quoll>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-13-c5e27cbc0795@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-13-c5e27cbc0795@foss.st.com>
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

On Fri, Aug 21, 2026 at 06:23:24PM +0200, Fabrice Gasnier wrote:
> Adapt stm32-syscon on stm32mp2, since transition to simple-mfd, to support
> usb2phy child nodes, that has a unit address.
> This is a temporary update, as it depends on Marek's series [1]. This
> should be dropped in later series revision.
> It's a precursor to validate further DT addition on USB and Type-C.
> 
> [1] https://lore.kernel.org/linux-phy/20260816213849.1044073-8-marex@nabladev.com/

NAK

So you allow buggy code to get in just to send a followup immediately,
insteas of just commenting there.

ST MUST start reviewing other ST-related patches or ST contributions
should be ignored.

Best regards,
Krzysztof



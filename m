Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916F5C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFmSf2jbiL7dzInzF3ILU/H09H5oNuenhAieGaL8ySA=; b=t7rTs56rrZNb9cIQ7beNtlLfdQ
	KKd+MiGUPgoV+hgi7yL/kRHLui4oBkW1P8quRXJBfm+y53hBw0hs0YH5lllMvfWzk/BVH4ewX8xji
	asd9qW6eSNw7SKmRPePXWGvh/CtX1HWh/IJqYO3giNKd4jMmJAOIgViE1WLN9FIMKjZ71+wDB1O7w
	sdgkrl045OKR7wJ8NekfWHfOP4tquSWztbdzbQhdALbmX4LsbII83OJ6sG4+M4TZJyw0qgPgWZ9p/
	CFgqtSsi2l57kWqev7Uzd3N1xsDUqs8RkeoypqeBbakj5JmaBeCqAx6ec9Z+IabbI3wAIpr/Eh/hI
	c5ghdfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozqJ-00000007G6q-1quj;
	Wed, 29 Jul 2026 08:40:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozqI-00000007G6T-2Ajz;
	Wed, 29 Jul 2026 08:40:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F083860A5E;
	Wed, 29 Jul 2026 08:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0891F000E9;
	Wed, 29 Jul 2026 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785314445;
	bh=sFmSf2jbiL7dzInzF3ILU/H09H5oNuenhAieGaL8ySA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTuaRGdjiYEVFU9jpDiDeMRUMmdwAl48ya5YICmZKy+aA9mQzjGTovMLUttMdeO2+
	 qgY9CSQEcijE/g2tYA1DZq4FdV80WefkMb+zowIdkzOTPzYJebGQ6sx2x3TPL0yBHP
	 coG1bcMNx43P/6W9piL3cakc2aI7V8rk4/hke8+VWHBituQJI9OZHJWe13wY6i4uW7
	 hs+b43yd7LpynQjlrFS5zY3eFJhlZf0+cHob4slXM5en4T2th3ilAxBhDIPDujh5e2
	 3X6wFlIPHOH944zHym99hB4ftaW1S/XfuxhgSUvbqcVMkc6H3qx7g67vSpZvFVLvqw
	 MpntsLn6J6k9g==
Date: Wed, 29 Jul 2026 10:40:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alberto Robazza <robazza.alberto@proton.me>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: amlogic: document Orbbec Zora
 P1 board compatible
Message-ID: <20260729-watchful-snobbish-velociraptor-b6f5d4@quoll>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
 <20260728151636.236393-3-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728151636.236393-3-robazzalberto@gmail.com>
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

On Tue, Jul 28, 2026 at 05:16:35PM +0200, Alberto Robazza wrote:
> Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
> which is based on the Amlogic A311D (Meson G12B) SoC. The corresponding
> device tree is added in the follow-up patch.

Drop the sentence.

> 
> The "orbbec" vendor prefix used here is added in the first patch of this
> series

Drop the sentence.

Best regards,
Krzysztof



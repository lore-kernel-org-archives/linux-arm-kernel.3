Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C38CCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X15/L+qfe/XysoZnt/lEZo8YVQ6nEiYFeZS91NqwMvk=; b=a6YZ4jy47Vib279eqocLXn70/Q
	aC0mz5oTbkfn+S4swYZlKFodC/SMvnHi5GFA7eUuaqxnQZRVAro8bRIm+Ste5aQVV9nkK6oCd0TSt
	+a6e7LuiqHjHhS316L091UiMzYTEuLuZil/89YMyLu7qOJuahXwI3XYzswcKeqTpaDwHTEgyJxLWV
	aF7HJnMLu1AAMLlrRwX8fce+kUM9Ur0+kuO6boiLxObyVCpuz6x8bvzqoXRggwkbLB196bGkMThuD
	5MRdmBSZ6vQW2Ma1TNcxIUKEcU/EAt4rci8DN1qWDZIeDCsGj+3JraBNr7+4VSOgJ6JnsCthngGeM
	Qysb6KNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFH9-0000000EZtQ-3rC4;
	Tue, 02 Sep 2025 00:53:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utC7a-0000000Dz5l-34Ec
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 21:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2ACEA601DA;
	Mon,  1 Sep 2025 21:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB72C4CEF0;
	Mon,  1 Sep 2025 21:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756762285;
	bh=pYGx4Z5PyQy+FBk43EbI6DGF/1qa7cKPoVZH27D9KxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7+IhNQks9WAXZh5dRfApNnaOoV8N2Yw80HEtMQu/g4rLqCguPt8jS0WTUYBTj5/Y
	 KDeyInm5+0uybxPJZd+FrYZJt70C3XHEPUJEVMkZfU4zbbuuKlpKZLizqloRa8HFen
	 4BtqPhknnurexE1dUVYnsS6rlhXdEAghpZY/DaNbyFK6320VHLpK+fLzA3If/k3QRi
	 M5i2b/ZcLyJ/8X955S1jvqfjiiRqpJ8Q19++YxlKcCrT14384N7lHMdp0JvmagHAPA
	 UMvy8VF5Jz8uj7uwuBfBcHMtv+cE+/GRVIaTIFKzgr+m2TJSbUT6fzksm+3pGLfIuk
	 XNCaMiH81IKnQ==
Date: Mon, 1 Sep 2025 16:31:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/8] dt-bindings: clock: sun55i-a523-ccu: Add A523 MCU
 CCU clock controller
Message-ID: <175676228396.377947.13021468225327496814.robh@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
 <20250830170901.1996227-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830170901.1996227-3-wens@kernel.org>
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


On Sun, 31 Aug 2025 01:08:55 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> There are four clock controllers in the A523 SoC. The existing binding
> already covers two of them that are critical for basic operation. The
> remaining ones are the MCU clock controller and CPU PLL clock
> controller.
> 
> Add a description for the MCU CCU. This unit controls and provides
> clocks to the MCU (RISC-V) subsystem and peripherals meant to operate
> under low power conditions.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../clock/allwinner,sun55i-a523-ccu.yaml      | 35 +++++++++++-
>  .../dt-bindings/clock/sun55i-a523-mcu-ccu.h   | 54 +++++++++++++++++++
>  .../dt-bindings/reset/sun55i-a523-mcu-ccu.h   | 30 +++++++++++
>  3 files changed, 117 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/sun55i-a523-mcu-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun55i-a523-mcu-ccu.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



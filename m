Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062EBC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGI1Xkfu1FjZTJanC956zK5h4HLU7Fgz+30vcL4T6+g=; b=p3IORiHLr1HSnaPgE0rwauvtbE
	S5UC10JGDq/iLNjlgpnGHoqBjS/sk/jwb0txGpsjc4NdfwsvlNho5DP2JpGSm+XyEUQM1sG3Ia1TJ
	GoFtdSAR7d7XWHW6/KB5GszEksAocjaD6/1OKvTNVeGrrzgZTdN7PdcsF68K6kUsXFzQ5vsXk4QLi
	HfajZlOXy+ZIg+FFwHfeGhuSent+Rc5KuSCxx2vKRNDR8m0ip64ZKe6ypjRdUwYkqYRQlydVTX8cM
	b0+qEHUt5gIwrIJ6dvyjnENC1jsuYCz4FfKAxn58+wNeTgI5krylp7LRI7Q4n0DdVFeNN8q2deKeA
	8aqwm1Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkryc-0000000FIJl-1fcr;
	Wed, 19 Feb 2025 21:51:30 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrx7-0000000FHxU-1Yr6;
	Wed, 19 Feb 2025 21:49:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FA99611D4;
	Wed, 19 Feb 2025 21:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A79EC4CEE6;
	Wed, 19 Feb 2025 21:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740001796;
	bh=V1p1tT7UNLn3zJwu+41I707JUQAwN9RLXALKhZOBi0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSwWSClUsLcb50H6wcw8uNxRz4rkMZZ7OBldjZF6ML75IG6C4tywp6GErrMbtAl46
	 yzRrDVY0v2WqoYCpEpicEw6QkYa7Lu7gbSIX0Is6cqSJSAkfEGvdEc1g4So+PjNm+b
	 pTADXkCwNmoRm7Y1qGn2AxsxIKxD4V9pv9Y6uDZmTq6WulZMyKUrDj0VDjYo0zGwA4
	 P8KLsiBrGvobF2g4LZP8mjqO5JhzeQVm3RTid+v+xbTgjaM2+6ek2UCfJHpfK/i/55
	 zKPVWsQ7+8W9GeXj9Zr2I3xG2d7DNmASWyAkIFH9wenBhfe47IqR02i0uLT2sTmMSo
	 qrw2tmgYHvCAQ==
Date: Wed, 19 Feb 2025 15:49:55 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: mmc: mmc-slot: Make compatible
 property optional
Message-ID: <174000172538.3013190.16324788737757814573.robh@kernel.org>
References: <20250212-mmc-slot-v3-0-2bf288207040@microchip.com>
 <20250212-mmc-slot-v3-1-2bf288207040@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-mmc-slot-v3-1-2bf288207040@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_134957_471667_A98B0F83 
X-CRM114-Status: GOOD (  11.31  )
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


On Wed, 12 Feb 2025 14:52:10 +0530, Dharma Balasubiramani wrote:
> The compatible property is required for some vendor-specific device trees, such
> as Amlogic's meson-mx-sdio, but is unnecessary for others, like Microchip's
> DTS. To resolve unintended warnings for configurations that do not require it,
> remove compatible from the required properties in mmc-slot.yaml.

Please rewrap your commit message at the right length. checkpatch.pl 
will tell you this so I don't have to.

> 
> Since meson-mx-sdio still requires compatible, explicitly add it to its
> required list in amlogic,meson-mx-sdio.yaml.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml | 3 +++
>  Documentation/devicetree/bindings/mmc/mmc-slot.yaml              | 1 -
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



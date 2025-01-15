Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0EDC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 23:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDsUCcNE70y/yn8sOeA5bMJxrpQ7o8msQoyV1ERAOy4=; b=4OtrbZ+AEoqpTMaGbBYBwXxm0G
	Je6Cz4UyrXZDPaU7IHfK07bvsDqXS6+mKe8CaBQRqKUPcffIwF48IATFahRacey8O4l3ptK9seYRj
	adLSm21lBLkyMpMrJAMxr09mXSs0mPnDviOejvCASqC42bczxTtYn2X42Yb/lphSD5NWux8k9wnj/
	B5FBsKeJ4VtGWuc3SrZ9zZyM7Vo3zF5HoMepxEAxmOjtYy9y9rWvZ4Oxg0VKytZZd+hr8jvAV8h/e
	2zznjBu5L5W9CkirS75SWaRLLl7fpFKZLVVYIMxRdpZgslfMqAn0yYihxNfMXt5MtQD7AN/qVFpNl
	7CksyWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCm7-0000000DLm8-2sAS;
	Wed, 15 Jan 2025 23:26:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCis-0000000DL83-0dQ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 23:22:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 588C8A4264F;
	Wed, 15 Jan 2025 23:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EF8C4CED1;
	Wed, 15 Jan 2025 23:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736983373;
	bh=gDsUCcNE70y/yn8sOeA5bMJxrpQ7o8msQoyV1ERAOy4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lWVCD3Tjz7opmsSI2dw686R2teeoII75k3kdRqU4e/L7HZFOA4BwAQykQ2/zgDOKw
	 bDn+u1mxL7tzWoUId5R/G2kwHMvkQs+8RKc3pRLXusVHsKleK7kB2XFYKptrIFnq1R
	 tc5zEB8a/OMz7hVwD9L9rx7+Y7PM2axRG5YUEG3hBQn4M9KdGTxaiwVWB7x5IribCd
	 6E86tbcznS/VpwF/uM3VFClpDlOd3QwcGs8azEPHuruGkYMK+5AQaaTH3uMI0pF7yw
	 dv8QICbOvLdM+VYonvYtzxUvMKligqXsvyc6aVlwsTzoq6rXUbxPBqh2kFeIIEpY/S
	 9pvgMiLPER4RA==
Message-ID: <73ad1336d9fbfa020ba666eef340f784.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250114182021.670435-3-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com> <20250114182021.670435-3-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amarula@amarulasolutions.com, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 15:22:51 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_152254_254759_40A314FC 
X-CRM114-Status: UNSURE (   6.14  )
X-CRM114-Notice: Please train this message.
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

Quoting Dario Binacchi (2025-01-14 10:19:47)
> The addition of DT bindings for enabling and tuning spread spectrum
> clocking generation is available only for the main PLL of stm32f{4,7}
> platforms.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---

Applied to clk-next


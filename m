Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2833B606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dNdTVSl6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GnpgJrAq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4SnLNd5w0z2j+M0DUYOzSs1MGDbeGkfvlokW6ZHl9ak=; b=dNdTVSl6U/0Z5MHjGzBuOxw0wE
	UM6wz74n07SWdTk7QZflwxuxi6cafUItboqHYLyxBiu40VvUsrRxw++32qRsRCjuoHezhzYvlOH1a
	e6VNZx8KRLoNC6Tr1Jz9x3uZTA9FfdePRSEGB0XDsVNGlX0Iv9i5qlq4ax012FmudwMTALrpWgCdp
	kY857kAcoJurKgFf+wGmZ7s42txzNYpjDf8lgn5wef2uZWokZjkSquD1D1Kh2fihCeQzwC7frneW1
	O57X2RyuuGLzE80ZeJHln2mMFj2k4NKU4sbz/snS6LAoYsoXEyBV+jUCNeGPU/xLbSn+LEi8K+j7Y
	eq9OreYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpZd-0000000DtP3-1dpB;
	Thu, 22 Oct 2026 09:59:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpZb-0000000DtOx-41Qq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:59:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DA6A605ED;
	Thu, 22 Oct 2026 09:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF321F000C1;
	Thu, 22 Oct 2026 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792663139;
	bh=4SnLNd5w0z2j+M0DUYOzSs1MGDbeGkfvlokW6ZHl9ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GnpgJrAqse237anlo1ylTV1VGXMmeCDfb0l4eXb82966faybLMzbc57npZ24D/U20
	 cIJp55OZ+7DBHCwexWAlIUQPs+MmIFEYA7b6qpjo7pgAVLtZz7DDHAuAuYSpKeSwsi
	 9VBKuoH0a7LANeivMjNTnleLVkWm+YLafubsHwt2tgE0hnLYANrrmGSkf7PxQ9ejiU
	 JEX1L/saOROiz/YPVZn4tX8JCeSxEzkcLeu9M4ScH4uWZuPF0EN1qiobU3EyrLGpj7
	 H0lZFtICBrF2Ixa3sUfYXHYh8Ay75ZUbpZwtB54F9FY0DDiq5lhSGD9qI1o5+AAagl
	 5knMtM/qh006w==
Date: Thu, 22 Oct 2026 11:58:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: clock: stm32mp13: add SPI1 to SPI5 bus
 clocks
Message-ID: <20261022-scrupulous-toucan-of-judgment-00c8cf@quoll>
References: <20261020-ups_mp13_clk_spi-v1-0-6c00730945c7@foss.st.com>
 <20261020-ups_mp13_clk_spi-v1-2-6c00730945c7@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020-ups_mp13_clk_spi-v1-2-6c00730945c7@foss.st.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 10:31:08AM +0200, Gabriel Fernandez wrote:
> The STM32MP13 RCC binding only provides the kernel clocks of the SPI
> and I2S instances (SPIx_K). Their bus interface clocks are missing,
> whereas the I2S binding requires one as its "pclk" clock.
> 
> Add the IDs of the SPI1 to SPI5 bus clocks, as already done for the
> SPI instances of the STM32MP15.
> 
> Drop STM32MP1_LAST_CLK: it is not part of the binding ABI, it would have
> to change each time an ID is added, and the driver no longer uses it as
> it defines the number of clocks by itself.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  include/dt-bindings/clock/stm32mp13-clks.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F99B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MbiIWpIK;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4DMs8kV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yaa6k5Fi/S8yLcSO8oA5OP0KYAzuBkSJifuZS+OJQwg=; b=MbiIWpIKDneAPaEbsGZ4D4NcOj
	89u/MWaMtDZS5G2uCytgzgobw0VEx+wEtc9YTNux2vnHfGpL/ce28/Tmf0U75+goxUttCQb6QChZh
	UAB6f3P1RyNq+a+3jf5lOEJky8CUtJ41gMxfy7pPaJsf27SkZsFt2q1kC6MphkbPl9nBhjWiP0ONd
	YpfI3KlWGbOyMeLNWp6zedPSODLxUT77kCSH2mgrH6aK5wgjA0k/qn9KQd3LbpnnunGU5yPU7DdA7
	d8KnsSjyWOjN2Bz6YgsSkSY893x+ZSlozMVqrqEnxjC6fT5ch1rpE5YBnC21C63Gesd158Dcvreo9
	9nv0nA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbHr-0000000Cg09-1SmH;
	Wed, 21 Oct 2026 18:43:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbHp-0000000Cfzu-35Yd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 18:43:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFDBF60052;
	Wed, 21 Oct 2026 18:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39751F000C1;
	Wed, 21 Oct 2026 18:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792608220;
	bh=Yaa6k5Fi/S8yLcSO8oA5OP0KYAzuBkSJifuZS+OJQwg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Q4DMs8kVxPGEaN7Axg9dakbNTgBP2NukZGUkfwdkGiJd2vewncfX2IL/BP4IW9GQd
	 8HRndU+baQEdiRdKBKFYuHOehHyfenkrIscmvzQk86iUTA/NESFOO3lF2GZmxcHgJK
	 /iY1tW+Bd4g8AwVRtyB5iI9JaSNPAaEOPvVmO//Hbc65Bo2QNSSrULzY1Ba0wt+zkS
	 ItAmKgvV84ZNMX1S/lpls36R9WBNW7mkvuQq6hHTgZ6YvYEm1hVNaG9OMD6E9xlN8Y
	 V4+qzZhzn/zKRVX4zPRD/bt7qwmcT6IRDwFuL6Nrjbu5v5F1GbRmJTNTZ0a/vBm89z
	 kvR2Ya+aXNHZw==
Date: Wed, 21 Oct 2026 19:43:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>
Subject: Re: [PATCH v4] arm64: dts: aspeed: Add syscon phandle to AST2700
 ADC nodes
Message-ID: <20261021194334.587dbe77@jic23-hlaptop>
In-Reply-To: <20261021-ast27xx-adc-dts-syscon-v4-1-4fab164f10b4@aspeedtech.com>
References: <20261021-ast27xx-adc-dts-syscon-v4-1-4fab164f10b4@aspeedtech.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 10:09:39 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Point the ADC nodes at their own syscon1 so the driver can correctly
> locate the reference-voltage trimming data on AST2700, where syscon0
> and syscon1 share the same device-tree node name and would otherwise
> resolve to the wrong SCU.
> 
> Fixes: e77bb5dc5759 ("arm64: dts: aspeed: Add initial AST27xx SoC device tree")
> Assisted-by: LLM
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
> This was patch 3/3 of "iio: adc: aspeed: Fix SCU lookup for multi-SCU
> AST2700" (https://lore.kernel.org/r/20261005-ast27xx-adc-upstream-v3-0-ef25552d3a59@aspeedtech.com).
> Jonathan has applied patches 1 and 2 to the testing branch of iio.git;
> this resends patch 3 on its own, now with a Fixes tag, since the
> driver falls back to the old global syscon lookup whenever this
> property is absent, so patches 1 and 2 alone don't change AST2700's
> behaviour without it.

I've now moved these at Billy's request to the fixes-togreg branch
and tagged them for stable. That will go upstream sometime after
rc1 (rather than waiting for the next cycle as testing would have
done).

Thanks,

Jonathan

> ---
>  arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi b/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi
> index bc990f79e693..053673cc4b8e 100644
> --- a/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi
> +++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi
> @@ -246,6 +246,7 @@ adc0: adc@14c00000 {
>  		clocks = <&syscon1 SCU1_CLK_AHB>;
>  		resets = <&syscon1 SCU1_RESET_ADC>;
>  		interrupts-extended = <&intc1 80>;
> +		aspeed,trim-syscon = <&syscon1>;
>  		#io-channel-cells = <1>;
>  		status = "disabled";
>  	};
> @@ -256,6 +257,7 @@ adc1: adc@14c00100 {
>  		clocks = <&syscon1 SCU1_CLK_AHB>;
>  		resets = <&syscon1 SCU1_RESET_ADC>;
>  		interrupts-extended = <&intc1 80>;
> +		aspeed,trim-syscon = <&syscon1>;
>  		#io-channel-cells = <1>;
>  		status = "disabled";
>  	};
> 
> ---
> base-commit: 43ffda3c7f8456bbe641ae8249a077a361b97880
> change-id: 20261021-ast27xx-adc-dts-syscon-9cf5d733ed0e
> 
> Best regards,



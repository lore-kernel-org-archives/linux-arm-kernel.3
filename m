Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2AD606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ILjuQd0f;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=kxutoywe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ev4Pxa4GSZfTGiitPcTMLqPoai9j4iSbJvD57fBcqKs=; b=ILjuQd0fNpM33z
	/ReSuh8hPIk9c3Vp9TJK2TvzkYcqBIPboz9U1SUfqK+BRj7z8EvJXOhRIG7wD2T+g58cNJR4++290
	1l48gIM1aDZzyOpwVPE6jYJnBm2LCmazTDvGrBKVIBjKtESIWmoFkEOc/VnebeYSlQI8iC/ymQANI
	WZ6RHk7RYwf88Bbj5vZz4w1ybK7moSoFgvkEeuEv1xTZoKKBTDnLm5Rnn4bvlKVc/CdftzIjimxwY
	nyOl9OlbEgQLhTXOopyqEGDVN6rXMGlLyW9dkouV9Kfjsq0rdM7kx1+EyCRckIJa3YDIbh18OrUHO
	njmLrih2Zpb0DYV7NGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNd8v-0000000Euzm-1ikG;
	Sun, 01 Nov 2026 21:31:09 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNd8s-0000000EuzR-3tTG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 21:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=ev4Pxa4GSZfTGiitPcTMLqPoai9j4iSbJvD57fBcqKs=; t=1793568666; x=1794778266; 
	b=kxutoywe8p7JQmcBWRX9uGhND36Ez+yn8SMg+Tbd3fO7JhGuczagV175HkonU+AfBcxqgbOaX3g
	PIE1a7DTT+Ob+JgthPPJX0hr+UDxrCLp35czVVWkvEyo5tj1MK9twjLRBx0Wuy8Iz7UBbV7rbjSeK
	hmXe4XECNEue0uLt/A47hQs++gAfbmKCpORQ6FjbNzvG3RqgasH/20qt1t2QkCHXT86megjjNLjph
	TxuwCafBK90UlPVUUm20tv0HhbDmb5sUAzS4PWucQZfZzekBx+7P4vPi70rX+EMjKeRITCQucSgOz
	Z2aVE09BMDx4o+JNaa5DFwIp+lPcwIuKVfSQ==;
Date: Sun, 1 Nov 2026 22:29:42 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christopher
 Obbard <chris.obbard@oss.qualcomm.com>, Andrew Goodbody
 <andrew.goodbody@linaro.org>, Paul Walmsley <paul@pwsan.com>, Russell King
 <linux@armlinux.org.uk>, Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/9] ARM: dts: omap: dm816x: Correct speed for
 sysclk5
Message-ID: <20261101222942.1a78c6fb@kemnade.info>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-5-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
	<20261028-patch-ektor5-dm8168-dts-v2-5-4544429251e2@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_133106_989042_D5D71ACA 
X-CRM114-Status: GOOD (  20.55  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 17:06:06 +0100
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> From: Andrew Goodbody <andrew.goodbody@linaro.org>
> 
> The default code for setting up the clocks results in sysclk5 running at
> 1.6GHz whereas it is expected to run at half that ie 813MHz. Force the
> divider to be /2 to achieve the 813MHz speed.
> 
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> ---
>  arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
> index 76ebc6c3c3e5..cb990773b098 100644
> --- a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
> @@ -144,7 +144,7 @@ sysclk5_ck: sysclk5_ck@310 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
>  		clocks = <&sysclk4_ck>;
> -		ti,max-div = <1>;
> +		ti,dividers = <2>;

so this changes register value  0 is intepreted as divider 1
to divider 2. Sounds strange. It just changes the interpretation of the
register values, not the setting. Maybe checkout the register value from
user space with tools like devmem. The original interpretation was right.
So this change does not make any sense. I think sysclk5 still runs at
1.6Ghz, but it is displayed as 813Mhz.

I would expect some assigned-clocks / assigned-clock-rates pair somewhere
in this patch instead.

Regards,
Andreas


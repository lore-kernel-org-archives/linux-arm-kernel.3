Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC8EC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 09:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWS2HM3iT66S6iZKQryif4NS3GIsSrxKH5Pfjk6WkR0=; b=NV3r0JBGxXrtGElZSqYrcJWV6U
	HZ+pEoGJmcLi23IQ8YrtgGIUGQPv/24qocX5fx0/KhNhBgdzTwdtn+G0NRH2EXn8fmAMeHlv46QUw
	Dr11Bz5AePkGhdgPgjzIQd1ANEfnhVByzqP1WgFUamLsXI9Z2S2nM7t2FoR1femOoINixn1YDc9bh
	T2LPaIJAM7Kz5dOD3H4YLM6mSGXfYsnE9SujDbV2YUOW+dBMsfJoe9JEAbpJhVRrf1oPmqLkKnHft
	WMOWD45Hs7xqzFddz9rx8GIsZm3m6AGnaMX6L1UD0azPhP0tm5oyaaNOIuZDWoYhH32VqYDVJz/1A
	WJqBAttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNmh-0000000G8M3-1LkK;
	Sat, 15 Mar 2025 09:26:23 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNdr-0000000G6q7-0bSq;
	Sat, 15 Mar 2025 09:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mWS2HM3iT66S6iZKQryif4NS3GIsSrxKH5Pfjk6WkR0=; b=UTvDL7Wk0X/nkaOGoAgI5Eg3AG
	fWjdixU73vMSlXTE+FvzIDePaJRm5/12K0hgMfoCQC/R1CmPdR8QCqMGlhJ1MuP0hhm3hOj1XCR5J
	cu4aAIC7267vX1dCrtfEM4IKgnXS9JgbmBsJA86Nyc+B/kl9aZxJtV58KR2E8DgF/ASoOGaEnPM2a
	EOTrpkWpvMAPHAK9byZBnxusvbXJJmG2ryPNZmmU1KL0OYi+TLUFHPf+8cH2+Dfk0qY3qL7GOOkqr
	Lk7Ol8/BKU6ICLNoRhed3GG4VoRvfXFcNTAiVUS/8mrgcDRmQaYEo03NZ2qd2celX7zOsCVDK3zfO
	pEQcLlOQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttNdY-006o8i-0N;
	Sat, 15 Mar 2025 17:16:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 17:16:56 +0800
Date: Sat, 15 Mar 2025 17:16:56 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Olivia Mackall <olivia@selenic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: rng: rockchip,rk3588-rng: Drop
 unnecessary status from example
Message-ID: <Z9VFiLMFtzBMIAtQ@gondor.apana.org.au>
References: <20250307093309.44950-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307093309.44950-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_021715_179203_D356D3C1 
X-CRM114-Status: GOOD (  11.94  )
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

On Fri, Mar 07, 2025 at 10:33:09AM +0100, Krzysztof Kozlowski wrote:
> Device nodes are enabled by default, so no need for 'status = "okay"' in
> the DTS example.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Drop unnecessary full stop in subject prefix after ':'.
> 2. Add Rb tag.
> ---
>  Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml | 1 -
>  1 file changed, 1 deletion(-)

Patch applied.  Thanks.

Please disregard the previous reply incorrectly sent for v1.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


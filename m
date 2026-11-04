Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825C3606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 04:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yTPIcwmB;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=A1fBFSva
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CBeoOPO8dQa32q5FSGLVAtCrcM+vnK3M9abEc4Baae0=; b=yTPIcwmBf4Em4c
	91p0A3VmhUoaHyo4fABURH38P8wGbkOrxA9AW1xprTI9DD//S3P9qNG/50dodMK96eqiGdvcxOtcD
	9V8zGzIYxgIlHfd+IJxCPhaum6B+ueyBtNb7IzVIMC48ZWn0Gx9W3upM4D6HyRMd2wzwvm2YFAm/y
	/AoQehVPNnh8gP7J1NIBD+gcmWIYYmCMrVndk4Lh5X6Xu/FxJOv/xbYg6oLp4BpDaGMqtXaEfvXys
	s1sWprLDC0TtMZa806GKua6Kn0DdL97s874elGzGMJXzV2LFbiR+gADGBUPV77tSEvccNjdD9Csad
	M23zA770bPVXOla575Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpHQ-00000007n0c-26zD;
	Thu, 05 Nov 2026 04:40:52 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpHN-00000007mzC-2Nmj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 04:40:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AD9C10CB4D;
	Thu, 05 Nov 2026 05:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793853644;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=CBeoOPO8dQa32q5FSGLVAtCrcM+vnK3M9abEc4Baae0=;
	b=A1fBFSvaKLE0DyT+bxS1Ujpzu4d+5B4Pt4QckCyU1hiNxg0Jlp7tALCny2Hy9XMx1Atdr0
	AMZat10bqhdZlicSBgsTSXKcMGZTSVecu1xe7J2uPjIQ9oVFzuxPHJWRycEM7TyjHPJrhQ
	+Bsf2Xqv6bA5mEumyAriNrD6ptMOrg7DCpqY5nggDXyJH6lwZZHj8J0DlFHSctrhkhSgtR
	AKGznxomoYij6awZBUeXzl//bo/HJIYvZTtb6cTU0OmDJg1Alpv4h/h4r81DPCs+fzIZoh
	rhoVpOJxdYZ08MB3iGEI4Th/AplO0vttGwdTydwuS2Fg/1LOb/0UVLh8Oqlmcg==
Message-ID: <14f72896-3c52-45ad-9832-6f33cb4d8c00@nabladev.com>
Date: Wed, 4 Nov 2026 17:47:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] dt-bindings: watchdog: arm-smc-wdt: allow a list
 of SMC ids
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc: Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
 <20261104161553.30115-2-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261104161553.30115-2-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_204049_749708_C1D62222 
X-CRM114-Status: GOOD (  12.23  )
X-Spam-Score: -0.6 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 5:16 PM, Mateusz Nowicki wrote:
> The SMC function id of the watchdog service is not discoverable and
> differs between firmware versions for the same SoC. Let arm,smc-id hold
> a list of ids that the driver tries in order, so a SoC dtsi can name
> every id used by firmware for that SoC. A single id stays valid.
> 
> Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
> ---
>   .../devicetree/bindings/watchdog/arm-smc-wdt.yaml        | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
> index 8e9d0b7e8244..9844b23ef51c 100644
> --- a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
> @@ -18,9 +18,14 @@ properties:
>         - arm,smc-wdt
>   
>     arm,smc-id:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
maxItems: 2 ?


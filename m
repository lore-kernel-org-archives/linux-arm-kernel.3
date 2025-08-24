Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04579CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysizyDV1UE87HUIt7ZRiS1yeJatz3bjdvsDuraJC0sE=; b=d2lTwhPPF7XeJTfG5anoHzHeRv
	LQhJyer7cVGNenNe4XXF+X1ksMg32aSGWd+APH5FYw6ZlOP2GlYr2i8CW3BiUyNHnxzvx7kT3uaJJ
	j+WAae7+OQoEGPjZeg8EmmraRHE3MQrPcVe126+0/0vOGniNrC/orOFxSSzESg7Y62Vn3JIUtupO9
	HDjLEc1XZjlElxx6Ae8s1ghT6IgPt7Pt0YsqNJezB9SiD8okezA6FXNwXqvHcd9Bg+Slu+Ael7QNi
	vASqbZzMEfP/mh1GsVzwp6pWQIFglHLhlg3ovXKSubRbAqCdgdcr6vwB/CinTqVFHqSx03XtjBRND
	a9RxZHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDpp-00000006MdB-2XR2;
	Sun, 24 Aug 2025 16:44:49 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDnD-00000006MVL-3QhX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 16:42:08 +0000
DKIM-Signature: a=rsa-sha256; bh=ysizyDV1UE87HUIt7ZRiS1yeJatz3bjdvsDuraJC0sE=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1756053719; v=1; x=1756485719;
 b=FqGZ5J1b5tJ9wpjENynkSsp3flST81ymQP3gVZTq7KLZr1N3j5diukQb3EJ1AWNZ+Bd/fhOJ
 JONJKTOw6apCmTTTT0XAbCFzE1PwfFwDAsqmsaxaCxRGQShmlbc8YOt1ru4Sdn1i+xJk90FTmJB
 QvtC4s8Fn0HDHwjOkaINvRLUv8PT6Bap4jBdnxbTV24jFGJ8+mS9C3+rkolJ7Kjy7B7gEoDeHG6
 2xRQH5rcEB8GHMbQW295UhSpYMgOJtk178OlZvBbx9JfvTr2bKysn8soVW9IbUqDg/dQQc4iVAq
 UphxzeWON+RRwWb/UJNRtmBCwauQBJpjLHk3jVHUGe0oA==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 6acb09e9; Sun, 24 Aug 2025 18:41:59 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Karel Balej <balejk@matfyz.cz>
Cc: linux-mmc@vger.kernel.org, ulf.hansson@linaro.org,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Karel Balej <balejk@matfyz.cz>
Subject: Re: [PATCH mmc/next 3/3] arm64: dts: samsung,coreprimevelte: add SDIO
Date: Sun, 24 Aug 2025 18:41:58 +0200
Message-ID: <13858228.uLZWGnKmhe@radijator>
In-Reply-To: <20250824110039.28258-4-balejk@matfyz.cz>
References: <20250824110039.28258-1-balejk@matfyz.cz>
 <20250824110039.28258-4-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_094208_002292_3BD96755 
X-CRM114-Status: UNSURE (   6.41  )
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

On Sunday, 24 August 2025 12:53:45 Central European Summer Time Karel Balej 
wrote:
> @@ -368,3 +505,12 @@ &sdh0 {
>  	vmmc-supply = <&ldo14>;
>  	vqmmc-supply = <&ldo6>;
>  };
> +
> +&sdh1 {
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&sdh1_pins_0 &sdh1_pins_1 &sdh1_pins_2>;
> +	pinctrl-1 = <&sdh1_fast_pins_0 &sdh1_fast_pins_1 &sdh1_pins_2>;
> +	bus-width = <4>;
> +	broken-cd;
> +	non-removable;

non-removable overrides broken-cd, drop the latter.

Regards,
--
Duje




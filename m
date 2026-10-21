Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8B0606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 16:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UD20hMSY;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CBTAC58G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+0U5uc8o8aSpg/3Nq2d92vcnnoDIvQVEgNyLz/yOhM=; b=UD20hMSYPoEgYIVnMJtn7qi6/J
	otaCl7LcNI7qeFJHQBDkC+L29QF24YFfosQt9Aabfmz6hGUjmxL716b9XTl11mpOecMIvhtQy00m7
	cVjH8nF0QgTEP0y2CxECSzDZhk8vcrwaNlyijJhfQU5WVjrWAJYwke63Mr+Cp0wqoeJqyBpObODbf
	BdgGk3PesHpQ+TOPNzEUT7Dw3PCA6eh3nrojocOi9XhWlKhHvX7yHJlow5HzRIXfmVz99wSasK90p
	fkDEp64ZxlHq8wjYKIeDekTkbQbXpz7ppyz2pNpFa/tL5czj+N1Frjtit4WhOj0LGD4ADjsDb2DhR
	3cZ0jpbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYmp-0000000CKv3-49eb;
	Wed, 21 Oct 2026 16:03:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYmo-0000000CKuQ-0BWG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 16:03:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso12123025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 09:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792598607; x=1793203407; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o+0U5uc8o8aSpg/3Nq2d92vcnnoDIvQVEgNyLz/yOhM=;
        b=CBTAC58G9B1BmpcLvHx+TkflR6OcGSbSQ93yaithkDiP4FJqEXupq3b6gA64OGs9Mi
         TPM1/LuPtUO0zAcNlILmx9+n3NxbRsAedGuV6X2WfmXPABMkAc9mApT3fhtoDgrrfx7J
         SDooZkUUDhy4NamB+Ue5K5WaOjpZJ0rVzmapAR8CjXGganQM50J/rtDdjUpYmZjSLebg
         tCdSKzmO/pb/RK8OwaAorgGUHAJ9RUgt9MUGYD0L4XY42k83deQ3JUCkHOTfm+g7op4x
         up+GzrHKnZBFELDBWdwKk37EoB0c6ik4f5LywYD33w3j9aHEn1xWPPdR5PI3exT199Jo
         Y8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598607; x=1793203407;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+0U5uc8o8aSpg/3Nq2d92vcnnoDIvQVEgNyLz/yOhM=;
        b=Hz2r5l8JhxoVUJnQSeBKXzKvjxVYmrc7e9gGw6AFe7/kRJ9C2pVlNua9LXjKW0WWOI
         hJP0UH+t3+GsXaDA45dQV3dwmIrLxvWf1AWchHuulOZoJA9avO9ihmyi2dlO9IAKZKQE
         UHT/Y0VsACV3MvbwFiidRaIB8GyZ8pTjAOdbhKVp5Pgrcj556Jff0LhBSNuzWb2+gBRp
         ffUVGmrz4hDQxow+3Wy7XVNfbF7DsDlTWVkxvAM86twuWR7SNBjcwwEqE889gzHx6ABo
         6CE/zPrdqcPCVO7IrkPPwOyZp7fpiKXcy1M/qDWjcNtw0XOH0gZ9I3jY3pr7DlHwU0U5
         TjIA==
X-Forwarded-Encrypted: i=1; AKwUvByv5h3oKlU9lhXOdAjhtZ3XYwe0nSzxbMs5VkI/A9fYa0ubdJnoyHnRWfD82foV9iHPnyegakQWlddd3PKIOxfK@lists.infradead.org
X-Gm-Message-State: AFq9FYKi+aiEtLCxNidZWdQiQtZzlEtvjAffrERt9ORY1uFFxhJ9qDNo
	nESjdvAG9wmN9aM7BxFSPYrtOEOganUmqmmpvrr+uXFUaGCpY4YhlxRHST1BGM6MHQg=
X-Gm-Gg: AYBFou0SgVUUZ9cZmcu8EiPkgILJS0bd987lcuG1GkGQelv8mgzJ2PYqLihk9YGc/gQ
	rKZur/TsrV+2QVOFYDLL2JNL4sqzfo+I8HNTNVcV+8EsvpRO+d2JyxPLZYXaAi7x5SG4hmwSgqY
	IURdcmc86wV4plpPQfdA+PkGt2sIOPsIIt9Ney6rGlhct4uASlrxBt0sIPQ1ONLCWotgc4tFUB9
	KjYKplS97/BSnRzLfcoobb0qhC/+RJRbcGc195dkxgvx0MSUZjmUhuFLXOhdmfCqpH3obJRCIUL
	FTL1M1ArJV39LKe7lT+a7fdeqlGwYq6yMiJbEVBSrBfWbHt0Lz4GnQDULcc46pE3zhn5t+IqL+5
	dGcIYHJoWHpv6/oeQSXcJHs438FEEOzz09vJff0qC4GpcyKw41Q9W7ynfLUy2APzzupmu1oysBZ
	S4zGgi0XYnrLhICmE+2p8z4jPfG8J9BnwCNJq0LMAz2y3yrWdjEsqikoBqBfMa2/2rw0prd28uQ
	YOzj8eFkSL/6sPvp4hm1WUAGyq07oNUMaSvqs7+TevG4aBR44qI1weu+nDUcaZ0y2jooGjUAw0B
	tUNWSmE7sATU64HxsSebt02JyGHq8Eixisyxko3eNI9F3xA=
X-Received: by 2002:a05:600c:4fc8:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a1fdd2472emr58485645e9.11.1792598606167;
        Wed, 21 Oct 2026 09:03:26 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm53982045e9.5.2026.10.21.09.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:03:25 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 18:03:23 +0200
Message-Id: <DMAN65SWMXQ0.125AVDDDSIG7@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Paul Walmsley"
 <paul@pwsan.com>, "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Christopher Obbard"
 <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Linus Walleij" <linusw@kernel.org>, "Rouven
 Czerwinski" <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
 <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
 <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
 <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
 <DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
 <20261020215143.7dd0ad5d@kemnade.info>
In-Reply-To: <20261020215143.7dd0ad5d@kemnade.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_090330_117275_4FE534A8 
X-CRM114-Status: GOOD (  17.59  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andreas,

On Tue Oct 20, 2026 at 9:51 PM CEST, Andreas Kemnade wrote:
> [...]
>> Sorry, does dm814x.h not look as bindings? I'm a bit confused.
>
> probably also not the ideal placement in bindings.
>
>> FWIW, dm8148-evm.dts is not including the header, dm814x.dtsi is.
>> Following=20
>>=20
>> Basically PULL_ENA define in omap.h is wrong for DM8168 SoCs.=20
>>=20
>> For a better solution, you would prefer:
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in dm816x.h
>> - Replace defines in dm8168-evm.dts
>> - Add the header in dm8168-evm.dts
>>=20
>> or:
>>=20
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in omap.h
>> - Replace defines in dm8168-evm.dts
>>=20
> Hmm, there is dm8168-evm.dts which uses PULL_UP / PULL_ENA
> in nandflash-pins. Do they factor in this inversion? Do you have that boa=
rd
> by chance? We probably need to take the brush there anyways.

Andrew has one, AFAIK he already tested that, it should be fine.
We are checking the schematics anyway to be *extra* sure, but the board
boots and all the peripherals seem to work.

>
> If I had my head in some OMAP3/4/5 dts files with non-prefixed
> defines, I would probably not object against any PULL_ENA without
> DM816X_ in front of it if I am not very awake.
>
> So better do the undef and not use DM816X_ prefixes there.
> Maybe rename that file to dm816x-pinctrl.h. That is a bit
> inconsistent with the other omap files but at least that inconsistency
> can be catched by the compiler.
> Other arm32 platforms have things like e.g. nxp/imx/imx6sll-pinfunc.h

Ok, it is a nice idea, I'll refactor in dts/omap/ti, using the same
pattern as dm814x.h.

>
> Regards,
> Andreas

Thanks,
Ettore



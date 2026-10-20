Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE19606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fGo+28tH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bb1Gj1oK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=; b=fGo+28tHMkee+/Fpw3K1A5+Ulc
	mZeiVt1eWUi9+oYc4PRFn8TD1SJCE0HzsTF6jVmw1XoSeIB7F0r0/u0fDALcQWOk5AHeqfpPizaEV
	1KYltCtCPBl+MLhQ1Fy8zaNhCJKp4QvPssIoNVQ43XWoYTWdXp0rGnKPAXc2vSY3ijIiZQ8EaD35b
	WeN7MbqOEO431ThfHT+js5btZpY8FlxnTuw1Qa/69/DtM9lSglS286UEYQHv/k0VBh4/TlKLtj2A5
	NenocM3MU1BgLuDwycis8pMSIoBi11qBwWDMQIudJ8vyx+Wm4dzCr3LvDXCnykSwVZJvM1WOIO40D
	Y+/w+5+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIynC-00000008cvA-0cHi;
	Tue, 20 Oct 2026 01:37:30 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyn9-00000008cuZ-3zpD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 01:37:29 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-15943c9c005so2346010c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 18:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460247; x=1793065047; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
        b=Bb1Gj1oKKG6QUxEsGmvWQ2kYMbH+2WG81WS1/Jugl6v4bdOeW9IaOR3Dx0gtQLeJLB
         1eWUqZs1PaZKo/cDReKsSSta44E27GTYk0BTolDuMndF6TAz8jQidzIJ+bapdNZiSIp4
         rYkaoNczmrqMolzCY34pst0ZYsN9tuO2P907FU4+ol4VpbL+3RoOWpmsttJPY1d5eTCY
         zPmfutdgccDxtx8G7UBAzeP6ZetDPYjiWju7vGGka+XHKom3qGe2S2EKMfa0bI7bljni
         AwadT7SSYvsgq66Xt2TL4ZQMtWtL5+X06kTGE8kW1Uq9WNLXkq1XanC9lZ/tiOEEIg5h
         LgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460247; x=1793065047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
        b=HDFji3AfzwhGamT2Os6HQpOINj10YETRzeiAGOghkT44GHPdTltq8872L9O8qB5Vkw
         fJ5Nvxg94/8E9L8TWFYLPYC7KISjTg0/K3CrK41R0EIZAPGVWjj9ES73zSwh+YovX6PL
         MOqameX87ycCE2A+gmLeo6qKWTdr7fDAZp3ZN0BSR44qlBOMeyQ2a1givNp07bCeWsEC
         J18B4aseOVGYGPdGqXUyWHMUrsthoa/grSByLQbbm3EsM89vf7FqTA1EogwKy1kDjYYX
         FAFMyF2LVvZNwPSN7H7eZa/0RBv7R2IX+BsupbFtda4V6f7/r9EbpAA4jqZt/UtCPciy
         NmTA==
X-Forwarded-Encrypted: i=1; AKwUvByZb5ApddIQF5pJf0qHVOjgX8++TOg+EcpRRp/wXyhpJA2mEguuLmE2rVBIGmEtsLTVHdZSC5PkKWazmRfeaMr8@lists.infradead.org
X-Gm-Message-State: AFq9FYJsLKZfDr3pDd0fLm/uvj6QwqC100wDXSaXLaIzBDp2fCWIgdei
	n99U/cHkiJyNoN47Fs9aOycrQXbxfQSgM3+QJ1I9Iw2dsSUEWxUJExrm
X-Gm-Gg: AYBFou02o0xFSFpgL/mtwv6nqKUoApbpV/v+hSqbebr+ciDDcdMO86hIzNulFX/qtJN
	fdlNRYtoC0mCN7nB24xOf04Kw7539vFiqsoZ49dOW6tPWeDZWWFdyJg2R2r04PAjD4eHSWSer7c
	1wWj2NvT5rNt9MWEoE5JMlybEdjkj3ydDPPyZZRctE95De0V2+G5KN9m79q4eEsROmKx+gRYqR5
	damf/4xWML/54uRziLi0I50FYQSayC0aNLddodGZePrnAFwmit8D6/we9df2srJnRVDEUgxJ74N
	OcdhjrD665w4anO3fuLKy8YxDMCUms89UiV1+gWz3lTcs9Tj4fBFWhC6ytCOHA2j0bPDJwruKwJ
	cHFPHQK+25pdNTRh0FWwidQ773OqkSBrHotAcwdTMxpVEtK+HYA34c1iGpPSDchs1gjkZM6eXTa
	Ti6D8KZlwT66iyr4Gy7kDD/xklShjybOF5JS1f7sdNBTaaVqUWegVrKkiSob7dpkGtiUZWVnEcF
	+wrnEhP+UzF
X-Received: by 2002:a05:7022:120a:b0:171:a066:938e with SMTP id a92af1059eb24-18512c384b3mr12193156c88.21.1792460246891;
        Mon, 19 Oct 2026 18:37:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37626819c88.0.2026.10.19.18.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:37:26 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:37:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: watchdog: apple,wdt: Add t6041
 compatible
Message-ID: <1a720dcf-9f67-423d-b998-d0db73f82899@roeck-us.net>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-1-961edd8d661b@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-1-961edd8d661b@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_183727_994344_3FFE2FC9 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 14, 2026 at 08:56:08AM +0200, Yureka Lilian wrote:
> The watchdog on the Apple t604x (M4 Pro/Max) SoCs is compatible with the
> M1-M4 SoCs. Add "apple,t6041-wdt" as SoC specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter


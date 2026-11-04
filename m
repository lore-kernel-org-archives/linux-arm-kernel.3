Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2770606B2C0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mkUYO4oF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4dUj7qtlv87aoaokSVHZlryaRSMAw8BaqO13OeSv3d8=; b=mkUYO4oFW7cgezJwyOpqGSdBOc
	dVtwtCgedS2iKIqJb+JXPHTf+pl6cvswOtuxGgg8sW+kejjJCUAVxAjBotd3GvfizdBl+Yn0aYqrs
	QMEAnrUQRVjQsh0i/MeYtFkEOfyZOT28TB6KpKIFbN/S5Q305ZeipzjplMWQsURhYeQZ0ggHBzSEO
	bCm7uOnU/L9eMv0DV9djePU5o1JKr+c3YFBeMNb2DtLmv+uSOIdtyBozHzI4hrkGnpM4H6dH4iORI
	T4L0HzIGPJDiyLrdy7tXec6vRWrblwXXC8wRkW+w502s/1vLAozpoaqvo2vBXRwcS/zdilZBtfvu6
	OTwzxJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjHS-000000078aV-456J;
	Wed, 04 Nov 2026 22:16:30 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjHQ-000000078Zz-0Owu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 22:16:29 +0000
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so24315a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 14:16:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830587; x=1794435387;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4dUj7qtlv87aoaokSVHZlryaRSMAw8BaqO13OeSv3d8=;
        b=WbT92BbkswE/5XBkAVyTuJCaaZWrhAUe3Y3rtBDoRPXEVbOZaMRU34QowEzEAd3ISi
         yO6rQJxWUr7myB3KHU1/pj+MFYb+pOuRxc9BHGICTqgsEdPoUlarlw3RJBkHK4oE5HSj
         HIurWkbajNGT3TzoVWZehvVp3kkgm1WEnocrZQIQzTbZgvPEN85C2jn2X0bmqpAK1TYu
         oz4iJblH/SRqARd+v2nRsjW0+z4FsKuAEryDya8nHRKML3OZwXpCYaF1WCWDl6Lyr4oV
         YTtjRioe7cdYTLAnWo+AoFsGj6mcbJjZ6yEY43p2ZW4BBsuyWjdxSTRTZe0foWXTsot7
         cVNw==
X-Forwarded-Encrypted: i=1; AKwUvBwEpyUk9pr5ZHEsMHtYUL8XjXKQN+7+FXfiO5lYe9eb1/qYq8Pm4x5aBv6JSoJEBX7tC1OIpoX8eIfdT0GLySGH@lists.infradead.org
X-Gm-Message-State: APuU4Z9tqJPaOD2jGWVDrPSJjAsqFCSzA1VhQHy0g9ZDPcZGZdfLfdYQ
	GT3cnENd8N27TNdvAbkkeNtOqiiPHp5hzk853b7evmiLs9/FArn+Yud/ZZfi/D6b
X-Gm-Gg: AYBFou2nt0yC1aOcj44otz7oYhSv0EtnhDEYGYag6uNCCappcMyoaU9isR+7ryHN7tH
	ylLHAftfdKFE35Gb6+5gnYWx8JRKARd78Jehc+OWHRJO+SO1VGfGxNFlHxuJPxxcmL25eKQbMMT
	QltCqq93eReg7HdtoqncZRijtXP05fiHD8EIFgsBvm3nlwukQkA35EzqUaMmNN6VuTn1aLgnu7F
	6Z3+7aZ7yP4MATt/PMETi0pdVBygUNN3csNEudvI9X7Fo+Nn7o5i2HqoTgh80uLje90/aHnoBII
	AiTfEcdU/ygVHARdQbE5pMujKJE8wba+6gxXZV9pXXl9DaEUowYPyogmmCYGt1HiEWzuAS5+rGr
	S8EmWipsAKkYM6o25fbVbCp9KW2d5uBR39ZOJYMm94+9M7UIu7RpAvTZ4y4i4Edz4X4FgHPk2aE
	KO7U+OENMROxIdBkhZS6Ta/mHmDd58mEhFUaMCcMzWKLn9TI9s/CTi2976Yw/QGTg0Qm+F/Herm
	8z4342A7MxoO4M4GRxaQWmhRInkkZGLBULJEXzd/rtrc5JZCc1C4qLiG6k5QH6i/wIrMsOtVlAx
	1BempA3KSOPfXjElX89vRMM4KuBC5SEL3z4VmWag6yAS5zkXKwOiuM3LIezO5XmxvkLuwCBhN8+
	fsvdHancomt6HcFT4VqJTFxxImOYoDRNnf20WWj0dg9U=
X-Received: by 2002:a17:90b:3f48:b0:3ae:3d82:5d88 with SMTP id 98e67ed59e1d1-3b0af950e83mr500920a91.0.1793830587043;
        Wed, 04 Nov 2026 14:16:27 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cd6c0sm662504a91.13.2026.11.04.14.16.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:16:26 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36c9a93a1abso69408eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 14:16:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwbDkaT64MCbgsgwDU2EsST7g4YzUDiYIWIOuIFH8XFsN8uybNW1duNSXPQfj+bDbcVDdwmSeCanepVTBiKxANY@lists.infradead.org
X-Received: by 2002:a05:693c:80da:b0:368:2c6d:ddfe with SMTP id
 5a478bee46e88-36de5f6f030mr1017112eec.9.1793830585474; Wed, 04 Nov 2026
 14:16:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
In-Reply-To: <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 17:16:14 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
X-Gm-Features: AclHuK9-UnITn3qNlxFDVEt7-zpIej_-hzEuMRZnZQ7mZri5SrN5fWqpIt5XJGI
Message-ID: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_141628_161739_115FFBB4 
X-CRM114-Status: GOOD (  14.80  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Please add minimum, and multipleOf.
>
> I've not looked at the code yet, but default: 0 would also be good.

Will do: minimum 0, multipleOf 55 and default 0.

> These values are odd. The RGMII standard says 2ns is required. Where
> is the rest coming from.

They are the values the vendor bootloader programs, and I checked them
against the hardware. Sweeping each delay over its 256 steps at
1000 Mb/s, TX works from 0 to about 2.8 ns and RX from 0 to about
1.5 ns; 935 and 550 ps sit inside both windows, and a 2 ns RX delay in
the MAC fails.

The rest of the skew is not programmed anywhere: the switch's PCDU
register for this port reads back 0, and with the MAC's delays at 0 as
well the link still passes traffic. So it comes from the board routing
or the chips themselves, which I can't separate from software.

If you'd rather see this described another way in the DT, I'm happy to
change it for v2.

> Does this mean there is a switch on the other end? Maybe look at what
> the switch is doing for RGMII delays.

Yes, a MaxLinear GSW150 on its CPU port, with phy-mode "rgmii-id" and no
*-internal-delay-ps. As above, its delays read back as 0.


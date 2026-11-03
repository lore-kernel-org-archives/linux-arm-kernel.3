Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8766760A3803
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fWHOHcxT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lM5wLY70mAhEd66eVg7LK8p6PaCJhmOslbKIqWnTrnc=; b=fWHOHcxTiMQQe0bjvXNkMhSiJO
	kVdmrBpvE0YYXcdp+FYAbD/eMM+cTqa2Cs+PmUeI7jcedBOK1g8JA1nGzPeEw2MYVyNH+a6gNkjKr
	z4Vp0QIgG/wnFrMgOoO5CFr7puYrxBK4nVZMihW5Sj6tB6yVji5hIXc6pdrOYIZVlkZ71DKGr9yoY
	vJkquCItBNh0MLm7pNUMFVxj5eQJhRA6sxes0kfHc2pqDUY+eOJc1VbMmogUADu0lPiipWGfOo5gh
	NFrTISz0toddviRDTbzLmL2BZZbQi+rh6/X/wAsDFwtOm8IYJWlGjGlZMtvfAXHyeUpUo/erDYXZm
	y/WaTMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHWD-00000003A7D-37aB;
	Tue, 03 Nov 2026 16:37:54 +0000
Received: from mail-pj1-f51.google.com ([209.85.216.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHW8-000000039xS-23rr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:37:52 +0000
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso2643197a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723867; x=1794328667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lM5wLY70mAhEd66eVg7LK8p6PaCJhmOslbKIqWnTrnc=;
        b=O3ZSiCXRT4Xb99PFcHYpjEkGfROSWrs4+0UY6rOd2/9yNWLgLGvdAF3gIJIB7+Z8/F
         98qclY1+nJGO9k64SAtmoFvnLV/0HXLPIl+1JPuRc1CUT7Wk2Qi5i/iiX9U5HG8L3UUB
         pK6srQdI51mcRKonIECjoXj0QBPk+bpo026KqmT2ZtOtHk/wW2RFIa87QPYfe5QZ4/35
         KkJQJNOMI5qHNVrT07ndLH8J46LMQzyvXTawJxtEB4r76us257t6uGpt2CoVLc7GVvVp
         oGX7CFdc9FvO3lwQrqCVwqrXBuMsGolcaSoohzj9Zmjk0A5BB4PCX2NFjksy+MfPx6C8
         NLiw==
X-Forwarded-Encrypted: i=1; AKwUvBxzMovfSJeAz68AF7I8QiWKVE9LBwkwe0r+dxFgGU+sfFYW80B90aiD9kh5DYv1K2kfTBemWbS4EeWSssFkSte2@lists.infradead.org
X-Gm-Message-State: APuU4Z/H4BXy78e6u9cLdKm0Ifs4phUbLcptl8RDccjCjmWfopitl5ZB
	59ZRHALwPEvFVCzUbAbaU0aUILO4DlyzdpfsSaaqkCCASw/RAQuqSXAvVyzEDullfpr0pw==
X-Gm-Gg: AYBFou2AGo2U+firY1mzCuT8RbU0a7r+QDSAxZdtHZP1KAD9QiUSG5s1q0ARigWzU1O
	G9Z8x4vAUPH+ikmZg1Cc/qiZ1ljK0O2N+juiUTFvvETV2wDVsMSuC2OPcq1XvxwtX4iwv1NrB1g
	3ZxYq2pAfSU4FXo/laB6SYloPRpOvr7J75M9NqR6SIJVm/TgQRxf0hkSF4E1BaESdtWeW6dk9CY
	tFuF18e05H6jq+mQ17BD6l9MnUWfh2Hm16PWeRIjXgLZqiJY1mtQP0yeAAGDUNu64NcXYtPzoQG
	VgHlXnprfK4tM624QDfAZJ7SG8B3tyAiSOvsvbmPjzrBL46ENfQFfpixnD/QOlAyqpG3LxynabU
	2Np24IjjsneCw7g/W6z3Oz4+DocAUNk85Irb2OXCzogWATD5jg5EiyNx5BMzz3Q4oP8IwkIXbJR
	+BrnVuVolxwuEYxyirhb1pIgpAjjqajY1T0YbfN/XqfM5AqInS5r541MWj0LHqLKN+qMdrVfbEW
	J9L7323UcRXj04Su0DAz77jPC0nmtIdgfZFNMRxxTpkVWFtD3v+dJcHuOs5z9u91OdqyPdxbrzF
	SlCVGauC982Fq2db3DmbsTmnl+U8420etROJDq/NvGTNlfohYiIDlTmDP/B+aF5m0MM2B2WeaMj
	T48fynmNOFjec2LRQzxjVn+7/FnQhnOXnwn3lr4FTCjpdbltXaw9qGOk=
X-Received: by 2002:a17:90b:4a83:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3ae89747e27mr10654555a91.30.1793723867505;
        Tue, 03 Nov 2026 08:37:47 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm5247203a91.15.2026.11.03.08.37.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:37:47 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a1947498bso4712443eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:37:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwltGq6gcmeS7c968gQJBrH5x/Ie4gLX6F6YfDYa2RKgZ2oW5vXLozfHa+WsgaAZPDTPnkiwJSocQBqMvcCDojJ@lists.infradead.org
X-Received: by 2002:a05:690c:6b12:b0:8b1:2b64:6fbd with SMTP id
 00721157ae682-8b2b68290bbmr97956117b3.65.1793723494365; Tue, 03 Nov 2026
 08:31:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-5-tanure@linux.com>
 <ce7d357b-8990-49bb-94c5-5491496f3ba8@lunn.ch>
In-Reply-To: <ce7d357b-8990-49bb-94c5-5491496f3ba8@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:31:23 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+38UPjtAxz6EsxWDaWTZFz-jTQ67WKFSLGrxmOeMaOLNA@mail.gmail.com>
X-Gm-Features: AclHuK8EDS_pThzfN9kbbX2pgEiup5lgKQS3IQZ5CGTtBeqTGSuccPA6dHYQQPQ
Message-ID: <CAJX_Q+38UPjtAxz6EsxWDaWTZFz-jTQ67WKFSLGrxmOeMaOLNA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083749_235416_858D3A1D 
X-CRM114-Status: GOOD (  22.55  )
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 1:25=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/*
> > + * Delay handling of the SoCs up to the G12A. It reads phy-mode as the
> > + * list of delays this glue has to add, falls back to a 2ns TX delay a=
nd
> > + * takes the vendor delay properties, all of which ethernet-controller=
.yaml
> > + * rules out. The boards in the tree depend on it, so it stays, but a =
new
> > + * SoC must not use it.
> > + */
> >  static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
> >  {
> >       u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
> > +     struct device_node *np =3D dwmac->dev->of_node;
> > +     u32 tx_delay_ns, rx_delay_ps =3D 0;
> >       int ret;
>
> Does this code need to change?
>
> It would be better if you did not need to change the old code, so you
> don't need to worry about breaking other SoCs. Just don't call it for
> the T7, use you new function in its place.

OK. In v5 the old code is untouched: the parsing stays in probe and
meson8b_init_rgmii_delays() is as it was. The T7 gets a callback of
its own, and the only change to probe is calling the callback instead
of the function directly. The T7 keeps has_prg_eth1_rgmii_rx_delay,
so the existing probe code already validates its RX value.

>
>         Andrew


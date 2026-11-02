Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1978606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 01:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yQgIyCr6;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0/4lWtGA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Rcwix2uwEWKi7035aDG+amqfMVRyuFKx2q048RQMB3c=; b=yQgIyCr6rDIiOJaPCvVgWrRaEj
	7Pna1AXxdSJuklZXdfe1QQoqaSJ0vDp9IgUO32c9BTAw9tRKsVE2w1Ww1hTRD+Q47hlw9L1OhxOld
	p+ML8YzDqI3g1xU6SG2OQ+TmgzTOgYvFWfcbvvJ2mx2TaL/AGW8C1x+MeNFCLqYftJEkopNaT/slA
	3b6Pv2nsFZ67s8lZuD0IN2XjtP0Me72ewc574QdA/X025tty1PqKHIF0QUbTufxT9lHykDE5hn67E
	A+PG/K3VjSAgwk9PLdG+w0A2l6NwXg+MqSsrXhfR6z+UO7GGQvnTTFlJV/bhclXt7GHfy+YvBM+nS
	lwSeA6Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNgaG-0000000FLc3-0uzc;
	Mon, 02 Nov 2026 01:11:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNgaD-0000000FLbG-2IL3;
	Mon, 02 Nov 2026 01:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Rcwix2uwEWKi7035aDG+amqfMVRyuFKx2q048RQMB3c=; b=0/4lWtGAM1ZgkRyu9eUa46Ex7I
	1F3RO1pfEwk9FGgEG3y40hILMDHAzmjjFloJY/FIlLfa5XzqJra3K8P0QwJZdV24R1d1gClKRe2rC
	o5WTvX+FTtCngvvbgBKD41qu2nU75HEqU1efGHsXW7G+w0FWHS6gHqgWSzlcg+v8M46o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xNgZr-00DiR9-NI; Mon, 02 Nov 2026 02:11:11 +0100
Date: Mon, 2 Nov 2026 02:11:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
Message-ID: <f8da1842-bdc0-4bf7-8f15-46b57a9eedc9@lunn.ch>
References: <20261022200640.3101932-1-tanure@linux.com>
 <20261022200640.3101932-3-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022200640.3101932-3-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_171133_586656_66BBC991 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.yaml.
> +        # The RX delay line of this glue is fine tuning in 200ps steps,
> +        # added on top of what phy-mode describes. The TX side has no fine
> +        # tuning: its only step is a quarter of the clock period, the full
> +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> +        tx-internal-delay-ps: false
> +
> +        rx-internal-delay-ps:
> +          enum: [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000,
> +                 2200, 2400, 2600, 2800, 3000]

This is good, thanks.

> +
> +        amlogic,tx-delay-ns: false
> +        amlogic,rx-delay-ns: false

Maybe add a comment that these are deprecated in new SoCs favour of
the standard {rx|tx}-internal-delay-ps properties.

    Andrew



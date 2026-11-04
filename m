Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED04606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ruWrkiYX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EuVZ/U8iXB5qoqQB2mOa7sPSxLd+TMbAJUrNPXzT9Uo=; b=ruWrkiYXBbp1ZUsx0IXfTX4pHg
	6MA/qzuAJP58JsYKk08tErH3lUoGOCCauYnhEKQhG76Ele0XnUwupsCsfUT5JvTmAcWpz6r0+6kIM
	DR1Pv9hF6yu+U8HF1jtM6Ovntnp4ZqD+tAWevZvVtJHbFFIegmF+7sbJn1lBugeK1idLQgnXKGj6m
	QlrVTmL2V5g4n5FxulAOnIVQrkfEkq1Gv8pBDgE7ySKYiftKNKgql5yKYfVLtbUu17cZPoftDQ1I3
	wlgEUE7YYbB7ieO6azcejWz6npFFMiEaFNGEXwz+rx3IUxIZ8AIleV4VXIHGjRH1SXQqANF9EbSNw
	zukE8GVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjKy-000000078r9-0uJW;
	Wed, 04 Nov 2026 22:20:08 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjKu-000000078qj-0Ywd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 22:20:06 +0000
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso595620a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 14:20:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830803; x=1794435603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EuVZ/U8iXB5qoqQB2mOa7sPSxLd+TMbAJUrNPXzT9Uo=;
        b=N75zZSaeVxRE85erD+4Xr05N0VsUIvqQAO46esqu3j3f/iwO3dNftfQn/wkTc8O9Kp
         Vzk1zU/PitKxLq2GJVBQxhV1QLOafK+/LVIj1QnfNt5wPf4rFEVeBG3CFSzgCc6Y2lE8
         kp2okNVLTAMy9SHV6pgBJX2RmXfzyo0tDZmxb6Xsb1urraCWtnq9W/bEbuFc+GMCWZ9z
         bb6BVGJq6XbJe8kxTeywfDosT2Oue/hUTx3r1IF3BOTrSfu5smZFyHE2A1/i4xx5zCkx
         +jmqwbNmO41VuZzMPiHi/q7hZW31PNkn3dUSdK/OVqinlnp7a2K2MyrWagQXXPkhGpy0
         qOmA==
X-Forwarded-Encrypted: i=1; AKwUvBwxTQFJRTVAwnGjlw5bOLrTSM2S2UlIpCxkyShKGaVVHauBRjzCXd6W9MZm7A5tThTth5axG+aahqLKoELZvd3o@lists.infradead.org
X-Gm-Message-State: APuU4Z/q+1sTVQAOSFKbJv6xL6+zQX44bXD9mK5tjOdkVsLnNYBUQCX4
	sBcnYoD4B24aODOyYd6GJu1rlLHAkaXsusqTgVNkFDbvf1WFb2uxiMF1fEbc9A==
X-Gm-Gg: AYBFou1saOZPWEtljsOj2Pj8aawnttumPoXKOoXe257oP2l3dHKh+3kYXTaVYNNZaih
	35ZERdg3aZjCoeq7zUz26B9w8MAx6VIYNJAi9ByzlxuJ0EU5zTHi/pgbaa9RpiEOdECIibyd/rs
	MUfdzbBx/Jq2m63r6d0crXsr3RaVuETNUUg54X38CZ23s99SkZ+x/B1fTCfN7REC3UffoZBvKEs
	ogazPXj5J4sqG08mzYeAd/1npyJyT6DuuhvjRpqFvDdt5Ykl69kfgZfRsVn/SXT6bRG7RuO3ZjE
	HK1+bYfr4oFvJS8zatCWWGjSpB+89i1ynLIcraW1q1WKqrYWAkSipe88aQJn2XgQY99NYcs9R5z
	6z4shx3KB1KqV9yjoOIdb6Ohvw0GqwTR+iX1SI3+eU3t10PCTYqr8T3Axk38WcZslcLxfluWhnp
	73399I2O7SJCTJ3CZtSA2142CL+5uoqF92wrYBWyBASn54LhInMjUoSXHJMuRYl3Eak9bwTLymL
	wsFc+8hpsm3F+uX1tr0WJ5GfOIxGf2H/z+PWDhhm8VnXBgqlnxNHQ7402d4DJZy5zLJFP0IvPU0
	AB0YG2UebFQFupeEXy1rlVbTxsrNu1TZYAccA8fMFO+B0KiKgb5kkhup+K+jPnXPY+Qb/aWjUtE
	1HOK3IVHqxiQ=
X-Received: by 2002:a17:90b:1a8f:b0:3ad:eb38:9778 with SMTP id 98e67ed59e1d1-3ae897994dcmr15617202a91.48.1793830803212;
        Wed, 04 Nov 2026 14:20:03 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312cc44sm811193a91.1.2026.11.04.14.20.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:20:03 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36dbde64409so678994eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 14:20:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwgOMWPFHPEvQHRO238vDASKJjIOGnF0YfcS5ZP/vEO2BmhNXxnpq/vcJvQqO6E5JRnR3VQmvsKFfx8aZCOj5tP@lists.infradead.org
X-Received: by 2002:a05:7300:e9d3:20b0:369:fe81:a575 with SMTP id
 5a478bee46e88-36a4243ab94mr30254394eec.35.1793830801788; Wed, 04 Nov 2026
 14:20:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev> <ba345fce-e88a-4aac-b9a4-59c500f80247@lunn.ch>
In-Reply-To: <ba345fce-e88a-4aac-b9a4-59c500f80247@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 17:19:50 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ73NCpxXWWD+HTVXctWCbOutbW+FHT83fGB+ar=Hu+vsQ@mail.gmail.com>
X-Gm-Features: AclHuK9bkkUrD9f9kOIMS4d2kgzS-vT8Hn9jZFXbBFoDFm8RqLepOJdYmZqvzqI
Message-ID: <CAPY4CJ73NCpxXWWD+HTVXctWCbOutbW+FHT83fGB+ar=Hu+vsQ@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: Add Siflower SF19A2890 glue
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
X-CRM114-CacheID: sfid-20261104_142005_868745_9B0742B7 
X-CRM114-Status: GOOD (  11.00  )
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

> What does SF19A2890_GMAC_RX_DELAY_EN do? By default rx is 0, so the
> delay is not enabled. Is that any different to actually enabling it
> with SF19A2890_GMAC_RX_DELAY set to 0?

RX_DELAY_EN switches the RX delay line in; with it clear the line is
bypassed. I checked on the board: with it clear, the link passes
traffic at every RX_DELAY value, including 40 and 80 steps, which fail
with it set; with it set, RX_DELAY applies as measured in the sweep.

With RX_DELAY at 0, enabled and bypassed both pass traffic, so any
difference between them is too small to show at 1000 Mb/s. v2 will
explain this in a comment.


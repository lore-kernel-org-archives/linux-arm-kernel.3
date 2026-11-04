Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40436606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lJsUW1X+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+jPqoNXEpA+7+FIrz6APb9I5eEcoubqwAjkLbTZnqws=; b=lJsUW1X+daZSrFolHGWc8lsYOY
	iLnTAN8oZDhq5w+LlEGjww3SQm+uRBDK9dBCEeSJfkBJXywUoFav6JgnlQftqq86qY8hyF71Yc/R5
	VMLAZ+l8/EJNxbd50YRTojv+j1+o6yNwACYT76sImVTC0JTlREQoxgh4S7diUm+siuvMo7+BTuGyT
	GuyfkEpjpsMtjH4xtqPqhZaEW5m8nz8eTySA9RCQerv9vOhilAmyvhdyqJL9PDc2Nhq2x3NylmdhN
	HYJ26aIRQM1xebHN9E99oIxjXPq3D8hcYfBNXByrBPJ0FD3zwk/peKkTFIDso+muz786NiWxkPsDM
	KEb6oytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWPf-00000004iGy-00zH;
	Wed, 04 Nov 2026 08:32:07 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWPd-00000004iFd-0bWB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:32:06 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ec3561b07dso280797e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781124; x=1794385924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+jPqoNXEpA+7+FIrz6APb9I5eEcoubqwAjkLbTZnqws=;
        b=HoYTVBZPSpM4W8a9HgnnF2xVmPqbKABPwfkZHhJ9EgzOE+pXbllWkyTGf8MqnrBlee
         a8llH010ylNY/ydBhaU8jWLy+yvTupp69SgGjr60drvlMmTiP/aN1SdEAtAD5Hrw/4Py
         fi6dud0nDaVRyJdC1PumL+TN2wGersmV19Q0KhXCqIJM0qt5tWrAu38RfzY72eshaa6g
         BGAEtSBbBqxf2Kn+nh41GFzwvHWHIhUklcb0mM5EgIuqqWtVnyH/xyPfcVxybZQ5kSuC
         64oZwuG9K1vg0Ll1vOVVI1juS2WD7a1DTVNFm1IjI+92t+wLHkPqryY0YzdqKhs53/ya
         2Q+w==
X-Forwarded-Encrypted: i=1; AKwUvByU3+m8VPkfXVln93cYnBo1FUX0n3pAyzy4KJNeTjWtju3Nu1frGpIsyf3LZAXta0T3wgbrsbpFw+7BKcJwzRIG@lists.infradead.org
X-Gm-Message-State: APuU4Z+lZAzKINwN/ubXr4TCTi6kzk0GPDTSpnKlrpWVXRCKimWN0GMH
	rn6Q6KFmfzRxifclDYgJhaUhpXvkBpb/Hev/FsNbpQRoUP3in/p5fF6+S3xXWzA9
X-Gm-Gg: AYBFou3lpz7TQh6Qud2pLwpg32TbFpYFsTm7kPD7ADmww4CxfGflGnAFf1H6fS/6ubA
	/j6hM1PzU7HQyTa9PeEm3Fl7HxOeUE+9/YEENczxaizlnZOqhPTrdzRpo2/w0pnNpXS+8OU9e/y
	qHqih+Co64qk/BVQRIOXeCQIjlB6WTje7AFgAP3h7jG8if6AuqPZ0dekueOK30MJBNEjasHdgax
	wl/5Bd1mLrxlIibyAxe1Zt0BRobw/1PxJOIJMDbL6hO475/LckdXejujdBLvcq37rnwzGvj4ThP
	48I5qdI8+K9lObzXzu91yFVJg07RJyVO2TpK8B/dc8dqiHm5d3BZXBf023oLtD4VznkHcjkHF5w
	Bl0x638hHUfck3kGSQtrQEMbHkpTt9Dvpw8ZdbB1pzf1Yf3uMVjHO2uKhgV7qf6pxdBr6Agpz4Q
	nsw9g3z8DTgzQPPbG8W8lEHJLRfxoO5qHjciaXxjnlutXi2M+xs4h1ijr3IdViqhqZ4ZKlwMAc7
	1jDthXj/W7yN7CVqhCdZffVmGV6zdrKfUBeej6+b6pVj+gB559EkZQrglZYwy/iHSoEZSqVoSsy
	doWlVxcUi+VJ8RKRYjbwG7+pAk6gNRN92KvfyL7jrHdaQIQugS49ZcOlOys33B8Knw==
X-Received: by 2002:a05:6122:21ab:b0:5ea:f169:946f with SMTP id 71dfb90a1353d-5ec68953498mr4855944e0c.8.1793781123746;
        Wed, 04 Nov 2026 00:32:03 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d774dcsm1145789e0c.5.2026.11.04.00.32.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:32:03 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7ce78f9d6baso260686137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:32:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw7iywNIkVBNhNoMcCqLz3ed15LNg1z7kFpz2rAXabalPf2AzqIyBmvCiZWzUshthFRmwZhgfdw9wl3cEjU9chF@lists.infradead.org
X-Received: by 2002:a05:6102:c09:b0:7b2:becd:1179 with SMTP id
 ada2fe7eead31-7d0543be60emr5897841137.44.1793781122974; Wed, 04 Nov 2026
 00:32:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de> <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 09:31:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSrMTXbXVuo9tQqMKnOLXe3=7oWyJRGkvRBZjBBm3nxg@mail.gmail.com>
X-Gm-Features: AclHuK-YthVrpSjlZVBQt5vi6FrwMySVDZUmcMVvViznIkVXiwSHbJqQx6qRLRM
Message-ID: <CAMuHMdWSrMTXbXVuo9tQqMKnOLXe3=7oWyJRGkvRBZjBBm3nxg@mail.gmail.com>
Subject: Re: [PATCH 6/8] reset: rzv2h-usb2phy: Use regmap_test_bits in rzv2h_usbphy_reset_status
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_003205_192744_4066FAC3 
X-CRM114-Status: GOOD (  15.72  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Philipp,

On Tue, 3 Nov 2026 at 15:52, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Simplify rzv2h_usbphy_reset_status() by using regmap_test_bits().
> No functional change.

Now propagates errors.

>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


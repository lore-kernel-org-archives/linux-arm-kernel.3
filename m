Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1350606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mvzIrgCk;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PSeWZXmy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DUCKXpFhOMZBT2HnErNgc1GGFPbfPUwN4bKfvKKAN5I=; b=mvzIrgCk7rJ4SN
	ldti4gX8xtvMlB+aVvLlZZWCpmHDeC60xwBMKhk/T7wHgp55yMCEOH7+OcUJL0UsfzL35itprEHqO
	JL8OvyRQu270EPaQCpA1MV5Wy+VTbhQ7TGKKFER3Xh+LCRS+5rbWmxvNvGyMKrYwfmGLNnYg0mSEq
	sQ7fKprwqRCpvi2INE/0CbuVw9mH9Uj6AxlgTX6SFJqbxLOLDrhmz7adHh+zWRqiKxNeEYTdyK54G
	IaNtDrdn/NkkrUz8Uqw0mWGnTsSzs3sKH5qyWn+m/9ZPYE4rMu453ckBtM6xre6KuLJhExBgw+Eu+
	CHwlu9JmdcRl9ejqgKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGD3-00000001xhU-10sV;
	Mon, 26 Oct 2026 08:37:37 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGD0-00000001xgf-0KgK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:37:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1499382f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793003852; x=1793608652; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUCKXpFhOMZBT2HnErNgc1GGFPbfPUwN4bKfvKKAN5I=;
        b=PSeWZXmydpsgP8ornx3+L6EPWqEvwO2KPNv9qYZCvubTNfriDfgC+XV0IJYmkBrSxZ
         ix9X8078kJYLu7lP4D+eHfW5QmS4F5tNj6qunUuG3yCdWG08qCMEiZ/5bDPuGTDI4E73
         +eiLUVSAgb3pZD2CgokCfMDUfYEHYWY9X+C06oJSiP79RaLcfelJxE986ThKC/PGflXS
         vuYAk/dnnKCQpdwp9IYLeKzYXanX3n38SDKopq2qSmOkG2vYHwispJ3KvECpzTkuueED
         rf8nGnEItHGVzLCg9L7BmihZkV4wNyfwaNldAC28U1oiyuydFRL8eBnGw8a8M0njJQJD
         c0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003852; x=1793608652;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUCKXpFhOMZBT2HnErNgc1GGFPbfPUwN4bKfvKKAN5I=;
        b=rgSORwt3tHBXlixb5I/PVZ4HE0+986NqfeOuCIxyLRcc1v1TCbr7WbrkNdKKWwdAeD
         hP9SR45c7YpufA0GjeaHwqAREYdufRw2GUHdXIOnvm4/ZERyjTNbjew5bW/AQUS45DIQ
         h7T1Pz9zaUnb01x0WjAn9oHRvCCaJRTSeQ0GGE3/HdOZY+OhUDu6PXdXovVczdOJse4n
         pR8FIB6kTZss289DU2R5iwyihrvhPhgL3VRuXImw7QXLjCWKLBP7GN+Ia+iXQVxVN4eW
         pj5k/V+73Al0BlJF0N6fqef1L9gBDi1AM3mCSrJmARGWY+i8VLT0Xd6czE5DW3KeZHNJ
         svTQ==
X-Forwarded-Encrypted: i=1; AKwUvByFhplMKAURN2ZjjAWGM3TD4xo7jl3ACK8U8kTtNtthYBVjuPhYKs2QzEb3LCfRrWXDn+Rl5ck94KGxVXvU5sJx@lists.infradead.org
X-Gm-Message-State: AFq9FYKF+KY7EBERrO2A9jtQJ3KusrZOyFKu/TTBN6ScRBuyVN5GcIvR
	k6CMhZ/QmWjvloBjku19bbA8bp742njBtbvmi7kLhvrx4tzNarCBLb3PGYInDiDpY9Y=
X-Gm-Gg: AYBFou16xSDJIm+GlApiHIZusk/Y33VnUfxYoQudr81b/9IrpJTC6e8FJtPTMagkUDA
	Amh64DhJDIWUkxFEdXNhh/V+Mg16212Nvz3az5CHFNitx/QJfYwWlKf722uYSyUBUoXkXYC+m0i
	kPrCzkREyogrJkDpwWXyXUshzOFY7+eyW3OL42QCfcjN8UByX5Em89YosyiRWbMpfkh6CkXNiOS
	zSknW8L0uhLz75bAkGGYS4DWYSFZEA8/w6ZY2n0g1xi/ISJWzwYYt4l0AOpkdfr4Nvjcz/OaGce
	j+WJ8g+9DQEDAlhKLhS6MRp7XD3Q6gxdzEvZKEoopORmw4ft67MZ6VkknIXI8A2rCyj121wxPL7
	9y/uGj8YoRSM26fS/e2mkM1njo3oAbDHnv+YZlXO3Yfjy0fgdE7OlHTwMT4YmN5CqWY1jGLEWZg
	kcsgsoXJIJnuNq4eJkE3n7RzuzFarO8hAzqVxAF8gg3JapOSyxFnsxWbQUpEZ5kZ8Kk9jDYS5nP
	MbYcycuqv2Z0DuI/2yTWfAB2KNkKRELjxcpWQx3UbD+ldZ/tCH9n/tgXISQvPqwWK27o4Z4GSA+
	KO8FI79FwpW9BBHsJewsKw==
X-Received: by 2002:a5d:64ed:0:b0:487:1575:ebe2 with SMTP id ffacd0b85a97d-48e3eb96fb0mr10894843f8f.44.1793003851960;
        Mon, 26 Oct 2026 01:37:31 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm73219f8f.13.2026.10.26.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:37:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 2/2] clk: meson: s4: propagate rate requests through the
 CEC 32k muxes
In-Reply-To: <20261025191852.208226-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025191852.208226-3-christian.koever-draxl@student.uibk.ac.at>
Date: Mon, 26 Oct 2026 09:37:30 +0100
Message-ID: <1jmrs0kgc5.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_013734_158189_BD45870B 
X-CRM114-Status: GOOD (  20.40  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On dim. 25 oct. 2026 at 20:18, christian.koever-draxl@student.uibk.ac.at wr=
ote:

> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The AO-CEC driver asks its core clock for 32768 Hz. On S4 that request
> stops at ceca_32k_sel / cecb_32k_sel: both are muxes without
> CLK_SET_RATE_PARENT, so it never reaches the dual divider that can
> produce the rate, and probe fails with
>
>   meson-ao-cec fe044000.cec: core clock set rate failed
>   meson-ao-cec fe044000.cec: CEC controller registration failed
>
> The equivalent G12A mux, ao_cec_sel, carries the flag, which is why CEC
> works there. Add it to both S4 selectors.
>
> The other parent of these muxes is the RTC clock, which must not be
> reprogrammed on behalf of CEC, so boards should pin the mux parent to
> the dual divider with assigned-clock-parents.

Again, the change is OK in itself but if you are going to assign the
mux parents through assigned rate why, why don't you assign the parent
rate too ?

You are doing half the job in DT, half in the driver, that is kind of
odd.

>
> Only the CECA path was tested; CECB is the same defect in the
> duplicated block.
>
> Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peri=
pheral clock controller")
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  drivers/clk/meson/s4-peripherals.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-pe=
ripherals.c
> index 329cd526749e..8e303db6154c 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -407,6 +407,7 @@ static struct clk_regmap s4_ceca_32k_sel =3D {
>  			&s4_rtc_clk.hw
>  		},
>  		.num_parents =3D 2,
> +		.flags =3D CLK_SET_RATE_PARENT,
>  	},
>  };
>=20=20
> @@ -514,6 +515,7 @@ static struct clk_regmap s4_cecb_32k_sel =3D {
>  			&s4_rtc_clk.hw
>  		},
>  		.num_parents =3D 2,
> +		.flags =3D CLK_SET_RATE_PARENT,
>  	},
>  };
>=20=20
> --=20
> 2.56.0
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

--=20
Jerome


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22109C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQrd7KhxR5QNidsw3HjCzgZby4/ydefULjPxoyJrlVs=; b=Cvtul3fVaY9wRhXNM76zK8NdPL
	keCK4zByhRMwaZgChwwgugXoATMmiuR8DeO/CLi8yfDF8uh1xRpS28MDpkCCCXs7ORR6XlN+N6u3U
	zzKYK7HvK8Ml8YWxQZWauwek48hpHEPLV/VME7m8Ye4TDAeHByOzwfyv5wQK9rJXKEptoji8ka7mH
	rUHZG14XP/45qTJSNnX1eOztYE5W4HYgy97GqEFM0DSiL1HhDq9lN25WIQ9SeC4w3knzD89dRZ2se
	ml7BT7vHqSsw+MJMxIGVGK+LBg/pEbdQE98OtgJ1Btw0H20Rybw5T6odmvHnYJ6CVbSbSc6lGraGh
	E2nUAYXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teziA-0000000G3pb-2gKU;
	Mon, 03 Feb 2025 16:54:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tezgn-0000000G3Wv-3fBx;
	Mon, 03 Feb 2025 16:52:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 626625C66C9;
	Mon,  3 Feb 2025 16:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7D3C4AF09;
	Mon,  3 Feb 2025 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738601569;
	bh=KYAHdnV48fxBXFY3qpA0uvflhDKLsBpZZvc4LapIXn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lg7Cc+SZYJGzgL61IJ6B/3fk5Z1JzGmovob0mUQDbB55wJCxxRDKVt1VwAJzKAvTh
	 fJQp6DYCxEWbt1JVf/1WeTireprdFMbPeT0G3HrsytLEUp36iUwa7DkOCDo787wydZ
	 IqMEmyQOfrFiYFAM2CU2fGMf0rOxu6PyMrelVQ0jiFdCUqujAlDUrwAsDTBowfMJb8
	 0m6MfHHIO3/C4lUCORsnJSI3+TCoEjA2AOqVoxp7leyWSByvsL1mBxGXOz1jhjacKg
	 f4N1WRqVmlT43TB8ldper+wGc/lGB4DcCrG2Z/7MapaDvN7J3XuMfsy47rR9cF7rp2
	 qc5CZf3Oyom7Q==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso6897552a12.2;
        Mon, 03 Feb 2025 08:52:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYeo4J9iXk4z+DeCRUtP4uKbZzkSkStCnHwws0BsJ/1YMX+BDvz+pju8OMPZEAxotmwlPoiEcZpfOz5oTx9A8=@lists.infradead.org, AJvYcCWkw4uoeu7+uOz9UNqPs66nU+M6yzLZ3zB1Fz+yt73YbhtTg4NiR/VN0WXzBPw8BMY3ENkY1C03HzsgBzqPUuyC@lists.infradead.org
X-Gm-Message-State: AOJu0YwECPtPQe2fOIAV2YkaXeFaU8tkZIVVg0oi1TI5Dlhtn6MANETS
	eYh0Suawqtuu53lGiPAxmMTw1Dief66X6BImDDE+QHN2rEIJMouQ6icqF3WgyGVygOysAR1tp5Y
	Dr+4E17hiq3PNH1hTx0oSGvA5ZA==
X-Google-Smtp-Source: AGHT+IEV2/Sd6DHIrU3ZrbIJ2gYXXde46QL1lRAjvii+LibXZWGhqkpzoCzlCNNSLJ03B11qDzWWSKexPZQSYJB0dD8=
X-Received: by 2002:a05:6402:4026:b0:5dc:7fbe:7303 with SMTP id
 4fb4d7f45d1cf-5dc7fcdb6afmr18086193a12.5.1738601567417; Mon, 03 Feb 2025
 08:52:47 -0800 (PST)
MIME-Version: 1.0
References: <20250201093126.7322-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250201093126.7322-1-biju.das.jz@bp.renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Feb 2025 10:52:35 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+dn5wyEKbvAT8M2V=nM-vV_eHiRtwO_0h6EiJ=8OkHSw@mail.gmail.com>
X-Gm-Features: AWEUYZk6vEuoN17Xf_joz3957pyiXnco-9SecodVg5pP8U1SPnSpTkxx0rjtOhE
Message-ID: <CAL_Jsq+dn5wyEKbvAT8M2V=nM-vV_eHiRtwO_0h6EiJ=8OkHSw@mail.gmail.com>
Subject: Re: [PATCH v2] of: base: Add of_get_available_child_by_name()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Saravana Kannan <saravanak@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_085249_993301_DD1DD16C 
X-CRM114-Status: GOOD (  12.34  )
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

On Sat, Feb 1, 2025 at 3:31=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> There are lot of drivers using of_get_child_by_name() followed by
> of_device_is_available() to find the available child node by name for a
> given parent. Provide a helper for these users to simplify the code.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Rob Herring <robh@kernel.org>

> ---
> v1->v2:
>  * Updated commit description.
>  * Updated kerneldoc comment block
>  * Avoided code duplication by using of_get_child_by_name().
>
> Note:
> grep showed the below files will be the users for this new API.
> I will be updating these drivers once this patch is in mainline.

No need to wait. Please convert all the net ones and send this patch with t=
hem.

>
> drivers/net/dsa/rzn1_a5psw.c
> drivers/net/can/rcar/rcar_canfd.c
>
> drivers/net/ethernet/mediatek/mtk_star_emac.c
> drivers/net/dsa/mt7530.c
> drivers/net/dsa/sja1105/sja1105_mdio.c
> drivers/net/dsa/qca/qca8k-8xxx.c
> drivers/net/wireless/mediatek/mt76/mac80211.c
> drivers/net/ethernet/ibm/emac/core.c
> drivers/net/ethernet/ti/am65-cpsw-nuss.c
> drivers/net/ethernet/actions/owl-emac.c
> drivers/net/ethernet/mediatek/mtk_eth_soc.c
> drivers/media/platform/samsung/exynos4-is/media-dev.h
> drivers/gpu/drm/tegra/rgb.c
> drivers/gpu/drm/msm/adreno/adreno_gpu.c
> drivers/clk/davinci/pll.c


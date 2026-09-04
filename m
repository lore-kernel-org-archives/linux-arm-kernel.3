Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A48C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gNCncRwcYB9lWmv5bcgCTAj/WG9KBrvFMQ3voJc5e4=; b=zNLpGyjDz4SIdcIS15aGi9hYsy
	jmRqiY9lE0txOpDTscJnm5cIUzns3UekaHcCiIunS2/Ucw7N/OfXzQ/jF1g6rjJD7JyZAEcpQJldQ
	uJGVHqJLWGvgJwa9nEYv6+9t30i/ebciE7uznm4ENgWXvFBJiFJxLbyXGPdj93Ix3tJOKjD31iMrL
	m342Jep3zsLFxl6X2KkQ5VMJ8dDXVncu1ToXFHkEflXqrfGGbZQNqSbni3bQnXC2HZaOE9LP8qiBN
	OLB9nyy+7XMJDNp605KEc3bOMG0i94tgYKIIXa4zwspBfMnfdcFLMw+rBBvZFIhVek2HVc7p8tvXn
	fQpKRibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VUg-00000002TIW-3XeA;
	Fri, 04 Sep 2026 15:06:18 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VUe-00000002THk-0F9g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:06:17 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1827984a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 08:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788534373; x=1789139173; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7gNCncRwcYB9lWmv5bcgCTAj/WG9KBrvFMQ3voJc5e4=;
        b=YzzyCHOTDmwwkNcXdl3w7XW8jbrOeqJB6kjLPz2sDrocUTRddk5Z0seUfotTxhxFzX
         3vXomLC6Bjc9oD5hAwMkWGUYpFxHVVVXneMkMB4AGt+iNQh1tU0JQZIfkN6lymJvxI16
         3OUScmBfgp2P9SmQlOT/8uAemgE53GZJt2SAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534373; x=1789139173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gNCncRwcYB9lWmv5bcgCTAj/WG9KBrvFMQ3voJc5e4=;
        b=g42vMdQzBdzAYRLwUIiIdkPNyHQmuHdNpV/I71r4pGHxMJUq9e+1AqhfQE33i7I6d2
         ymD4xXHCpDm+d9nCoOkjae9d8VXkd9jvjjoEcortkEZsIJwHU+xTFLfZXH7MtKuXc/Bq
         4dbPyKlW7k6dFhy53iDlKALZYP7zj1VCMcCwSyVD5Z+zm38DmcELio0M0bC7Y4uQvhul
         54l0np3B1T3+go+6soQ3EUZ9PXqLV8UB/Gj3aAjrW5jYNe2yBF6CG9vaorO7fzXF7nXx
         LTVs0SWRhGGH54jF/J9XeOEODso0UGv8WgNCRDJY/ta7UggTxM3uHTh/SH0L7+ncSM6O
         qZPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQTWhyMv4jzZadeHT4Yr6UEPEZ9Crr/LpxSOfWuUFNDfvgWawYmiVHySANGKljjoZS+MnapSroRKPqKTLobslO@lists.infradead.org
X-Gm-Message-State: AFuF++lenV3OITMXiT66dqJbMnO8UXjOtMNXHcbMmzjK8imdx++PFpL4
	GS6i6Am/kNxHT/B5wmVqMPECulzXXW2UmiM+RSboK9FkudoFWxzDeaTXALiuRLdjE3v7fDtScOq
	X/KI=
X-Gm-Gg: AYBFou0xQJ9MbGsndCAAU7JJBei74HdiHVrjEP6WERwz4kxqD/5jIkXTibJxdK3bodC
	zk6NAMDPUK+SCHJi6M9u2X/CEcp+DWVZlYCKdyymIpF/6VilPHCqrGRQjedcQwP5LTGrV6YxNAj
	PnISmZbtH0xeK9rkqWUOHJlzYhKha5mASQyN4ik2RuLVRqKW8NQQXTFhzIABPSXsp8IKqPzpn14
	yba6kfOQ9gI2YeS/Vg0vptxK8IR9D5fVW+MTB5WPJ4cnxdVVs42wNlsB/ScFjUCIYa/DutSSFPl
	Wruy6WcsnCGTebiC6fmuf6A8HtOUpalcGN6F24oN3rJ/A4WWbw3Z4gtKPVB4pu2biKTo3jEmOAF
	20E8AyGJ5J19Kq01Obtvz6nMMPFRy/k7uGtVvBJ4KlOn1H7cVi4JkpFmrQcv929j6YpsCkJNX4K
	iJAyL/1ylmWSDVI0RlpA5qlh/E2aLx6hkZjrQRpmN2UYh65FZPmwlU2x7qeBRMsA4tLnlnzwVvZ
	OVAnkc9otxNgGnT2NT9nno8TGY=
X-Received: by 2002:a05:6402:a0c4:b0:6a7:ee56:814f with SMTP id 4fb4d7f45d1cf-6a7ee568282mr1410654a12.29.1788534373256;
        Fri, 04 Sep 2026 08:06:13 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e9889sm1288594a12.22.2026.09.04.08.06.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:06:10 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482ea739de2so747650f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 08:06:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhlonN7oDgQgI5J0Dzv8MR4vs5K0T5QbK/YAKYfvCHp07d/sSORcsKLI4zuWF1kn41+Kz3ts57VbsWY8uZXKc3@lists.infradead.org
X-Received: by 2002:a05:6000:60e:b0:485:8c16:a355 with SMTP id
 ffacd0b85a97d-4858c16a6c2mr4328911f8f.45.1788534366728; Fri, 04 Sep 2026
 08:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260904035009.4114363-1-justin.yeh@mediatek.com>
In-Reply-To: <20260904035009.4114363-1-justin.yeh@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Sep 2026 08:05:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Us7FrQ2GYYSfm+freDNTWv8xd260kA2Z3B5jFzw5OBgw@mail.gmail.com>
X-Gm-Features: AcwNN1U5Q3Et8gbm1HfFEKvqA92RRKLIkp4skB9nrMClbBiYdjjt_11lut00YBI
Message-ID: <CAD=FV=Us7FrQ2GYYSfm+freDNTWv8xd260kA2Z3B5jFzw5OBgw@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: Skip SET_POWER on shutdown for panel followers
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_080616_153980_5A828B94 
X-CRM114-Status: GOOD (  15.77  )
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

Hi,

On Thu, Sep 3, 2026 at 8:50=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> When an i2c-hid device is a panel follower, drm_atomic_helper_shutdown()
> unprepares the panel before device_shutdown() gets around to the i2c
> client. The panel_unpreparing() callback already calls
> i2c_hid_core_suspend() with force_poweroff set, which sends
> SET_POWER(SLEEP) and then drops the device's regulators.
>
> So by the time i2c_hid_core_shutdown() runs, the controller is unpowered
> and can no longer complete a transfer. On MT8196 the SET_POWER(SLEEP)
> issued there burns the full i2c-mt65xx bus timeout before failing,
> adding two seconds to every reboot.

I don't think there is any guarantee here though, is there? In your
case the panel might have been powered off before
i2c_hid_core_shutdown(), but is there something that ensures that? I'm
not aware of it.

Would it be better to follow in the example of i2c_hid_core_remove()
and just remove ourselves as a panel follower? That would
automatically call the power-off functions if needed, right?

-Doug


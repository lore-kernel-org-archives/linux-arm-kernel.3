Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083BF606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 16:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H3dqPhKm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2ahcmLe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9aOJYyjhEG5QFHqOyuUpkNt3Bv7NGCpLH14WnNP73X8=; b=H3dqPhKmtgli06j56OA1aBRTR0
	XU/6v/GVS3S695PiaA6bdRPR6KPYW0PantMzsPpgtpA5s2vExL+NWnMwSy7FXQfE20R6uIvTPVpd1
	HAZ1BfKxyLsXGsnrPRP+sCKZqp16elXJJ0r0zT+UZR+s6yb3Xzbyx/PNi8JR2lvZzOUQ0XovZU21j
	8I6UFOHhkRBWW+m2E9OpW6lQyP3pUqZuyeDDKoJLaxPf7Z1WzkMXdhzMSHe/N1dv0LbFjFbrPXYEy
	EGh1cwDtR5GkP29pjeamt7kM7hNIyMnB485NN4Y/zloZ7bT+OpVkOPSZQhQddA5pY6kPZFLuXzFG0
	Ll7ovQLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNYfe-0000000EgBx-456U;
	Sun, 01 Nov 2026 16:44:38 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNYfc-0000000EgBK-0iEL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 16:44:37 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-35159e0092aso245700eec.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 08:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793551475; x=1794156275; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aOJYyjhEG5QFHqOyuUpkNt3Bv7NGCpLH14WnNP73X8=;
        b=V2ahcmLe7XM255ipvh+kQtBKhiYBw5ffMZo8JoAEDAQ4BxTfdbO/JIsXlJanJjlvEg
         lpHzUVVygBHgbRctdY0IvgzLFJbBoC+Dyx9N4WkeeF6p63kZBCco5C/vk/4SH1Ke8h66
         5XavFbm0SbEheo9y9EeuagIGi7mphK0vRQqPCYN5sR4edbfKCkWQyrf0rkJ7q/L3lFxN
         BYOTIqYVf4Q+byOnmRgc6cIMGf28iqRVA6KtbYqpUrI7jpqX9AxmT5I/a41tymiO4qxY
         BzSng1JHAXjZnnv00XLG2/CAm+jYXrdrceDrpUvxBhDzBGtBeNT1heR/2EPLXEI5eMsq
         Mnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551475; x=1794156275;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9aOJYyjhEG5QFHqOyuUpkNt3Bv7NGCpLH14WnNP73X8=;
        b=RH2eEEvFT7rwb5qvAyjZVYCJ2YhKnDb77rfT3gvuCYXw5m/fzSJWnM3/ROCYegOcXr
         l/c70E0Acnekys86wXtpqwbbE+3Aj8XpNULmGqX5V3M4Or/t4+1ENEWiwGpXOY2TXB0i
         3GoQ3O/S0SgL+wSIbyQqB6NmQPZJY4qXTTItGd783dNxdRaGKme0GKDklihIBQUczFpD
         UYOLxYyzHjcPBRj9V6hec9aqdK3MlXAAx/qzEt5IcWqKEHe4/FRBRDMC0ZuM4QnjQ1SG
         nwZl1TLwi2YongW5XddTVvEIG0TRgYGLDPBrBDuQp/X+gEfj53dztKJF7NTG+K6D2QPQ
         jIFg==
X-Forwarded-Encrypted: i=1; AKwUvBwJbT/I4p++5I1mi+nxvbJgDbr9HNhhah2zJVi0CAuvA3Po6MIZ/DOn2mpib3PERwCr/a+nZ7G4NAWgC971UxR6@lists.infradead.org
X-Gm-Message-State: APuU4Z9QwFblX1lkmq5T6V/VwDGgcYzOsB13OXobcgFhXljWHe/2MiWF
	7uGGICjgdP3BRm607TozLU+sIrfDPU2npwfXt0sX4MYObBupToTiSAd4
X-Gm-Gg: AYBFou1zzUC6gwRdZ/yfdAKbcu7hAVLvLbk18bhgg7zJwOSMhoKGyQoInvF99hncrRR
	7C68nKT6BuIIUzABIqLQBDhsPYDquB9OjKwaMwNvF4dfEBJpNRnsQhwsb3eDbXbojyi23GMycWE
	0bL4ihj3iSwQDL56eobViyIIPtKgYlc0Q03NyIYRjvAjqNpY48K8yPRkPUsP2bG2a/XHqZ/hHF0
	M7ocbZygsBEpwZrPWioeB6tNXUvN95YG+7NY146ngqEJbiUflHhTzhPg6YYEfIBoa8gv/YNXf9Q
	Y0DgD3S98UrpdSwXQ2fe88urAU6O1ui+V0qJ4+5RktXovQ5OAmCjz79plB5zHvgYV57PvyZrC7d
	lKb978BW5RRIHddrXDBHgW617WVRILKshNs4ePbHRwAD9ZuGfDiHawUV5qPk/KIsI43uPf5eLPc
	c/US6KOp2iPygW+gjbIPGUnyJq6EY05m7lI+kd9Jphx8HT/DyX3qeodDeSE4KL9CamJLC6h5aIP
	3MfGHP/jkMpXdLyv91ksEXU/jhGoNROHNzKPSAiwRojIPatZS65alkm/y3PPLFn6Uz6uZxPUpU/
	1z2I40c/iPMCgI9bkh1MskxM3PRKcB2w6JM/I6x6IwbDOSBl9Vo=
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id 5a478bee46e88-36a4235ceddmr15771035eec.2.1793551474787;
        Sun, 01 Nov 2026 08:44:34 -0800 (PST)
Received: from lima-buntos-dev.. ([218.239.109.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm35700172eec.1.2026.11.01.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:44:34 -0800 (PST)
From: =?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?GIBEOM=20LEE=20=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
Subject: [PATCH 0/2] regulator: mt6363: Fix the regmap value width and the VSRAM LDO registers
Date: Mon,  2 Nov 2026 01:44:02 +0900
Message-ID: <20261101164405.1743177-1-rtx4060@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_084436_203460_A0F5D481 
X-CRM114-Status: GOOD (  18.06  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These patches fix two problems in the MT6363 regulator driver that can be
seen from the code. They are on top of regulator for-next, where the driver
is the same as in master and v7.2.12.

Patch 1: the registers have 8 bits but the regmap has 16-bit values, so
every write also writes the next register. For example, disabling one of
VS2 and VBUCK1-7 also disables VS1, VS3 and VSRAM_{DIGRF,MDFE,MODEM}. The
MT6373 driver on the list has 16-bit values too, so its next version will
want the same change.

Patch 2: VSRAM_{CPUB,CPUM,CPUL,APU} use the enable and low power registers
of the BUCK1 group instead of their own, so disabling one of them disables
VS1.

Testing: none of this has run on hardware, because the bootloader of my
board (Lenovo TB375FC, MT6897) is still locked. Each patch builds with W=1.
The driver file also ran unchanged in user space, against a model of the
registers made from MediaTek's header and driver, before and after the
patches:

 - 16 of the 33 checks of the model fail before and pass after. The 9 that
   still fail are about the VEMC voltage callbacks and the overcurrent
   handling, for which I have fixes that I would like to test first.
 - ASan reports a stack buffer overflow in the BUCK_TOP key write before
   patch 1, and nothing after it.
 - The resolved table of the 35 rails differs from MediaTek's driver in 8
   entries before patch 2, and in none after it.

The model comes from MediaTek's sources, so it does not show how the chip
really behaves. A Tested-by from anyone with an MT8196 or MT6991 board would
be very welcome.

How this was made: Claude (claude-opus-5-5, an AI coding assistant) found
both problems while comparing the driver with MediaTek's driver in the
OnePlus MT6897 kernel, during a longer session of porting mainline Linux to
this tablet. It wrote the patches, their changelogs and this letter, and it
ran the checks above. I reviewed the result before signing off.

GIBEOM LEE (이기범) (2):
  regulator: mt6363: Use 8-bit regmap values
  regulator: mt6363: Fix the registers of the VSRAM CPU and APU LDOs

 drivers/regulator/mt6363-regulator.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF62CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeVg0bi2qnwtneVj2BkteKgMLEFX64W6RwZtPGHh8tg=; b=Zm7fPqmQk1Vb/pArIWwIdf8Ui/
	UgG1VCOCXjgADe45M5K9CFfrRm+LGWgzIhVhVT4wB6E6lMGwMH1rwOuFJr7CtsUjCtzjrj1wMx7Jf
	guj5PNjIHVqLJABALsCUtUPp5ld6qQwZW6SEam8tt78FzQ6lVnQFNi40ZeQKf1ZfLrPYuG9aIZ2Qd
	SZsDzrgtcw5S724v9TUPiUrL+RAjNfo0VvLZpBHK/GlIKY9ib2OMK+sHrJinRN+Xpbz4a3GlkmQgV
	Mwo4KPxi67nfvqCpRkmKt8+s+OMWAymHVck3reabB65mnk0PPE+3H64Q/zrJvBJfY7IjuAEni/VRZ
	7C0H+RBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJNj-0000000C4Rh-3eaP;
	Sat, 13 Jun 2026 08:06:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJNe-0000000C4R2-0yC0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 08:06:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4908b92904fso19102465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 01:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781337972; x=1781942772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeVg0bi2qnwtneVj2BkteKgMLEFX64W6RwZtPGHh8tg=;
        b=EF/UQsN5mvmJOCCmH9DlqewgxUerwgD0rgMwRHZz9cFXorWH8zkCP+sqS3CldlW8bA
         DpXYM/i/MELWJWB3yIU6j0++VhdO4PJfMMQsxwOHkEbTaRXc5mhR/5i+w5rZXfpkQalX
         uQSx2rZN12S+G+coeF1A0fvFRB64uydXzkBFqtej+FVCSMl+4OopG7t+emOG7IFyqet1
         g6QdWw9RebRSi+gDaz8Orm2W8bZ2ytEYjjjUB4wjYmAyrWmZQfJGGPzWL/dg4HG3j9OA
         yq67izB+myJfqzF+BuFxfHzvgUrfqXPlYvIpZWRL1q+UwTo/IVkOC3FBzG9eO3svKx/u
         Zh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781337972; x=1781942772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DeVg0bi2qnwtneVj2BkteKgMLEFX64W6RwZtPGHh8tg=;
        b=IMMUyGNcufMutSR3SAxRFoortHcDhX3xmLyqkAlG0BRuuSZyHSkgCn1cVoKopTzQvk
         mty9jwMQvOLbz67NBp9ICI7nZGdi+Ws8Ydet8PwffFOaUAFDP793zqiaaY/R55nKjk7O
         b6d79IAZt05Tv3g16LxT7+Des3sr56QQR3A9Lmi3bxLpgM/GXoNzrG373v7GDoQan/YY
         do6YI8aOX8SW//PLpscrNiSne48i3I7TUISAgFaZ1899M3pB+xq3hWbXB711dKEwR0m/
         AlESQog/mkcTjAIkCdF3+JsNld8sKVV3J4OxajvrIXJ2fsjBOmLgtJARPszZLcRahnde
         KxHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UP0KQomAeA0y1p/STPiEh6fp9cM0XYmLpQkfllImDwQO2vZ/Wah8nt0avsgdLY6clEQ41V88t69jAbw3pUj72@lists.infradead.org
X-Gm-Message-State: AOJu0YwaJ6wj1xno9al9M8OWVC0fHJROYgK1L7DE4ZuG4KwXD9VfLl2x
	iEpx74BAkvqWbVyUzGD3otM2JGox9W7/jlrfCAvVaTwk+pgaxDAk1tKt
X-Gm-Gg: Acq92OE7w86gSeaPFku7/yy/a6fuDXmShpHrOSgIn6RPkSgZJ3lLdKIuGEQLDxjwAHD
	HNddKitnPuzs/5LenT/ryrI89KnkaiYf1YlshRr0m9tVIH35+Cp0bGkjdgHClbyZrpBVu9YnnIy
	9NkyAU7on80gUB2Z+nZHyNPnmRj+fwSzrJm7enYQL5rdALKvrCgfKsTZPtXda9/qqRUzqjiSXtk
	eNi/lJy+1BQ3KUEdz3Ifb5+xGcJRqIGKBnEyeNbopW6BzkKfhjaTSCokjsMccncb3GA1ogInQ66
	5e9+qc5iGofsNLtqGStVpxeY0EhdbNLgX8rxKHj34+W9ATbk8ZSrUI8NywhMoTzXVsxrZUFdP0b
	Syml+F2KWQ+r4OPNS3qOC/HqyyVfedblyvqmTpn8IG81oLKdv2wdfZX8uuacYrnhI8oInSizkPa
	lyySyL4G9sgLbnpqZEzKAWcqMx/oocq7OCuEvS/TAGC/+E
X-Received: by 2002:a05:600c:a310:b0:490:b58b:a8cb with SMTP id 5b1f17b1804b1-490ec50b860mr58693755e9.26.1781337971635;
        Sat, 13 Jun 2026 01:06:11 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49220304180sm53456435e9.4.2026.06.13.01.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:06:11 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-iio@vger.kernel.org,
 =?UTF-8?B?Vm9qdMSbY2ggS3LDoXRrw70=?= <vo.kratky@seznam.cz>
Cc: =?UTF-8?B?Vm9qdMSbY2ggS3LDoXRrw70=?= <vo.kratky@seznam.cz>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Linus Walleij <linusw@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/11] iio: adc: change from %ld to %pe for PTR_ERR() printing
Date: Sat, 13 Jun 2026 10:06:09 +0200
Message-ID: <rfot56KMT1aR8vVOIe5xxg@gmail.com>
In-Reply-To: <20260604120201.116925-3-vo.kratky@seznam.cz>
References: <20260604120201.116925-1-vo.kratky@seznam.cz>
 <20260604120201.116925-3-vo.kratky@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_010614_275517_E5313172 
X-CRM114-Status: UNSURE (   6.65  )
X-CRM114-Notice: Please train this message.
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

Dne =C4=8Detrtek, 4. junij 2026 ob 13:59:22 Srednjeevropski poletni =C4=8Da=
s je Vojt=C4=9Bch Kr=C3=A1tk=C3=BD napisal(a):
> Replace numeric PTR_ERR() logging with the %pe format specifier
> so that error values are printed in a more readable form.
>=20
> This change was identified using a Coccinelle semantic patch.
>=20
> No functional change intended.
>=20
> Signed-off-by: Vojt=C4=9Bch Kr=C3=A1tk=C3=BD <vo.kratky@seznam.cz>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC4DC36001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4wEEUuOXU/4c78WOKPAs88Y7ud2TxrGsHh+sX8lWUM=; b=OG6q+9SXexwgYusXhLotVpFPAX
	Adkg1VD5aKzgy4Re6pKQYtc3AMOvIEwFEQ826bziAmD+siM9jNnfiEFCrLxAxkXn/7Yn10/ROO9Rn
	qACDi97+Ky8m6Izy7ahIBai8RO6O6HmS+CTOZ619wFci/7/yMoZT63065dvjzhNK+72s5JMX9mvoP
	J/BrGP/BSDTnirTAqzLfb5XWNQhFCD5NtSGGgTpCVHlk2DrjjKj7nzXHPiKSudg/KXxmTsCQ4RHIB
	AKV2YHqx+uAJunZD3s8g7GXxBCSoJYODCPuERIrj6Mu3xKwqUE7fSI5nOFG663ki2F3K2jhrTZAuV
	N2BjIknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1ua-0000000AI3r-3yoL;
	Wed, 19 Mar 2025 22:29:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1oO-0000000AHGG-1QWV;
	Wed, 19 Mar 2025 22:22:57 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-226185948ffso1356345ad.0;
        Wed, 19 Mar 2025 15:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1742422975; x=1743027775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4wEEUuOXU/4c78WOKPAs88Y7ud2TxrGsHh+sX8lWUM=;
        b=LP5yqdDnTGViLOY7oYFQCihQMtB7QItqiFeNmAiIl9AEZ0nFSxcNm31gTqz/Sj7NBT
         ZZRTsPcRh/k8+32s01DmhUoTs7M8B8qjRQzs7EICB8QDY/SCQ4rRFz2suUsk4kSTT+ze
         g86TXa6I6UuFJSBE37nTuLt1tiKmrWZMQkGdVxupnG5gtrVCC9hHIwo4aZP1G1V3ZU1F
         TmWj0DUGrVb/P8AAQRWr6noXN0vnC6tBU+tiqTBQOy+ua4AC20lzBrvgv+6rSqoWNmlC
         K3T9Qz69P0rVgh3nbe0f2EzpNTlO31+F1Ym/6kZkIEP74PPgbXu4v4q6wsnSwI05aNYn
         5IZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742422975; x=1743027775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4wEEUuOXU/4c78WOKPAs88Y7ud2TxrGsHh+sX8lWUM=;
        b=fOC847Y0Yc+i/Ni6dNddEkOSlRsmxh8TyRd6mbLfoKCeUSZ5gHcB6gi6LOqlfW9bOV
         reuSs9JzB/A+nAqYc5qJ9qUw+19cQqmfxUoSy+NJFMe8hB+hmjMNEDsomDQHcfL60TxG
         SdggKeNuJ3SjH7gJu7eilF9hxDQjlmsn+hCKaC9T6fNkV2FLkyYDUXeAHE883m5h5yqx
         7BX6k574xnTMVI6VTX2d0WKaGWnaTX3sOHrmkIdtU3Q/8WtHMYybWOVcPwYIXAE8MnBq
         ACHkyaalJOauaLTYe/UIN76F6w5IM/SFOiLZvXQoAbI0CCNleGLCoEI166bSjmMR1sg1
         B8tg==
X-Forwarded-Encrypted: i=1; AJvYcCXMiRUBuicVAD4vuSg1b9Ntsi7p09Vdw5HQWMHWZZgnex2ipxZAzSyO0Wg0YaDHgX5oJaCW9I+oyHGZlA6+Si02/A==@lists.infradead.org, AJvYcCXpPfbU2O4XdIpQ8JdCxLP9pepYf6rLIytl7EGPScQV9HxI60JKOMNQGRQRKYEdNMOXOdFVogQ8pOPPsYeR@lists.infradead.org
X-Gm-Message-State: AOJu0YwWKYQr+byFzV8slmT2tAFQ7EW7u14yF4wuqsBIz0uP6pbZYgwD
	dyFUd5pZDpKuT5kli7bqEwNZ8r35xSngoWF5XBx7PQis8suyESPmsz75xe+/w8S4kGpy+a/b71x
	eQtTkQtjwsCP949s2oZX10Eia2bf1f+iE
X-Gm-Gg: ASbGncu0QhH/BknfJWp3bty60O14+FHoz6nl3Ou9aLhg/uGfLFNxeX+EbzoDY0Y5MlL
	vlXtzPt71/gR+9aDZGwPk/KNmZNn1hHHM/Tw6l3M1E9lCWWwvbNhxzSDJdxaAGFPI0Aj9/4fGWp
	4cYce7guMkAnAbJ1IZi75E+fi9sUVULHi784bN2Tgxg5ZS60njAUP9o51tdGc=
X-Google-Smtp-Source: AGHT+IHnrwxeln/RnbLA2XRvBCju7XzJvLA6h2ZrJXAkHwZQxFkrUVqTHCcEQJIqR6TUDRWTL3skUv6t2g4Q+MafzCQ=
X-Received: by 2002:a17:902:ecc4:b0:224:249f:9723 with SMTP id
 d9443c01a7336-22649a67f83mr47754205ad.51.1742422975243; Wed, 19 Mar 2025
 15:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net> <20250314-ugoos-am3-v2-1-422104b0cec5@posteo.net>
In-Reply-To: <20250314-ugoos-am3-v2-1-422104b0cec5@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Mar 2025 23:22:44 +0100
X-Gm-Features: AQ5f1JoWIv58AbGKUJz6nPSYBcTrHvuaOG-LcZ2pVsz1-w1fQQqOt643bLXrSYM
Message-ID: <CAFBinCA8Sk8rKt7zZBEgCdRh4J_fktapo56RtVJOC4myCJ1qeQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: Add Ugoos AM3
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_152256_395220_525F93C0 
X-CRM114-Status: UNSURE (   7.68  )
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

On Fri, Mar 14, 2025 at 12:11=E2=80=AFAM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> The Ugoos AM3 is a small set-top box based on the Amlogic S912 SoC.
>
>   https://ugoos.com/ugoos-am3-16g
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


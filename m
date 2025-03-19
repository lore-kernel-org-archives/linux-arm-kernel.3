Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78B5C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNYERNhRSmEwITLfpZYCCLoI9bGljSTelP1WrYbn7WE=; b=l1/zEyhstd0XpDclzEc9UX3B7u
	EfmpcwSkb8yDm6RTvQGQOvGW+tTZU98V5qxQwn6pu/NarHUEovvGpENL70avRcf/6O8+MWMSmIod1
	4VuxscY+aFcxQratgeBqzPWpwmeq54cUPOt99WtyvN9X/TF1Nv8c+HKdKQvU3BmiP1Pzj0UWW8LXe
	N+rTs6qFEvkd2tRIH5/C76l89e5dAkAQm4EZZfNyScXCEUCt9/U0G19WNtW3IQ3Y4l5ZreUmWww/8
	j2jKxFzVynr2ffVPIhs39oVhCHtfaRkoIh5zMOBpBOA2nGnWVageNbmY5iRT3pTjPetuShNZtm7mt
	UHW/PNwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1xv-0000000AIVr-1TiQ;
	Wed, 19 Mar 2025 22:32:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1sd-0000000AHkY-2SKO;
	Wed, 19 Mar 2025 22:27:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-225a28a511eso1277385ad.1;
        Wed, 19 Mar 2025 15:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1742423239; x=1743028039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNYERNhRSmEwITLfpZYCCLoI9bGljSTelP1WrYbn7WE=;
        b=Cdm+CF0EV3KmNrukhKIhn7uR8+GZd+r6fi8wDhsdB3FAm6r+amdrx07Y4IO84NKUHL
         W0LrK1vA+66SKCz3UrAvV2eQG4p6rfV+vz7PCwcSftVa4SP78l3PnUHlAJvtafB6DnY2
         jkZMLLPtNnHO9rizW+u4j889tEkUg+Lo+gdTAGCHtqNyxdLOhYxXZ02zaiVS1TK37Eq7
         sWPBmbNaj1+91RSh1ot1AQ4g8pCsaiY5SG2k5HTnc4Xixi94F3zIFaUrNkiHEvERr31v
         U8SbPaQ7JV92YmWV/wMT768hmQNo7ptCFiQ4b8XG6Kq76/BAS+yrgNCsekTU13rBXTdj
         bJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742423239; x=1743028039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNYERNhRSmEwITLfpZYCCLoI9bGljSTelP1WrYbn7WE=;
        b=FRQIsawZGlMsJkrCGsDDwD4cAEwLQYT1w8vc/qhSPl9R76xkkXMHkvwFA6mngjvqEt
         c5J1o/00KGwkY3y+5YokNE6d91JnxV/wwpB3XLplCssNIYrhKFh8nVyDn873UKcgdILP
         MFoEYOVksFyMj2qrqFJa4rQH6V8f/Q5yDwOdXaxpLw6K/r45/53oHASZpq5/ZNBJbND6
         fZ3zU4Js2lUOapL+R0jAtoUM00ANJfhaSmUp1RKRjPTOikIIlU5wrJPGYOHX2/4EzwHS
         UEvjNEmBlkcmCFw6Hq6PxSQy2jZO5WtaUJC/ueFMh6cx8MVfc6IS3SkEZM0kyYNICsdV
         UDpA==
X-Forwarded-Encrypted: i=1; AJvYcCUBCpQFU/RgHgKwiguyJPR/mXkV0YcFV2yMKSNxWJcYmSlt5ehjbKsXm9i+7NnJL/yYm4rQ5XsHDEwaFwme@lists.infradead.org, AJvYcCUMfM5Uql7SjWqxPf0uL7jTPJbIyB+oR0yH5pAANcPVEOKOT91YD59BIjS/T9gsC/NI5vwT+GII/y9xDI4qlxry6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxihl34ZRchLqhJTZ79v+X7GO4EgkYTArB6gAdHwcqA6jEGYuwo
	l4uo6fnkjT/I30OzEfjxleHO7VoX1Ta13BAJlYAiUw/nHPVH1d6EBJFFTHloRSXymGWj/6g6Iaq
	c0wTZbtt7fXeKX/y+RLPeoO8KPR0=
X-Gm-Gg: ASbGncv+JtHCHQwupacIIAG6HCu+KKL57N7xUC2XOAhaw1aUoNbmP7iTRttYwo9ydKj
	kE+0Q+zU6IRHXG+yPziD+Ol0N0RkYGCWLzQiJnUFNv798HPstJjDjbfJJAmrKrZA+YKkwhIEZlD
	v1eFmvmmMmodPc2ENl4w5t4OkxEf14ygMncYSJslv26TRngnqnvwL8sq610/E=
X-Google-Smtp-Source: AGHT+IFAWS2OHB1m+Vc2vxoZrF2uLP/QolfYKiuDmkj1RM7T3/ht3qZtnjLSYd3ujmhvShSgAjncLaYsLA0qAzPhp6U=
X-Received: by 2002:a17:902:f693:b0:21f:68ae:56e3 with SMTP id
 d9443c01a7336-22649c8e7e9mr52422045ad.39.1742423238640; Wed, 19 Mar 2025
 15:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250319190150.31529-2-funderscore@postmarketos.org> <20250319190150.31529-3-funderscore@postmarketos.org>
In-Reply-To: <20250319190150.31529-3-funderscore@postmarketos.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Mar 2025 23:27:07 +0100
X-Gm-Features: AQ5f1Jq_ZECwLUjQyBqdaX25O07PIZ7e5glTPQT7D1by9iVmLwmBmJhYAj9-cEY
Message-ID: <CAFBinCC14dxYHWO1yMrGyvQigVR+h9qGaxUNjL49WXh-p5XMNg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
To: Ferass El Hafidi <funderscore@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Artur Weber <aweber.kernel@gmail.com>, 
	Karl Chan <exxxxkc@getgoogleoff.me>, Christian Hewitt <christianshewitt@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_152719_624143_6B8D3542 
X-CRM114-Status: UNSURE (   8.29  )
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

On Wed, Mar 19, 2025 at 8:02=E2=80=AFPM Ferass El Hafidi
<funderscore@postmarketos.org> wrote:
>
> Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka.
> xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
> few minor differences.
>
> Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC852C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECOXHvPy1m6u83HyWp0b6PRWuYparDalOzZlX1hnZOQ=; b=aWmrpVjEvprpRY7P8HwwN2KCi8
	yOELiKAUSIcq1gGy4dfJsSPAgkcT+x3tvnvr598qvTfT7bu2qrY8fdceab5pDIor4cYSnqjkrMLwU
	bjV3XZ8t3mjiWaghyDB6AhAtzB8yt0RXoGL8+CRHohVNM4StLyoGNBKlE38DYGGrtt+zwOfHuEoOa
	jumh5YfTJsGeEKzTS6/owXJ8bM3cpKPHgbyVF5K+7hhVF75otCM7t+JzywxxZrbPeM0gkLNpDoO8T
	aEUjsVM+Fen34fbd020P2DjBtJlJrCaFNWEP1TgJrly18ztTfum8wF0ONonpWZjhoAT0MhDniJcvG
	lql45cMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YCb-0000000AKuz-3JvT;
	Wed, 23 Apr 2025 11:23:41 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vgt-00000009nlR-2QnH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 08:42:48 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-549963b5551so6618305e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397765; x=1746002565; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECOXHvPy1m6u83HyWp0b6PRWuYparDalOzZlX1hnZOQ=;
        b=FXnyHWuxeFEsci+arm/ozRdq7ingzuG4R1y3UNZxpWQwpUgQM54L0JBXaEz3kBRj4e
         BZCKsglRL5Yceu5zJD4FrOLRgBvodG8mtMVYNu2apA8fsI1hRi577YSqAdqTAZfj49ad
         INfk8pmwi3qGC0poFeceICcg8eqEtN7sKR3DFUD28j7zwrjR6v95SfwvZ9rWX9DOkoUR
         imfhIetgNiWaKIugrYEslMgH3X9mbN+ZvUkuLLICzws7PrYn8ud+7WWeL07d6jvnz6QN
         GvN225oJs0mFJK1zV+SLUxqWpvtzbbEnxuD+fL3ucirfjCa4GvIhxBxgtA2UFFdOEQFT
         gv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397765; x=1746002565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECOXHvPy1m6u83HyWp0b6PRWuYparDalOzZlX1hnZOQ=;
        b=arsZAf8uhgUZQwevgbuPQ6vgLb+6fWmxEmIScR56DqBooqXXpQCCCBVE8cV49S8HX8
         NVsszyytMKtJs4IATNQ90YO7SVGq2Hk2s0xWE7TggT3Yv8Mjs3KkJPphb6AfdjySO+LZ
         02bQ97s4R4L7Al3cTEyngLZyqOpnIoWUjPfc1mfd2ybi3/wFI9/SA0zkYHI+8b5sBYSC
         SnAMddHHG4rtB31rfTMZhGHCGPAv3xGGwh5KOPpevB+U3nasBV99ROkK91uG7ZJ16MdX
         6b1Fi/sRvrRicCbkchMteUj0Egmb6ASeBWiHJd8cQZ3Z7upn2b4DzQHZsezvB8oLs+Y7
         ajTA==
X-Forwarded-Encrypted: i=1; AJvYcCXD4RdDNQ9NmHNWLPhHb+RnKg6X2SQj3hHftmsAiz8X8LbpDp2/xstYMl6VrgZO2I1Vu4R7CaxcBpASBrrp7o0l@lists.infradead.org
X-Gm-Message-State: AOJu0YypMN7e1k5qJfHHQ3sIWdhp7T9Nmw0hubyPQd00oX3ngTWpTE9R
	Y5Xv8mgBXlodTi+SHNDcaZeFVBP+LyqibvaChj7iNBiJV3LUznyAyJYthAXVAJGbL2puThJpB6v
	Fmey+ZIGV1PV/JqaFHcnM7xqassaqwm/OSNccCQ==
X-Gm-Gg: ASbGncte8Odmg87BH+A2T2EITX8M3Ax4QDRpIA0W/ztH4eq85gQfiXAqiPNIlhpYqR0
	7AMRIegQ6VMpwckO8ytovmo4/KL4WPUrctc/ACx2KIylgWxebcnA/TzIL/c1g7UQWkzbaKFwM+Z
	zGO4Ew5aHRsTVSwPIPq/VZ8A==
X-Google-Smtp-Source: AGHT+IF/9nczjT+/oWrcGPQu6RRK0VMd+RPdPyXG/CCLKRQHhZRImrCsqO3mNIzSHj966SqZ9meSOpaq1WCgkHTJSBc=
X-Received: by 2002:a05:6512:3987:b0:545:a1a:5576 with SMTP id
 2adb3069b0e04-54d6e62bf8amr5062499e87.22.1745397765600; Wed, 23 Apr 2025
 01:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:42:34 +0200
X-Gm-Features: ATxdqUECxAVIQqbFYM6Ibi6XkYyTlVovD9mEdGmf4ii6T1onYXMYyalIoDjWE5Y
Message-ID: <CACRpkdb-+xhugxuAif_X0KyxOCgRr5LihzF0pUkviUzwZQTYCw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint pin
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_014247_637111_FF9783F9 
X-CRM114-Status: UNSURE (   6.84  )
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

On Fri, Apr 11, 2025 at 10:42=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek=
.com> wrote:

> Add eint pin support for MediaTek mt8196 SoC.

Patch fixed up and applied.

I recorded Cathys affirmative reply as Acked-by.

Yours,
Linus Walleij


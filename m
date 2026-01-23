Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A478BD74ECB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uRZVas5P6xxkBpdwTHJQR+xs1A0EdTWP84ona+zohk=; b=wJx9Lo3xq4CXEWyggxwRNRLxc9
	tSrtoFvS2brLWv7yTbCSPquXMvPI8Kqq3QFVwwtzEJTqB3EiSt/D/FXQcmUQgAck7iT9Mx0lwpsDB
	yWywbmu2jDtDeaGFNi7DoEy8G2ae1b9LKXa7QLBovizTYhe1XRaq/I0P5YAzMyyL10K/S9W/QR5Ec
	ALLxruuVLKBV6/y8i8zQMptciRq3bNpjSTJ0ynpSwIkXW1SnyWd6P9Vr1QS39nc6U3T3sxUC9YCOp
	QzyjilAjrJHl2eZbDGuf5bNnQ+MNVBLBztvrX8fGyo4sK5xKyswJr1kIsmJbvgfbNJo+j0OSfpLVl
	knN1ITOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHFn-00000008xyo-3Ank;
	Fri, 23 Jan 2026 13:31:11 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHFk-00000008xy6-0ePk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:31:10 +0000
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso1474015241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175067; x=1769779867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uRZVas5P6xxkBpdwTHJQR+xs1A0EdTWP84ona+zohk=;
        b=rnzCRhRNKsroprGV3rggRvVWVgt57np/nY/6WVo74pLgS7reXjNAR9OAgW7i4ssHya
         uxiTWz0D11e/PFa8yR74daxN3+3iV3l3FZ69C5SoL5NVIKuhnxlj2LDUQ/91hrCDkA65
         yJNkRfC2oYUdX54GfJhdEk5Vt+jf3PZL8RFJVql65rhxmjpZfEV8pWZu5L2ZxwcA9Bdb
         SAs7Vy7q/FTwNr+TCIv73T3FHF7FmvibkAJXJna1co6yb7YJWoXeRD3h5ioTwEn9iVuD
         GNCdTgPZtGqRB0ed6ndPxesq88rgYPoz7xFmeGxVGu+BdK4nfs8pmZSj9MsxgitgQUvP
         n1MA==
X-Gm-Message-State: AOJu0YwLExShqfr+LrgjYlGgSoD83pTLDTf2gJUKEGigbe83+8MttYHo
	tknTlSS0YGpQafidT/SrcTsRpnPj+IizuvzeVb0e0ayshYtW49sl2vFh89yYqMxA
X-Gm-Gg: AZuq6aKfii6CX1D0ytILN13dQqcR9FMQQiab/tdBff/oRNOedWt5n8JL8RpkiPvSklo
	+1GUs6mNQsCnI4uITwg+cAyYwvam3o6mdJOGKUjIEldpy0aMaUfWYhrObCsxVtlN4miO+4GC/ah
	L6KkMDxA3SNcVKq/6sxi8zYUDLoaQngMpR2ul4PDADLIdc5/LQP4emvS5zYxHOL674pNUl3sp3T
	bWvXY8k3nGYy+PwD2W4800xNHUGhz48CflTX7B+2ZE65ptjJ1M6sImQUS/eCzXQNWk9Aq26awzp
	r+txWiL7HITR1+6ONPY0w5ge+Gg9lkdFah5es8cVsU/7YodVyJuROoTzahr2g43pa1PT9bTyACM
	xKJtnWTnIho5bU0Imv9Dwu0duM63VuF4/a6X8P8UbIkagjKgYGtwSs9gWZJeIKYzU6igEQsfaNt
	ss7D1w033Cf55KoMqMyUlhQa61FcxGj0nfuoyzCktSjnVSrO+gzd/boaVB0vMgFw8=
X-Received: by 2002:a05:6102:2924:b0:5db:3569:9059 with SMTP id ada2fe7eead31-5f54cba4d2dmr680224137.17.1769175066859;
        Fri, 23 Jan 2026 05:31:06 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d62ce3fsm547439137.9.2026.01.23.05.31.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:31:05 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5662c2937fdso2086786e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:31:05 -0800 (PST)
X-Received: by 2002:a05:6122:6414:b0:563:5bd7:3793 with SMTP id
 71dfb90a1353d-5662cc268e0mr1610597e0c.3.1769175065114; Fri, 23 Jan 2026
 05:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:30:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7dKG5SQt0FKc5PCpa6Ew79e5Xm=GQw3KYvY+9OKLx2w@mail.gmail.com>
X-Gm-Features: AZwV_QgegGXBPtMl9ShTKxG3gBg_w4ZVsxp7J0NjCRso-dcFlW5sDr7DiMpG720
Message-ID: <CAMuHMdX7dKG5SQt0FKc5PCpa6Ew79e5Xm=GQw3KYvY+9OKLx2w@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] arm64: dts: renesas: r8a77961: Describe PCIe root ports
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_053109_453468_FB76E84D 
X-CRM114-Status: GOOD (  17.39  )
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

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add nodes which describe the root ports in the PCIe controller DT nodes.
> This can be used together with the pwrctrl driver to control clock and
> power supply to a PCIe slot.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


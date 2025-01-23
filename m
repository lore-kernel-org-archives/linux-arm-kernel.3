Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0AEC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ObmF4EAbz69jChCTuuA+EV0Ksc0exXQpmKmEqjaiDU=; b=ZGxBt6ZWm4qHVSj8lRGafVd8+U
	W+cpWk+JcxhBPJ2ymt8PeplCxbGnqNOyrFqqYmbUAqhE3JC9x6KNuZ1FWNqyz4bOc+0Fqls4EIpyg
	+uJW2aAu8BiPU/rskuWX++E/1eRwRFjlljugNqsDinFtepYnwI5N080iH5iOuuGyhZT5L6fV7GS29
	57MQNHCSqqYQdXNRlQcsd9rhdtTHlEtfKlkIRHIIBLTyoTgvo2b+6rM5bwMDgYQdgOpKySYzFJ9od
	i6vE1YVBikgY2GXhTNruLW/sYHYjsxE4Xd/OcoRK3X2xrhVvHzK+CO1o7FMX9jwUsY2C7Kaw53+0Y
	K+mRZHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taz7s-0000000Chz4-3RMO;
	Thu, 23 Jan 2025 15:28:12 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taz6a-0000000ChhY-1blg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 15:26:53 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85b8c94a6b4so243427241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 07:26:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646008; x=1738250808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ObmF4EAbz69jChCTuuA+EV0Ksc0exXQpmKmEqjaiDU=;
        b=GWDDFDfBa1AXoNv7O9ewphouV/+/zzlsh9JjX2yQ4/QA9LOdCAPv7J2+/kRFOzEUwg
         4/tGHCTkxXTwVEv/mJZ6gtknPZO4ILVBZhRZ9V2/5LwYX1J4DoA21aEJfQbGnx13apPJ
         LG3YzFF0voG95CG7dS/kfNcFCEPG2DCPxgF5cpomWTbkgCJ9ctUhqfOrxAB974pWonlh
         slZW69joQg0lvG1s6QZkpnQQhdQipdVJVM5vNAPY40gxKXdgQzo4Px9ct2ICYLOLtgnm
         NGYwoqji8hRCqLE5TE4Dhyp4KR7Q6U2uOL7xpocOmF3Q4hdIOVGH6agQXLC+Gp+gWWjk
         bOKg==
X-Gm-Message-State: AOJu0YzXOysCkKYjlxt8ysbmw9Yj/z29trialec1fIWGSdz74Es+4jm3
	hOCDy99CevKoaeL6H9MczEGltGZ5U/aZje+0/jXhpJeyCAkQ11VRidN1dXIJ
X-Gm-Gg: ASbGncv12K2yQ5F3GQmQmeUvcfJjN2WTJRcF+ZFk5gbANShfHNlKzSpVabFsH1uBGjN
	zTlByZUro9gUFNFiDv+flS+u7P1yE1Tu36B+s7910zjqOZEo6YQtKRZHqOQaNRnWniMELb+LLHp
	yGJgpKe6229FACRdM4DLMOgDUxamkNmHRDoX89oI+irSMKPeUJ7tEX7KU8gPZqQT6yRe+Mi/Sgl
	Y0Y54EiIq1/035HzIcV7CPNoZ5DJ/7ESciF9eE4XlRWZbOP/tknyObiN8cMsyKHtKVijGBUfGme
	2KZr+fKiuvyIFdkslCO7J5gy3VLBdJ9GD5Vp/O0WTrQ=
X-Google-Smtp-Source: AGHT+IH13GGaXfk3NPKJv+PDU5s+HHNNz1CIPxIlO7SaDOtSenIa4XurKgI7ORYmASAh6oSWrHb0aQ==
X-Received: by 2002:a05:6122:4011:b0:51b:b750:8303 with SMTP id 71dfb90a1353d-51d5b39ad50mr22071512e0c.11.1737646008258;
        Thu, 23 Jan 2025 07:26:48 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ebbdafcsm5939e0c.32.2025.01.23.07.26.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:26:47 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afd56903b7so281815137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 07:26:47 -0800 (PST)
X-Received: by 2002:a05:6102:4b15:b0:4b0:ccec:c9de with SMTP id
 ada2fe7eead31-4b690d322famr23895215137.24.1737646007443; Thu, 23 Jan 2025
 07:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org> <20250118111344.361617-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 16:26:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXe6ZOKXPRrG4pJTsP_6ZaAysHrsNGEC76ASPOfP0aaXw@mail.gmail.com>
X-Gm-Features: AWEUYZmSg5HWSdLGc8j6CDEBswP0pzOY_OzDTJ5vSW2vEF9CejAiXtH9hbGKZEw
Message-ID: <CAMuHMdXe6ZOKXPRrG4pJTsP_6ZaAysHrsNGEC76ASPOfP0aaXw@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: spider-ethernet: Access rswitch
 ports via phandles
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_072652_419726_2D8BF277 
X-CRM114-Status: GOOD (  14.25  )
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

On Sat, Jan 18, 2025 at 12:14=E2=80=AFPM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The r8a779f0.dtsi now contains labels for each rswitch port in
> the form 'rswitchportN'. Use those to access rswitch ports and
> slightly reduce the depth of this board DT. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


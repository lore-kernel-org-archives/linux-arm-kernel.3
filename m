Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729AFCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rof2e6OjGUUG+ZoOg7L3bn2avl1gX+MuD7fzpYfe/9c=; b=SJ0Pk3mL6EMoMzBg1B1ZpmkfRX
	XByn9+kVyyBDXS/BZr33QeYfyWnqCyuCT2mpWdw0xk1vEQGhydSCKfM6Vxu9ynsBRZayHsUAZtKmB
	u4TF6rNU39xAsdRewuylmPkbhEC844j/0kgpISW9siGMfkF0a7HOzSHQUo9olRy9Cyk1AOGDQ+uGL
	AgbGoitAC6+QMP57PTjcQ4l2BLkmxikrHX3de3oAJ+clv2C92GVTEyKZFnjR5LgIAMOzWy7yw86mp
	17PKTpkFkikhcU0K5XuYtccbzikNM8+xkfgf9B0KCbIhB4Nop5Bw/nnBkcBgMur80p8qeXb92Tg7y
	Udg0TKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPnh-0000000AwEr-20Mo;
	Fri, 22 May 2026 13:20:29 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPnf-0000000AwEB-08M8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:28 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd0209f25c1so1208998466b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456025; x=1780060825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rof2e6OjGUUG+ZoOg7L3bn2avl1gX+MuD7fzpYfe/9c=;
        b=bhS/qFQRXP4MlbnSkT6HHMa14YjF1WN2YIkFH7xMcgx7cpMek3D+AehgLWtsjWdbQ2
         Kf4gXSFyTPM2Cyp1mHxFH9vAQa5bKUKQyBNzVOIJxzcAURwRFAtMsBy0fOngq/HVE1wg
         TldxPPeczcTpifs6nlDrwSRweWBDO2yNULk5XRbtIkXFHN7t6Wbjarub+g732wLxg3/a
         zfHspbF7knjaxxWQI5vDKpP9yq2a259COVE0vqvM1eOsvmAkIX5vgKS3TXY/OLYARSH2
         Vc9mc4HdxdiUiubs2cC0FxL0VCT5FrVFMPmYUGrkMpuqIY3EOF5HuURwNpM9QVd8jmEl
         eceA==
X-Gm-Message-State: AOJu0YxG1/HzI9zNzuPiAijwgvnGWTsfipf9f+EQJmCNm452C2mpJ88x
	ZW9Z4PC3FkllUe/UF3KjU+3zjYEW+Kgv3f+STwbSfJdOFgTBHA48CvEv3U399ylsRR8=
X-Gm-Gg: Acq92OFaIJw6aAkXFYCSQmI+hg9TbJW5ATgUhLhqO+RKYIjA4BjpaszxBaDh1fjuTEj
	EP3bD7OnQnTWiyPsYOQaLa4+BthCpnihjuGjlxKORd69Hym1T1xrovb6W6SIWtZSTRjpyh3+7wD
	vDZeUIZqTLb5YPVTUcsiA5+2uxsRYpA1J6vKOG0FuZGvXHfiPK9xWcYBoNMSIiOy9g3lLiBlHEZ
	y6XE4IQ7InsIRjy/PtGtRAU5BZaUcf4NpQSeYRuAXDrp0FdbQadL+r8k1wfc5evrd7wYq9vf1mR
	ZwN9Gwm2uziI8h0z4i8smDnZKJNk3SaMEFLT/M4ndklgeODRDpjtGjogJk61pVFEwiqa14oqJ9I
	LO9JMz9ecTOwYNa4y2R9DbRg79oHswxdAiq+2MaOTz64X+VZrlEUcbP2crTjwlEA3tjNmBrmv8X
	mfynhc8FitFzxt25RK5MEwHI89J2p1ICz0yLg0RxbIAHLHtmv1r+w6T09+d109
X-Received: by 2002:a17:907:c80c:b0:bdc:6e26:a90 with SMTP id a640c23a62f3a-bdd281ad163mr230186066b.2.1779456023204;
        Fri, 22 May 2026 06:20:23 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc3151ff7sm53506266b.23.2026.05.22.06.20.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:20:22 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso8571972a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:22 -0700 (PDT)
X-Received: by 2002:a05:6402:538b:b0:688:34c4:e8cc with SMTP id
 4fb4d7f45d1cf-6889c43eb03mr1886593a12.6.1779456022655; Fri, 22 May 2026
 06:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:20:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbJ-SPK5wmA68bg-iF6mhaHx8gzxRK_co7E2w+BfaUNg@mail.gmail.com>
X-Gm-Features: AVHnY4KgBi27n3nuGQlpIbkeEOVvo7gucNBwkT372ZXFKVfmiLEIJgWEfOyb6mI
Message-ID: <CAMuHMdVbJ-SPK5wmA68bg-iF6mhaHx8gzxRK_co7E2w+BfaUNg@mail.gmail.com>
Subject: Re: [PATCH 01/11] arm64: dts: renesas: salvator-common: Specify
 ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062027_188062_1167BC05 
X-CRM114-Status: GOOD (  19.75  )
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

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

No regression on my Salvator-X(S) collective, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


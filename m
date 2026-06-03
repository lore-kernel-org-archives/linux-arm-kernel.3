Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BE2CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWxBYc1IVZbFBqFpe+a7OXnuXHa/My8CwptPt7UTNAk=; b=rKobb2uQsmCCpkCxOo6TqUONG1
	4n2HkHZJ8WDopKVq5p9+hvj4MjZp4JB22VNDDmalD2bNYe8pdJJAOBD2qF7yaZmbMCJ8D4MzJkl9W
	9PVM7xkq+5NOrjDMCH1gQUVlPDmnyWnAZrpSu/eeOEYEyOF/ryeByzsCQtY1i3qoyjzRJ0PTGcplF
	L58/+rHoL2R1fBAyTzHAWPz3KUbQuQPmlPsXQ9gC41sXMOqS/QBENMNoaEtu2zQ3sRq1q4UFNFDOK
	oaIodahZbenuzH42q5laxMInHUlUftI7gF+AdHU4D/u/Ejh8lPZTpzRFDuUoP52QkhAScNi+JPgOl
	QoYfqFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkw9-0000000F5Xj-1bpC;
	Wed, 03 Jun 2026 12:43:09 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkw6-0000000F5X6-1ni3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:43:08 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso1507345e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780490585; x=1781095385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWxBYc1IVZbFBqFpe+a7OXnuXHa/My8CwptPt7UTNAk=;
        b=dEtf8RH2Qw8x8aqFgRKTOkQdO8XSFG1Oq8LWhy3TtuxrTIRSMAgqaKGyPvJmZKNpjO
         5kM6iW1Io4X0+PMDSd82DpgcYERx0o+uVNcTuk90jVpnlB5G5akKJmQ3PToDBosZN4en
         o+ZEnhcEq+6+s/iwrBxBE+ts1eTgKdGsJIW+M9jcY3bWipXIkz9dWVZfSnRnx3Drs2Bt
         Qu7nhx6M71brbY+1HKjLN3HDpLdcApzn1U2PsOkhqQ2WFF47+M1EhJ8KwpdYgsw8GMTI
         nWPg96dTLyT9LuGxicHhg/cPV39MWMDJm/RFvkoKcyFtyxawYHg9pBtgyhX1Fl8h2baB
         hsVw==
X-Gm-Message-State: AOJu0YyL+4rCQoH8ear9+bUWiFavtXlVnaHWS4tX7VTHOe6AjkMAhTBs
	DF8TA+FRNkvcyWjguama2h43lOndEKZtpEd7vAzkfLEJmtumMUu4i/Q1rgFIMI4Mo0Q=
X-Gm-Gg: Acq92OHvsfWj3p+c4Cxj3oDI2czUscMaGUuO+yrmCq8I6q/mR5x+YrckWxlciZvUMSa
	zfvoYoTVy3vjU04hkYw/kO/EBFyqIyHuBHQXK2gT3qMVGPIUD7sUzpH2fBG9B/2gSvpVryqdhLA
	OfkQFn4X9lo75zDXRlgg4QmCHzsEPObcQOZBSEUUNEkUEJ7M5/NYkzHpgncCdZ/7Dk1Dm2IQ1FN
	CCLy7qvBMMV3mJWD7gZW/xXX66Ri7YNQWxnH7bKHyDfvvrPjxFaZ3KvtJcMELxffe0J47d7dnkD
	UwoyDNyShF6uEv6qjcmxAhHhyp/LZeSeisfFDInv8yo6ozWwUVQqQBLEfhZF7wMTxxYuc8cki4o
	il029n1fvDjwUlbJbrAoVU1f0AQxyWJKBq3LSm6USPbutZ8Sn3D6qzbqQUk/USR1nKdXrY3hKMN
	1BeU9rWxW5yUJ3Ww+sUzGWeiEgKs/48fgy80GfJZg+WbNwH3EOAbtDABF+un+o2+6i0JF0GBM=
X-Received: by 2002:a05:6122:6608:b0:588:c9a6:2807 with SMTP id 71dfb90a1353d-5a6e8628e13mr1506498e0c.10.1780490584553;
        Wed, 03 Jun 2026 05:43:04 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d777996csm2189657e0c.7.2026.06.03.05.43.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:43:02 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6cfdce656bfso1419486137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:43:01 -0700 (PDT)
X-Received: by 2002:a05:6102:3594:b0:607:4fde:1921 with SMTP id
 ada2fe7eead31-6ec490c3d34mr995887137.24.1780490581062; Wed, 03 Jun 2026
 05:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260601113919.8327-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260601113919.8327-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jun 2026 14:42:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGJ+Ww+ek3KLvrnFKpw2cJn=RB8q3k=W6ECVgtw-zK6Q@mail.gmail.com>
X-Gm-Features: AVHnY4IY7ZyzpnX56PnrLKeT4Q6f6pff2bdlvBxWDQkSl_14GHUg_sgrQjRBUyI
Message-ID: <CAMuHMdXGJ+Ww+ek3KLvrnFKpw2cJn=RB8q3k=W6ECVgtw-zK6Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Enable application CPU
 cores via PSCI
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_054306_470857_99410BCE 
X-CRM114-Status: GOOD (  18.39  )
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

Hi Marek,

On Mon, 1 Jun 2026 at 13:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add PSCI "enable-method" DT property to all application CPU cores.
> This allows the OS to bring application CPU cores up and down.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

> NOTE: This depends mainline TFA 2.15 or newer (or SDK TFA version
>       which includes b950bc09f5e9 ("plat: rcar_gen5: Fix multicore
>       boot by ensuring fixed address for plat_secondary_reset"))
>       and on SDK 4.32 or newer SCP firmware.

I assume SDK 4.32 includes a sufficiently new TFA, as that works for me?

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


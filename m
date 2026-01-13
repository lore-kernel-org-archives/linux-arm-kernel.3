Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D7ED0C855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MR0NoHyZdJndLOZGMkASZoG8F5TIOzALE+PpGAFfY78=; b=zKCdbSXq62kxkm5mzmmz26Bma9
	73XhYRNuSv41Ts6DOSpclvdKkuWLonPIffH8qoZcwogjwwWpqATMrBIEMu5GpZT/eSthKc6i2Khyl
	lpmJ6XYMssCTzVnROoCj/9Kz6hbkKna6KcJ8kf3aAzjMpo+bGuBVxwWGIB/bHJHlcV/S9NlmHJLZ2
	u1tl02tXSzfxBfMs9JBtzbKfwQMBx8nmNqcbqk5ZIXCvwxCMfeQNhYFk/8Qug154AwkFhdvl8w6Aw
	fA/EK1ZU2isl8GW6DVdit0JzS/ipGkrdgmOfZX6f3hIynRNuWVgDPpA2LhxvyWRuUkieHghCmqrOH
	STEXBUUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcM6-000000070Cv-3dle;
	Tue, 13 Jan 2026 11:14:34 +0000
Received: from mail-pg1-f194.google.com ([209.85.215.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcM4-000000070CR-3eVG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:14:34 +0000
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso4877428a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 03:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302871; x=1768907671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MR0NoHyZdJndLOZGMkASZoG8F5TIOzALE+PpGAFfY78=;
        b=mPfSaUBFKQhdzhDYfSN0PurnaASt5hpCdb+cJxzR7A6xMRjDhle1IAZq+YeOZefowZ
         84ToA9hpAPK581W+Q1NBBDA05IJo/FLvjgbZWa3M1slxe0lAppDxkzWzkbtx7w9avTHy
         EBf7NfPHRtYF1B08jcK9jrgg4M/OH5oJosX8jvxqKzIhSTG+WMwznoN272E1nHrDR1v3
         DfbvcstPXxbU5YrZnDa7QcOXa+m7Tp4As0Wn+8CtLMr+zqjOVOb1ICmMCFN+ey+E/HcL
         KyZnb0ZVE1MgudHahL61pzd4Hrll+aqTjjwL4/6P41Twx0h+W0q6J8BhUWSJzWjtH1KV
         Gg0A==
X-Gm-Message-State: AOJu0Yzb+AR/OYTWLsmBzLfvJQUEEIwGrmHJL1AaEwdvRO3550mMotZE
	l8RMfiXNQifOQ5P0YIYQZDLw7jAqN0ARFKl8i4a5+41e5HudeWHR9nziQuqjJYl4PY0=
X-Gm-Gg: AY/fxX7/E1dkcoYzDb9IyH1igRTMFNlBCv1m1yYpjCus6YnU843qxjCJARdWd5hAcj4
	CTnn/Yt5ZTC+xY0uKC6DaDSh0xMqNd9MWI0jzCijjSjkfylmKiM3w9tzcyRWlVhcMf1LjpFEGMJ
	z9TSrHHogbNBfospnXOFFLozrxvpzpyJ2AyCOi5LffhogpSPi7CsVIVnk2cg+B3lIoXMVOs4wcT
	y8c8isCPhYmpnuhX7CVsXyuf3rZGM4a9kewSil4WErKwMJqKqW8BhbXPdJGv9C6Qx35QDQjk4w4
	oXgwpoZ2WqfC8XZhoExxj/SN1eEum9mBGZVYdNmKc675i1OX8X8Z8Uv4sBL8jLKM6p7MwIqlxcE
	OMiY+gYba4pybxi5qDlqbR6mrcfc5uP5Za4AEsYKE6h/hnPgGdgzyQEOxM90tTLtsbw5vkdCf0u
	M+viJ8WSSUKzvYIXg42VjDYPc1MK7Izxn6ZRu7hYp90K0KNaCp
X-Google-Smtp-Source: AGHT+IHw3DwX9zQXeUKKMmx+CALWYgzcU4IcE/l3bek89YmzS9noraJMkzUxLezBjmDsUqWLU+V+MA==
X-Received: by 2002:a05:6102:3584:b0:5ef:a07e:8a63 with SMTP id ada2fe7eead31-5efa07e8d80mr4259480137.26.1768295620553;
        Tue, 13 Jan 2026 01:13:40 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ed091d93f8sm18109569137.9.2026.01.13.01.13.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:13:39 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-943d0cafe77so2369665241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:13:39 -0800 (PST)
X-Received: by 2002:a05:6102:419e:b0:5df:ab05:d846 with SMTP id
 ada2fe7eead31-5ecbae4aedemr6860725137.40.1768295619640; Tue, 13 Jan 2026
 01:13:39 -0800 (PST)
MIME-Version: 1.0
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 10:13:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGsfCTzSSjh474Ohimad2W5h1Z=vNhS6zU=Lb9f5Zbxw@mail.gmail.com>
X-Gm-Features: AZwV_Qhh8RJBBYa7gKoAKpUlBeVNsz1RZyqK3-3_U_RszPPYx3TukXyRJOwF8cM
Message-ID: <CAMuHMdVGsfCTzSSjh474Ohimad2W5h1Z=vNhS6zU=Lb9f5Zbxw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_031432_909619_96A040A0 
X-CRM114-Status: GOOD (  21.50  )
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

On Tue, 13 Jan 2026 at 01:07, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Move the Waveshare panels description into separate document, so they
> can be properly described with compatible = "waveshare,...", "panel-dpi"
> and attached to "waveshare,dsi2dpi" bridge.
>
> While these panels are described as DPI panels, they are generally part
> of a larger unit in non-removable metal casing, so the actual internal
> configuration is not known. It is likely that internally, those panels
> are LVDS panels, connected to ICN6211 DSI-to-DPI bridge and then another
> unknown DPI-to-LVDS bridge.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: GPL-2.0

scripts/checkpatch.pl:

    WARNING: DT binding documents should be licensed (GPL-2.0-only OR
BSD-2-Clause)
    #68: FILE: Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml:1:

which matches what panel-simple.yaml uses.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


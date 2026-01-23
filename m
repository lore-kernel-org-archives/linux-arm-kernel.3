Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC3FD74ECF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FaJ17quXgLj3q7lesyxJ1BD4hQkqNGO4klrnGmMXe0=; b=05t4CuONNesiBMVfZkxo2sMmGO
	DA4NeDbh6QyEJA8UtMcASCeRHV/dTxkHWrMkWQddKZfD/7zReDcHIU0e0BMSsqVl/iw8T1/RQsy7Y
	fp5S1/kV9b73TYKP7uAHjm+Zv+bOmCr6gkoCNrGg2sVBHlI/DUEPG1yNeCUxkqYxMOJW724aEUfH1
	PhvJnUnerIBpSxniqg/YMfSurrPcLE5MqMtaiAizegGQxuqxdO4rcVZihJAL3kZOSjVipLUf0WI93
	+FnMJX6icfJm/1iGin3geFnrM43JR8vcxlB7Vn8zJA16dE/H3ojxsYrKgRmGKD18sto3bU53BUpgP
	H03vNSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHIx-00000008yS7-2KvH;
	Fri, 23 Jan 2026 13:34:27 +0000
Received: from mail-ua1-f65.google.com ([209.85.222.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHIu-00000008yRS-3Uja
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:34:26 +0000
Received: by mail-ua1-f65.google.com with SMTP id a1e0cc1a2514c-94388cfa259so554393241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175263; x=1769780063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FaJ17quXgLj3q7lesyxJ1BD4hQkqNGO4klrnGmMXe0=;
        b=JENn8bawvnO2DUZoftz2rEhoJu8DKQ1hUsNqNHNKhMwr/o0OHWVyBnmfcEvwuR68wz
         SuYyBdPe1js5KcW/Y9CbzFXtP8b2eWsF6qj9MIJYJeNah1Qv/O5fNfrnrH2M6NeSbgnN
         jAEEtE931jW7HCAY6zs2JtixKPZRr7KcUuAlcGX7JRNVheWet/dzP/U4CQaxjoTdbYYw
         9HgOhlqMmjdo+Dk+Vwe+HofzGosvNUvMf4XOhNJv2pc2Rgt/aKlpoAE6ikZ0O80irh99
         LUrWrb+aUknekbZfq7kpqtPycYCq86JKN1c9ehIxiBgwOu901R2V9NmIpU7ryCuMAktT
         u2LQ==
X-Gm-Message-State: AOJu0YyBltdbKPkyZhummJYvt4ubztzHBuYOeFByHF44nZ/m+UhNSigf
	Td3CYmzfdtZ+305ldrBYDmodGH2kvIbHWZekvocwtDUbR8J5RXN+rN+RPZ065XuOYQU=
X-Gm-Gg: AZuq6aKeRad9ol/0/xyyjTJQgx5UNWm50i6AkrGdo7uRD4hvN8YbqEinKOSwGO97S2G
	spY2CESUSy+g/ZFcjJKKCYKatZgiwDHtAuDms4WaNJignzUq0FCT1m1nILo0UKoq4eauOUOKCUn
	E4BGnHL/SqX781NYqrCioLcwmJlCPgdJtwchZ1TZNBNzj7FYVw5lSBqSsgDLaAWCWozsdSDk3nt
	/Hjcl/VXVosgKB+fQOIbuLxCC3WC+lIGsTHwN+o6RsBUlW0u5sygZ2yuos9lcSVC2OkUQzcsVJJ
	8f4nMSVoEXbvw1UP51qXG7rGwAWK3Vp1dSV8GAciruqhBVMAVilGp/fymwFDgK9+US0hiaRwTEV
	3NtJSkBbObexsFwWkvQEiBvx6Vne97eoRCfeSyFauc9OCJn5lbTMorutTYlXMVd0enJ+8HWwTWr
	phXTRYJz1npAr3TyU0c8pXyva3XhN0XLSlks3Huw0iwHWwhMBi
X-Received: by 2002:a05:6102:3594:b0:5f5:4055:4558 with SMTP id ada2fe7eead31-5f54b9dd693mr944041137.2.1769175263374;
        Fri, 23 Jan 2026 05:34:23 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d3d849dsm502014137.2.2026.01.23.05.34.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:34:23 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94388cfa259so554378241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:34:22 -0800 (PST)
X-Received: by 2002:a05:6102:3753:b0:5ef:aeff:8304 with SMTP id
 ada2fe7eead31-5f54bccac8amr893050137.33.1769175260730; Fri, 23 Jan 2026
 05:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-8-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:34:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhqLnfZdg_9-JmH7Nrae1MfzM73R_NUFuwXioYnNoQ8g@mail.gmail.com>
X-Gm-Features: AZwV_Qj-XKrZ6tI1NWPXXvOntE-HmWyNH8CYB4F0u4KrKnplhkYq6k74VqQHwH0
Message-ID: <CAMuHMdUhqLnfZdg_9-JmH7Nrae1MfzM73R_NUFuwXioYnNoQ8g@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: renesas: salvator-common: Describe
 PCIe/USB3.0 clock generator
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_053425_734428_4EF96B01 
X-CRM114-Status: GOOD (  19.56  )
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
> Describe the 9FGV0841 PCIe and USB3.0 clock generator present on both
> Salvator-X and Salvator-XS boards. The clock generator supplies 100 MHz
> differential clock for both PCIe ports, as well as for the USB 3.0 PHY.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -641,16 +654,27 @@ &ohci1 {
>
>  &pcie_bus_clk {
>         clock-frequency = <100000000>;

I will drop the clock-frequency while applying, as there is no point
in changing it in a disabled node.

> +       status = "disabled";
>  };

> @@ -1038,11 +1062,13 @@ &usb3_peri0 {
>  };
>
>  &usb3_phy0 {
> +       clocks = <&cpg CPG_MOD 328>, <&pcie_usb_clk 6>, <&usb_extal_clk>;
>         status = "okay";
>  };
>
>  &usb3s0_clk {
>         clock-frequency = <100000000>;

Likewise.

> +       status = "disabled";
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


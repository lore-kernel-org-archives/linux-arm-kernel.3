Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A44C47BCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWrr+aouVwIROBpBmJECMnG33Dep8i0hbCwAaVkq1R0=; b=MwwCjCWoSekvlGJr1Gmxh2d3YO
	PJqOXzca0DD/zIcf7b5BKs0aZO03URsoKh9M2WKhWT2x48OTY9DKvgjM3JeJNR5Ahq+2Bpuw8OsWa
	dadIFoS7sAthil/CJTjRGiGClOENBq9GFFLua0YhEfs1q4E9H8cJ2MdPp8neRSCR9acG0+aTNox+L
	llzl9l5kAADaojgMM3D7bSPRfU4p02wQ/B1A10a21gdjha+9K/eeiAZEkqxjO5ypbcX6r10GZPXGo
	TCZoP8UZN3sRl/r8xzhaCJmbMfF5mOzQNyJcbHFZvVsfjO0hPjAJrh7DVJBDFuaSANhhaP68e9MCo
	V0cU6ZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Eo-0000000ChAB-0FsM;
	Tue, 06 Jan 2026 09:20:26 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3El-0000000Ch9q-1Y8Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:20:24 +0000
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5dfa9bfa9c7so437736137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691222; x=1768296022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWrr+aouVwIROBpBmJECMnG33Dep8i0hbCwAaVkq1R0=;
        b=h6/36H0lm5sKul0/x/FmgHJ6mSIc8aXtwQ4XwAkCHmUr+6HSs8Ttcm1OYxC5AfPGpZ
         H86Gv+U/8GkTyxjIAhGGYkYEfX41gWxMOBdxHjSq/YfgbNE23mhS9BI+sB8xMipaXTUi
         mZw7q9VPvvdy4m7OeTD1boY7cCAX67XHp5wdwhrnrTOm4W8CyNjMa48hpQYXa6OnTiQp
         KG2ZnhWwlF5tWuIIWdOx17VFjwJ7eGbRjqon63hYs/qdC79g2QrlRJfYeSrHPhGW7nXc
         5rd+oOtVzEQ83q0wKRdSROnrjOsmCri90S3PZV1I6PqZe2IFGTmLyI2siU2Y1+sqrmmn
         KjoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+LgAs9LzvpaET/UrBR3dWpwsQtH7NyL05esVoe+ATuJ3Tb+Z6N2x6JDYKn1a8a7Gf1lb8rfqxIsG485Hl1FxN@lists.infradead.org
X-Gm-Message-State: AOJu0YxSjURQS8F74/Oxt0swAkJU14P48mHFvH2qWSSK+QVwa/SjhjLZ
	2ezN4Ax6MPtLxEv3i0ASUcV8IIKQZHT9/WHFos4KWb6L3x4ref9e0MEcp0sjOBpK
X-Gm-Gg: AY/fxX5vLxBvEVCE0c2qiuRA7ZdkD91JQhnEL3yHEHrrkXj/fCLZUgJ52tUCV2CLKO+
	MG/N0EJImxOqDF/nY1+tJTNxeEiq4BXyBVPQldqAvZxQfoa8WooGSuAWHEN2utW3o5dQPVynqhl
	gLIiZeN5VYn16iEnjXB8QmFXVKzeiPV4Mm4vOiPUICh3Ye/wBISTjTSuHkBLcAckOtAmypw9qBE
	cdmXYSv856I5mN4a6rVDY9/zACtKo4Ei9xkUIahNu+9JBmhZQ3d21bKdpgKNoDIMN7C2nvaV8n6
	28Ftk6nga+yEEngcebvs3n8dYU8QWfvJZaUJliKMw4DSG7jYDbOsy0hLY6TDJ62Ioigp6lV213o
	9oYdgocTwwSFkTPj/IBofPAz/00CI69TgZisUHprdptz6Kbr6cGopuV4gG6AXPDOtWHRRq7G+gz
	2Ni173eSm9OuVm0DU38/bLQ+DB8q0XH+AVqGQfn7Z4TL4BMLnz7o9D
X-Google-Smtp-Source: AGHT+IF9PuRMS7ywZxXC6rjtN3N8mIF5Uzn2bZ4llIgnnIlCRJJL/UuZfedmIMKRfncfuKiEcr+OIQ==
X-Received: by 2002:a05:6102:15a6:b0:5db:efcb:72 with SMTP id ada2fe7eead31-5ec74373a87mr752944137.6.1767691221663;
        Tue, 06 Jan 2026 01:20:21 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772b081fsm459467137.9.2026.01.06.01.20.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 01:20:21 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5598b58d816so560718e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:20:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUchHHwrWOoTjC9u9iXrOc9V/61lcdLxmFPzh5zxypZBLEnSqOscyBv6ecIpMrk5aG9nNAl4KrNjTyax3A8y7cJ@lists.infradead.org
X-Received: by 2002:a05:6102:6a92:b0:5df:b31d:d5ce with SMTP id
 ada2fe7eead31-5ec74524009mr734718137.28.1767690842994; Tue, 06 Jan 2026
 01:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com> <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jan 2026 10:13:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
X-Gm-Features: AQt7F2rMrz4VfFE8hOXFGnfaW6TUCM_pC_Fx6Bfylmm0kWFPuXvkE1g4WrvoTA4
Message-ID: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
Subject: Re: [PATCH 06/12] i2c: rcar: set device parent and of_node through
 the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_012023_420960_2E1B691E 
X-CRM114-Status: GOOD (  23.32  )
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

Hi Bartosz,

On Tue, 23 Dec 2025 at 11:05, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>         adap->algo = &rcar_i2c_algo;
>         adap->class = I2C_CLASS_DEPRECATED;
>         adap->retries = 3;
> -       adap->dev.parent = dev;
> -       adap->dev.of_node = dev->of_node;
> +       adap->parent = dev;
> +       adap->of_node = dev->of_node;
>         adap->bus_recovery_info = &rcar_i2c_bri;
>         adap->quirks = &rcar_i2c_quirks;
>         i2c_set_adapdata(adap, priv);

    [....]
    ret = rcar_i2c_clock_calculate(priv);
    [...]
    ret = i2c_add_numbered_adapter(adap);

As rcar_i2c_clock_calculate() uses rcar_i2c_priv_to_dev(priv):

    #define rcar_i2c_priv_to_dev(p)         ((p)->adap.dev.parent)

I believe this will deference dev.parent before it is initialized by
the newly added code in i2c_register_adapter().

Let's check...

    Unable to handle kernel NULL pointer dereference at virtual
address 0000024c when read
    [0000024c] *pgd=80000040004003, *pmd=00000000
    Internal error: Oops: 206 [#1] SMP ARM
    Modules linked in:
    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.19.0-rc3-koelsch-04401-g9e22366a23cd #2288 NONE
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    PC is at device_property_read_u32_array+0x0/0x14
    LR is at i2c_parse_timing+0x14/0x30
    [...]
    Call trace:
     device_property_read_u32_array from i2c_parse_timing+0x14/0x30
     i2c_parse_timing from i2c_parse_fw_timings+0x28/0x12c
     i2c_parse_fw_timings from rcar_i2c_probe+0x1cc/0x534
     rcar_i2c_probe from platform_probe+0x58/0x90

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


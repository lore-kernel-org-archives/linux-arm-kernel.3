Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50890C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhxUNZMk782m8rVDbncnLrWZuVZ5QZ3Bs0hyS8RTdoM=; b=FU48pfoNj49LLYwhjPZLgvgTNC
	jrNddfLkmiBbMxzuKnU7fczTe8C+C7XdTlfOBjQGB8S066i737yJbCKvpPSKK8O8h8s/5St2wQCvw
	YWb/1TSfbulXZXXpuU53Ivwn1yM8eJlWUWM3FR0GlLSLbI9NTobE0hhiye5lvJ5LQnHzWHui5Uq0F
	M7oDKBdxsZQh/SHMBpk1xf9KDyeq9Qf5HbTxHzLJLxm2GS7+C+em9TRsWjvH1EtNvUKxsQGhNfCm4
	wnERHqB7QOnQfnzUv8iW/VqMBdN95xw0xcHpfxqc51IvkZ6bHHFXjmw5Zj5zjKeH0lo7ftOm0HXZC
	IZkE6Xpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjk6-0000000CvtX-2XYa;
	Wed, 04 Jun 2025 08:45:02 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjfu-0000000Cv9Q-0Rja
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 08:40:43 +0000
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52b2290e28eso1796341e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 01:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749026439; x=1749631239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhxUNZMk782m8rVDbncnLrWZuVZ5QZ3Bs0hyS8RTdoM=;
        b=KVv2UsEuMc7kuzd8WFfivCSoQYaVzvKrkE/3Tm4Blzl/gZ8a7Nwe3ZZ6Mk5OFBlQ+h
         iwtDrxugpxVZ5O85TGb6sw4Vtdd+uV7BzxPTV1X0GhCdBy7Mjdc5mhzdsjUZUgHiHfbb
         G9nd+FDtFYNmkiqf7Xn2KgIzDATp4N0/OdXgBGDgG4luLIUbAu10SoyC6Ag+sNahpR/P
         D65vsQWrhaBZ1V6OXtxYPBaFIH1nasf/+TutDWNmIyPtM3jpF54gWQL+unIBzH7ZkRys
         5lrC2gUZ549cp1ghYVtTobAnxLMqo4nWsvC69WnyX0dPyfys+NGPY7OhtmNvPhPEEFpn
         3lXw==
X-Gm-Message-State: AOJu0YzB/BYKxrhqzMgWhcKgNkPWBv0b0xRClBw+6mxEGJsTmpH3ojTh
	cOVrd+tXoWHMxHeEcxvBRb9aCs2HMhh8w3L5/1HU/mKLVXuSZ+bU2CACsFTu6ft7
X-Gm-Gg: ASbGncukLkPJxXoHn+OVqjy4uilGS5RgN1LcaWs/5vVLZgZ2HwBbxQ0NsXHquDHc61P
	+axTXXKq2zUEB9rcHiRSaeA7PZ+iZ5JVrgk56PQbBF+mnnJIERosrLQCgEKOhF+4uUiGbYo7lN/
	ZCTnEXzPWOpvdLiuSMa+uxGS2wO5pbGZPUH3G0OjGKdX96pRxchopLfzFVhqoNELXGHYmrPa0Af
	5SofX5Q/9Q9FeXS7uVlIhaiMBAzvEsoKjX6IfZLhyzEPGOZKurggmpGNKZsa4tGgm/8ojlLcUou
	ilnnVYDaRhFmsqSx9w2jq8hJio2VUFlmZe10DD0GBOw4Lvo2h9NI9xdDdstknKsKA3DFTqWMdJf
	ilf3MrNA/SZsKg76M6esTjrCQ
X-Google-Smtp-Source: AGHT+IH1qaAikYbqOzHwb8/UwBT0d1k4Sc++MRAW99NZprglanjIBDabMZmtCXQZVu4P4na92epw4A==
X-Received: by 2002:a05:6122:a20:b0:526:2210:5b64 with SMTP id 71dfb90a1353d-530c893cc70mr806664e0c.9.1749026438623;
        Wed, 04 Jun 2025 01:40:38 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ad9658sm10636675e0c.18.2025.06.04.01.40.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:40:38 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87ea9ba1330so61522241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 01:40:37 -0700 (PDT)
X-Received: by 2002:a05:6102:26ca:b0:4e4:5e11:6832 with SMTP id
 ada2fe7eead31-4e746d02e4bmr961072137.7.1749026437616; Wed, 04 Jun 2025
 01:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Jun 2025 10:40:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFHKHKfymqa6jwfNnxZTAuH3kbj5WL+-zN=TR6XGd0eA@mail.gmail.com>
X-Gm-Features: AX0GCFt2fyoFoIK_LxeiOZfQp_iroUz4k9ILNbeuJExEwejZlhTah3i6hKjIVnU
Message-ID: <CAMuHMdUFHKHKfymqa6jwfNnxZTAuH3kbj5WL+-zN=TR6XGd0eA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl
 driver for PCI slots
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_014042_145752_36FF51A7 
X-CRM114-Status: GOOD (  30.64  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Marek,

Thanks for your patch!

On Sat, 31 May 2025 at 00:55, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add the ability to enable optional slot clock into the pwrctrl driver.
> This is used to enable slot clock in split-clock topologies, where the
> PCIe host/controller supply and PCIe slot supply are not provided by
> the same clock. The PCIe host/controller clock should be described in
> the controller node as the controller clock, while the slot clock should
> be described in controller bridge/slot subnode.
>
> Example DT snippet:
> &pcicontroller {
>     clocks = <&clk_dif 0>;             /* PCIe controller clock */
>
>     pci@0,0 {
>         #address-cells = <3>;
>         #size-cells = <2>;
>         reg = <0x0 0x0 0x0 0x0 0x0>;
>         compatible = "pciclass,0604";
>         device_type = "pci";
>         clocks = <&clk_dif 1>;         /* PCIe slot clock */

I assume this should be documented in
dtschema/schemas/pci/pci-bus-common.yaml, too?

>         vpcie3v3-supply = <&reg_3p3v>;
>         ranges;
>     };
> };
>
> Example clock topology:
>  ____________                    ____________
> |  PCIe host |                  | PCIe slot  |
> |            |                  |            |
> |    PCIe RX<|==================|>PCIe TX    |
> |    PCIe TX<|==================|>PCIe RX    |
> |            |                  |            |
> |   PCIe CLK<|======..  ..======|>PCIe CLK   |
> '------------'      ||  ||      '------------'
>                     ||  ||
>  ____________       ||  ||
> |  9FGV0441  |      ||  ||
> |            |      ||  ||
> |   CLK DIF0<|======''  ||
> |   CLK DIF1<|==========''
> |   CLK DIF2<|
> |   CLK DIF3<|
> '------------'
>
> Reviewed-by: Anand Moon <linux.amoon@gmail.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/drivers/pci/pwrctrl/slot.c
> +++ b/drivers/pci/pwrctrl/slot.c

> @@ -30,6 +31,7 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
>  {
>         struct pci_pwrctrl_slot_data *slot;
>         struct device *dev = &pdev->dev;
> +       struct clk *clk;
>         int ret;
>
>         slot = devm_kzalloc(dev, sizeof(*slot), GFP_KERNEL);
> @@ -50,6 +52,13 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
>                 goto err_regulator_free;
>         }
>
> +       clk = devm_clk_get_optional_enabled(dev, NULL);
> +       if (IS_ERR(clk)) {
> +               ret = dev_err_probe(dev, PTR_ERR(clk),
> +                                   "Failed to enable slot clock\n");
> +               goto err_regulator_disable;
> +       }

You are adding this block in the middle of the regulator handling.
Please move it below, under the devm_add_action_or_reset() call
(which is handled wrong, I have sent a patch[1]).

> +
>         ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
>                                        slot);
>         if (ret)

[1] https://lore.kernel.org/f60c445e965ba309f08c33de78bd62f358e68cd0.1749025687.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


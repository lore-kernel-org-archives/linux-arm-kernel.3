Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0221CCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHznA4IxR0ryi2cJoCEHN+kBwQ2XKkkZXeR8LA/d1QU=; b=ojnkdG1S8A4j8wFtmj/vkpOZK+
	ZVJLVHJNMK5OYGHGoms/DzU9kOtUvCyDcX3N1gVhHBrIoe3zkGRmNj4yo5BFW1QUrhONP32QgGWkX
	WKsePdVu+ixgRE0+zAc8YgHpl4xeSCZ5x+wuXINNQAjATtJxEhE7nawIa1/CyReH/C71QeTMLmONA
	uF9Ib8N351+Nlxd9kZOfHDjbbfjrwC/o7EObRI/rPc/tzog1S6EN1KpvZBn21VkrMGBDvoXu/ZHZH
	9caxbxjX0OCvCdLMO0uikwnM4i1FLlXOZHtp/tOEvuPYKicJsnso5h33VeNULeFtuShtXhCnvAND+
	Q6z7Ix0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvq7-00000006V7K-00NB;
	Thu, 23 Oct 2025 13:58:51 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvq4-00000006V6T-3cGy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:58:50 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54aa5f70513so230445e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 06:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227927; x=1761832727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHznA4IxR0ryi2cJoCEHN+kBwQ2XKkkZXeR8LA/d1QU=;
        b=jNYRKV+eiuLxfwFlT6bu76Rc/yjHMUIeye8pRb0SJvTDktlQ28ZnTNNpURBUHHE2eF
         haBQYIlrhn9DtFx6zYQKluug+zvSngcqvsVU2BoUmX/mBLwjPrKRR67yzA0NgPEN6UoX
         jBt7Wknv4C96SNQLAkskFj5aJpGKsWLzeH7u0pL5/L1dXstZqQFHo5+pQdE7hrhh0/ut
         6QVlenDTWjkAirqzoHSLyqqR5gklT/PpYvwFy+CyPYyOGYTDzq3HEESL1iBykrD3lffP
         Gf6olyQIOV5PxG6fhUsmXzL0R3YI7VmFMipQ6Wg/ZOWhrisPNthkpuPEPrG3SQS377Xt
         ZlQw==
X-Forwarded-Encrypted: i=1; AJvYcCUQV/nR7WEVL0Xv26/KmkkPxIC3V+TA6A0jludQ9sibOKi21fPl2FtdvOjcfWeBYkDTWPOmKdOejmV+sjYYkqW1@lists.infradead.org
X-Gm-Message-State: AOJu0YylxiVMwDPLctnOG/dR96jamq1BRO8a01D23ogqWjRBMIWk2+cJ
	7AZJY7oxJ3vKHmyQYhSbvO54Nv/rMxEL1o70Fmevjw1aXRQAqPCVJXCIPbAKikg1
X-Gm-Gg: ASbGncvQHP1O5teupgNMpLH/aVx+P/LcR1Y1WhpPk427eArUg5CTe1p6KyJl97M9wPH
	eMpIjkP5e0U8x5akPvYCHdag7UgARMhm3dOCib/O6n6FzjtvEHyQdWznHBsHTZavYmNOdbJvZtx
	zfixoQtWcX4o3JcPG0ffA4XVa4u8le1QSOz/5I2dlpk7lS5Ic2yXar0gVaHj9HRhVs1bqScc3VZ
	CZSgXCBLT8O8qkxe4LLy6O+EWedu9XLMVNF+KOcov6PcsPxiyFrn6zLS9oXFr/oT9c+zmdH7aAu
	HIBFBAcRIEjfKRvxhimdBJB8HLT8sbi1hYalT5HIUVEjdqoqDfQz+LwBslMbPfARfuBld03zA3r
	h92UMWHmNE5OVcdPpHr6A9dO8E6l/V4Yi26mCoCvlq4UG5iC0OfayvHQeM9zHzmvgYsAgBW/Exe
	tWgldu3ey+KHOIzZae/uCVaedtZinJM0r5k9H9LA==
X-Google-Smtp-Source: AGHT+IFJk9fp2hhz64Syzbeavt8mdfTFZwSf4cG0+TKbLjn4j8k2y9f2rrXA4joIz2ogk2slIvyMAw==
X-Received: by 2002:a05:6102:e11:b0:5d7:684b:cfe3 with SMTP id ada2fe7eead31-5d7dd6a5052mr7354218137.23.1761227927149;
        Thu, 23 Oct 2025 06:58:47 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bd8e5e87sm775719e0c.11.2025.10.23.06.58.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 06:58:46 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-91bdf1a4875so285665241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 06:58:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrpyde0h5eOu6bYda3P/B+E90tZtstfHterK8TnwTSeRLTBmVgXcbZLCwc1USRyFVXZqmEHlgYTLuQcWv2GjFm@lists.infradead.org
X-Received: by 2002:a05:6102:c09:b0:5db:3935:1636 with SMTP id
 ada2fe7eead31-5db393518f0mr253967137.26.1761227926239; Thu, 23 Oct 2025
 06:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251009-clk-ssc-v5-1-v5-0-d6447d76171e@nxp.com> <20251009-clk-ssc-v5-1-v5-6-d6447d76171e@nxp.com>
In-Reply-To: <20251009-clk-ssc-v5-1-v5-6-d6447d76171e@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 15:58:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-UkzLnrPpBVyMH0DtgubxE_spUYbxtpO+5dmkFFqdcQ@mail.gmail.com>
X-Gm-Features: AWmQ_bl-Wzz5qd5CCY2fSVugSIzDYGwiZQethxZEtHbYBjXjOaCfH3VbWwjwxpU
Message-ID: <CAMuHMdU-UkzLnrPpBVyMH0DtgubxE_spUYbxtpO+5dmkFFqdcQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_065849_079660_98BB8C7D 
X-CRM114-Status: GOOD (  25.90  )
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

Hi Peng,

On Thu, 9 Oct 2025 at 05:49, Peng Fan <peng.fan@nxp.com> wrote:
>  - Introduce 'clk-scmi-oem.c' to support vendor-specific OEM extensions
>    for the SCMI clock driver, allows clean integration of vendor-specific
>    features without impacting the core SCMI clock driver logic.
>  - Extend 'clk-scmi.h' with 'scmi_clk_oem' structure and related declarations.
>  - Initialize OEM extensions via 'scmi_clk_oem_init()'.
>  - Support querying OEM-specific features and setting spread spectrum.
>  - Pass 'scmi_device' to 'scmi_clk_ops_select()' for OEM data access.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/clk/clk-scmi-oem.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * The Vendor OEM extension for System Control and Power Interface (SCMI)
> + * Protocol based clock driver
> + *
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/scmi_imx_protocol.h>
> +#include <linux/scmi_protocol.h>
> +
> +#include "clk-scmi.h"
> +
> +#define SCMI_CLOCK_CFG_IMX_SSC                 0x80
> +#define SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK      GENMASK(7, 0)
> +#define SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK                GENMASK(23, 8)
> +#define SCMI_CLOCK_IMX_SS_ENABLE_MASK          BIT(24)
> +
> +struct scmi_clk_oem_info {
> +       char *vendor_id;
> +       char *sub_vendor_id;
> +       char *compatible;
> +       const void *data;
> +};
> +
> +static int
> +scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
> +                                const struct clk_spread_spectrum *ss_conf)
> +{
> +       struct scmi_clk *clk = to_scmi_clk(hw);
> +       int ret;
> +       u32 val;
> +
> +       /*
> +        * extConfigValue[7:0]   - spread percentage (%)
> +        * extConfigValue[23:8]  - Modulation Frequency

What is the unit of this?
According to the code below, it is in Hz, so it is limited to 65535 Hz.

> +        * extConfigValue[24]    - Enable/Disable
> +        * extConfigValue[31:25] - Reserved

Center, up, down, could be stored here, I assume?

> +        */
> +       val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
> +       val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
> +       if (ss_conf->method != CLK_SPREAD_NO)
> +               val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
> +       ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
> +                                                SCMI_CLOCK_CFG_IMX_SSC,
> +                                                val, false);
> +       if (ret)
> +               dev_warn(clk->dev,
> +                        "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
> +                        ss_conf->modfreq_hz, ss_conf->spread_bp, ss_conf->method,
> +                        clk->id);
> +
> +       return ret;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


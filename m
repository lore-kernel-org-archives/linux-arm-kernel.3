Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DD3CA601F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpjtofrkUDRqvSiMqlyAYlghXPAPat+XcdincmK9q5k=; b=xk0nhgtvUfvHcv5siII4oTMkSL
	xAZuVV1omobUNBUA70xl7xMHFAobx7SuDxekPKhoCejsqpHs2RRMKm8fKgYjrm3X+MUizP4T/Ekqq
	CfIWAsHB98epee8N6dxX69o5TazZ8DTYIC0smesANxcrOaqVhlF50A5uqD3yZ1tYOODqnGBILYDg1
	dZzUVFVQTLi6okBUGorplMNgY+vHXiTHmqmTAKRYPPm/6y4k8vhhrRRlMolxl4SDEw5q1HIfHwoBc
	GxKeVDlzHQMNArde/tqAhAA3yFRbrjlPt15qnjjZ73ptq+eeKTZWQPnzWzC6Ohq5YH1Q3vJtQryyf
	ua+zkCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFM0-00000006ybi-1tJM;
	Fri, 09 Oct 2026 18:30:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLq-00000006yTY-2TTa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 18:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BpjtofrkUDRqvSiMqlyAYlghXPAPat+XcdincmK9q5k=; b=Lt2X427tp1Ik7OvLKAs0ueDesF
	wUQGKjliapWWF2Pri58rUMEwS3wtEoI27OQWDZXfuJQuqepEO6hkcyvapdUqDK1v9IsqzJURe47rU
	3UfgsOOXmr1F7x3q8e5UIGx+je0vPChRmepZnQw3CzXV2oWqMYS02x5BeZx7V7xChvELquVx3xUoo
	F+9ooS6IVT0wBbJ9EzpqEl973+0Ng5E4Haid6G6tnEX5ivTOTmYZDhwBYDR5gpRyTdCO9Dp2/qlfF
	junqKf+EkrW8gVUtQptagyv1f3rA8005ZSzD8M2SosaNP8unQadstJnXnqdxbp8smPnrOxtlUhnoj
	Om/zKueg==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFFLn-0000000BWlx-3EhS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so1239495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570586; x=1792175386; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BpjtofrkUDRqvSiMqlyAYlghXPAPat+XcdincmK9q5k=;
        b=AFlBN6Xgd9pXNLNAmRaDQMui7lm78n19sfa6kcVExIKv7b+Qg+qfdhPHCyXgosjxPj
         qwEbPx1cDRjVjcPpApON6UNzRT31+D4T5kHrc7yq74TohNrKm4kkc3mzoF1K5OnID3it
         71cclOfdqAqPoI0838YH+FTmuzEP4PC/pWxBvyLpGgPg9UGAJf1drMsKhbjR/GxHGLGr
         1ypaV6cxqERzpkDG3VGi+EYVrUaMx08o5F9BAQUp7DCGI1eeYXqzyGFwj/gvXJK9Skc8
         EG9lwWuHXX8WTUHAYefBsVQXIjbCZSw4lyhGVxXw3nDrKwdz+HrfZTixwooskp69F81S
         WyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570586; x=1792175386;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BpjtofrkUDRqvSiMqlyAYlghXPAPat+XcdincmK9q5k=;
        b=VMow07PRTNqckzsMQEMMyFbQ0wQJtjGSJXqTpLeFAkCygaPT72lMps2CMXFE0K8PeM
         DzluPETQBZNcXghWMRoPH2w1Z5Q2mZHFjyqQWIIL6+X6r1DDjxf+QAYp4bJq4V9URRvy
         oqPtzz9EVMrwf+ENCuchlri5+3V17BzIjNWjOB98nT8YVBjzzeWS0ctrGCnFILOUJEhT
         u7li5Or6Y4QeohMZONDp1mSao+diQ5KkbuCRf5JK+zNVLAVtqyZqwVFv79sh7VPIQ3iU
         4vgEDmLqyZLY3ujRzRlKRlHxa2KwJH4RBvjNBxA6WY0P38AEbJ70WWkuhArCoZydWtdq
         uQFw==
X-Forwarded-Encrypted: i=1; AKwUvBxKXaRBaRQiC5MP2bdx2q/rJjz4P0ffIn85kJpW8pGixC9GzY9BxjjlfVISIE88xSle43133fQCOGTKEPm3SZgp@lists.infradead.org
X-Gm-Message-State: AFuF++lyKp3dxemScXvz81YsiHtsNUprbwfR0zJqUQIgfvDyua1P6Kw+
	DJf3ZNFHGLZMG6R+wB5UHUI4UMBN8ay6X/MX7UgI+e3R4MCX+rBOZAE9bGyhpyCL6TE=
X-Gm-Gg: AYBFou30yITRzxl0vYjNSqZ63klt+aJ6QM5qXdp8+mbWl6SucW+BEnmYZpe8DlokYe2
	e3NyqfrguOSYwOYpeqvYGkIMu3kWl5b2D1HV5YS3CpL4Bp4PaKBnVDw0imOKvbF7SM9JDQkk8Bm
	kOEVNAiCGhFpjD4Yyfs/7vkO9x24bfrxPUN41BtfSjPaf5brPc/ROK5Aie0BrRoxMMv51EyCxYI
	pMTeAskoS1EsRpQi8nbe1RIc0DdledBmP9saupnZNQql5zbUaVF6uFn87KeRJlunwRv44ZZQGwm
	AZ6Z2vQ4DvTLIHerbPVfEQB7Zwgp1aXh8+Aa52GmdKooj/1NhOoj0TZPp3kc5zIILgt1XWqS9h6
	DoXnvlMz0Gknoy3ozcmnIo6oBOo4TLE7f/RjStmudbh7I/9o5Vi0hKlc0GiRi3Q4x70mlOxYYV9
	Wfptg182MTZspB8cTQcQ93jM4/OaoxE6vAZCaRWBrOmVtnyLLUDeyN2jAWgbtgOdKkdi3NOyBkH
	nvXjUqEwCzJgKWRcA==
X-Received: by 2002:a05:600c:c165:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a18e4988ecmr56332465e9.7.1791570585690;
        Fri, 09 Oct 2026 11:29:45 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e48db03sm95749805e9.3.2026.10.09.11.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:45 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 06/11] clk: realtek: Add support for gate clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20261002074331.3066919-7-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-7-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057524.266328.4248123787670079601.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5945; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=XNzr2wNUNghrBBxT8exO2uqCTKmR32NqYT7zK1+uz7E=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaae9uxc/m6+QK2RgueRBvebz8Lz10RPbDsVbijMb
 bFoSRBrRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACYSksHwhzvIVES3Pend/cIn
 NZOPsmdNNlKbJujvIiDq0L1+IldIOMP/hGq/KXtqPh1ezP+T2/2CvdnnaxvU/RcwxFx6o1Tb7Gf
 IAgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_192947_963525_AD306806 
X-CRM114-Status: GOOD (  21.75  )
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

> Introduce clk_regmap_gate_ops supporting enable, disable, and is_enabled
> for standard regmap gate clocks. To accommodate hardware designs, the
> enable and disable operations handle a 'write_en' flag, which asserts an
> adjacent write-enable bit (bit_idx + 1) simultaneously when modifying the
> gate bit.
> 
> Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 71edc18121c6..840aff067b61 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -3,4 +3,5 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += clk-rtk-common.o
>  clk-rtk-y += clk-pll.o
> +clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
> new file mode 100644
> index 000000000000..7033aeb1cd82
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-gate.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/export.h>
> +#include <linux/regmap.h>
> +#include "clk-regmap-gate.h"
> +
> +static int rtk_clk_regmap_gate_update(struct clk_hw *hw, bool enable)
> +{
> +	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
> +	unsigned int mask = BIT(clkg->bit_idx);
> +	unsigned int val = enable ? mask : 0;
> +
> +	/*
> +	 * Hardware specific design: to modify the gate bit, the adjacent
> +	 * write-enable bit (bit_idx + 1) must be asserted simultaneously.
> +	 */
> +	if (clkg->write_en) {
> +		mask |= BIT(clkg->bit_idx + 1);
> +		val |= BIT(clkg->bit_idx + 1);
> +	}
> +
> +	return regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);
> +}
> +
> +static int rtk_clk_regmap_gate_enable(struct clk_hw *hw)
> +{
> +	return rtk_clk_regmap_gate_update(hw, true);
> +}
> +
> +static void rtk_clk_regmap_gate_disable(struct clk_hw *hw)
> +{
> +	rtk_clk_regmap_gate_update(hw, false);
> +}
> +
> +static int rtk_clk_regmap_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
> +	int ret;
> +	u32 val;
> +
> +	ret = regmap_read(clkg->clkr.regmap, clkg->gate_ofs, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return !!(val & BIT(clkg->bit_idx));
> +}
> +
> +const struct clk_ops rtk_clk_regmap_gate_ops = {
> +	.enable     = rtk_clk_regmap_gate_enable,
> +	.disable    = rtk_clk_regmap_gate_disable,
> +	.is_enabled = rtk_clk_regmap_gate_is_enabled,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ops, "CLK_REALTEK");
> +
> +const struct clk_ops rtk_clk_regmap_gate_ro_ops = {
> +	.is_enabled = rtk_clk_regmap_gate_is_enabled,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ro_ops, "CLK_REALTEK");
> diff --git a/drivers/clk/realtek/clk-regmap-gate.h b/drivers/clk/realtek/clk-regmap-gate.h
> new file mode 100644
> index 000000000000..9303adda3166
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-gate.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_CLK_REGMAP_GATE_H
> +#define __CLK_REALTEK_CLK_REGMAP_GATE_H
> +
> +#include "clk-rtk-common.h"
> +
> +struct rtk_clk_regmap_gate {
> +	struct rtk_clk_regmap clkr;
> +	unsigned int gate_ofs;
> +	u8 bit_idx;
> +	u32 write_en : 1;
> +};
> +
> +#define __rtk_clk_regmap_gate_hw(_p) __rtk_clk_regmap_hw(&(_p)->clkr)
> +
> +#define __RTK_CLK_REGMAP_GATE(_name, _parent, _ops, _flags, _ofs, _bit_idx, \
> +			      _write_en)                                    \
> +	struct rtk_clk_regmap_gate _name = {                                \
> +		.clkr.hw.init = CLK_HW_INIT(#_name, _parent, _ops, _flags), \
> +		.gate_ofs = _ofs,                                           \
> +		.bit_idx = _bit_idx,                                        \
> +		.write_en = _write_en,                                      \
> +	}
> +
> +#define RTK_CLK_REGMAP_GATE(_name, _parent, _flags, _ofs, _bit_idx, _write_en)        \
> +	__RTK_CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
> +			      _bit_idx, _write_en)
> +
> +#define RTK_CLK_REGMAP_GATE_RO(_name, _parent, _flags, _ofs, _bit_idx, _write_en)  \
> +	__RTK_CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ro_ops, _flags, \
> +			  _ofs, _bit_idx, _write_en)
> +
> +#define __RTK_CLK_REGMAP_GATE_NO_PARENT(_name, _ops, _flags, _ofs, _bit_idx,  \
> +				    _write_en)                                \
> +	struct rtk_clk_regmap_gate _name = {                                  \
> +		.clkr.hw.init = CLK_HW_INIT_NO_PARENT(#_name, _ops, _flags),  \
> +		.gate_ofs = _ofs,                                             \
> +		.bit_idx = _bit_idx,                                          \
> +		.write_en = _write_en,                                        \
> +	}
> +
> +#define RTK_CLK_REGMAP_GATE_NO_PARENT(_name, _flags, _ofs, _bit_idx, _write_en)        \
> +	__RTK_CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
> +				    _bit_idx, _write_en)
> +
> +#define RTK_CLK_REGMAP_GATE_NO_PARENT_RO(_name, _flags, _ofs, _bit_idx, _write_en)  \
> +	__RTK_CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ro_ops, _flags, \
> +				    _ofs, _bit_idx, _write_en)

Is this _NO_PARENT still used ? if not drop it

-- 
Jerome



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E13EC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZE8PM1qe5Zi/ye8KfNya6rO3zzk+s+0vKUWUZe5ySU=; b=CAYwsYdD839R32GIJXC91pOHE4
	Zh61YYcXmH8DyhRxBZ81vxXVODdPLu7F3vInxrgiLATTRo6qAxRH5vF/0dmefQpoHYidXuasdhGam
	OlmuwAI0iKr6V4FDryFGt317GudXeV3TNOBOtLKxHRCZsPVlRlgfb+/kpzEDjbpVeMF9wo4WRslIR
	CkR1sDmLWtaPeXVDupzGgGSJRIw5SvaEEmsAXf/zloHrclm2keph67PK7WhxI5CpfvsUmh988HW1n
	oFXWLh1zrqZ7nlLIMiZnnkFfRMjpSNlw4KiYdhBHLYECIo55D3oAOAoKrpdEjDZ+EJJDgk+Mri3GC
	DK5YB2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKtV-00000005K3a-1UHw;
	Mon, 13 Jan 2025 13:54:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKoD-00000005J1S-34H8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 13:48:51 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKnz-0003hG-5W; Mon, 13 Jan 2025 14:48:35 +0100
Message-ID: <e2b29bf2-1751-4cf3-b1c1-a5ae7122945d@pengutronix.de>
Date: Mon, 13 Jan 2025 14:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] clk: imx8mp: inform CCF of maximum frequency of
 clocks
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de>
 <20250106-imx8m-clk-v2-6-6aaeadac65fe@pengutronix.de>
 <104eed995f349b123e633862f68de966.sboyd@kernel.org>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <104eed995f349b123e633862f68de966.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_054849_772701_5A6021EB 
X-CRM114-Status: GOOD (  15.44  )
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

Hello Stephen,

On 07.01.25 00:42, Stephen Boyd wrote:
> Quoting Ahmad Fatoum (2025-01-06 06:21:47)
>> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
>> index 516dbd170c8a356f293621b371b9ef9b9bec90a4..3b06990b73adcb2e4807f91a8983ad35068572a7 100644
>> --- a/drivers/clk/imx/clk-imx8mp.c
>> +++ b/drivers/clk/imx/clk-imx8mp.c
>> @@ -405,6 +406,145 @@ static const char * const imx8mp_clkout_sels[] = {"audio_pll1_out", "audio_pll2_
>>  static struct clk_hw **hws;
>>  static struct clk_hw_onecell_data *clk_hw_data;
>>  
>> +struct imx8mp_clock_constraints {
>> +       int clkid;
> 
> Is it signed instead of unsigned because the terminal element of the
> array has -1 as a clkid? And because clkid 0 is a valid one?

I did use -1 originally, but then switched to zero as applying
constraints on IMX8MP_CLK_DUMMY doesn't make sense anyway.

> Please remove the comma because nothing can come after this and if
> someone were to add something after they would get a compilation error.

Commas removed and clkid made unsigned in v3.

Thanks,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


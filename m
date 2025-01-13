Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB0DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+cv/HY4ZBd31shVURaJkV2pAQUaINVh/RYy3e0oYtQ=; b=sUL0T4VvM9xBP8BuV5DRkeVssx
	55PV/oLvvOE7rTolHuX7vZKXeOFh5n35F/VHxwaMmI8etH1qc8dtVx7e00crA9cj6a83AzgMeAVhN
	X2vKocX3qA8QrFGyQOqF2llI1D2xSMXv4De/93wQ2s7W38jhzxt10QEnSHw9ue65xySa5WXwwY708
	Sv8uvWdu7ohr7DaxF8PZRscEjMpjYEsEaPlOJygsEo52fD71DeSr5cr8H9kgfzcjFxY/4CGwrznX+
	PTrf8j/JRpKYdjsVWpYrAtgGdQ/9d0T+wbc9han4F8vBZc5qHaKypcEaVDQRdP/GUaAkCZ+E40sZ3
	Gk1k7rZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKvt-00000005KZz-2Oqu;
	Mon, 13 Jan 2025 13:56:45 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKr1-00000005JWv-2yDf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 13:51:44 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKqj-0004AM-V3; Mon, 13 Jan 2025 14:51:26 +0100
Message-ID: <b447c110-067b-440c-afcc-6eb3d87b174c@pengutronix.de>
Date: Mon, 13 Jan 2025 14:51:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>,
 Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de>
 <20250106-imx8m-clk-v2-1-6aaeadac65fe@pengutronix.de>
 <Z3wHp6eLQuV9GGvh@lizhi-Precision-Tower-5810>
 <957ad153-17f3-4cb8-8878-73093a9a2724@pengutronix.de>
 <Z3wyG61QEzgCJFh+@lizhi-Precision-Tower-5810>
 <6fddfd9a-8a8c-4dae-9f74-e8019b7ed404@pengutronix.de>
 <ismbe2ne65ew2jkcoa2tmbjz2eajvuz5bxuwef3wptj7tkvqhn@norm5p52aygr>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <ismbe2ne65ew2jkcoa2tmbjz2eajvuz5bxuwef3wptj7tkvqhn@norm5p52aygr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_055143_747201_9AB5EA2C 
X-CRM114-Status: GOOD (  16.66  )
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

Hi Krzysztof,
Hi Conor,

On 07.01.25 07:52, Krzysztof Kozlowski wrote:
> On Mon, Jan 06, 2025 at 08:55:08PM +0100, Ahmad Fatoum wrote:
>> I am not sure what's the preference is though, should we have>>
>>   fsl,operating-mode = "normal" / "overdrive"
>>
>> or 
>>
>>   fsl,operating-mode = <IMX_OPMODE_NORMAL> / <IMX_OPMODE_OVERDRIVE>
>>
>>
>> Any idea? Conor?
> 
> If these are two exclusive modes (plus default), then as Frank
> suggested: use enum of strings. Imagine encoding enum of 10 values with
> bools as you did: that would be enourmous oneOf condition or if:then:.
> 
> Preferred is strings, but numerical values are also accepted.

Ok, I went with strings for v3. Thanks

@Conor, as the binding changed I've dropped your Ack from v3.

Thanks,
Ahmad

> 
> Best regards,
> Krzysztof
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


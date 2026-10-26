Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B369E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bi4BFMnR;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=RqW5HTEa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VFODzkL0uZKqAQNJlwuJ0urPIasvytjg0AYOEPZU5zo=; b=Bi4BFMnRZhcKsr
	a201eo8dHJZDwzKyfQhp0szQSihPtS7alSo3rVri3oqDUqJRu+4KifcQUb0Ug97XeEnNIFLEl8QNs
	s1wFxLE/IngPD6ebfCKSNrCVbXzn/JwGH2OuRU2j4AOHJJMD1pOOkj+RXPM7f7T5DY/grCbjQcsTR
	2CHnCb/AfHz/OJ0lcvv0iczNTUbeEJLJ0k/TcA3F2YkIzKLQWzXy9EeNB/6G5wlhWjrVB/x203BxN
	BB5P1f4MNU5pPa00vKa6UjZHnIC2SeDhxNVqmROA9jnly+xwbRCwmLCa87YyTLfQWLr9yd2tA3r5O
	fr1gw9CxH2UOpjdDo+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH7e-00000002594-1AKi;
	Mon, 26 Oct 2026 09:36:06 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH7Y-00000002584-2rl9;
	Mon, 26 Oct 2026 09:36:04 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261026093555euoutp02a4f8ef91b3aa86db8377679f1fea21f3~iCrCSbcTY2220622206euoutp02z;
	Mon, 26 Oct 2026 09:35:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261026093555euoutp02a4f8ef91b3aa86db8377679f1fea21f3~iCrCSbcTY2220622206euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793007355;
	bh=VFODzkL0uZKqAQNJlwuJ0urPIasvytjg0AYOEPZU5zo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=RqW5HTEaNhWXEMVANk/YHAMMX8/dwCZWph+Ca2yKfPmYIy8BFS4/U4C9twdIr+UeX
	 QQj7izTKUN4zPTGhk2FSTcJXvoitoLuZSmFW4i2VhBoIqOo++UzmfaAXt+zaWlDO3D
	 8dN0UXbMVG/fgniVdQCdj/JaK1o4NscJjHJA/erI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261026093554eucas1p27ee3526a6b2fdb9f2c6c35e69ac09fe9~iCrBitmg73152231522eucas1p2n;
	Mon, 26 Oct 2026 09:35:54 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026093552eusmtip250daa3502a30759f756704eb1d885faf~iCq-4FCDh0127501275eusmtip2b;
	Mon, 26 Oct 2026 09:35:52 +0000 (GMT)
Message-ID: <3aee23e0-1a9e-4649-b9ac-72012f9feaa6@samsung.com>
Date: Mon, 26 Oct 2026 10:35:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/21] phy: starfive: Add jh7110-inno-hdmi-phy driver
To: Vinod Koul <vkoul@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner
	<heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Brian Masney
	<bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <asEQPf-oKbt_DSp3@parshuram>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261026093554eucas1p27ee3526a6b2fdb9f2c6c35e69ac09fe9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260929103245eucas1p1349d00810646fbf0149f1361534c23ac
X-EPHeader: CA
X-CMS-RootMailID: 20260929103245eucas1p1349d00810646fbf0149f1361534c23ac
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20260929103245eucas1p1349d00810646fbf0149f1361534c23ac@eucas1p1.samsung.com>
	<20260929-jh7110-clean-send-v5-19-82b4d8e3c6c7@samsung.com>
	<asEQPf-oKbt_DSp3@parshuram>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_023601_325714_EC5BAE9A 
X-CRM114-Status: GOOD (  20.19  )
X-Spam-Score: -3.1 (---)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/3/26 16:25, Vinod Koul wrote:
> On 29-09-26, 12:31, Michal Wilczynski wrote:
>> Add the HDMI PHY driver for the StarFive JH7110.
>>
>> This driver binds to the starfive,jh7110-inno-hdmi-phy node and
>> gets its regmap from the parent. It has no dependencies on voutcrg, only
>> on its reference oscillator (xin24m), which breaks the probe-time
>> circular dependency.
>>
>> This driver provides two main functions:
>>  - Clock Provider: It registers clk_ops to provide the variable pixel
>>    clock. The .set_rate operation configures the Pre-PLL registers
>>    (0x1a0+) based on the requested rate.
>>
>>  - PHY Provider: It registers phy_ops for the controller. The .power_on
>>    op configures and enables the Post-PLL and other analog blocks (BIAS,
>>    LDO, Serializer, etc.).
>>
>> The clock ops reach registers in the window shared with the HDMI
>> controller, and access to that window is gated by the controller's
>> system clock, which only the sibling controller driver holds. The clock
>> framework walks every registered clock regardless of which drivers have
>> bound, so deliberately do not implement .is_prepared, which lets the
>> framework fall back to the software prepare count, and return the cached
>> rate from .recalc_rate whenever the clock is not prepared. Without this,
>> clk_disable_unused() reads a PHY register with that clock gated and the
>> resulting stalled bus transaction wedges the CPU hard enough that it
>> stops responding to NMIs. It is reproducible by building the bridge
>> driver as a module so that the controller has not bound by then.
>>
>> The JH7110 instantiates the same Innosilicon IP as the Rockchip RK3328,
>> with the PHY register block shifted by 0x100 because it sits behind the
>> HDMI controller in the shared register space. The pre-PLL programming
>> therefore comes from the common Innosilicon helpers; this driver adds
>> the JH7110 pixel clock table, the post-PLL and the analog configuration.
>>
>> Co-developed-by: Dominique Belhachemi <db@domibel.de>
>> Signed-off-by: Dominique Belhachemi <db@domibel.de>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/phy/starfive/Kconfig                |  20 +
>>  drivers/phy/starfive/Makefile               |   1 +
>>  drivers/phy/starfive/phy-jh7110-inno-hdmi.c | 582 ++++++++++++++++++++++++++++
>>  3 files changed, 603 insertions(+)
>>
>> +						 STF_INNO_TMDS_D1_DRIVER_EN | \
>> +						 STF_INNO_TMDS_D0_DRIVER_EN)
>> +
>> +/* REG: 0x1b4 */
>> +#define STF_INNO_LDO_CONTROL			0x1b4
>> +#define STF_INNO_LDO_ENABLE			(BIT(2) | BIT(1) | BIT(0))
>> +
>> +/* REG: 0x1be */
>> +#define STF_INNO_SERIALIER_CONTROL		0x1be
>> +#define STF_INNO_SERIALIER_ENABLE		(BIT(6) | BIT(5) | BIT(4) | BIT(0))
>> +
>> +/* REG: 0x1cc */
>> +#define STF_INNO_RX_CONTROL			0x1cc
>> +#define STF_INNO_RX_ENABLE			(BIT(3) | BIT(2) | BIT(1) | BIT(0))
>> +
>> +/*
>> + * These tables are copied from the monolithic driver.
>> + * They match the Rockchip PHY driver tables.
>> + */
>> +
>> +struct post_pll_config {
>> +	unsigned long tmdsclock;
>> +	u8 prediv;
>> +	u16 fbdiv;
>> +	u8 postdiv;
>> +	u8 post_div_en;
>> +};
>> +
>> +static const struct inno_hdmi_phy_pre_pll_config pre_pll_cfg_table[] = {
>> +	{ 25175000, 25175000, 1, 100, 2, 3, 3, 12, 3, 3, 4, 0, 0xF55555 },
> 
> lower case hex values, here and everywhere else please


Sure will fix this.

> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FE8606A901
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EFnr26kE;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=XcJht3bK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0yf/VBr9PgSD2TLcROBoj1QltxuNWALI4+9T58rMh/k=; b=EFnr26kE12c8Pb
	KE/eOh7YkR/ZyH8sR7QABHEaVt4OwX3stvtyGe+dTJgbb3tuUg/Oq895mKnTSSWUiadfHQqnHG7Cv
	ZKazEew2J0wno2XGugsGkV7jJwWKeFPKHaTUNC5VFOrWfYCu9C0hYAA05QwNWCYl1qrD5ZR4zFNR2
	5PdaG0Yua+D5d/PWaZKu7wKZL0T75jUVARratxO4xDamsAaUDD3UNfKViAyq1J2x/jYwerXWXYa+Y
	jeU8s0MFhpz2QmVGZ6HXnxgPtcvp8+/CKxsEjUsRHp+HhtuPRNq3Qm6gZ9alg4kPRe0IgBHz8FYck
	eUTsn8J8eotqbqzN1jYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw19-00000008mH0-1dRO;
	Thu, 05 Nov 2026 11:52:31 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw14-00000008mFk-4AsT;
	Thu, 05 Nov 2026 11:52:30 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261105115223euoutp02401577e35fde163e971d044c1a1e6b40~lI-CoNlxl3120631206euoutp023;
	Thu,  5 Nov 2026 11:52:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261105115223euoutp02401577e35fde163e971d044c1a1e6b40~lI-CoNlxl3120631206euoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793879543;
	bh=0yf/VBr9PgSD2TLcROBoj1QltxuNWALI4+9T58rMh/k=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=XcJht3bKEcPNl4tHHo0odfzx0/lNUxBnLjQzrpY0jOOiwxhPsGfsqK6zkDMziJeFv
	 Qa9BFEFIB6kRiXQpuLwEsLm8qIDP6PxCFVDC8Rd63QgkFyuflwg44q2A6q0CQBu/OW
	 9hsCh/wnbjl4C3owfDiOalFk4sUorY1dq/NYOu7o=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261105115222eucas1p13e1fdfcf650934bf98ae67a9ceba38a7~lI-B4ePgq1887918879eucas1p1B;
	Thu,  5 Nov 2026 11:52:22 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261105115220eusmtip1dbbc5e03d0addbdca200fe0d0fffba71~lI-ANWOBC0047900479eusmtip1V;
	Thu,  5 Nov 2026 11:52:20 +0000 (GMT)
Message-ID: <54a2c7d1-f8d4-425e-966c-ae11ca03e13c@samsung.com>
Date: Thu, 5 Nov 2026 12:52:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/18] drm/bridge: inno-hdmi: Allow the register map
 to come from a parent
To: Heiko Stuebner <heiko@sntech.de>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
	<hal.feng@starfivetech.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Andy Yan
	<andyshrk@163.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Yakir Yang <kuankuan.y@gmail.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Conor Dooley <conor@kernel.org>,
	William Qiu <william.qiu@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Sandy Huang <hjc@rock-chips.com>, Manivannan
	Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, Byron Stanoszek <gandalf@winds.org>, OOHehir
	<oo.hehir@gmail.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <3194397.687JKscXgg@phil>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261105115222eucas1p13e1fdfcf650934bf98ae67a9ceba38a7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029075407eucas1p1c9b0d887cafa4c3c10bb34fa3ef3c4b7
X-EPHeader: CA
X-CMS-RootMailID: 20261029075407eucas1p1c9b0d887cafa4c3c10bb34fa3ef3c4b7
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
	<CGME20261029075407eucas1p1c9b0d887cafa4c3c10bb34fa3ef3c4b7@eucas1p1.samsung.com>
	<20261029-jh7110-clean-send-v6-9-759594e43acf@samsung.com>
	<3194397.687JKscXgg@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_035227_629625_E4C8F1F5 
X-CRM114-Status: GOOD (  24.06  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/30/26 19:01, Heiko Stuebner wrote:
> Am Donnerstag, 29. Oktober 2026, 08:53:43 Mitteleuropäische Normalzeit schrieb Michal Wilczynski:
>> On some SoCs the HDMI controller does not own its register window. The
>> StarFive JH7110 documents one 64 KB block, u0_hdmitx, that holds both
>> the controller and the PHY, so the parent device maps it and owns the
>> regmap while the two children share it.
>>
>> Use a regmap supplied by the parent device when there is one, and keep
>> mapping our own resource when there is not, so platforms that own their
>> register window are unaffected.
>>
>> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
>> Tested-by: Byron Stanoszek <gandalf@winds.org>
>> Tested-by: OOHehir <oo.hehir@gmail.com>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/gpu/drm/bridge/inno-hdmi.c | 31 ++++++++++++++++++++++++++++---
>>  1 file changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
>> index 222f6522844ee60ae9a07ab2dcca748dbf7403e4..a8905bf627a224d7e3918514195f1810164dc26f 100644
>> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
>> @@ -397,6 +397,7 @@ struct inno_hdmi {
>>  	struct clk *pclk;
>>  	struct clk *refclk;
>>  	void __iomem *regs;
>> +	struct regmap *regmap;
>>  	struct regmap *grf;
>>  
>>  	struct inno_hdmi_i2c *i2c;
>> @@ -470,11 +471,25 @@ static int inno_hdmi_find_phy_config(struct inno_hdmi *hdmi,
>>  
>>  static inline u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
>>  {
>> +	u32 val;
>> +
>> +	if (hdmi->regmap) {
>> +		if (regmap_read(hdmi->regmap, offset * 4, &val))
>> +			return 0;
>> +
>> +		return val;
>> +	}
>> +
>>  	return readl_relaxed(hdmi->regs + (offset) * 0x04);
>>  }
>>  
>>  static inline void hdmi_writeb(struct inno_hdmi *hdmi, u16 offset, u32 val)
>>  {
>> +	if (hdmi->regmap) {
>> +		regmap_write(hdmi->regmap, offset * 4, val);
>> +		return;
>> +	}
>> +
>>  	writel_relaxed(val, hdmi->regs + (offset) * 0x04);
>>  }
>>  
>> @@ -1101,9 +1116,19 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
>>  	hdmi->dev = dev;
>>  	hdmi->plat_data = plat_data;
>>  
>> -	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
>> -	if (IS_ERR(hdmi->regs))
>> -		return ERR_CAST(hdmi->regs);
>> +	/*
>> +	 * On platforms where the controller shares a register space with
>> +	 * other blocks, the parent owns the regmap. Fall back to mapping
>> +	 * our own resource where it does not.
>> +	 */
>> +	if (dev->parent)
>> +		hdmi->regmap = dev_get_regmap(dev->parent, NULL);
>> +
>> +	if (!hdmi->regmap) {
>> +		hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
>> +		if (IS_ERR(hdmi->regs))
>> +			return ERR_CAST(hdmi->regs);
>> +	}
> 
> why can't you just also use a mmio regmap here? Because with this change
> the driver now has 2 competing register interfaces and you need those
> conditionals all the time.
> 
> Just convert the existing user to also use a regmap please.

OK. In v7 inno-hdmi will use a regmap.

Parent's where one exists, and otherwise a devm_regmap_init_mmio()
covering its own resource. hdmi_readb()/hdmi_writeb() can then drop
the conditionals.

That also switches rockchip hw from readl/writel over to regmap. I
can only build test those two so a Tested-by from anyone with the
actual hardware would be appreciated.

> 
> 
> Heiko
> 
> 
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>


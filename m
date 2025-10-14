Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76721CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMNRHWzye4fEMo9V9I/sy/z7Qj73KleUZOXSTbXOCDY=; b=fjvq1004LjU7c3rIFC92lhOMca
	yS2Sbg0RQvY6cM1bSiynWcs/89KdPGnZKVGM+2XVBc1zO77AR6ZdqAWLeeU0X723X05nz6EpB4mZ0
	rPT0M+76IbLpfkPjanlXkiMveKWSDpy+99XEPu1HlvMByZnBQ4Iv340t2wyOYQEezLeY2SEEg9FpH
	Tc/oQxjr/oa4WDEJQfsqaymx8bogYIuiJZaE1r+MESKxKaCMGhsN+8W1v1CqkrmIBf9o5fVlE4vp5
	wq39o6Ij/E8JlHoA0QmJwTKOoY6LYqmWrr0ouLQFEwE3V5SBJjt2CFMUKslqs0tSAGeAHgFQBnS5W
	sNwzfRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dYV-0000000G9nr-0aof;
	Tue, 14 Oct 2025 11:51:03 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dYS-0000000G9mv-269Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:51:01 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmCGQ5CZ8z9v76;
	Tue, 14 Oct 2025 13:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760442654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMNRHWzye4fEMo9V9I/sy/z7Qj73KleUZOXSTbXOCDY=;
	b=GkKchx0uTTywibaUYUiB+jQ38OtMwd5KzWk2aYmnsNgQA/Y4KpKEKjkdyjR4C3lrai8Wtk
	LvrLhKtNXi35a7GonWkGgufct3sKyf88x6VCa8crFg2ivGJ9Z5E3OvUSxH3dI22msLU5UK
	honVKVFvi3iHnyOwkJSZ7FWsgGE/v7Qp7KmSyjAa4wmB0Kd+DYRJvTD7fXNjYamZVRw3HP
	Ygmc+P/IVHWHWhNu/T6YV9ugjiUV+3Y6IyB7wMaQR1SPIGHS/3goO9svCA1JdxwDq3Yrok
	TivZmFIyTcSM9/Ojpd5d23gveoEx3oaiBnrW6t06pWdcu662FRUM/CghJRoJXA==
Message-ID: <932b3d3f-534e-4b9b-b85b-5886c3f59c22@mailbox.org>
Date: Tue, 14 Oct 2025 13:50:49 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 02/39] drm/imx: Add i.MX95 Display Controller DomainBlend
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-3-marek.vasut@mailbox.org>
 <aO0rBBzI3cGWzO34@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO0rBBzI3cGWzO34@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 997ncizbotjz3d8tasincds5jn7nnqa3
X-MBO-RS-ID: f823ad7086e9524dd23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_045100_707238_0E540EDB 
X-CRM114-Status: GOOD (  16.58  )
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

On 10/13/25 6:38 PM, Frank Li wrote:

Hello Frank,

>> +#define STATICCONTROL				0x8
>> +#define  SHDTOKSEL_MASK				GENMASK(6, 4)
>> +#define  SHDTOKSEL(x)				FIELD_PREP(SHDTOKSEL_MASK, (x))
>> +#define  SHDLDSEL_MASK				GENMASK(3, 1)
>> +#define  SHDLDSEL(x)				FIELD_PREP(SHDLDSEL_MASK, (x))
> 
> Can you keep bit fields as consistent order,  from 31..0 or 0..31.

I sent a separate fix for that, so it can go in before these patches:

[PATCH] drm/imx: dc: Sort bits and bitfields in descending order

[...]

>> +static const struct dc_subdev_info dc_db_info[] = {
>> +	{ .reg_start = 0x4b6a0000, .id = 0, },
>> +	{ .reg_start = 0x4b720000, .id = 1, },
>> +};
> 
> Not sure why need map register address to id? Does graphic link or use
> dt cells pass it as argument.

The display engine component (de) does use it to figure out which 
matching domainblend component (db) to access , since there are multiple 
instances of each.

Is there anything I should change ?

>> +static inline void dc_db_alphamaskmode_disable(struct dc_db *db)
>> +{
>> +	regmap_write_bits(db->reg_cfg, ALPHACONTROL, ALPHAMASKENABLE, 0);
>> +}
> 
> This helper function just write value to one register, not helper much
> at all.

I agree, but it also makes dc_db_init() a bit more readable, so I don't 
think inlining this is going to improve the driver much.

>> +static inline void dc_db_blendcontrol(struct dc_db *db)
>> +{
>> +	u32 val = PRIM_A_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
>> +		  SEC_A_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
>> +		  PRIM_C_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
>> +		  SEC_C_BLD_FUNC(DC_DOMAINBLEND_BLEND_ONE);
>> +
>> +	regmap_write(db->reg_cfg, BLENDCONTROL, val);
>> +}
>> +
>> +void dc_db_init(struct dc_db *db)
>> +{
>> +	dc_db_enable_shden(db);
>> +	dc_db_shdtoksel(db, SW);
>> +	dc_db_shdldsel(db, SW);
>> +	dc_db_mode(db, DB_PRIMARY);
>> +	dc_db_alphamaskmode_disable(db);
>> +	dc_db_blendcontrol(db);
>> +}
>> +
> ...
>>
>> +struct dc_db {
>> +	struct device *dev;
>> +	struct regmap *reg_cfg;
>> +	int id;
> 
> where actually use this id?
Please see dc_db_bind() .

I will be handling the rest of the feedback on this series piece by 
piece, thank you for your input.


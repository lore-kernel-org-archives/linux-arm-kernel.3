Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5E2CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 17:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yvcra83KqAtjzan9YfLxcRGbh7hLfnp0iWgeFUv/vLM=; b=GZGePDfw7ttJjPs42oQcqW2g3N
	DNZmZXF9oqSoDP8kez0oQmU76ra5gweIJtayhVqzlkAuEW5MHwxLQZWQf45rD2jUEYsI4p69dnX5v
	PoZZ7xpFoyi+vaTWWEy5Tr+zZtIemKRzo3u6NNEvVYEWJNRNidFZN7Dk3JNJ++Iy10m4Q8d3jpAyZ
	j7w4XPbuV96o6A3NQNPL7ap7aRF5ZLAth4WYCb+S3/QNlNaci8pwhSa5O74BOidXzgdOMe/jLvSwV
	A70GlbXs2F5Qots+vVgfZNw69Dcv3ntoaSsCPGwu9UBBuUk40bOKbaSf440vlsH2DDA6vieIN2aiN
	TraioAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFbg1-00000008gRZ-3gNQ;
	Sun, 02 Nov 2025 17:15:37 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFbg0-00000008gQK-0rZF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 17:15:37 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d01ZD6v3Tz9slM;
	Sun,  2 Nov 2025 18:15:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762103733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yvcra83KqAtjzan9YfLxcRGbh7hLfnp0iWgeFUv/vLM=;
	b=v3olOY/+S43PgZ9sly6XeJ1t0BL0X1kTGqmKwACZXIjXTLKeL+5+kvcV/OEN4BCDEjlNvd
	XHY//vVJgwf3llsBggueCMWpJUdtplR1Jj9yn2y74Re6lwDIKMhmnMUr0sQSic67IT62yZ
	gTNdo9WnNf1/z6G7oA6OYK2e3n7ieAt6d1V3/uQlllhRbTflMMrB+c1oEQTHtloYE9UDmP
	pu4V6OHmWFLUAKVHqVKLXgGnfcg7nyrhMc/0xY0cXHo24xUPf+MGUXY+vaCUQ+1HcupTnn
	SW0jYPlVjgbRrbjfKpXMFDNP+VPFfE4meoaSfwXjX4fV+FEb1iNBqdp3Q+jQSA==
Message-ID: <55d44163-4f37-462f-b860-c862cb5ada5a@mailbox.org>
Date: Sun, 2 Nov 2025 17:59:48 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251017154029.105099-1-marek.vasut@mailbox.org>
 <dc4b1b65-542f-4bd2-bd91-af3fe4223b63@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <dc4b1b65-542f-4bd2-bd91-af3fe4223b63@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: owwnz8df3ensc6z3bmdy7xxp57c41417
X-MBO-RS-ID: 6daf2627d9b070bd268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_091536_392383_6FBFB023 
X-CRM114-Status: GOOD (  12.20  )
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

On 10/20/25 8:21 AM, Liu Ying wrote:

Hello Liu,

>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>> @@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
>>   };
>>   
>>   struct fsl_ldb_devdata {
>> -	u32 ldb_ctrl;
>> -	u32 lvds_ctrl;
>>   	bool lvds_en_bit;
>>   	bool single_ctrl_reg;
> 
> single_ctrl_reg can be dropped then, as it can be expressed by failing to
> get the second register.
> 
> Furthermore, with this done, lvds_en_bit is the only member left and hence
> struct fsl_ldb_devdata can also be dropped, as IIRC there is no need to
> use a structure for device data with only a flag.
I plan to add more bits into the driver match data when adding the MX95, 
so I would like to retain these instead of removing them and the adding 
them back.

The rest is fixed in V2, thanks !


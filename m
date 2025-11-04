Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A236ACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 03:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUWrGCIw/Zv/GiBWLpRt2ws57Kzc9dYmqq3QLQpmDF0=; b=1jn2js9WgyjGNunLUYwu+7vtyQ
	hunyGBL95m7Lver7kVIubnLvOH+zC4w+OMbbqIfJikygAgGp6iuFxoPUdwxGQUX3tgkBH0giN1KQP
	LlxoLMoXNllRNivjx6XysvpunHui9yqm8g9JTNeJfz/92eaq5TcFLQbB9DR5KsJTZgzFGF8qbCJyr
	P31AW7jo5AZkIvBSKy3/UAiJDYM4B3Nal6g3U0XytZXY4Olqt5iQAD+FJ9cyVLsiwI/PXf5Xp1sor
	hF46S/v8SaF3hBmY70cqpctHuMaMZC5szthv2qm7sXDeddMqlXua0dVMS1CZHTxZHsE3w4eJxnN+b
	OPeeXJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7Wo-0000000B2dF-3toC;
	Tue, 04 Nov 2025 03:16:14 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7Wg-0000000B2a2-47k5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 03:16:12 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d0trg01jkz9t7v;
	Tue,  4 Nov 2025 04:16:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762226163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iUWrGCIw/Zv/GiBWLpRt2ws57Kzc9dYmqq3QLQpmDF0=;
	b=oVpSfSU6aBjiyCMFJCNiSJAYhCK/qIKz2+5F9D3Q6FPRvG6MFF25OZG2peWBVcVjOK79BI
	tHEnnZR3FBlsu/bFebgxtqt2is3u3/5r5pbqqhffMBp9dvT8OnMaYnZ8UR45Qa1ioo48AX
	KeL47JJyZmjQxXDSk7IIW4IFniiaDptn3qqRnKQcItpwSoETVzsDuvBGMzZjmFAcny/yXL
	fAFfxPt4ISSOPcXxgZwQayiJSF03C/wc8gMnRIuKFshp5cYkN3AN5T+3UrK2yOzPEGm5p9
	4opGreAxNbSre/FKzOjEa+4HXzbOH/8CU238yCkJ5LXzlVocKZ9HRADAKGSFmg==
Message-ID: <0c4bb240-6f5d-46c2-8a0d-7446ad3a9d31@mailbox.org>
Date: Tue, 4 Nov 2025 04:13:14 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/bridge: fsl-ldb: Parse register offsets from DT
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
References: <20251102170257.65491-1-marek.vasut@mailbox.org>
 <4beeffe0-6ae4-4039-9904-3ec318533a1d@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <4beeffe0-6ae4-4039-9904-3ec318533a1d@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 34add6b3791a6021810
X-MBO-RS-META: ntjcfwefoenphcqto837dnsga9k76u5n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_191607_174699_EDD521CE 
X-CRM114-Status: GOOD (  15.11  )
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

On 11/4/25 3:39 AM, Liu Ying wrote:

Hello Liu,

>> @@ -61,24 +62,13 @@ enum fsl_ldb_devtype {
>>   };
>>   
>>   struct fsl_ldb_devdata {
>> -	u32 ldb_ctrl;
>> -	u32 lvds_ctrl;
>>   	bool lvds_en_bit;
>> -	bool single_ctrl_reg;
>>   };
>>   
>>   static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
> 
> As I pointed out in v1 comment, this patch should remove struct
> fsl_ldb_devdata.

The lvds_en_bit is still needed , and I plan to add MX95 support here, 
which would extend this again. Going back and forth makes little sense.

[...]

>> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>   	fsl_ldb->dev = &pdev->dev;
>>   	fsl_ldb->bridge.of_node = dev->of_node;
>>   
>> +	/* No "reg-names" property likely means single-register LDB */
>> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
> 
> You don't need to match reg-names.  Instead, just call of_property_read_reg()
> twice to get the first reg and the second reg by passing indexes 0 and 1 to it.
> If the second reg is not found, then set fsl_ldb->single_ctrl_reg to true.

This wouldn't work if the two entries were ordered the other way around 
in DT, i.e. first "ldb" second "lvds" and vice-versa. That's why 
properties with multiple values also have the -names property that goes 
with them.


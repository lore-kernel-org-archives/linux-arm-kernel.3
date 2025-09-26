Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B8CCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yd4Mx+jNOSdf6VCUIn0E+aIjOManxtZgx8FZ6L3wTIs=; b=kxyxZdXHosCBS3XBz3nGyWmAhn
	mPtO/HbIhRd3p4YklaKjtjKC/AC8RfrmG8Gt+/ezQacQUqKlr11sBTZO/xjYMQn4hGNAfqHDZRBzh
	0I8YCbRPE8EexW/5968v6Yqhq44ffTI100elzKYOOBp3tu1bJ5QmckwQALXvJacwf1wuea858TVkT
	EjgXhUbyIlaFrzT9ewiERszopB8VGnjQsqBc53AkEAz1X/kqSB86oDHqMSs34pBuWbbyfWCcZTC2J
	G6OyICxCo9++F+jUOEhToo7YmswTDWMpCtQQ0n6C5cijuPsN1AB7Old5NJs5wQ/2Lv5fq1Wg9Do7V
	XW/a4Qww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28ZI-00000001ayX-2gGx;
	Fri, 26 Sep 2025 13:33:00 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28ZG-00000001awQ-1wWk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 13:32:59 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cYBNP0pt7z9tNq;
	Fri, 26 Sep 2025 15:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758893573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yd4Mx+jNOSdf6VCUIn0E+aIjOManxtZgx8FZ6L3wTIs=;
	b=wUyAiw6MOzMV6zf7lkEjnsjt+tRDVO6Ao57dGOEZTYgFMcEL65ECbBvEI/2WXzr8uXZO/W
	v1BEdJa66C9cq0i+QiS09TuaR84YYZxSmSI1HtIB8vuGqw44LAPcDzA2JmqeWZgYi7zuWl
	2PQUufCxWo1oDAu+Tauj9BxOqDiz1NehzBWN6FfwIUcPP6nXLE9FPI432+sKnK2vXSc+Lh
	JThwcs9VHk+BV24T7GI9J6u3hNVRYSFxLE3dwCJqdFHoGs20mIxI5u6lj1ppRuodwF0Rgw
	FSwRL4iQ3sdvK7EJAPupK1+g28EiZJfgoJeAYplUjKj4fxnq/UQcF4SmTbxLeQ==
Message-ID: <32fffaad-7738-4fa6-80cc-2f8eba7ca099@mailbox.org>
Date: Fri, 26 Sep 2025 15:32:46 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, peng.fan@nxp.com, robh@kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de
References: <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
 <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
 <aMrDKkIoZvAlBD8d@oss.nxp.com>
 <609113fa-6af3-4e7e-b47a-45b3152d8581@mailbox.org>
 <aNZaatnVRRkaPrnD@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aNZaatnVRRkaPrnD@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 39f223dbff010fb2613
X-MBO-RS-META: 7t9f5dx43crya5tca76ssnuhq4bazs8u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_063258_634429_7223723E 
X-CRM114-Status: GOOD (  11.86  )
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

On 9/26/25 11:18 AM, Rain Yang wrote:

Hello Jiyu,

>>> as the 0x4d810008 is a write-once register and whose operation has been moved into the SM side,
>>> so please drop the reset change.
>>> can you also change the label of the gpu node from gpu to mali like "mali: gpu@4d900000",
>>> as the internal driver use mali label to control the thermal up/low limitation.
>>
>> I updated all of the AHAB container, imx-oei and imx-sm components, and the
>> reset controller is no longer needed indeed.
> 
> thanks, please update the gpu node label if possibly.

Which label do you refer to, and which one would you prefer to have there ?

>>> BTW, does the dynamic frequency work well on your side so far with perf domain?
>>
>> How do I test that ?
> 
> cat /sys/kernel/debug/clk/gpu/clk_rate, although its name in dts is core.
> it is an read-only scmi-clk.
> the clk rate should be fixed, as it can be changed only via scmi_perf in i.MX95.

Right now, it is indeed fixed at 1 GHz .

-- 
Best regards,
Marek Vasut


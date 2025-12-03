Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA08D1CDAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 23:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhbIniuuQ8q9UC/1DMXWkUeaOYHzbOf3+bWM0K6h1U4=; b=GvazDg0t683OS74NkUqAlx44Zg
	9KR6+uRPZwjPAy/qvJIg+d8pS1lK11C6NwwKYkbZiGylvWiNqPUtZGTI9RsQcT8eELuvMG+JQjAk8
	T2IZT9wKVVCVPiGHkjpQSwqjxj11lm4SyGFyze+tI5hDSAVVL9Q0+H2lAyiHaDzM57N945RNjfWqe
	5wnPtPILL//xRAPVNTyK3ve+lixG5G1Uuy/yIQUc+ZZ39sWiT7HyA5dq+n1PjpMbYI9Kt07KbZEZH
	d3LGcAQFbF6F4zPcBMz9O3tlGvQa5igMKNPejg+r+oeOCBShtQIWXyJzwAovSpQh0dK94VD39qWjo
	DaeIWIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQvxK-00000007EyV-3z8z;
	Wed, 03 Dec 2025 23:08:18 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQvxH-00000007ExL-2vy3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 23:08:17 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dMCwl2v9zz9t76;
	Thu,  4 Dec 2025 00:08:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764803287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhbIniuuQ8q9UC/1DMXWkUeaOYHzbOf3+bWM0K6h1U4=;
	b=nbEGxyCOb3HmOL4l2MsuEepS/Id3XB4doMq1lwF8cU+xf/nFSP0C4LYRzqxfLS+RPoBSos
	qsMuX8TjJULqq0KutPxWtRu40WNQZG3vVvYhMPJ9gD6/iLKTeHLsFqtTgkpQXiqIPKvGd/
	+11VZzVGyOBysEHOgqoyFFS9IHyzrN6vNqc2YRsTflkqP9KfhMkm8H8DHF/JOXkSeAANs1
	aS4g2PX3myIUdEwic9pECgnOTrxmMtBhVmT7WY7rO2XkJpL0wDldYKG2UtO0QtVj3hXPUd
	yvC8qbd/+v6JLOe85ePJiVxylyWWTfjiVC+hCm3jnGpGsoqD5bAeNjtrbTDN0A==
Message-ID: <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
Date: Wed, 3 Dec 2025 23:48:47 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
 <aS-lEibp3zTsaR6T@oss.nxp.com>
 <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
 <aTACuRjC_Zpf8IOU@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aTACuRjC_Zpf8IOU@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: x987gmirsy6ignztfudnbw9cyynizgmp
X-MBO-RS-ID: fe6a6a95bcbf618ab1e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_150815_884443_41AE713B 
X-CRM114-Status: GOOD (  16.87  )
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

On 12/3/25 10:28 AM, Rain Yang wrote:

Hello Rain,

>>> Thanks for integrating this downstream patch.
>>
>> Which downstream patch do you refer to ?
>>
>>> Please note that CLK_GPUAPB and CLK_GPU are
>>> always-on, so the commit message should be amended accordingly.
>>
>> The GPU clock do not seem to be always-on, neither do the GPUAPB . It seems
>> the SM can turn those clock off perfectly well.
>>
>>> Additionally, the IMX95_CLK_GPUAPB handle shall be removed, as there is no valid OPP entry
>>> in the frequency table, this also helps minimize differences between downstream and upstream,
>>> reducing maintenance effort.
>>
>> Downstream kernel forks are not relevant to this discussion, upstream your
>> content and then you won't have to spend maintenance effort on downstream
>> stuff.
> 
> This patch [1] was the reference point.

Sigh ... I was not aware of that one.

Maybe next time, it would be good to upstream these changes directly ?

> For the Linux working environment,
> CLK_GPU and CLK_GPUAPB are always-on, while CLK_GPU_CGC can be gated off.
> 
> Regarding the IMX95_CLK_GPUAPB handle, my suggestion was based on the absence
> of its frequency in any OPP entry within the frequency table. Removing it
> could simplify the OPP handling logic and reduce unnecessary complexity.

If the clock can be disabled by SM, Linux has to make sure they are NOT 
disabled, so they must be described in DT, right ?

> [1] https://github.com/nxp-imx/linux-imx/commit/695f2bdc57b869ca5189313e4b5fa7eb5a12f622


-- 
Best regards,
Marek Vasut


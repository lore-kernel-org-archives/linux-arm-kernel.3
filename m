Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9B3D1CDC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 03:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ei7m5Ns3dLPcNqCQJpDdvbPz0mDTTjmXQeeMl3O7nUE=; b=rxQfkW2C2+elNNj48jhWPkN7FV
	SbXYqKhC8Q5vmAdJnvl4/IXd7dDAiI3S/q3TcXjbnHqlN/MG8Vh/Ace28+z9UULELqLLrnKjfRmBS
	eyLNJLsiAaTQnBEMZiDTQzu3HxGWROgEUXPm2a1jb3cVqgnmfIDgxoFIEjA3ipO+yZVdjR6Hzjvs/
	ZPGf2HF0F7UiPXMPlcT6Za7ietXQjoJgkWV0YiyBf03b2N4KknHeiqVlTyrT1ygdyxwoh2/tvFxWK
	UI1we++EkgFzjY6OL6Aw+l/jfmhFEVbL0gnzgim/oGZ+azPtTT+wZQ5NDLoqwKeBkiasX5yNt0T62
	6AerJt9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQzyV-00000007PDA-3ayj;
	Thu, 04 Dec 2025 03:25:47 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQzyT-00000007PCo-3IVb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 03:25:47 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dMKdw6YvBz9tgF;
	Thu,  4 Dec 2025 04:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764818741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ei7m5Ns3dLPcNqCQJpDdvbPz0mDTTjmXQeeMl3O7nUE=;
	b=dwE+My0UVhY4v5eRLWSFRAPYw2kNUO4i/dcFjOjGdyk4BO5RU8MZocxagUQIRqJ3RBo4wD
	uq6lAY48PfCrZu2iKST6NyPE0yLppY1/mryGjF3bCgPtEjOUBizcXNlrFSzuF+zf7iPqHQ
	sbqTPWd7P9qS8c5cMXlY9qZX8g79ZuDMwEg3S+j+7ho6X8aoQYsqE1ge5MoVDPOJzys89X
	y/WClgmaUQGH++o5jqOzXnSzf8yHazWcjC4icGa6fZ54DLSPsgpOtOlcSN+Lr8L+8QRFnh
	XzPb5OvRWTkdiOuIRUeFM+cVDrTQ62Zzi+otFv3Hqz5cbFtDNaqfpfxE7wYFog==
Message-ID: <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
Date: Thu, 4 Dec 2025 04:25:38 +0100
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
 <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
 <aTD5np-HGaJqhzkD@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aTD5np-HGaJqhzkD@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: eytu18s5usyrho7etfqi6p3r8n6fmfbr
X-MBO-RS-ID: a5ef938b78277bca17e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_192545_995141_99797E40 
X-CRM114-Status: GOOD (  13.50  )
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

On 12/4/25 4:01 AM, Rain Yang wrote:

[...]
>>> For the Linux working environment,
>>> CLK_GPU and CLK_GPUAPB are always-on, while CLK_GPU_CGC can be gated off.
>>>
>>> Regarding the IMX95_CLK_GPUAPB handle, my suggestion was based on the absence
>>> of its frequency in any OPP entry within the frequency table. Removing it
>>> could simplify the OPP handling logic and reduce unnecessary complexity.
>>
>> If the clock can be disabled by SM, Linux has to make sure they are NOT
>> disabled, so they must be described in DT, right ?
>>
>>> [1] https://github.com/nxp-imx/linux-imx/commit/695f2bdc57b869ca5189313e4b5fa7eb5a12f622
> Currently, only CLK_GPU_CGC shall be described in the Device Tree[1], as it can be gated.
> The other clocks (CLK_GPU and CLK_GPUAPB) are always-on in the Linux environment,
> so describing any of them in DT is not necessary and would not be proper in this context.

Since this discussion is in fact unrelated to this bugfix, I would 
propose to fork the discussion into a separate patch. Can you please 
submit a patch for the GPUAPB clock ? Note that I believe GPUAPB clock 
have to be described in DT, if only because DT is a hardware 
description, and to make sure the GPUAPB clock are correctly enabled by 
the driver.


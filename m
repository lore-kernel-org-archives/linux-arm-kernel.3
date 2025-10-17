Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B91CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJsJIIBmyS44r/Za6Ww7u8aRde5yPPmd2EJgiWuqZok=; b=MQrcgOQ4dai2N9spm0tk5PAtlj
	6J5EOctlXOWxdaamFZ1Tv4XSQyICELi6/YsbfzjGPblIasJyip3V6uHUUu42xaSTH//9MZoXqT6G1
	B46m1H6OSo2DFYtZp1TqacofUgyvlWDhwmUxOWi4y1Qx3OpO4o2CkTb+HiB4aiKw9/C27QCaIUrHK
	zDnr9gZC82Z3VeF+YIEpsfWYHsWJSymHpn3RLNOr2a8so7NiMNaQAnjfL2GstjjXUv5Pn5t5ZUY2V
	Pb8OMsv301rbAvaVAsYL1rimRn7yfxJAzqnz5E96A/Ffb3QR2QypcHVVBpHQmDhprRyMXBdYOvRcJ
	KYBEyJfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfp-00000008V9n-1lpF;
	Fri, 17 Oct 2025 16:51:25 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfU-00000008Uue-44Kr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:51:06 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp9nK2L1Jz9sSq;
	Fri, 17 Oct 2025 18:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJsJIIBmyS44r/Za6Ww7u8aRde5yPPmd2EJgiWuqZok=;
	b=ri3EMDsZEN4UnyNu0+7sYCnpRhI59tlwCE72BMClrJG5Z/9VF3E0TFTmdsWE93bSKc4gE7
	hhs2WbanfCytWk3dPq2JFhRQEvXftZxx1UYwFG60B/mLGbhhsMPKLkMeRKu/tqRZflxcxk
	8Hf2wvQ4HzRjc9duTrppLkVLAHgai6wntue296XwapLUXyZUSLeEQtOJBS5RMjRAzDqi0T
	cQXsbhNO03cUtPukXFA86VbXx2WuUpqDmoX1f3ltipWOY3Sd8NjQoKGJjOmcjXv1XaBzXc
	8ECMjKEBoEfQcSen58Q+dgonWGKRG+xvzEcbsFzqjErR0jqaNLLqlnMKeersDw==
Message-ID: <49a97a81-f5db-40c7-83ae-2e12b790a6ae@mailbox.org>
Date: Fri, 17 Oct 2025 17:18:16 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
To: Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
 <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
 <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
 <ae9d1289-c0f9-47b9-b6be-e39d170425a2@mailbox.org>
 <a9a9867c-2653-45f0-89a2-39132335aac9@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <a9a9867c-2653-45f0-89a2-39132335aac9@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 06fa1a62a3227d44521
X-MBO-RS-META: 4jmhrbazn39p7xypji99r43776hhwgqg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_095105_353787_D46A1F31 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
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

On 10/16/25 4:28 AM, Liu Ying wrote:

Hello Liu,

> Have you got i.MX95 DC IP spec?  If no, then it would be difficult for you to
> write DT bindings for all i.MX95 DC units.  Note that this is something
> necessary to do.

Nope, still waiting for those.

> And, a bit more information about display pipelines in i.MX95 display domain:
> 
> Dither -> pixel interleaver -> pixel link loopback -> camera domain
>                              -> pixel link -> MIPI DSI controller
>                              -> pixel mapper(LDB)
> 
> Note that NXP downstream kernel wrongly adds pixel link between pixel
> interleaver and pixel mapper due to ambiguous i.MX95 TRM.
Is my understanding correct, that the Dither Unit ~= Display Engine ?


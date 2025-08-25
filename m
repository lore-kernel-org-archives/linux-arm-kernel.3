Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27214CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 20:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qx/nBrJgEy4ACj8BLrfZhPmHWNsIJJlIdSPVY29XGDo=; b=3PEOcVhQ0etyJ6ylCwguv4JYjh
	Q210wwRFmLKlF5lrXzo7AsH7RcggjdBQc0YhTpP1f0FiaPY4/zEk1e6INIVRUrWFekNBuJhlxHqY7
	zBIHKKqMRbUnxYopCiNQiLMKHKo+OzPBSWgZSNvE9IC4QTpm1kEQlEj7oQzs63FkdHSIOTgBaXmWb
	XPFAn/n/KJReR9jZpl/dUv8OUo2gIX8ItV8vESNuREeQbFe6539mcOwkOsB5vND4X6QXi6m8teCcT
	QVfnnSGyKxbXxbcvXHkTYp7BxpuCeEOVEKEBZ92/w/mxCfNZhEAF8TjNXVvCmQ3WS/SrmX2mhAQMG
	NC1NAG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqeDV-00000009hBy-1N9K;
	Mon, 25 Aug 2025 20:55:01 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqeAn-00000009gez-3Bfk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 20:52:15 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id C277FA0D0C;
	Mon, 25 Aug 2025 22:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=Qx/nBrJgEy4ACj8BLrfZ
	hPmHWNsIJJlIdSPVY29XGDo=; b=KOTwHdFwrlssuKhGmYQi1pNHWmLpcDzUjzuD
	5aSkfx5fPlX5pUFG2CmstfASRrQ63+dQM5mTlVid5T6muXMYB1NQQUAAIcxcfrzy
	wHUURmxj/lFJZAf9AZ1E5GPMpW8r0RLdLBSOwLv/moIdG/Q3qaT908u6u1oIgu9b
	PskeO6wLgT32xzj9mL/h7ao0HKZxhnR/sjaTDQ2sG3vLM4aOncH4LGfBi7Jx7DV3
	LKXZRwYxi9Q5XbgRNzrXFTTkRSG1Y5FAbUa1UB7b+nUTSwWc1gTqNOsr364oQfPL
	bctg3oo0ldAphuHR+xxR6pWRCdWendzWdkuHtkXYvmZdnkyoZUElOPHQgszzQzeo
	CrN51MHMVNPoIq5z/1oRqDhsoVFxFXAcYLVnYeE7H4GvXVtuMemZhTqD+BA/6NwT
	SqTUsy33vVPmSFJjmn/tvfSVIgrlhtwm6JkSpb07cPbNQMeKU/GxTB2LFnXGrdr/
	wAwHDZztY0tpsDvixH8M6s2lGM/0u1DDmCxHziFGkzW/J6/LevhVXjR4FN7XRU0w
	IxboxRGK2GlTkinQ2lm+ZQT8pormbrRNl14AqXHt6qooU9worejDL6dKUzG5O3S3
	+0g/e1RMg1vpECBPGfocTU2K7/5W0JRByN/Hk/LW6RsMP3DFBCW8B589f4RdeBzx
	KjxnBXU=
Message-ID: <8d951db9-80a5-4209-ada5-6bba854e994d@prolan.hu>
Date: Mon, 25 Aug 2025 22:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: imx6-hummingboard: Replace license text
 comment with SPDX identifier
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Rabeeh Khoury <rabeeh@solid-run.com>
References: <20250709-hb-dts-lic-v2-1-a168bd9d24bd@prolan.hu>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250709-hb-dts-lic-v2-1-a168bd9d24bd@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.7]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E60706B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_135214_264156_971E4C80 
X-CRM114-Status: GOOD (  11.59  )
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

Hi,

On 2025. 07. 09. 9:28, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> On top, half of the files have the fragment "either version 2 of the
> License" for some reason, and not follow up with "or any later version".
> So the resulting SPDX license is still "GPL-2.0-only".
> 
> Cc: Rabeeh Khoury <rabeeh@solid-run.com>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

So, Rabeeh, Russell, what do you think? Is there something else I need 
to change?

Bence



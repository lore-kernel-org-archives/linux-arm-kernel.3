Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2ACD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 02:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75B4gxMdiRXoDbJNgqXGfnhtWbwMTHh+zPhA5Svb3G8=; b=AGt9Uan5rpb+ks7T87x2W326GX
	Y123Bg4OcXtTRDE37jWO5EnFYlaUJs6U+kfeO/a2fuDXrM9dhEd7Wf1D30qngLzX6FSbo4aFwdj11
	VNH/xcCkzwADg0u0/2aKxf5glt29xUa0ygEr6tmKQjQh6b3kgtnvjj3My3FjKm66RNLh2cBIhUswm
	WBZ7QzeC61CejDX5VdJ5KxdNbPY7l2T/Oo4hJX3an0OxdnRujc+NtA2OcyKTEzaYZQSr8LJUftaeg
	Sv3xHB+lMyrmG2LRZZNLLMz+LoX3VQwtIcPT65OYI8spfCAYzhnWhA7Qi82gK5L/k/8z24X2YH+bU
	+gy/0gbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3OY-00000003FWh-12MY;
	Mon, 29 Dec 2025 02:54:06 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3OV-00000003FW4-1za0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 02:54:04 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dfglm07GFz9t5G;
	Mon, 29 Dec 2025 03:53:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1766976836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75B4gxMdiRXoDbJNgqXGfnhtWbwMTHh+zPhA5Svb3G8=;
	b=SUtLtPrgzr3EoF0uqM0r229UqRIsxVebpxhK2jxnCDcO94zq9P6Bnn1yqqgfZZWJa18OQ1
	1CQH0ZyRvzwDI71o3r+jtyfUOAOeGqsrETlxZYnmOFEsso+opmjoJ+1mbOx0h6OUR5RQsZ
	TKa1EYVDB+V41hhOWvebwE/87GbIATErVvNRsM6Mzn9oFFGppNJI4X4HYflQq19JFkBL3V
	QR3ZI/DA+UH0V1ACLhr8+C7uY20YTQ4jB6uRX/w1bMmPLl4AGT6zpO83aqMsUqlLdzopNn
	0nwjEHkWhaJ9T456AjOKApcgGlkn0p7wvc6Sk1AVzQzstBiyYO4fCsPKZLSWCQ==
Message-ID: <b61fc304-26e0-422f-bb31-303e7bcbb824@mailbox.org>
Date: Mon, 29 Dec 2025 03:53:53 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM SBC
 DT to rev.903
To: Shawn Guo <shawnguo@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20241226171404.84095-1-marex@denx.de>
 <173531253398.3886481.9345779510218290682.robh@kernel.org>
 <14c48d93-8ee6-4769-8dc3-5c527134bc77@mailbox.org> <aVHqlnNGNGmaF14m@dragon>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aVHqlnNGNGmaF14m@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 29f1afb84c51a004196
X-MBO-RS-META: kspase6p397kpcxioyds6askqkgd9zd9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_185403_669446_0E4276D9 
X-CRM114-Status: GOOD (  12.45  )
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

On 12/29/25 3:42 AM, Shawn Guo wrote:
> On Fri, Dec 26, 2025 at 11:24:29AM +0100, Marek Vasut wrote:
>> On 12/27/24 4:18 PM, Rob Herring (Arm) wrote:
>>
>> Hello Shawn,
>>
>>> On Thu, 26 Dec 2024 18:13:27 +0100, Marek Vasut wrote:
>>>> Update the DT to match newest Data Modul i.MX8M Plus eDM SBC rev.903
>>>> board which implements significant changes. Keep some of the rev.900
>>>> and rev.902 nodes in the DT so that a DTO can be used to support old
>>>> rev.900 and rev.902 boards easily.
>>
>> [...]
>>
>>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
>>> 	['st,st33tphf2ei2c', 'tcg,tpm-tis-i2c'] is too long
>>> 	'st,st33tphf2ei2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x', 'st,st33ktpm2xi2c']
>>
>> This is addressed in bindings patch [1] . Can this patch and the bindings
>> patch be applied ?
>>
>> https://lore.kernel.org/all/20241226171124.83735-1-marex@denx.de/
> 
> Could you resend them?
Why ? The emails are in lore/patchwork and the patches still apply just 
fine, don't they ?


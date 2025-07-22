Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8CEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 04:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7b5hGarLAQZ7wJX3z+HKwupNShCIskH0D5h01nt0B4=; b=Bu0ZyyCsnXgzAt
	2bC/RZHfFGAJK8PW/Dp8RnSL8Qpaz7lSfRTRVw3z1zX1BB/fU5iSW57YtN45sl97k2Ntue9rEkK3s
	37pBKOXK2tINXHNXx3mhEUWeJaLUGwNhYhK+gHzBVDYePNCmjHSCCiVj5T4gbWx29Jhf0eYFDu0H7
	hse2KnV32nPfPSyoG8ctkf0Fpuocr70Q+IoGXcoRdyXCZrSCjxCqe4nXCYm4Ftx+wYzHgw3TPeqhy
	xCDry2SGqna9RA2k/JN+peeD1mkcolTXtSkAQokEMmI1DD8QkTbn7TnVIrla4k4RQRVy/ej4aLiEw
	1kUFKTWBh13x7owozA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4IL-00000001EYk-2nYn;
	Tue, 22 Jul 2025 04:08:01 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4Fq-00000001ERC-1LW6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 04:05:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 824221026E02A;
	Tue, 22 Jul 2025 06:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1753157121;
	h=from:reply-to:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=m7b5hGarLAQZ7wJX3z+HKwupNShCIskH0D5h01nt0B4=;
	b=SDY32tfSFz9zqLNKR+pX3Uk/W/Xzd5ZVXPEe2q4ZUeHX9EYBDOu+y3zT0mwKenJdgN3v+0
	5+MD523v3CJvOvs2LVpxJ7xzUTuZYyCiqaUxeKBa83xzMdTf3e1G7Lgbmytn0OFHvKh0bS
	JMDz4IVw0Ztc628Hbc0RqGVbYBg3Hi9SQrB8eSKCk84hsLWAkde6tW86HY5+rGgI0dZlFH
	yl7LppaXBVsN8EMt1+4CQMcmvXcWfXSep+IFQIUyHspcOlre4bdBSWZrjan7oheXBckaNp
	lFByEhJrXrlDnVH2AR+Im6UKjYKVFrvAMEQR8T3N2t261YXDOWPGTXVfrNVTzw==
Message-ID: <8a8106ea-83d3-e02a-9ae7-ea4a66e4c248@denx.de>
Date: Tue, 22 Jul 2025 06:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: (subset) [PATCH v1 0/3] spidev: introduce trivial abb sensor
 device
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrei Lalaev <andrey.lalaev@gmail.com>,
 Chanh Nguyen <chanh@os.amperecomputing.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Grant Peltier <grantpeltier93@gmail.com>, Guenter Roeck
 <linux@roeck-us.net>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250719063355.73111-1-hs@denx.de>
 <175311337130.327079.7374455187420344577.b4-ty@kernel.org>
 <d677ecd9-42d6-43fe-8fe1-a5afd4d270e2@kernel.org>
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <d677ecd9-42d6-43fe-8fe1-a5afd4d270e2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_210526_566552_5CE8132E 
X-CRM114-Status: GOOD (  17.79  )
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
Reply-To: hs@denx.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,

On 21.07.25 18:24, Krzysztof Kozlowski wrote:
> On 21/07/2025 17:56, Mark Brown wrote:
>> On Sat, 19 Jul 2025 08:33:51 +0200, Heiko Schocher wrote:
>>> This series introduces the changes needed for trivial spi
>>> based sensors from ABB, currently operated from userspace.
>>>
>>> The last patch adds the spidevices to the DTS files, already
>>> in mainline.
>>>
>>> make dtbs_check showed no errors/warnings for the dts files
>>>
>>> [...]
>>
>> Applied to
>>
>>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
>>
>> Thanks!
>>
>> [1/3] dt-bindings: trivial-devices: Document ABB sensors
>>        commit: aad2f87cbcab56b322109d26d7b11842a09df91f
>> [2/3] spi: spidev: Add an entry for the ABB spi sensors
>>        commit: d60f7cab7c04944a79af16caa43c141e780a59c6
>>
> 
> 
> That's unexpected, Mark. Patches received two objections/comments and I
> don't think discussion was resolved.
> 
> ABB is huge company, probably making hundreds or more of sensors. The
> patchset basically claims that all of them work with spidev. It does not
> providing any model names or details, so it seems really incomplete to
> call them trivial devices.

I do not know how many different sensors they have, nor if that department can
speak for the whole company...

What I have as information is:
https://lore.kernel.org/linux-spi/2477dc64-92a0-9dc9-d168-56646d0d796e@denx.de/

and I get no more information about them currently. May I should
add some sort of trivial into compatible name? Something like

"abb,spi-trivial-sensor"
or
"abb,spidev-trivial-sensor"

which makes it clearer, that only ABB trivial sensor, controlled through spidev
driver, is connected here?

Looking into definiton of "trivial devices" in
Documentation/devicetree/bindings/trivial-devices.yaml
"""
description: |
   This is a list of trivial I2C and SPI devices that have simple device tree
   bindings, consisting only of a compatible field, an address and possibly an
   interrupt line.
"""

which fits exactly, as they even have nothing more than the SPI lines
connected to the carrier board(s).

bye,
Heiko
-- 
DENX Software Engineering GmbH, Managing Director: Johanna Denk, Tabea Lutz
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B8FCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 02:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Es6Vws/eOKlp6GKSxTpWgYQiUx72bXIcoH8A5zQmI8s=; b=eRy8gb0WkZl5DdX3z4SjeEPrav
	V1aRxXd/2+X0x9jgoOOvCTsGxxxEAgLODZb+vm75YPiNRX6MUCb6481ZkK++dAwZXsu4qnPzNhL2v
	FiAER5YXcy/Y08k9/EOcv1DXEHFZTMUfZMOkl3iGowNGpmLI2mGEbcNC0Ktxx2Wg0gDmTYRVa9bpl
	MiU9slinKVgWk0Th4w3fApV2QVvK+qT2I2Vp+fjTxPkDuyNxPZlifrQ0C1f+PCPIsVzUdAtgEFHRE
	vrmZVfI7kp6uMlv0/uhyJQ5Yi1XJYs+n8kUggCssYVTuEfBuQScDP9SEKorsENE0URK5hpebLE+2D
	SzgeP+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXNK-000000080TB-3fja;
	Sat, 09 May 2026 02:25:06 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXNI-000000080SO-3MMS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 02:25:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 943A3113FEF;
	Sat,  9 May 2026 04:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1778293502;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Es6Vws/eOKlp6GKSxTpWgYQiUx72bXIcoH8A5zQmI8s=;
	b=XA0zSWNGfIxfsU8SO9vPVaT8aQl+J5o0UthVWlclapZjE/zgJ7/eZJCXPN2uwMa9juvK8B
	m9Mi86M8qs7rcfw1wDbLqqGfDiHOuCPjFch5xeWBroP0yeZzFOnt7y0AjBTF2uuAZeNtSM
	VNhQs1KBv7APWyl4yYTRwFZjiLkjG7BRM+5WHqKJQef/KPWLOxReqyjcQ/3ELrvR9hFSSF
	7Y6URWipGU+NTPHQ7xA7VyH4/Bta28WropyrSB0am8ENasGLcJk8KN9G1fSlyA0QB1mJHz
	3r70vA694+HII200i+TmUiEApOfhWDXcQ5fxPtrlUhRJv/kjWxoLxTAlR1xXkw==
Message-ID: <decbcc28-831b-4220-90ee-fa32d9ce2e2f@nabladev.com>
Date: Fri, 8 May 2026 23:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260407211850.79881-1-marex@nabladev.com>
 <65342735-44b3-4a2b-90ab-6093e0fd91c9@nabladev.com>
 <af4FO5vOx3ruwWBE@lizhi-Precision-Tower-5810>
 <dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com>
 <af5EWnJyP6leh5ao@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <af5EWnJyP6leh5ao@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_192505_079979_4B06CD4C 
X-CRM114-Status: GOOD (  14.67  )
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

On 5/8/26 10:15 PM, Frank Li wrote:
> On Fri, May 08, 2026 at 06:20:10PM +0200, Marek Vasut wrote:
>> On 5/8/26 5:46 PM, Frank Li wrote:
>>
>> Hello Frank,
>>
>>>> this patchset is now split. How can we proceed ?
>>>
>>> I am thinking about it. I found an old thread
>>> https://lore.kernel.org/linux-devicetree/20250902105710.00512c6d@booty/
>>>
>>> The current code base already supportted partitial of it, such as gpio and
>>> irq map for connector.
>>>
>>> Internal chancel liu have prepared version by use nexus mapping for audio
>>> boards, which almost done to send out to review.
>>>
>>> I want to wait for a little bit well to resolve or partitial resolve N x M
>>> problem.
>> DT connectors have been discussed for the last 10 or so years and three is
>> still no real progress.
>>
>> I would be happy to send a follow up patchset which would convert the DTOs
>> to whatever connector implementation format lands in the future, but I am
>> concerned that waiting for DT connectors will block this patchset from
>> landing for a long time.
>>
>> So how about finalizing this patchset, landing it, and once connectors
>> become available, I will send a follow up conversion patchset ? Would that
>> be workable for you ?
> 
> We still have times, can you wait for chancel liu's patch for a while to
> check if his method can help this situation.
Do you know when chancel liu's patch is going to be submitted ?

Is there maybe some preliminary version I can try ?

Thank you for your help !


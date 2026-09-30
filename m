Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43360CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 19:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dR7TRsCJ25q9nKc0aVFqV0DBkjf9gpIXafQpdl4hBAg=; b=rr+aIIZ8aXDKskQS1irupxkkEv
	cKfX9f0H5EWXeJJ4jnwL4KG+o//+ZoOIRBkhqnPphmRl+aiH5yCKwAsQxN9Z3RbcOcnLmiaWpMRdx
	fdSd8smOLhauroVmEYVmSYNIf4Vgi9k8rk7vPAj1FjzL4Yl/tjWGF89VwdFo2JlVxeVU/noX1XG3l
	kjC/Kj3jPEb78yLul4pbGQH1ol3EyKRt0C8wdrj4jys4kRskZEu4qhVhDChGCM6nVZeULfJ/Ir0dt
	y66kCcx+mwU3o3qOuOGMxLuu8rJEZxoYbBufZESrcpITxymsqrdfbLJ05g7avowpGKWHq3jepoEbk
	f/jL4h9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC002-000000074mA-3uVu;
	Wed, 30 Sep 2026 19:29:54 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzzz-000000074kY-3AW8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 19:29:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0AE1106FC1;
	Wed, 30 Sep 2026 21:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790796578;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dR7TRsCJ25q9nKc0aVFqV0DBkjf9gpIXafQpdl4hBAg=;
	b=itQpGtQcIgyGw8VPcQ4FGKI7x/CWWKMkTXKgixCP51xt6XRKDhdqbztd3DgbcmMAv3HCJu
	PGl0CIE9TMjyMVw0GIiS6WrK7kePbt9Z4/qhqfIJo8K7o5F7JnosFh8qId5aIKAgoxsKms
	uP9ZSHKbJVLd30xpQOBrwmP4kMzFDDl2NliEa1QzgEkMMNR9wfK/2+oZY281MqTxbcybBK
	i+jzt338VIohdETUZTSrPbfEXyM3EcgbNWGbSs/t4hhWS6/fUE/3LuVpBQM/WMGedAtpMM
	iWoDG1XQTduklzEXFNRVsxPnxgdNHLOxfX3eJCipscNPT3L6xk+XiGBkUb1zbw==
Message-ID: <17f240e5-9c65-4562-ba51-535b0c69c5fd@nabladev.com>
Date: Wed, 30 Sep 2026 21:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: imx95: Add support for Data Modul
 i.MX95 eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: linux-arm-kernel@lists.infradead.org,
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260928204741.175754-1-marex@nabladev.com>
 <20260928204741.175754-3-marex@nabladev.com> <arvPDq8sjjv7na01@SMW015318>
 <49303872-5622-4e1d-8e1a-01394ec29367@nabladev.com>
 <20260930174413.GA2463938@francesco-nb> <ar1bhpji35CbArtY@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <ar1bhpji35CbArtY@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_122952_012942_359778FE 
X-CRM114-Status: GOOD (  17.89  )
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

On 9/30/26 8:57 PM, Frank Li wrote:
> On Wed, Sep 30, 2026 at 07:44:13PM +0200, Francesco Dolcini wrote:
>> On Tue, Sep 29, 2026 at 05:20:27PM +0200, Marek Vasut wrote:
>>> On 9/29/26 4:45 PM, Frank Li wrote:
>>>
>>> Hello Frank,
>>>
>>>>> +	backlight_lvds: backlight-lvds {
>>>>> +		compatible = "pwm-backlight";
>>>>> +		pinctrl-names = "default";
>>>>> +		pinctrl-0 = <&pinctrl_panel_backlight_lvds>;
>>>>> +		brightness-levels = <0 1 10 20 30 40 50 60 70 75 80 90 100>;
>>>>> +		default-brightness-level = <7>;
>>>>> +		enable-gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>;
>>>>> +		pwms = <&tpm3 3 5000000 0>;
>>>>> +		/* Disabled by default, unless display board plugged in. */
>>>>> +		status = "disabled";
>>>>> +	};
>>>>
>>>> The both backlight is not used in this dts, can you remove it and
>>>> add these when it real use.
>>> It's the same thing we do on the other boards, so I would prefer to keep
>>> this consistent:
>>
>> I agree with Marek, and I would not use the criteria about being used or
>> not.
> 
> 
> Others boards: some has dtso, which use it. And krzy have some concern for
> similar case although he have not reply alex's answer.
> 
> https://lore.kernel.org/imx/30599533-91de-41fd-9420-3f8693ec92ac@kernel.org/
> 
> And it is most likely go through nexus connector node to support display
> panel in future.

I do not think nexus node will apply to this connector, no.

> So I suggest remove it now and add it when need.
Can we please go with consistency between these boards from one vendor ?

Thank you.


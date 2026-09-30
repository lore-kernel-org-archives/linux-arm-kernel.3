Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FC9CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGkVLFh4t1/duKSh5UdjNw/Yth278XKTFrmEUlELumM=; b=tiHDsiHauz7SB9wqXjWqmrMaI2
	CgXbR3cxMd6zrLfDjFbgTOSJ0vr8ugL0z6n7m5Fz1iDfb0CGDHEGLMTZMdn0fnjDhT+LktUhpWBTT
	CPYXDD9DTpxBgiKzF2xcDEaFCN+wfLsbvpa74JHDppXmlbCVEAG6U1TiSW9RNiHlPH/HFVIA1znkg
	X4BeRl7FBZ6mau1cOH+CtnZ0F9a4Ca0LtH6krGavpP8rLv5A3Hv6SlSdOgmNlf9BnArjVI1bE+ZBK
	cwWK/2VQI6QDlsjGEQZ44EFIdDZNkJFFvfiZzK64CKG1hE/jLqC5K3dBVjt3Dw2qkvXmqz8XQR9QA
	W4jVAIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Az-00000007IM3-37wp;
	Wed, 30 Sep 2026 21:49:21 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Ao-00000007IEv-37Yg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:49:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BD7110709D;
	Wed, 30 Sep 2026 23:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790804944;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nGkVLFh4t1/duKSh5UdjNw/Yth278XKTFrmEUlELumM=;
	b=EosciR1gI97ZJNuK6lrn0GImUmlmIuHdU8v5TNXFFsOGPPBDf74Wx3PvUrE2V7b1W0yfat
	7QbAILUNAKBddNzuiLY8Ztq2Dr71Y6hontqdji74WqPB4ucP3AMEYnWNN7cV5QoWhFZaWE
	gU+PjUoXMvcCUDmR75c9OtqI5ruT+S68m4xgd0XfPyMiVog0dw4BVehfwY5R8eOdzmps2j
	+4nT4VWT04iFVDS83fof/X+tn9Q0eQ70vh16sh5FfOSC48G5ySpuKXXT5kIVwT46AtYyZ/
	/O4ttEd8fuHGh/jY4nyvK2L5hhftjaptATMz2X2M9P9r+hwgMkrejGhSOY9Qew==
Message-ID: <4efdcea6-a099-46a6-8d07-dd5c583b962a@nabladev.com>
Date: Wed, 30 Sep 2026 23:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: imx95: Add support for Data Modul
 i.MX95 eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 linux-arm-kernel@lists.infradead.org, Aswath Govindraju
 <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260928204741.175754-1-marex@nabladev.com>
 <20260928204741.175754-3-marex@nabladev.com> <arvPDq8sjjv7na01@SMW015318>
 <49303872-5622-4e1d-8e1a-01394ec29367@nabladev.com>
 <20260930174413.GA2463938@francesco-nb> <ar1bhpji35CbArtY@SMW015318>
 <17f240e5-9c65-4562-ba51-535b0c69c5fd@nabladev.com>
 <ar19W4wX07p8u3_5@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <ar19W4wX07p8u3_5@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_144910_935907_5A6AB1F0 
X-CRM114-Status: GOOD (  17.59  )
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

On 9/30/26 11:21 PM, Frank Li wrote:
> On Wed, Sep 30, 2026 at 09:29:34PM +0200, Marek Vasut wrote:
>> On 9/30/26 8:57 PM, Frank Li wrote:
>>> On Wed, Sep 30, 2026 at 07:44:13PM +0200, Francesco Dolcini wrote:
>>>> On Tue, Sep 29, 2026 at 05:20:27PM +0200, Marek Vasut wrote:
>>>>> On 9/29/26 4:45 PM, Frank Li wrote:
>>>>>
>>>>> Hello Frank,
>>>>>
>>>>>>> +	backlight_lvds: backlight-lvds {
>>>>>>> +		compatible = "pwm-backlight";
>>>>>>> +		pinctrl-names = "default";
>>>>>>> +		pinctrl-0 = <&pinctrl_panel_backlight_lvds>;
>>>>>>> +		brightness-levels = <0 1 10 20 30 40 50 60 70 75 80 90 100>;
>>>>>>> +		default-brightness-level = <7>;
>>>>>>> +		enable-gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>;
>>>>>>> +		pwms = <&tpm3 3 5000000 0>;
>>>>>>> +		/* Disabled by default, unless display board plugged in. */
>>>>>>> +		status = "disabled";
>>>>>>> +	};
>>>>>>
>>>>>> The both backlight is not used in this dts, can you remove it and
>>>>>> add these when it real use.
>>>>> It's the same thing we do on the other boards, so I would prefer to keep
>>>>> this consistent:
>>>>
>>>> I agree with Marek, and I would not use the criteria about being used or
>>>> not.
>>>
>>>
>>> Others boards: some has dtso, which use it. And krzy have some concern for
>>> similar case although he have not reply alex's answer.
>>>
>>> https://lore.kernel.org/imx/30599533-91de-41fd-9420-3f8693ec92ac@kernel.org/
>>>
>>> And it is most likely go through nexus connector node to support display
>>> panel in future.
>>
>> I do not think nexus node will apply to this connector, no.
>>
>>> So I suggest remove it now and add it when need.
>> Can we please go with consistency between these boards from one vendor ?
> 
> Yes, I am keeping consistency, then ask remove it. I applied alex's v2
> version. I put v1 link to show krzy's concern.
> 
> https://lore.kernel.org/imx/20260319125013.2421621-3-alexander.stein@ew.tq-group.com/
> 
> Changes in v2:
> * Changed commit message to imperative form
> * Remove (currently unused) display and backlight nodes
I sent you a V6 with those nodes removed.


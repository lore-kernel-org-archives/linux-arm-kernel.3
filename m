Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953F5CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUYo+tiJed8GqE7XG0pCVxNk1azoH5vDACly9iohrss=; b=lpHOQjmbvRNLIp6jGIlAPq0t8E
	Gp8PXpBK+VCOpdDTFUeZ7Ax0I6lS3Unwomp0E5L/qU2IMPwfzR8cSGWOA2neLsRw/VmotkpP/67BH
	nOqWF6u8ydv2+yN0Z9e5C929Jj7lKALwWkBe85rgj8soGjc11loDD0kOMlLQDZz4K70BoMNk80MVe
	w+nL2Q84mLueN48Fh+lgj+3OS455mZqxNTtFVLzQe6DoxlLkR2mzAi9U/tUl4GIKo8QW0b6MApoHG
	nhFMP5NRkLSCpf4dXKN+TdNTTHsQmZvJP2qf2lWZJm4t7lycSPpjxvfPXd7jb41Lmh867jgRSrcvO
	sMuMchhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGog-00000000T9Q-0Vyu;
	Thu, 18 Sep 2025 15:45:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGod-00000000T8O-3vCN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758210299; x=1789746299;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TLxm4ahaIJ4V2L6slJoaSY8rcZnLIWsUYo2kqnEhio0=;
  b=xo9FMaaXTkhcHiRZBZHipofZbFsNALyYbHI8IEnI0Op7lv+/O4AqXv2s
   XSYFqEoYAiYgPYFV5TV/HynxPeTfcvjO3mMOhF/ZM0XFjosPWCLzcMRix
   cu3vGaWL4XtpB7R/uuvR4Hx9EKZ2N+Y80K1CKGnBDKU0n4QOdYLAW48rE
   V8EM3EWrdmKIAk0e8hcu9OSIGDq6u5i1AdIAKWP6a5Qe0/cesub+ZNwus
   OkipSMmy3xrLPQJFWM0FbldCBw1vxLVrdSXQH+lGuxlCCinkuaq8TBp+U
   6d/NInM6oNbN7sFtOkr8EE0hVKTJWS4jBGHQQ6JXqMmtA74HY96Lx4wCg
   A==;
X-CSE-ConnectionGUID: ml0fmOoaTYS4Bvnd20HWOg==
X-CSE-MsgGUID: +JtR0hcARAOkhn0YlKPN3g==
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="214065523"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 08:44:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 08:44:43 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Sep 2025 08:44:43 -0700
Message-ID: <895aaf27-cfb7-4071-a62d-b9204c249cc1@microchip.com>
Date: Thu, 18 Sep 2025 08:44:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: reset: atmel,sama5d2-shdwc:
 add lpm binding
To: Conor Dooley <conor@kernel.org>
CC: <claudiu.beznea@tuxon.dev>, <sre@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>
References: <cover.1758051358.git.Ryan.Wanner@microchip.com>
 <d8fc40a97008cb0b4001684b3c9e1cc4bf3fb706.1758051358.git.Ryan.Wanner@microchip.com>
 <20250917-zeppelin-stoppage-0d0f876df93e@spud>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <20250917-zeppelin-stoppage-0d0f876df93e@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_084500_258121_B0A13320 
X-CRM114-Status: GOOD (  16.70  )
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

On 9/17/25 12:38, Conor Dooley wrote:
> On Tue, Sep 16, 2025 at 12:50:30PM -0700, Ryan.Wanner@microchip.com wrote:
>> From: Varshini Rajendran <varshini.rajendran@microchip.com>
>>
>> Add microchip,lpm-connection binding which allows to specify the devices
>> the SHDWC's Low Power Mode pin is connected to.
>>
>> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
>> [ryan.wanner@microchip.com: Add sam9x7-shdwc SoC to properties check]
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>  .../power/reset/atmel,sama5d2-shdwc.yaml      | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
>> index 9c34249b2d6d..668b541eb44c 100644
>> --- a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
>> +++ b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
>> @@ -56,6 +56,13 @@ properties:
>>      description: enable real-time timer wake-up
>>      type: boolean
>>  
>> +  microchip,lpm-connection:
>> +    description:
>> +      List of phandles to devices which are connected to SHDWC's Low Power Mode Pin.
>> +      The LPM pin is used to idicate to an external power supply or device to enter
>> +      or exit a special powering state.
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> This sounds like you're some kind of power-domain provider. Why doesn't
> that generic kind of thing work for you?

This is used by the MPUs shutdown controller to toggle external things
that need to be disabled.

In the case of the SAMA7G5EK board it is used to disable the 24MHz
oscillator and the 25MHz oscillator for the GMAC1 phy.

From my understanding this is not a power-domain provider it is just
used to toggle devices to disable when the MPU is in a low power state
and to re-enable when the MPU is in a normal power state.

Ryan
> 
>> +
>>  patternProperties:
>>    "^input@[0-15]$":
>>      description:
>> @@ -96,6 +103,18 @@ allOf:
>>        properties:
>>          atmel,wakeup-rtt-timer: false
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - atmel,sama5d2-shdwc
>> +              - microchip,sam9x60-shdwc
>> +              - microchip,sam9x7-shdwc
>> +    then:
>> +      properties:
>> +        microchip,lpm-connection: false
>> +
>>  additionalProperties: false
>>  
>>  examples:
>> -- 
>> 2.43.0
>>


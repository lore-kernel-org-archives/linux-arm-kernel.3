Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B61CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvDw3KVRz7KvchjxSHR2cOozGBUZnt7khP7Ju+BwHEs=; b=SzBGtB3fO1lMHBWnBOWcEnx7Q7
	OPm/J17oIw9wF+iyrBil6N/sXzRZW3xf6LbqIaIQjOeGS5alwrP6OADRIf8tSSp3A+NYdM0fQuGw/
	42MTnzozV8mGBfQnjrNnUdNhjFCNlAdJPZrKMLOlnDpz3m5hE25LZKxF3ZVCcRo1vunFwMrxZyQ1S
	Go8ebr55FG8jiuAYb/+EgEgjiUxWHunp0WWAm8H4VG56Q3I+j9wwso57xEvvA7z34iSCppA84Fq/I
	NEcqS7IyCdSGYTRPcg8Vd6eRBq+qWGUlNTHV4X4YNLJjeaG/LXcCsqv1dO/s0h0PaP+4M4TmxMANe
	Mxgo2JFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvpJ-00000006UrP-2fce;
	Thu, 23 Oct 2025 13:58:01 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvpH-00000006UqE-2xzL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:58:01 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4csnfr3cgdz9slx;
	Thu, 23 Oct 2025 15:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761227876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvDw3KVRz7KvchjxSHR2cOozGBUZnt7khP7Ju+BwHEs=;
	b=HaVABwHmhZOUxy8QugCfn+LoF0N0PRvzMLWoJZ4nggrZqO2Z630mpKgmMiie33/QvpWpRY
	3pk2p45Bxhe3w4zKnrjwHqPxMQVo3YvAi03PZurgtocgJY+2cIGbqsNyId4d6DDLPIFrLi
	I2+MlZ4Rxv71k+Zh6I8uT9fgtsq1yao7w+A60rhCh8/Oss36NQEYvbyawe2nyCG7awZa8j
	dRxIyHn9L52N9H/jRrZZUUCWQbB6iCx+k4/K6paI862xs8n8LKgVF6CkTuJ/i2nNepU71F
	T2j90/aklKGfqvBhzTna3TbGr3/qVLJ3oHeab/rXljrRXY2GlZgFg6sB7hHHfA==
Message-ID: <98ce2726-ab58-447a-bcb5-23b6347fa4fb@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761227874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvDw3KVRz7KvchjxSHR2cOozGBUZnt7khP7Ju+BwHEs=;
	b=PEiveaMwtZEcej3rfaw7BGWVnPSXvrzU0PHYP2sM8/v2LF7DLswJgbgvzer/jQwpvWJLJc
	JBrOk59mwKuf0lZU4aj2pU0NTIFPfmUEA4UBAwOqsKxSxSvfp7ZHyjHkojmIuiT6z7hfy6
	jddWSdpleDdryGqnsFYuG/0mN6aepCiRdJOGlqAnFKlNMM9EO8d4B92wLMt/90NUzbvSjG
	R3ynh161xa74jgFy49R1W3wRcpXsVgWosawDKZ3qBaoTZLq9GTlR56q4PPPNYXd0Ovj+B3
	no65cQOxnU1U/fBAqcjJYHF5S6BUlyErdKDk/HyEgqcKDIbBrbJrigUbPl+OMg==
Date: Thu, 23 Oct 2025 15:57:51 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Sudeep Holla <sudeep.holla@arm.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
 <20251023-active-blue-collie-2978ea@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251023-active-blue-collie-2978ea@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: dusg5ipbwggidpzsepg36osiph8xjhnt
X-MBO-RS-ID: 30b98b26cec28366837
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_065759_911441_7540E6A4 
X-CRM114-Status: GOOD (  14.02  )
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

On 10/23/25 3:42 PM, Sudeep Holla wrote:

Hello Sudeep,

>>> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>>> index be817fd9cc34b..b53754a318ea1 100644
>>> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>>> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>>> @@ -146,6 +146,13 @@ properties:
>>>         this platform. If set, the value should be non-zero.
>>>       minimum: 1
>>>   
>>> +  arm,poll-transport:
>>> +    type: boolean
>>> +    description:
>>> +      An optional property which unconditionally forces polling in all transports.
>>> +      This is mainly mean to work around uncooperative SCP, which does not generate
>>> +      completion interrupts.
>>> +
>>
>> Could you please clarify which platform and transport this change pertains to?
>>
>> Introducing a property that enforces unconditional polling across all
>> platforms is not ideal - particularly if this is intended as a workaround
>> for a platform- or firmware- specific issue. Such implementations often get
>> replicated across platforms without addressing the root cause, leading to
>> wider inconsistencies.
>>
> 
> Just to clarify what I mean by "enforces unconditional polling" is with the
> added DT property only. I understand this is new property and it much be
> present in DT to enforce polling, but it can be misused initially for testing
> in absence of interrupt support and forgotten in DT. Hence my concern.

I would argue about the "mis" part of "misused" . It can be both "used" 
and "misused". I can add stronger warning into the description ?

-- 
Best regards,
Marek Vasut


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E2BCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 11:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgdsR49irpJByzJ96bcwBmhSCv4K4cXZahydPuILDco=; b=UdIjMjGlu699GES1yMFRNnBC8n
	Aqvz0i7MXr10/BrBRvcTliVi3YKbMBXG1y1CFXkK3+XkYGQOXMeBVoBMg0xSB6eBN1IjHEgTIWVwz
	683gy2h6JmLp0JnZQ8/F1U5YqQcSfe7fHD2KQtoWU8H+0S9gDIzmGtfTa8pd8VNlsdIcrOcUJ2+lm
	3yU8b3x9PQ/5kruXtvdVs7xU9RJ+bBOG+mA29kL7nMKp0elJ2t80H6WdcVfycwb4smKl8kT4SW6Qv
	+AckSjqQqSTPqfCgNR+g9O1Eol9G4XeG9Ko8b6aC5vGSSwYjIZ/UzEEGhgwVMIFcJnbV5weYl8fUo
	J5LKMOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7rV-0000000B7oy-3E4F;
	Thu, 04 Sep 2025 11:10:53 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu70Y-0000000AogA-2c6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 10:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xgdsR49irpJByzJ96bcwBmhSCv4K4cXZahydPuILDco=; b=nn3+1Rxo+sb6gVBkjg5wdrMG1Z
	Xj9upXEyacqW45zeWBQy490E0jg4I3Gfck8A+K6G9un9jo7OGf2bmovU/zwCNRSRzYoI95P5nqkSs
	R3QPMkWHZM/wTe7HTef84vL0G+oI2H4fhtfRAlEws7uYJxQ8+lsIWwG1Fy4gWk7g40NtoNRMi+4En
	OHWTuxlNGVXq36Iecb7GlMsH8Zz9SG8UQJFfB+ahlMc54+9vX0kGBWPdrOLbDww6SjKNWwBKAugMW
	XxXrSVbKQXhd8wDX7cAftW8u0Wkm3pjgMPM/Bwkt9k3EJ1gU4xkU3P6pXsr1rST++njyBvzg7u5c1
	GhZVa7Mg==;
Received: from 86-58-118-213.dynamic.telemach.net ([86.58.118.213]:54824 helo=[192.168.0.129])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uu70U-00000003pfn-053I;
	Thu, 04 Sep 2025 12:15:54 +0200
Message-ID: <b6006a1b-0b46-4e0d-9d49-6cc0dbe84814@norik.com>
Date: Thu, 4 Sep 2025 12:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: afe: current-sense-amplifier: Add
 io-channel-cells
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 upstream@lists.phytec.de
References: <20250903113700.3079626-1-primoz.fiser@norik.com>
 <20250904-tangible-practical-partridge-a1b0e4@kuoka>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
In-Reply-To: <20250904-tangible-practical-partridge-a1b0e4@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_031559_134184_F0DE299A 
X-CRM114-Status: GOOD (  10.22  )
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

Hi Krzysztof,

On 4. 09. 25 11:17, Krzysztof Kozlowski wrote:
> On Wed, Sep 03, 2025 at 01:36:59PM +0200, Primoz Fiser wrote:
>> The current-sense-amplifier is an IIO provider thus can be referenced by
>> IIO consumers (via "io-channels" property in consumer device node). Such
>> provider is required to describe number of cells used in phandle lookup
>> with "io-channel-cells" property, otherwise the following kernel error
>> is present:
>>
>>    OF: /iio-hwmon: could not get #io-channel-cells for /current-sense
> 
> Also, how can I reproduce this error? Do you paste here real errors or
> just some invented ones from some out of tree code (hint: such would not
> be relevant).

I get this error if I apply patch #2 without patch #1. See [1] for more 
details.

BR,
Primoz


[1] 
https://lore.kernel.org/all/20250903113700.3079626-1-primoz.fiser@norik.com/

> 
>>
>> Also fixes the following dtbs_check warning:
>>
>>    current-sense: '#io-channel-cells' does not match any of the regexes:
>>    'pinctrl-[0-9]+' from schema $id:
>>    http://devicetree.org/schemas/iio/afe/current-sense-amplifier.yaml#
> 
> Best regards,
> Krzysztof
> 



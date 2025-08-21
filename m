Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D677CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vu34i576y2BSwMeUHBGp1dObEwdKJi14691AKgvh1CM=; b=ZGoEJlKapfQisVqvrqdwSMTdGH
	u38W1KRWZUQJqdI/I6Btw/6DhaRMc05DyOOxbwFZskK9nw/aMm9ImwnSp4tU/JefniQZwWrNimpgS
	w/psy9A1A01jHkvJ6VDuUcMOJUhXvH/1XGMs99gY2vkvrUJYG14Vr8XLEEqPX9CwLxVZlgU3cyjUc
	BOoeabbvL5F+VlgqUP4CXT5w3pCa9jynegMtag6XN6lUsxci4BHjhW+HnEG5tDjyZuu4LM+jbvAkZ
	0CNe2/eFP5duU+Q9iy1ASiOid+e4N60YnJIkqDqLabfz3YCHBevDyjYyqZ9uTfwPOvIOx4h12SHj3
	DAj2Nfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upB5T-00000000JwN-0Yiy;
	Thu, 21 Aug 2025 19:36:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7AZ-0000000HLU8-3lI0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 518A660200;
	Thu, 21 Aug 2025 15:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E47C4CEEB;
	Thu, 21 Aug 2025 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755789939;
	bh=9kJqLOf6Qe+TXpNf2uvky1bKvhlkOmQpjYLqd2IEmos=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=n8g9HanS2lu636ESY7KmSZ/Zei+gIK6ydMzOks0Nf/9xeHezuQwjFM0Ty5bJP+6+R
	 bvGK3jB4HUtLnTbqfwveFa4ZZxEdi3RR/q+V858X1muPPWBwHDnBR3bwpiKaNM785p
	 RKFBJqjhDfhEd5yk3d/s1ek51x55nrlL5zMF4g4zxTOF19AoL4aJeoiMiMZJdxOTIA
	 81oIfKUTxKRQp2SBAsZNAXU8bjZmnuy5L2wvEQjkGFB/3QpUjKERLhqIc9YCNWP0iU
	 UPmQcCwuQx5U62WvrKig5WfLkPpq4rL1E1u2bvuM4tkbOC2aTOtpUEu1Au0oLoOWn+
	 sGgym0VGzddZQ==
Message-ID: <4a95cbf3-b3ae-4b26-8db2-dd5cf14a4c0c@kernel.org>
Date: Thu, 21 Aug 2025 17:25:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 2/8] dt-bindings: hwmon: add Apple System Management
 Controller hwmon schema
To: James Calligeros <jcalligeros99@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-2-57df6c3e5f19@gmail.com>
 <20250819201537.GA1223169-robh@kernel.org>
 <CAHgNfTw+wetmZzvPgkANpmSD4b6k0785QZLpBVD9FMqNDnq2EQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHgNfTw+wetmZzvPgkANpmSD4b6k0785QZLpBVD9FMqNDnq2EQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 20.08.25 01:22, James Calligeros wrote:
> Hi Rob,
> 
> On Wed, Aug 20, 2025 at 6:15 AM Rob Herring <robh@kernel.org> wrote:
>>

[...]

>>> +          apple,fan-maximum:
>>> +            $ref: /schemas/types.yaml#/definitions/string
>>> +            pattern: "^[A-Za-z0-9]{4}"
>>> +            description: The maximum speed the current fan can run at
>>> +          apple,fan-target:
>>> +            $ref: /schemas/types.yaml#/definitions/string
>>> +            pattern: "^[A-Za-z0-9]{4}"
>>> +            description: Writeable endpoint for setting desired fan speed
>>> +          apple,fan-mode:
>>> +            $ref: /schemas/types.yaml#/definitions/string
>>> +            pattern: "^[A-Za-z0-9]{4}"
>>> +            description: Writeable endpoint to enable/disable manual fan
>>> +              control
>>> +          label:
>>> +            $ref: /schemas/types.yaml#/definitions/string
>>> +            description: Human-readable name for the sensor
>>
>> Surely more than apple,key-id is required? How would it be useful with
>> only that? You can know how many fans you have, but have no info or
>> control over them?
> 
> The key specified in apple,key-id is the fan's current speed, which is the
> only key strictly required to enumerate the presence of a fan in the system.
> All of the other keys are optional information that are only really useful
> when implementing manual fan control, which is itself optional as the platform
> really expects the SMC firmware to have control over fan speeds at all times.


Can we at least also require the label? Then we have the SMC key and a 
human readable representation which is already useful.


Sven




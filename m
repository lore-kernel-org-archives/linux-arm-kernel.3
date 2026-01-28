Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C47D3F094
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYk18bX7cRzr0uBEytpgIQTDx3Sgm8mS05n6bJfcUrs=; b=oX+iQ52q8Z/5nqBmSCD9+sb+u0
	J2EMSFEFglc2ca+e/w6ahOe1Rfq9CsZkcSZl4+KvDoh3esH+r6sUjB4P2kadW2PR9iYUteLq/j8io
	364AMw3peG2ueSFQEceNKbVGKM50irNagpxMY3uM33NPWPeapEquKi5smEJA4DoQOmmAmx8i3mVbW
	vFRp5pAJkp0lQGxqC3aImf3IxdcFF8hvl1pgts8GTtvdwf0LpEpnqO9f62fCcKXRWG1D5Ds20J2R8
	vss7VY77V3QqoKobud24PJVtSB1FO6W/rfJmeN6c6OIf7r4CF1H6XvL2XKKdCdBBwW5XBYGyvd+Mc
	Z4xQUQgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8ag-0000000GPbk-475n;
	Wed, 28 Jan 2026 16:40:27 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8af-0000000GPbB-14XL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:40:26 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-bde0f62464cso442a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1769618424; x=1770223224; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYk18bX7cRzr0uBEytpgIQTDx3Sgm8mS05n6bJfcUrs=;
        b=UhRCLhEcaOWLWX9LzTosSL2woxsT0xHJ98bmSFSl7DP4tS47Wq+mYMymjMZbpLY1Fg
         lVTXoSyNRe+j7rJ14hz+ZhgFdV4pvns4IyPckLnP/H6uH6JSc7x6KmefNRHKR04cYTbo
         e+4Mxkhl1NDFs0CU198CD6H7Mj88tlE7eozjMJw87XaNCJx45uzvaAiTURvMpsgEwbbC
         caKihLe0/eteb29D5LKqmabWsP9GTme0cdDPFoxxVOOdXO9QkO5OrI0ddJiu09TGSy6+
         HDn35YRKAzW1EBF8pc01WxtDsUp3QrbFUUr83mSKeltsc88JtiStzPNthL5HonoJPz0q
         sf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769618424; x=1770223224;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYk18bX7cRzr0uBEytpgIQTDx3Sgm8mS05n6bJfcUrs=;
        b=li02QgPUyHzGeNfOATagAg75gFHdInxnXWcnIRhAdSP2ByGDRSTZArWY0yx5p4bV8y
         clKnaeTzUcRVDTCfrwvn677mjSCAtMEbI5/SIdWLksdtStuPUSeYQ00MSKBkP4cOy5Jt
         4DIAxshJXg5rNoxiAmOqVl527pjBUPQS49vgF8KdTDJlmpMOftJ39rAJeL8H56Ws0ERn
         y0NdbLoo+Z7jlUwJt1zgMCUgSAcdPHUSXpz894Gn9v43E2Gd8KEBSA13/99ms/tOaazW
         keSjs2JFG/jMAIsryp7oOXri8hF4B5PJ01Z8LOHyEoDh/tM64k20lzTuXcSwyfrgteCJ
         XHqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW48zGkHT/s/Nb4y8K+Uu5CvmrVeK2lJBPhxBilG59y4i1WjnN7YwZh9V3mHL6aCqrza3l9/mu2fHkt2vNlZK/T@lists.infradead.org
X-Gm-Message-State: AOJu0YzOUrdeaEwwOKHDgxtloyzBldFh+qpoC06DnwIU3xLpJci1tQFd
	nWpJ3N+liWYeuzAtj+TIDkRDdWKHIu7bFm8+INe2KEGdSmx6IAnrLY+7JEaNbOe9RVo=
X-Gm-Gg: AZuq6aIhHrSoZh6PRMPiwiCnGJcQtXVj/BgP7ITp7Dd+eG+HjflhRk+GH/4kk5sZsVU
	qXiQiLBW67qn9zC6Q+N8CBvWVTpj+jwiGcEeJbjdFWl0MyfEBDOxBdA8Cfg0P2IqDkT3bJUsmL5
	jY8lO0SOFBw7TZ8g0/q7qTqPr8aYKrSjjuB2Eum5S+3wAEqqn8UJsis/vwL98WA6w3tZDda1SHs
	DyhEXm1eAKFjwV4Y6vcdtWyMiPPArSgwOIN1mmxvR2R2XDAOE5zBbMCJdnTDqH+V+9oifmuGQR3
	l8DWT3DqLZ9NmHfXqVWNIHZo7WLzMYdgTOxwy646z1SOxvRtkLtf6CbeYGxo+OBkzwp+7RJ6dEC
	70RQMP7X74beWTSmWKF/6Lyki/WZ/rdfHgdWQixdsG1Pz4awc/LJqpMeXyXSA6tWFSrjsQgjBtp
	CN6qvWkz2adiRVgo/JBA6EkVPAUVIuPKlLTE7BExPA0IsBxQ==
X-Received: by 2002:a17:90b:3c11:b0:352:c995:808a with SMTP id 98e67ed59e1d1-353fecda875mr5481744a91.14.1769618423968;
        Wed, 28 Jan 2026 08:40:23 -0800 (PST)
Received: from smtpclient.apple ([2601:602:8700:e32a:245f:3d9c:239d:6b19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61e0007sm5993765a91.12.2026.01.28.08.40.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Jan 2026 08:40:23 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v6 1/7] dt-bindings: i2c: xiic: make clocks optional
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <aXoul5n9sA1UmqoS@smile.fi.intel.com>
Date: Wed, 28 Jan 2026 08:40:11 -0800
Cc: Michal Simek <michal.simek@amd.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 info@mocean-labs.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E2D1B484-CBF0-4763-908C-DF293332D2B1@nexthop.ai>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
 <20260127-i2c-xiic-v6-1-e82e2f6f657c@nexthop.ai>
 <20260128-remarkable-airborne-chihuahua-a1a16c@quoll>
 <66c7435c-a936-413e-a016-c860d448c971@amd.com>
 <fc00f8cf-b566-4694-82fe-76010d2f7c78@lunn.ch>
 <aXog-KBw7Bp-VEC4@smile.fi.intel.com>
 <5dc423be-c1f4-4a59-abcc-807f63b25f3f@amd.com>
 <aXoul5n9sA1UmqoS@smile.fi.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_084025_305256_F9DDA8B9 
X-CRM114-Status: GOOD (  19.62  )
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



> On Jan 28, 2026, at 7:43=E2=80=AFAM, Andy Shevchenko =
<andriy.shevchenko@intel.com> wrote:
>=20
> On Wed, Jan 28, 2026 at 04:00:30PM +0100, Michal Simek wrote:
>> On 1/28/26 15:45, Andy Shevchenko wrote:
>>> On Wed, Jan 28, 2026 at 03:34:02PM +0100, Andrew Lunn wrote:
>>>> On Wed, Jan 28, 2026 at 12:21:41PM +0100, Michal Simek wrote:
>>>>> On 1/28/26 11:37, Krzysztof Kozlowski wrote:
>>>>>> On Tue, Jan 27, 2026 at 09:03:55PM +0000, Abdurrahman Hussain =
wrote:
>>>>>>> The xiic driver is designed to operate without explicit clock =
configuration
>>>>>>=20
>>>>>> And if you change this in the driver, then you change bindings?
>>>>>>=20
>>>>>> You miss here explanation based on hardware - how does the =
hardware work
>>>>>> if nothing ticks it clocks?
>>>>>=20
>>>>> Hardware obviously have clock input which needs to be connected. =
Without it
>>>>> it won't work.
>>>>=20
>>>> Should ACPI potential limitations be making the DT description less
>>>> accurate?
>>>>=20
>>>> Would it not be better that the driver has an DT binding and an =
ACPI
>>>> binding? Where there are common properties, common functions can be
>>>> used to retrieve them. However, if ACPI lacks usable clocks, use =
the
>>>> of_ method to get the clock from DT, and skip it for ACPI.
>>>=20
>>> Why should we use of_ methods? If this is required we can check the =
type of
>>> fwnode and act accordingly, but I think this should go deeper into =
some
>>> treewide available helpers, because now some drivers repeat the =
mantra.
>>>=20
>>> But how do the driver get the clock frequency (if needed for some =
register
>>> settings and/or calculations)? DT seems to have well established =
property
>>> 'clock-frequency' for that. Can we consider it as "ACPI binding" as =
well?
>>=20
>> "clock-frequency" property in i2c is used for selecting i2c speed =
100/400kHz.
>>=20
>> Clock frequency in this driver is about describing clock coming to IP =
itself.
>> Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
>=20
> Ah, I see, then is_of_node() probably is the compromise how to deal =
with
> this setup.
>=20

Thanks for all the feedback!

So, if everyone agrees, I can make the changes to:

- Remove the DT bindings change.
- Make the driver fetch the clock only on OF by checking is_of_node().

Does this sound acceptable?

Best regards,
Abdurrahman




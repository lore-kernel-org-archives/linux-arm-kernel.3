Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7A7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x1lf49SD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rWtzPTNz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h4/IEEwDZXLw/hZQAesBTnBi16Rhs6f/cohcUh8FEIY=; b=x1lf49SDZvEJJh
	jQZtLYoUm7k50HFntCIYuDyBfbPrkj9JWMPj/G6Fg3I4Ta+iXKfalUqy2BfC2x72ojnt+FW6Y+sHq
	RvaDdLKsDQITzBmS0k+W7wn0RG4s0j3HHpMQEKAFfNWVS7SSRRF9d6WHdhqi9NChoUqEFOvQ5zR2y
	5jPJZwdve+qJV9lt8JxfdJW+XtjVavoqGcGkOUiyMOmwLNpqmrIVpZyZuuXWHRMBJWJJe9UTAwvTm
	ma8tqhQV/EJUbH4O7ecsl5rc3SA/UxCgdSXQVc021UFkayIKK5G0R/yGfMRTLZFzPKRkvL8dwdKRo
	y7hZNxjnE0C7x/Xcfc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdSV-000000049hP-3R8h;
	Tue, 27 Oct 2026 09:27:07 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdSS-000000049gX-1o9P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 09:27:06 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2e85fb35300so5213885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093223; x=1793698023; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h4/IEEwDZXLw/hZQAesBTnBi16Rhs6f/cohcUh8FEIY=;
        b=rWtzPTNzVG39x9kMIdVu5SBwReZC/oUyysBQxhb9589aQruru8CUFssOMFX16DRwjL
         pTgEV06To9H7CeWMGE+4IuzctbMcUC2/G8iy8MKGDClD6yQz7/91vOb1xhnEZbl1NKHA
         HQrHdBVwTSYshMJdbmL+UB66hoOAlnEfUTTvLWYcfJOQlfEBB/Fovym4/8KsqTJMIEG6
         oj0Fkaw43P9d0m2lRCpyLWAVp/V9IDCAodOwD2d5RobUqu455ghRuX1pZwO47LW7HV6F
         WBcDPFFyh9yLY/1QQ1FHGU567E0aZkjEdD/9oFjZlMWfm/kTVaU5RxmnEt+S2zVzJZdt
         INHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093223; x=1793698023;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4/IEEwDZXLw/hZQAesBTnBi16Rhs6f/cohcUh8FEIY=;
        b=jTwHCDhDhoIvEcu5fLin/7kCQncf57Pq8D/zmpcxcKrGwtM/ELMoWP12QJ7aVbc/Hl
         k09mdEL72wvrnOe7jo5T/qDx9CoAW8avOr5GfTD/YbZNofL2vWuvGqkXE0cZJR6sEscl
         yDx+0dM3/K9nGCaw8XVBP7ycwFZMJ+IMHdvu5gqywDQSQhwgf/ptROr/ffETkE1L206v
         fNLk2mKwHFTboCOrwYXm22OLXpq042QPPvhbdmOCfzIHXGnOdQxC89mSLl1MOGmvzRyX
         kEqaXQnSTsqEXc2jagNfeCkdprzutnVENosQkVawazszlVZd/dEgX4C59JW3AILcSr1s
         61sw==
X-Forwarded-Encrypted: i=1; AKwUvBwhnjYe4wEYG//UjeWPcW1Zs966byt36+VuuC1v65yEQER/spvfwRrKtESu76UmBYScUkz7TGOJFEU93qCG7/Sx@lists.infradead.org
X-Gm-Message-State: AFq9FYJMKGnANbT7fmIBqShU5DA/y+hHYOxf43eLCCtoFTzQArjG33G7
	PMRi8GLptLIPeaZJ652MFwgeAzqJEZ9qPa+Eciv5tb+KjCrVK0U5vLY4
X-Gm-Gg: AYBFou3tKRRkTvSiO619gD/98+Q8SbZwYRH/6x7sTImampYkouu4o3rhS9hCjfUy4uR
	2FkU/VgJzBfiV0dh7mAP0TFAXm5bUmJMHT2PjK0UU4nLmM5grSpXPVch2oD0hua4tNfM0A0xdJ6
	mriAKiR3+HybvY6yNmXtWg307aj/aD0WngnHhu69sE0OVtBIn2MkmZW4Tfxdh8y53oSLJOkAfgs
	nE+aNjPyn6hRVGOYAQJZXMuwop1It7E4ngJPdCtnZBvp8LD56QoZ9+3srN9ITl4svVqpFu1MVIE
	Yfpahr6FV07SCu0SBEzIEjiVI4t3XnBhEv2z2VimBMrQki6GgHKqbplbd68kPYvGR5Ld84TQ3vf
	5OV67Qur1G6PrBwQNqUNdTvcG9LL4YjACulu9B7sSNvWFmmJ/Ll0JKj4fgtOegmwmY/50L2intM
	Mb7GdylZnd5op4KeIM9FkpM4dOAQCihgL/0GgjtJh6ac+Ca2M2GIh7dDtMakK6QFmfCy2KbNe3z
	+Fq6B1/GHD9UEfPhcKG8REf4MVmAStv2wdLRLWX7kgsWLTLvXrw8OMBrzSPJpt5t7ejDYm1fmDW
	wtXmJKqXsSLsRzcebWV5iGTXI5rQ
X-Received: by 2002:a17:903:19f0:b0:2e9:3dd2:a8f6 with SMTP id d9443c01a7336-2eae3942024mr14409105ad.9.1793093222853;
        Tue, 27 Oct 2026 02:27:02 -0700 (PDT)
Received: from [0.0.0.0] ([129.126.71.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm6149335ad.16.2026.10.27.02.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:26:59 -0700 (PDT)
Message-ID: <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
Date: Tue, 27 Oct 2026 17:26:44 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, rafael@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Drax?=
 =?UTF-8?Q?l?= <ckoever@outlook.de>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
From: Chuan Liu <chuan.liu686@gmail.com>
In-Reply-To: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_022704_500479_308B5878 
X-CRM114-Status: GOOD (  17.65  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Viresh, Christian,
     Could you please hold off for now on the patches adding cpufreq 
driver support on S4? There are still two issues that need to be 
resolved first:
   - The clock driver currently does not support setting the CPU clock.
   - The CPU regulator needs some time to stabilize after the voltage is 
changed. Without a proper delay, the CPU clock frequency may be raised 
before the regulator voltage has actually reached the target value, 
which can hang the system. The S4 CPU regulator handling currently lacks 
the logic to wait for the regulator voltage to settle, so this part 
needs to be completed first.

We are currently working on submitting our own cpufreq driver. We are 
considering how to address the issues above, taking into account the 
hardware characteristics of previous SoCs and evaluating factors such as 
the transition latency. S4 will be covered by that work (as well as SoCs 
from S4 onward, such as C3, T7, ..., A9). So please give us some time.

On 10/26/2026 4:59 PM, Viresh Kumar wrote:
> On 26-10-26, 09:57, Jerome Brunet wrote:
>> On lun. 26 oct. 2026 at 11:00, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>
>>> On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
>>>> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
>>>>
>>>> Every S4 speed bin runs the same CPU frequencies but needs its own
>>>> voltage curve, and the bin can only be read through the secure monitor.
>>>>
>>>> Read the bin from the firmware, select the matching
>>>> "opp-microvolt-speed<bin>" property for all CPUs, then register
>>>> cpufreq-dt. Bins outside the known range fall back to bin 0, which
>>>> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
>>>> on the SoC compatible and needs no node of its own, and S4 is added to
>>>> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
>>>> the bin has been applied.
>>>>
>>>> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
>>>> ---
>>>>   MAINTAINERS                          |   1 +
>>>>   drivers/cpufreq/Kconfig.arm          |  14 ++
>>>>   drivers/cpufreq/Makefile             |   1 +
>>>>   drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
>>>>   drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>>>>   5 files changed, 202 insertions(+)
>>>>   create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
>>>
>>> Is it safe to apply just this one ? I can take this via the PM tree then.
>>
>> I would advise to wait a little for Amlogic to chime in.
> 
> Sure, I wasn't going to wait for the maintainers to respond anyway.
> 

-- 
Best regards,
Chuan



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21210C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptD7RqG2Wfwe8QvHULRB9jljjN5BIARVY3LM/DAzOSM=; b=aocNlP5aSljFgGb252+BTkqanw
	+hzxRc6EowEvQ11l2bGJniGTPXbyaYaGBmyxVkViWJ0oa5IZg2r/Bb3BSpvsUC51Bk2mhymgYgQrJ
	R1w7S3EO2jsrW5CUc79aYCpNM6B7H0Lu4HbDPCXoCY51G5OD45z1ryACmNw7x0HjyZDRPbWVGgGem
	hVUrfsmsJDRQPP5cvkBQqT7iZmmW4t/bF0hXK/wE3PlxNYHCyCMifrudgfBOoAktCjTWEVNB7rFW7
	eY6iRgBQU6SQq8rJcl76TMSYWQkkrgobTd31NKG6VoznM0X8s/nUegCmaiM2Cu2P3SIGZhfO4sq/h
	D3KFj0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgCz-0000000Fd4q-0N4K;
	Wed, 06 Aug 2025 15:37:41 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfzR-0000000Fb21-3370
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:23:42 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bxvFf4ZzLz9t1D;
	Wed,  6 Aug 2025 17:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754493814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ptD7RqG2Wfwe8QvHULRB9jljjN5BIARVY3LM/DAzOSM=;
	b=rINUDcKIArXUARYoVU8YTwFTGj6+5V7Wja6notBfGvVBFgdJPGZUoRKKNqv2AX00eR22MG
	HBrK/1y+6/MO/nuqE/PumgQKLzRJ3rdtqmbTlR4Q+SOpfDxcHQrwRF2ItT8ubDRcT96Eu1
	0JMzWe8H8aXIik/IrF4yuMmtaFXD08WxmpHc06zsSda7Ddym+cQCK6w9Kon2yX9vn3Lqaf
	xMw1jbKz+JhwBf3pKSmocCVHP2ZWC1ZF6gdEx3kxfNK1c9EeEBuN+PPbARvILHUP6eAVnG
	MwUE2Gbr6TcZD9QykA1Pv1A0QexP/376JN20RP5CoW3T3HFwZw4a/U9clUp2Kg==
Message-ID: <e1d465f7-43d7-471b-b8a7-7d24428bac4c@mailbox.org>
Date: Wed, 6 Aug 2025 17:23:31 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip points
 on V4H Sparrow Hawk
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a0bef3196f4fbcb220b
X-MBO-RS-META: ahbupiudatrs3ous6js5scw7o1xdhufs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_082341_908656_184F34D1 
X-CRM114-Status: GOOD (  15.83  )
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

On 8/6/25 11:35 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

>> +       #cooling-cells = <2>;
> 
> This is only present for the first CPU core, and map{0,1,3} refer
> only to a76_0, because all four CPU cores are driven by a single clock
> (Z0), right?

That seems correct.

>> +
>> +       a76_0_thermal_idle: thermal-idle {
>> +               #cooling-cells = <2>;
>> +               duration-us = <10000>;
>> +               exit-latency-us = <500>;
>> +       };
>> +};
> 
>> +/* THS sensor in SoC near CA76 cores does more progressive cooling. */
>> +&sensor_thermal_ca76 {
>> +       critical-action = "shutdown";
>> +
>> +       cooling-maps {
>> +               /*
>> +                * The cooling-device minimum and maximum parameters inversely
>> +                * match opp-table-0 {} node entries in r8a779g0.dtsi, in other
>> +                * words, 0 refers to 1.8 GHz OPP and 4 refers to 500 MHz OPP.
>> +                * This is because they refer to cooling levels, where maximum
>> +                * cooling level happens at 500 MHz OPP, when the CPU core is
>> +                * running slowly and therefore generates least heat.
> 
> That applies to cooling-device = <&a76_[0-3] ...>...

Do you want me to add this line into the comment ?

>> +                */
>> +               map0 {
>> +                       /* At 68C, inhibit 1.7 GHz and 1.8 GHz modes */
>> +                       trip = <&sensor3_passive_low>;
>> +                       cooling-device = <&a76_0 2 4>;
>> +                       contribution = <128>;
>> +               };
>> +
>> +               map1 {
>> +                       /* At 72C, inhibit 1.5 GHz mode */
>> +                       trip = <&sensor3_passive_mid>;
>> +                       cooling-device = <&a76_0 3 4>;
>> +                       contribution = <256>;
>> +               };
>> +
>> +               map2 {
>> +                       /* At 76C, start injecting idle states */
>> +                       trip = <&sensor3_passive_hi>;
>> +                       cooling-device = <&a76_0_thermal_idle 0 80>,
>> +                                        <&a76_1_thermal_idle 0 80>,
>> +                                        <&a76_2_thermal_idle 0 80>,
>> +                                        <&a76_3_thermal_idle 0 80>;
> 
> ... but what do "0 80" refer to? I couldn't find in the thermal-idle
> bindings what exactly are the minimum and maximum cooling states here.
The comments in drivers/thermal/cpuidle_cooling.c clarify that, it is 
the idle injection rate in percent, in this case the cooling can inject 
idle states up to 80% of time.

+CC Daniel in case they want to chime in on that.


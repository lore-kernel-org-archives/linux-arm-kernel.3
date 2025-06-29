Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6372C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 22:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDdpl3By3X9ovNNxMrYzM8BcEB9nscefW9jEfoZxips=; b=isuDQytdMrwXIB4cVE5LzU9MGL
	LFuCrwbDLpq8WI6h63895n7I/AnhUlr1Lzd7jIcFTQA5J8QRuCUzsPV0i2t4tT3ArLa/DUSKtPOCN
	hBwAqJ6dgDuEUxcsaQ4xHOfZ0ljjFbGLCfEVDEg6rVdUIobPVlZPEWKUpqMxT7Qj+DIdI/fVhraJ6
	U92eVWQ8MUg+CB0EDn06D6zLEvrrvIa7jo1kS3Zt4BXlMi3am6n/Ly+BpEJNFk/TaSVtdy8Lx3Uwf
	R4hK6QBYKNA3XTEk+fF+nYfpfFQucLmZ3t/j+cgxiJZwTcR5yCDTCWHwIj+JSshvUAGxb30pb9tDz
	4XoNcWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW0cP-00000000oXe-2Alh;
	Sun, 29 Jun 2025 22:35:25 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW0a6-00000000oUp-3iR2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 22:33:04 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bVkZg1fVXz9st4;
	Mon, 30 Jun 2025 00:32:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751236379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kDdpl3By3X9ovNNxMrYzM8BcEB9nscefW9jEfoZxips=;
	b=X9YEudhNYyyQKsMiNjcgzjtDOADX/Hv10Qk0k+HuNEQ8ykiwfc28TT9U8GUlfUXUNR0LyG
	tPZGlv6/ocb9qYSs+yKRIDaIMGsYGvIZu5XGUk9zkUvyKcFXK9X/8JCrvzvNyvnSQWkHpP
	X15jC3gY41r2waV/GFDtmlFzq+yB1i7mkjaztuRktFQ8wXL+ejstgQSuIZvdAttnAglB7S
	PKg4lFKpSfvQ3W0XZ+zPO0QVzv7ouMyZZUwViaYeIfcJ0roYIt+hbBATAMy7mMquuq34Yy
	x3yQaF/4OgzhdXw84EE5UgpziQl45GpKh8fn2QJR3MMvcVGJzwCI4jXQCdZFTw==
Message-ID: <c0ec7600-158f-431e-8f99-a462d68b808e@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751236377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kDdpl3By3X9ovNNxMrYzM8BcEB9nscefW9jEfoZxips=;
	b=O2wvv5vpGSPgJRfrdRylP+6fnD36JGHlQkMm2PCf5GW+bch6SGCD5OP1xGtws1aJ9LNag5
	doFfqUIyia9SICS+oUC/wCe6lhItsjTxjG3wF/0LZif3tq1kiQYmpZBys1bUXPXvKi4W5L
	0bkcas8UYWVc2z5oF5FNU26mgUiZeZx8DX8TGaFUwLVIUZAkX+J82fxcPyig9zJ0OCZPe2
	s48NSlxFd+0sPGJBeqJXRj4hElophW1N2GRofKiD44IZsR8qDccQNmST6VIJHiu5GpLd8K
	w58gqgTgkEUmwogqnd/VMzDmyrh7rBvs1nmFAbZIC7c70wO4B4VDM779bHA2dw==
Date: Mon, 30 Jun 2025 00:32:54 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip points
 on V4H Sparrow Hawk
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
 <20250626214152.GA1817595@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250626214152.GA1817595@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2484d965c38b68daec3
X-MBO-RS-META: 5jta8u7daqtyj6ngn4tdp1n53siur7bj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_153303_065581_E14BDA06 
X-CRM114-Status: GOOD (  15.40  )
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

On 6/26/25 11:41 PM, Niklas Söderlund wrote:

Hello Niklas,

>> +&a76_3 {
>> +	a76_3_thermal_idle: thermal-idle {
>> +		#cooling-cells = <2>;
>> +		duration-us = <10000>;
>> +		exit-latency-us = <500>;
>> +	};
>> +};
> 
> I did not know you could do this and use it as a cooling device, thanks
> for teaching me something new!

You could, although the cooling effect may vary. Some cores enter e.g. 
clock stop during idle and then they really cool down, some do not.

>> +/* THS sensors in SoC, critical temperature trip point is 100C */
>> +&sensor1_crit {
>> +	temperature = <100000>;
>> +};
>> +
>> +&sensor2_crit {
>> +	temperature = <100000>;
>> +};
>> +
>> +&sensor3_crit {
>> +	temperature = <100000>;
>> +};
>> +
>> +&sensor4_crit {
>> +	temperature = <100000>;
>> +};
>> +
>> +&sensor_thermal_cr52 {
>> +	critical-action = "shutdown";
>> +};
>> +
>> +&sensor_thermal_cnn {
>> +	critical-action = "shutdown";
>> +};
> 
> Is this not the default action for critical trip points? In my testing
> in the past R-Car systems have always shutdown when the critical trip is
> reached.

It isn't quite that clear cut.

drivers/thermal/thermal_of.c thermal_of_zone_register() contains this 
piece of code:

"
407         ret = of_property_read_string(np, "critical-action", &action);
408         if (!ret && !of_ops.critical) {
409                 if (!strcasecmp(action, "reboot"))
410                         of_ops.critical = 
thermal_zone_device_critical_reboot;
411                 else if (!strcasecmp(action, "shutdown"))
412                         of_ops.critical = 
thermal_zone_device_critical_shutdown;
413         }
"

If "critical-action" DT property is not set, then of_ops.critical are 
not modified.

drivers/thermal/thermal_core.c thermal_zone_device_register_with_trips() 
contains this piece of code:

1571         if (!tz->ops.critical)
1572                 tz->ops.critical = thermal_zone_device_critical;

If (in case of OF) of_ops.critical is not set, use 
thermal_zone_device_critical() handler.

There is a slight difference:
- If critical-action = "shutdown" is set in DT, then handler
   thermal_zone_device_critical_shutdown() is called, which is a wrapper
   around thermal_zone_device_halt(tz, HWPROT_ACT_SHUTDOWN);
- If critical-action = "shutdown" is NOT set in DT, then handler
   thermal_zone_device_critical() is called, which is a wrapper
   around thermal_zone_device_halt(tz, HWPROT_ACT_DEFAULT);

thermal_zone_device_halt() itself is a wrapper around 
__hw_protection_trigger(msg, poweroff_delay_ms, action); , where action 
is either HWPROT_ACT_SHUTDOWN or HWPROT_ACT_DEFAULT , which is handled 
in kernel/reboot.c __hw_protection_trigger() implementation :

1028 void __hw_protection_trigger(const char *reason, int ms_until_forced,
1029                              enum hw_protection_action action)
1030 {
1031         static atomic_t allow_proceed = ATOMIC_INIT(1);
1032
1033         if (action == HWPROT_ACT_DEFAULT)
1034                 action = hw_protection_action;

In case of HWPROT_ACT_DEFAULT , the 'hw_protection_action' which is 
assigned into 'action' can be overridden, either via sysfs write, or 
hw_protection_ kernel command line parameter . In case of 
HWPROT_ACT_SHUTDOWN , the action cannot be overridden .

In case this hardware starts to melt, we surely want HWPROT_ACT_SHUTDOWN 
with no override options ...

> If it's not I think we should move these to r8a779g0.dtsi. And
> likely add them for all other SoCs too?

... the other hardware has non-optional heatsink, where override-able 
HWPROT_ACT_DEFAULT is the right option I think .


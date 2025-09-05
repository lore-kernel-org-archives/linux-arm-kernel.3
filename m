Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DF5CAC580
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGW/ungxqDBJW9YXMQpQD4nhCcnvrpn3JZwjvrh6Cg0=; b=xRqTzvaluRACmB1uJCWO4v3x4O
	bBScQXe/AL1IsXL6646kwXEvSsjzV1KV/p5d2aWUn4oka8QfiLwYqPRYQxvY8SOZZ92866zt3K3Ny
	Drw5YCrhbwLv44oGJlPm/uD0xKvI2trJPRI9sX030cnG73IYZGjLC+kbsebrKLUKpCZhMI1Bsclr2
	isEiVDvMFPK0Jl+pHpd/HJ4s0YIqcV7g4Syr7ycTaaTXXU3i+XEMEpkcIMX06vYNTOYSMV/L4iIk9
	t5eF42PcJyHAd7Hy1I+g0anXDl+aHZcO00SlVIcE+DVbTD23NxweZomwuXqTCx9FPAdSeK20gRLJd
	n3RB8bOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYEr-00000002hOq-3MWb;
	Fri, 05 Sep 2025 15:20:33 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUxz-00000001UVx-2ZUr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 11:50:57 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cJF6K5HQ3z9sps;
	Fri,  5 Sep 2025 13:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757073049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGW/ungxqDBJW9YXMQpQD4nhCcnvrpn3JZwjvrh6Cg0=;
	b=r62uWWWhiP+/TNFM9ojD9hGOynWoFijOzN0tq8G8HZ+DH/2n3Pw/zLcSbKG1tuQh15S/4U
	vYHUt9u0M4vxS4Lq7D8jIFgpMuguuMGAPnhJw8KSZ+G6B9xywnWbwIDYMK/6KZxCREjcaD
	MKufHBi/U2WL0I1I3TjEoiiyl94sFHp+EVJVYSZ2JklUhf8m7dZ13fEFrFRyeaf1CPAvE+
	MHbJOB2FZd/rW3nFItO7Y9ArvnRYCanrtJD8CEwe8fmifsMQjjVJcFYJHcwcr/AjTRG7bp
	VPeACTxdXHSuSPuRELq2FzUw2tlmD4Gn76UvfqMVzpFVG8KyW+c3s8lg+RJGKA==
Message-ID: <82c9133b-050d-443f-afa5-31cb31c9e858@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757073047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGW/ungxqDBJW9YXMQpQD4nhCcnvrpn3JZwjvrh6Cg0=;
	b=W6wzAmKEzXq3BtGTj/djFy2owFTO21A6RLHkXJCc369J1pED64e2IMAZ2sgP7OuQuRnt5r
	WHHY5XizfwW1eW/pLMK86HCW2NduJZtzCbja5jq8dHi5sggtmtnxsqYU/8D3Y32h89/f9O
	wB1widfF2KK8Tqvc82m2OEvFrVAat8IkoDTKtfAktnAFmxOvH9Hmwyjw7Hc2D2BBFeg3JP
	eLMFpRXPa4YDeq/QB4uYG2U0y8zq64tcIc+E3DmbbL/tWwN7EqTd00Ee6HMJ5AYnMSTzOZ
	cYOc13vzgnETEEBeLQIKQZPdrTtWV0z8y4JhvqwlPWw+sKx9fLkYujfpzG2f7g==
Date: Fri, 5 Sep 2025 13:50:45 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWnusjKE8FNQWX-0arcdbV-18KTCHKZmhs5r5kRXn46ZA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWnusjKE8FNQWX-0arcdbV-18KTCHKZmhs5r5kRXn46ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3wqf1r8wd9xns1m3kdf8exxcee66ncs1
X-MBO-RS-ID: 82a828f7ef46ba3f18d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045055_800030_4E0DB35D 
X-CRM114-Status: GOOD (  11.57  )
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

On 9/5/25 11:25 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso
> 
>> +&i2c0_mux3 {
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +
>> +       mcu: gpio@45 {
>> +               compatible = "raspberrypi,touchscreen-panel-regulator-v2";
>> +               reg = <0x45>;
>> +               gpio-controller;
>> +               #gpio-cells = <2>;
>> +               #pwm-cells = <3>;
> 
> make dtbs_check:
> 
>      arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb:
> gpio@45 (raspberrypi,touchscreen-panel-regulator-v2): '#gpio-cells',
> '#pwm-cells', 'gpio-controller' do not match any of the regexes:
> '^pinctrl-[0-9]+$'
>              from schema $id:
> http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml#
> 
> I noticed you posted patches to fix all other issues in DT bindings
> triggered by this series, so I assume you just forgot to post the
> fixes for this one (which you authored ;-)?
I think the following patch handles this:

[PATCH] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi 
720x1280 v2 binding


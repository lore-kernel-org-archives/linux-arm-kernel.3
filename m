Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04DDCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnV3qkM8vXKz87ni6r4AwY45doVDY/GJzEej5br5st4=; b=BODvh3oIhJOJaqT6yiMhvsXrPt
	yw41tklG0AOKHYJERXzB9KvHcp8bP+7dOzuVp2G/ChfDpREd4Pc4lXt4leazz8iiTol80JpoYQp7x
	rUjR4/NRiX3ZttP0Yst6qXZiQxTiSKbYimW5iGU5KPCH3/Q5y7hQqhd/MHrxAlmLWxc6lfvgEqJT/
	n+eEwDU0bKixiUOWol6AssTGYEL52jAvQubwovI/pweWrQHlBoyeKtTYNezze2Xs4xNHIbUf0ixIE
	rQLeTAAzJC5ZWCw95p7ZsHFZjueOxKgv/HLFUwUjTrIxQwUz+fQrxqjqc7FokFjmJLb1pn9sdXwcV
	j2E276tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmLb-0000000FEC8-3lHU;
	Wed, 03 Jun 2026 14:13:31 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmLZ-0000000FEAx-3PAI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:13:31 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gVqRV1nDbz9tjf;
	Wed,  3 Jun 2026 16:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780495990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnV3qkM8vXKz87ni6r4AwY45doVDY/GJzEej5br5st4=;
	b=nVumAYB24WEopxRdmCdptRc4D/aq1fAw6mjBWBUfeCdAlb72LbldJGbWxmcNADb205l5sj
	eJibB9U22Hqdqc6bPWYdewugZZXcCIf14qEaASFwzENFVwkX2xPinyzvNM2nYInetX2n6d
	GfWFIPQB9ni0LUnqu2QgO+iw0NC2AuJg3r5K0wzaNFv+WTuE/vQSsgIX6A3sFi7OUKYcVj
	Zcj/Qv/396S0+09Pm38CN8AIGqqD3tz8NrysrNozXiy5+KetjZg5LNcv/4zK/lDlomnqa6
	RxQi/eqRjSeMnWvr/XGWJEq+1/pZw6RcQo+tkFSZ7CmnlxxUcfp3zxbYKxSKmg==
Message-ID: <a5535498-ea43-42ab-9cff-0ad53551737b@mailbox.org>
Date: Wed, 3 Jun 2026 16:13:06 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Enable application CPU
 cores via PSCI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260601113919.8327-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXGJ+Ww+ek3KLvrnFKpw2cJn=RB8q3k=W6ECVgtw-zK6Q@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXGJ+Ww+ek3KLvrnFKpw2cJn=RB8q3k=W6ECVgtw-zK6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e6913ec3d3745fd1b4a
X-MBO-RS-META: ffe1ti4tsfjmtqc1bf9w344pn51uzy9c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_071330_338100_B249AA8B 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

On 6/3/26 2:42 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Mon, 1 Jun 2026 at 13:39, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Add PSCI "enable-method" DT property to all application CPU cores.
>> This allows the OS to bring application CPU cores up and down.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.3.
> 
>> NOTE: This depends mainline TFA 2.15 or newer (or SDK TFA version
>>        which includes b950bc09f5e9 ("plat: rcar_gen5: Fix multicore
>>        boot by ensuring fixed address for plat_secondary_reset"))
>>        and on SDK 4.32 or newer SCP firmware.
> 
> I assume SDK 4.32 includes a sufficiently new TFA

It does not, but it does include sufficiently patched old TFA.

[...]

-- 
Best regards,
Marek Vasut


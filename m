Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA18CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 02:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1A1qyP8QeOPCU1K/hsX1FmZmqrWn214Zp6AIo4nhBs=; b=0bDIRqHew1jcWP0EO9cGsSoKCZ
	8e2y6wusyZM8Lv2Y7sQkc1GYtQcUuKsBBjFhTGHCXnj+oEccJ4IUpOngmEuKRIzySqAUXLF1hspcs
	T77EgL2MUZKWnU65v/i4nuFO1DUp5ezOA9YM/YO8Uf0q2VhMtO2HVMw674EwVlZA7tdQurvojzzEz
	UGN9HeoJmf0D6X9mkxq8X1tB9il4qdbFAB/QdMh+DSDqJ1zB4SpP0SFwihsUxFjmMg7BcoVjhow8k
	/jXDmerSOQUSSus84oNz1HMoROb7aRWRKf6zUV3va7r6/VtoW0xATdLiZlcddmYkNAkatKVWz15T+
	Bk7qw7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJMuy-0000000AC5L-42Lc;
	Sun, 03 May 2026 02:50:52 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJMuw-0000000AC4Y-2Gk8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 02:50:51 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g7TmP5BtLz9tjP;
	Sun,  3 May 2026 04:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777776645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d1A1qyP8QeOPCU1K/hsX1FmZmqrWn214Zp6AIo4nhBs=;
	b=khdl8CnHDmq8rAwn3UDgffvBS7llbtM4SCECCpjOR0ezbfjH17+dLJReJmvcKjc+UoOKGA
	RU3Z5xmkgQ3EoXJ8P1d+KjiiNYxCDEMTnsGK0BVWbBmRpi3lRxIkgHVYBx21GvhOhA71Lp
	t/UpvNPk7kWBDD1UDbXF7kszEoDs7pf83TpH/2zYg+fNcnh8TMcZOgXyQ28KDCUyXqDOvR
	8KaU9ZRoY/dTXZiwhyGmq1MKzmLi6C5ecTzgipWpegH4BMWYCPRoykeViDvgt1zE8Rb/gS
	2KAbXg+hCgk5E/4nw/oUmnlmpLfdtfkEme0SzlHq81QefByEtuFmo/MjNBucZg==
Message-ID: <8668e3da-fcd2-412e-9457-3413e0aceafc@mailbox.org>
Date: Sat, 2 May 2026 21:23:33 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] dt-bindings: clock: cs2000-cp: document CS2500
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUkT6wO=mCSbJt1dQueW62=_o3r589MvFyHhz-zSfw_9w@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUkT6wO=mCSbJt1dQueW62=_o3r589MvFyHhz-zSfw_9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 85931d5d9f889a08582
X-MBO-RS-META: i4rmf11wrmk77r1ympywfpfi9bxrssa9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_195050_739676_C1DB9287 
X-CRM114-Status: GOOD (  11.49  )
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

On 4/29/26 1:32 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sun, 19 Apr 2026 at 21:37, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Document backward compatibility support for CS2500 chip, which
>> is a drop-in replacement for CS2000 chip.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
>> --- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>> @@ -11,14 +11,18 @@ maintainers:
>>
>>   description: |
>>     The CS2000-CP is an extremely versatile system clocking device that
>> -  utilizes a programmable phase lock loop.
>> +  utilizes a programmable phase lock loop. CP2500-CP is a compatible
>> +  drop-in replacement for CP2000-CP.
> 
> While CP2000 exists in two variants (-CP and -OTP, cfr. the link below),
> there is just "CP2500"[2].
And it is called CS2500 , suffix dropped and typo fixed in V2, thanks !


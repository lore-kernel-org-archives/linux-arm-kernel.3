Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD52D111BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lhytOz/pMLw6cwoN72tfr5dCndGkwWb50ggJNngL6Q=; b=m9LGTzNErsN9Pv
	u4TBQtGMdOghzMI5+N9x9xDkFkKurRgwXIKOxyaWsKbdHufgkiC5XclWKfE7PFgF1g23w8ZlILH4j
	tBc8FlAwyK+7xvFLEQs4QC5/B/VmQhH2jARBoiKTa8jV4XwdPXjBVKao1qKE2nOiHCj++TsD4S/ee
	ku4FdWsiX8Ok3V4euNzK2KFLts7+sk5rUS4TCxVFG2yPOnB0FHNFZ3ef2Roe3ae9Tp4Q56tz0VVsC
	cAi0lvmF/YAO3M0SPb+KZrbJuNqAyJE/r0hVRXvGeu3wOIXK3Qmp4LPOmXpVYHYtSjujyCdd9Ucmb
	QtA5G7RVfIouCUxql3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rz9-0000000CuL3-0Biv;
	Mon, 04 Nov 2024 07:58:51 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rxS-0000000CuBG-2iUf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 07:57:07 +0000
Received: from [192.168.1.107] (87-97-112-21.pool.digikabel.hu [87.97.112.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 78E05888D5;
	Mon,  4 Nov 2024 08:57:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730707024;
	bh=2lhytOz/pMLw6cwoN72tfr5dCndGkwWb50ggJNngL6Q=;
	h=Date:Subject:To:Cc:References:Reply-To:From:In-Reply-To:From;
	b=oC4uW4rKzPa98MJMV3tddMN7nd3UbXkHVvUeAEYPtrnwaGOe1ezUvowN8GKP0IDvT
	 Qhc2aumIuJiwxzOc3br2cNL8YDgkQYjmoDMh+ZqNo08iSjr3lYWDmXWwhYzk2bbv/K
	 Uu6bgFK+aUskJ/PfxusWxP39mIlu4fISR9bNAqi4nE48xK6fpAeQcOTBncC3R5t0Rt
	 I9qLWEYUKkaH8AILQ4OXa6LjSbMXIZ4Di37hVApg8MVXv1n62wCPbhcJUHg6r8yTlW
	 AXf07mzwkqZswRY6m7kAayldZbRyuxbBn8G2scrFM01VVP099iA7gFR6hlYJ/SkC4X
	 sGfXoKH2kRvnA==
Message-ID: <4e5a3f32-f959-8106-ac32-f802353dbcf6@denx.de>
Date: Mon, 4 Nov 2024 08:54:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mp: add aristainetos3 board
 support
Content-Language: en-US
To: Shawn Guo <shawnguo2@yeah.net>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241031151238.67753-1-hs@denx.de>
 <20241031151238.67753-4-hs@denx.de> <ZydFO6b6oe9widaa@dragon>
 <5340fb82-bda0-d22f-23df-de620c8d61c3@denx.de> <Zyh0AgJZh1//17Te@dragon>
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <Zyh0AgJZh1//17Te@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_235706_872150_74C552F7 
X-CRM114-Status: GOOD (  15.13  )
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
Reply-To: hs@denx.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Shawn,

On 04.11.24 08:13, Shawn Guo wrote:
> On Mon, Nov 04, 2024 at 06:33:55AM +0100, Heiko Schocher wrote:
>>>> +
>>>> +		semtech,probe-reset;
>>>> +		gpio-controller;
>>>> +		interrupt-controller;
>>>> +
>>>> +		interrupt-parent = <&gpio1>;
>>>> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
>>>> +	};
>>
>> Should I remove newlines here too?... but looking into the example from
>>
>> Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
>>
>> there are this newlines ... so I let this lines in... or?
> 
> Not having newlines in middle of property list is just a style that
> I prefer for IMX device trees.

I remove them too than!

Thanks!

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de


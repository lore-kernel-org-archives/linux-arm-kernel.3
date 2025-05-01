Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F310C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Abq4Ei9DLswAtlYPs6qcl8CMlhm3M3rxfQd24ZEg59g=; b=EBqJAg67cfUrvgY/rIL26mts+l
	LV601QquEfT4DaBxVqMbCSz5Gx8cOQZ5kON/lKqq08cWHtfC6ieyIWLW+Oj3u/uV1gBCi8JNQ593w
	Dn/4yUGiIIr9G4BlfjpcBiAiezFTpPkWruGESOfxG1Q7n/8gPojKysuEHnR+RWbFFdBoPS/2d/dsF
	P4e5YherROznHCLd4wlErPSc4KyjYmRQGN25zUHNNYQ3Qqe53h/+FFIN78JyXzgs99xlZNcXP6QnP
	4ou4HXMqw66oqOB1FsCJ+HcfXbrj6Ff7GYeEfXYzkc8OQvTxgMSs8XGiGO0U0truq0KBaPMYSlUmo
	K4frpGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARjm-0000000FFUu-1BAq;
	Thu, 01 May 2025 11:05:54 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARfx-0000000FEwH-2oRh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:01:59 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D0B07258E3;
	Thu,  1 May 2025 13:01:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VqxOrDQx-27; Thu,  1 May 2025 13:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746097314; bh=LWH9aQoEGKjvn+/B3c90aXr4V2lDUYHoaiBU/lVpSfQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DkHgLmPnYucvtXeETGabAofcZZEmBxKiTmR7RGcads/ZyhjGYsm5u0CWKnwLt0ivk
	 5Nyl0+BokmdyNdfth1pPMwj6OBUNNqTjcmoJcfLJgOsShpHfiUvBRfFkFmpYGKjKGO
	 BS5GPONOrnoYmg4VLfoUbNI+k0wJkY3ZqCrIWCoGZlBEojBXEpEWTFdh+fDe/RC7jz
	 Iyta2WBQ9sQFaCmWm/lR35TX8eWd9j61oLaHDqN2kvAzeAGPoAhUlbna8L99xcZWNp
	 9R29QJFgMl4bq3xUq3vuyp7GGGtEED3HsKEzOFUd4R5RVcD711JgWQxUUIfl2Mt39J
	 qrh/Jo+Vj3bNA==
MIME-Version: 1.0
Date: Thu, 01 May 2025 11:01:53 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 3/5] arm64: dts: exynos: add initial support for
 Samsung Galaxy J7 Prime
In-Reply-To: <298d8c1f-40ca-4377-a7a5-69f81989d7ea@kernel.org>
References: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
 <20250414-exynos7870-v6-3-039bd5385411@disroot.org>
 <298d8c1f-40ca-4377-a7a5-69f81989d7ea@kernel.org>
Message-ID: <4fe07fef083daed35898e8a1d11b6d2d@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_040158_129302_33F30947 
X-CRM114-Status: GOOD (  10.05  )
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

On 2025-05-01 10:13, Krzysztof Kozlowski wrote:
> On 13/04/2025 20:58, Kaustabh Chakraborty wrote:
>> +		key-volup {
>> +			label = "Volume Up Key";
>> +			gpios = <&gpa2 0 GPIO_ACTIVE_LOW>;
>> +			linux,code = <KEY_VOLUMEUP>;
>> +		};
>> +	};
>> +
>> +	memory@40000000 {
>> +		device_type = "memory";
>> +		reg = <0x0 0x40000000 0x3e400000>;
>> +	};
>> +
>> +	memory@80000000 {
> 
> Why are these two separate device nodes, instead of one for two ranges?
> Does device has somehow two independent memory controllers?

This is from Galaxy J6:

	memory@40000000 {
		device_type = "memory";
		reg = <0x0 0x40000000 0x3d800000>;
	};

	memory@80000000 {
		device_type = "memory";
		reg = <0x0 0x80000000 0x40000000>;
	};

changes to

	memory@40000000 {
		device_type = "memory";
		reg = <0x0 0x40000000 0x3d800000>,
		      <0x0 0x80000000 0x7d800000>;
	};

I assume I have changed it correctly? `free -h` displays the full
and correct memory capacity.

> 
> 
> Best regards,
> Krzysztof


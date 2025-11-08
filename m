Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4D2CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vAYaVk9WZENjF6eHkSICn7UuLb/IhISNxFGvIkIKLE=; b=s6F5wlz7+760htB21K8JYUvfIx
	/jgylQf4De9xcG1gA67e25NFRU6mTzB5TfiVAdhIZj4YstTE1D6YylGohTs7EnlT3pX5+Buo3Kdm+
	Fyhv/0A9/PlfDzjEwc+ZQuOyNwOkx/La2VWIwM4MP+2s0Pp5zkDTKfTuA641BiEcrVgBRwDh58YFr
	hhGAcNpvKAw5IBp0jYtea1PIpAK7sLZazV2qNxt+MzkQAdbnYJmb4kW0Ne2f2FwyggglVlTdfNcZd
	5wXrUrYz9FP51qtVGDIOJ1HkAnWylADZDvYPPRuGzEfuyH85AhxyApBHmyvbZcj2sFOiafnVgkYcS
	rosYy7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHjU5-00000003Agu-3fYF;
	Sat, 08 Nov 2025 14:00:05 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHjU1-00000003Afu-1ENh;
	Sat, 08 Nov 2025 14:00:04 +0000
Received: from smtpclient.apple (unknown [180.172.111.150])
	by APP-05 (Coremail) with SMTP id zQCowAA3pPK0TA9pT6IJAg--.54671S2;
	Sat, 08 Nov 2025 21:59:17 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: Re: [PATCH 1/3] riscv: soc: re-organized allwinner menu
From: revy <gaohan@iscas.ac.cn>
X-Priority: 3
In-Reply-To: <e98a1e59-f3ff-4e9f-a180-79aea9943236@kernel.org>
Date: Sat, 8 Nov 2025 21:59:06 +0800
Cc: Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>,
 krzk+dt@kernel.org,
 conor+dt@kernel.org,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Yixun Lan <dlan@gentoo.org>,
 Drew Fustini <fustini@kernel.org>,
 geert+renesas@glider.be,
 Guodong Xu <guodong@riscstar.com>,
 Haylen Chu <heylenay@4d2.org>,
 Joel Stanley <joel@jms.id.au>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Han Gao <rabenda.cn@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <43109A90-8447-4006-8E29-2D2C0866758F@iscas.ac.cn>
References: <cover.1762588494.git.gaohan@iscas.ac.cn>
 <d17a3a01e2b1297538c419b51953f9613426ba42.1762588494.git.gaohan@iscas.ac.cn>
 <e98a1e59-f3ff-4e9f-a180-79aea9943236@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-CM-TRANSID: zQCowAA3pPK0TA9pT6IJAg--.54671S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF13uFWkGr1UXFWDWw1fXrb_yoW8Kw15pF
	4fCFsI9FW5XryIganFgryj9FW5ta93Gw43WryDJ34rZ34jv3yUWr90qr4xWF1DXryDWa17
	Jr95uF1a93y5AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvCb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kf
	nxnUUI43ZEXa7IU0uc_3UUUUU==
X-Originating-IP: [180.172.111.150]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCQ8ADGkPJyrqCQAAsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_060001_885328_601B1AC5 
X-CRM114-Status: GOOD (  12.83  )
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




> -----Original Messages-----
> From: "Krzysztof Kozlowski" <krzk@kernel.org>
> Sent Time: 2025-11-08 19:29:07 (Saturday)
> To: gaohan@iscas.ac.cn, "Paul Walmsley" <pjw@kernel.org>, "Palmer =
Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, =
"Alexandre Ghiti" <alex@ghiti.fr>, "Rob Herring" <robh@kernel.org>, =
"Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" =
<conor+dt@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>, "Jernej Skrabec" =
<jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, =
"Yixun Lan" <dlan@gentoo.org>, "Drew Fustini" <fustini@kernel.org>, =
"Geert Uytterhoeven" <geert+renesas@glider.be>, "Guodong Xu" =
<guodong@riscstar.com>, "Haylen Chu" <heylenay@4d2.org>, "Joel Stanley" =
<joel@jms.id.au>
> Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, =
devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =
linux-sunxi@lists.linux.dev, "Han Gao" <rabenda.cn@gmail.com>
> Subject: Re: [PATCH 1/3] riscv: soc: re-organized allwinner menu
>=20
> On 08/11/2025 09:20, gaohan@iscas.ac.cn wrote:
>> From: Han Gao <gaohan@iscas.ac.cn>
>>=20
>> Allwinner currently offers d1(s)/v821/v861/v881 on RISC-V,
>> using different IPs.
>>=20
>> d1(s): Xuantie C906
>> v821: Andes A27 + XuanTie E907
>> v861/v881: XuanTie C907
>>=20
>> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
>> ---
>> arch/riscv/Kconfig.socs | 22 +++++++++++++++++-----
>> 1 file changed, 17 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index 848e7149e443..7cba5d6ec4c3 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -54,14 +54,26 @@ config SOC_STARFIVE
>> 	help
>> 	  This enables support for StarFive SoC platform hardware.
>>=20
>> -config ARCH_SUNXI
>> -	bool "Allwinner sun20i SoCs"
>> +menuconfig ARCH_SUNXI
>> +	bool "Allwinner RISC-V SoCs"
>> +
>> +if ARCH_SUNXI
>> +
>> +config ARCH_SUNXI_XUANTIE
>=20
>=20
> You should not get multiple ARCHs. ARCH is only one. There is also not
> much rationale in commit msg for that.

The main goal is to avoid choosing multiple IP addresses for erreta.=20
If using Andes IPs, I don't want to choose XuanTIe (T-Head) ERRETA.

For example, v821 uses Andes ax27, but it used to select ERRATA_THEAD.

>=20
> Best regards,
> Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4325DC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpqevsbCiItTV9yzJ6RS3hyp8oN52d0Lf6KZvZP5l74=; b=CaF26lILnrzCaSiaGKB3a/4dGj
	1/CgFjeOcy7gRzsmliqeA5SDUxwL8SBIZOyhcK9zmyVjkizGOouilFlhWlW6T3mpGNHvw0h/YbM4V
	GsQ+qAMg5z0Sx4pfjI4Fq4PQqjvkg7RE49HzM27kVDiWVh/PLKiPtZgqS5Vzn5VDFAKK7KLm6VzpD
	G0c8Pzv0kasj6bqnaYbiwpIjpAmZlVnNpVIGj15HK5DoP/y/fTbYzKvqVQDnD7biU9QpYCnY4oLAE
	nQt26/0F7WrFIKX6y4f+I9YQzK57ccO/Hn2MDTWmDZSNecJFZ8Sj0F4h4hUKsY/0SR3z8DWiiYXYJ
	BqKI3MBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnctN-00000007LTy-2Qp8;
	Thu, 27 Feb 2025 12:21:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncNc-00000007EoC-3j35
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:48:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24D305C526B;
	Thu, 27 Feb 2025 11:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D582BC4CEDD;
	Thu, 27 Feb 2025 11:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740656919;
	bh=AhpAhn0faHwswWHSManQjfhQBejZiiPzZCY113iBWVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nBo/yt4d/vB9av6RmbJkoTqebihNKMeXmbE845X0SY/rDHaYYA0r69pPZKhTtt2f3
	 B3dHqMOMQV20vaBP/LO2H2O/4R2lVXwQLNGthOghTPWiP3SiApJhlzNxvmmxX0VpeW
	 QjFH+S78g6k88aq8nwDQg01yzedR+kPiOV0P0F0qyXk1G1qJWBEvD6eLWi+1J/zbp5
	 yTtRlfTMuzDZ7+qLWyZBcirFf77gakS3Gu+vjWZs8HLrEJOMk62qSrbs6dqJULmP/C
	 NjLeZZ5QIochcf2jYG+sDDGby0ZS4sqWVXS6PSP73pXcF7BqOIXhvGgZWlg0tpoUOm
	 1x25pDn+qltRQ==
Message-ID: <c4a44c39-5448-47d5-aeb1-32bab6e57047@kernel.org>
Date: Thu, 27 Feb 2025 12:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC
 option
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-14-thierry.bultel.yh@bp.renesas.com>
 <fe4ccf6d-bdf0-41eb-bffe-83d459319689@kernel.org>
 <TYCPR01MB1149252F0825C9BCF6A1B832F8AC22@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <f134c607-2a03-4ee2-9f7a-befa1e4feb74@kernel.org>
 <CAMuHMdW1k71gL_OYug+aF=SEkMDuXLy_oLpikahYVcqPMsMbHg@mail.gmail.com>
 <4f737623-6083-4ef9-b7a3-d09ebafa92de@kernel.org>
 <TYCPR01MB11492DBCAD461B83B3CBE75E68ACD2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <TYCPR01MB11492DBCAD461B83B3CBE75E68ACD2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_034841_014844_3B18AEDC 
X-CRM114-Status: GOOD (  15.48  )
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

On 27/02/2025 11:48, Thierry Bultel wrote:
>>
>> This is fine, I am not against fine-grained SoC-enable options. However
>> all your SoCs should be enabled by default (default y if ARCH_RENESAS or
>> any other option which works for you) thus you won't be growing user-
>> selectable choices.
>>
>> Strictly speaking this still will be choice, because you need to trim
>> config, but all people and all distros will just ignore it  and don't see
>> it in defconfig.
>>
> 
> I understand.
> 
> All the ARCH_XXX SoC options are already under a menuconfig section, which
> is defaulted to 'y' if ARCH_RENESAS.

Indeed and it actually cannot have "if ARCH_RENESAS" due to how compile
test is enabled there.

> 
> So I guess that this simple additional change would make it:
> 
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 91a815e0a522..231880c21aa7 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -358,6 +358,7 @@ config ARCH_R9A09G057
>  
>  config ARCH_R9A09G077
>         bool "ARM64 Platform support for RZ/T2H"
> +       default y
>         help
>           This enables support for the Renesas RZ/T2H SoC variants.

Yes and then run savedefconfig and check if defconfig needs this symbol.

Best regards,
Krzysztof


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35A2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 12:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0r+lgWTEbqxrZxw3wZ6SPWZ1WxPQ4jKS4osEVkt51Q=; b=wgtOG/9dbX9EsPSxiFXEbFsUtJ
	7OqLLSgQwNbJniVbrrbP6IUqyD8E2GIQVvHWfHtsrXqS/MORHkufcKGUp52cvBKCKoDk9KW7aHdk4
	IOVUIE4C3C+JTvxJYvKXwpu7X6uc80DMU5XFWAhvvMoeqFm2At6ZV0oV1OEX21k94IoxxkdIqU+lh
	WcPq+mTAtnJfTO1bc4LtPp/jOHvaHfV459PNoWcxARRebTDcIMlwPzRJ4lhV6DEayInzDVNT59RNO
	Mn1msTSi/Ie7y4E9WF+PnWukX4AKck/jTCPOtAWi4YHd861c/C41s6Z4IOOV3qYvFGC8SsP7qzpO7
	L+mha7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUQ4K-0000000GpUd-2ORi;
	Sun, 05 Jan 2025 12:49:24 +0000
Received: from mxout014.mail.hostpoint.ch ([2a00:d70:0:e::314])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUQ37-0000000GpFt-1DKI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 12:48:11 +0000
Received: from [10.0.2.44] (helo=asmtp014.mail.hostpoint.ch)
	by mxout014.mail.hostpoint.ch with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1tUQ2v-000000005Vu-3aIl;
	Sun, 05 Jan 2025 13:47:57 +0100
Received: from [178.197.223.140] (helo=[192.168.10.76])
	by asmtp014.mail.hostpoint.ch with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1tUQ2v-00000000NLP-2Dvi;
	Sun, 05 Jan 2025 13:47:57 +0100
X-Authenticated-Sender-Id: code@stefan-gloor.ch
Message-ID: <d4cafa3f-d17c-4f80-bb30-98c28ede1077@stefan-gloor.ch>
Date: Sun, 5 Jan 2025 13:47:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: sunxi: Add MMC alias for consistent enumeration
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241219105622.13691-2-code@stefan-gloor.ch>
 <CAGb2v67dBhL3-AhLeHg3xOgbNZ3qu0aj9+kA+MoOMRYfr_Z_zQ@mail.gmail.com>
 <20250101232836.76c7fd0e@minigeek.lan>
From: Stefan Gloor <code@stefan-gloor.ch>
In-Reply-To: <20250101232836.76c7fd0e@minigeek.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Vs-State: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_044809_343342_AE2F4A49 
X-CRM114-Status: GOOD (  16.43  )
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

Hi Chen-Yu and Andre, thank you for your input.


On 01.01.25 09:58, Chen-Yu Tsai wrote:

> IIRC we have chosen against adding explicit MMC aliases for the sunxi
> platforms. Please try using UUID= or PARTUUID= for root partition
> references.

I see, no problem. Out of curiosity, what is the reason for this 
decision? I couldn't find related discussions on the mailing list.

Personally, I like the UUID= or PARTUUID= method and I do have a working 
Yocto setup that uses PARTUUID to find the rootfs. It integrates nicely 
with the automatic disk/uuid creation and U-boot using extlinux.conf 
[1]. I do however understand that this requires major changes to the 
meta-sunxi layer and the maintainers don't like breaking a working 
system with U-boot scripts. So I went with the easier way of adding 
aliases. For future reference to anyone, this patch has now been added 
downstream to meta-sunxi [2].

[1] https://github.com/linux-sunxi/meta-sunxi/pull/431

[2] https://github.com/linux-sunxi/meta-sunxi/pull/432


On 02.01.25 00:28, Andre Przywara wrote:
> Yes, and LABEL= would be another way.
>
> Alternatively you could use U-Boot's DT when booting the board. U-Boot
> will add those aliases during build time (because it needs them for its
> own purposes), and by using $fdtcontroladdr (instead of $fdt_addr_r,
> on the bootz command line) you get this for free, and even save yourself
> from loading some DT.
> We sync the DTs regularly from the kernel to U-Boot now, and at the
> moment they are identical between the kernel and U-Boot, so you don't
> lose anything.

Thanks Andre for the helpful tips. I'll remember this for future reference.

Best,

Stefan



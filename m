Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658A8CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwQtsH68VPF+LHaAUjoh8HC7NSHn396Czn49ocrEmyU=; b=SEh6737p64skpCSJVhoQ4IShtM
	EfRlRoNBrrqAzpTFftv3gqJRLzPWMAsOtxORIr2VOAfW07JXcY2mRwvQUtb5y0N5KybvbobR+O+xy
	fiZf2FwIIST4ipCmVKOktWu8O6xDfTg62O+oYkdXjnTwFjAJmZPD9z3j1CFmWz5SIaQq2x2Ls1s1D
	XVTtMNsPvHqfVXcD42/JULWCkrXNGLtZBZAAALoAzLXQf72ScJT7UFfBoAeTG32wKgCrz0VAcVgVm
	weCqLPUjM5SED6gffij2ih99VJrxMblgCeDuUsN+6iQeTWmWDYRGx5xPl0q25s7WNsk022ww4SPFo
	/t219Cxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxFm-0000000FfP6-00R2;
	Mon, 18 May 2026 12:39:26 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxFj-0000000FfNl-2s7Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:39:24 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gJy6X06rNz9tf2;
	Mon, 18 May 2026 14:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779107956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SwQtsH68VPF+LHaAUjoh8HC7NSHn396Czn49ocrEmyU=;
	b=aV9XU4nUc96xqgi0almy3cDyvR3Gdl+jOg2q3Ylv/diL2QZMFKn/LL7q3BmdnPTuLO8H3r
	1ncLzWuRFhj5z6zyRdlt18fAVP1DYIvoaZLFrCUVkrAphbwlFID/F5tuHbZGRGkO4ahcZS
	gsUTG+9oWxjCqWBJAAMX6iBBCAqPKaogfICciC+2cWFR1GmMiVbdxCuMt6KzeM3qdGUH/u
	O3KMJy9l10i3k0y3+eIvmSJuRLuR2Fh0nCCLs29s6BGc7ubvvbtGCwVdg+IytdQRAv3SJY
	cqudrXoD/5B7m7HCjcc7A76QfPkh27zI8mlwKHzNq15Rp01X9SNDkF8shpbyow==
Message-ID: <0404752d-ad50-4d10-bce3-85fcc249b754@mailbox.org>
Date: Mon, 18 May 2026 14:39:12 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Describe all reserved
 memory
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVcpR96smOd4sdEXHoRp=WTLLzWNN9hO0P0=ZBTe4fKog@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVcpR96smOd4sdEXHoRp=WTLLzWNN9hO0P0=ZBTe4fKog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: d6fqep6pemmjf7zkmfn5k7xc3hapw1w9
X-MBO-RS-ID: 1b7f9417d81e0cad594
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_053923_871816_DF47EC56 
X-CRM114-Status: UNSURE (   9.23  )
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

On 5/18/26 9:18 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> +               /* TEE TZ DRAM. */
>> +               tee@8c400000 {
>> +                       reg = <0x0 0x8c400000 0x0 0x02000000>;
>> +                       no-map;
>> +               };
>> +        };
> 
> Shouldn't these reservations be added by the bootloader stack, when
> passing the DTB to Linux?

They should be added by the bootloader stack components, TFA and TEE, 
but they do not generate those reservation nodes thus far. TFA I can fix 
up for 2.16 (2.15 is in code freeze now), optee-os will need upstreaming 
of all the outstanding patches first, and then this can be fixed too. 
This is all long term plan though. Short term plan, which also prevents 
issues with SDK TFA/TEE, is this reserved memory node.

-- 
Best regards,
Marek Vasut


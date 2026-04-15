Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE097F433D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 23:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAh9to5467+gnOb00NYAiKWmE2uQaHHB013hJTcUdMA=; b=IOqCq3GbX7SRP5rHYP14wxG/xQ
	a1NuWvyHavQqytkhASBRX9JBo9ejeNeOA85Jz7+dtFTsF/kGpdEdn4/fMDC04wdc0dHHUfgVgWNKc
	VtectQ5RMmDx6/g7hSJE9YlBS1eMssBc2fjskHDg4Dj7oHFd6BpgROV97SVvx56MX9pKNRLfhTsGn
	Q1nr6JgAO5fGa/+GBkUuW29s/big0ntHT0t2aC2ChoBtDrp+owaalwEiwNxHBCJGRGUjYwxqhlCxk
	HKx5dX+nrnk60AdBQH96OitOP2Fwfz6G6SDcDuuV5Zfp3S2C10tc84Z+8Z3hYCF4GUzyrd6BztjsS
	UjR/4w/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9km-00000001lTu-3imd;
	Wed, 15 Apr 2026 23:34:40 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9kj-00000001lRY-2eZO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 23:34:39 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fwyCs19qBz9tQR;
	Thu, 16 Apr 2026 01:34:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776296073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QAh9to5467+gnOb00NYAiKWmE2uQaHHB013hJTcUdMA=;
	b=CynTRqs/sDc3j0nfYYUPy9X2NzMsm5Vnr3ESiKhHOUZvEbxWvBJuCibKIQ7rX+uHH+MN2+
	DOZX1TAQyXNUOlGFvG8sJ2XIBjJ3FduNKmfij7XdccgDcWNLmbHkAUyb2x75lAihaMjgAV
	UyN/aEuMid638kD+NOzLjCijfIEYzrCWANw7iQE+Wm26pB2Qs97KGBlmadVgYGwrg0uJHC
	oiO57N+MjPLxqJzXDotba9IWeLeN7rCCOMtNGEopmv7GxaboYz3dMfcnRf270eh4PfY+Oa
	Cbp6/PDKOcaETGyL/Da2W3aJLFgWdGd1ApH/Fztc4fm4foZSd5juCoNaSlOEWg==
Message-ID: <c79016f7-ee5f-4b32-91f6-9a2ca40436e8@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776296071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QAh9to5467+gnOb00NYAiKWmE2uQaHHB013hJTcUdMA=;
	b=kyhxDupAXS3XvO1q79TSS7h1Wt+/QkZHu7VBte5iuExFl3tOHKolFq4WiI3PDJVY/a79gU
	04jIGpRYNc3CrIxklQz5Bj2OPF4PLNvasZAb1Ea17Ylby68dxojD84rY9WawpVlOWiDje/
	0hy9522XSHz5iStpc1MhIto/PhyH5PRwpvUEZ9uEnjIqchKMPf4Y1Qc6cE+YkG8K2WgKu9
	jLja179bgfPKqnsZC0Hu7oJo/KK1yt1LTBDkDk3vg1OoKGFS19tW3y+mJxX4YT6obVIcNp
	KlJjiMJpbeBckiwhh9mOW9vIm6i7Qip5BmyJBNeUrDs5CLdaYrkCCP0AKOoqrQ==
Date: Thu, 16 Apr 2026 01:34:28 +0200
MIME-Version: 1.0
Subject: Re: [RFC][PATCH 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace
 clock on R-Mobile A1
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
 <20260328000031.94645-4-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVOHaQU0qAYYQV3u7bAm3jzKmQM=btnpFaToxGxPrVGXA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVOHaQU0qAYYQV3u7bAm3jzKmQM=btnpFaToxGxPrVGXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 9ba0599e0c6be236990
X-MBO-RS-META: 3hn3zg9cf1ged7k1jpsycw1w3sdf678j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_163437_818428_8863CA70 
X-CRM114-Status: UNSURE (   7.36  )
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

On 4/7/26 2:06 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
>> +++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
>> @@ -551,9 +551,9 @@ cpg_clocks: cpg_clocks@e6150000 {
>>                          clock-output-names = "system", "pllc0", "pllc1",
>>                                               "pllc2", "r",
>>                                               "usb24s",
>> -                                            "i", "zg", "b", "m1", "hp",
>> -                                            "hpp", "usbp", "s", "zb", "m3",
>> -                                            "cp";
>> +                                            "i", "zg", "b", "m1", "ztr", "zt",
>> +                                            "hp", "hpp", "usbp", "s", "zb",
>> +                                            "m3", "cp";
> 
> The order of the names must match the indices in the DT bindings below.
> Else consumers end up with a wrong parent clock, leading to issues
> like the I2C controller driver failing to probe because its parent
> clock is out of range.
Fixed in V2, thanks !


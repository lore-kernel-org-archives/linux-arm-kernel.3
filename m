Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843DBE6688A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 22:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggcfDzy4T2wd6OE/Z3K6o9nCDGY9SIX9C7Zth5qGkkw=; b=OKWEUqlTnHAv/lvSRCcE6yH5J6
	m/Q0pkgaO1fikeqMDDjvz9xMv0SBX2s7eP7eBkAPba7GH7D7FDfrM46zn9T9v7y8/Slx6/3N1ndya
	+D+suMFbhndRtpKTV4bPEkBdxx5Lya6BQvjVtp9ZYwe50sCYgZRayq/gz/5UVabZxNXBCGcm2HagI
	eceKJZ2zgAVWrf40Ci0pjO8O9uMjIPIqADzq2m06DWV6MHmtMNXv/bQojNi8789T/jHeUXzhGxtGU
	VPegGsNuKWhv5AX4NSsLzoaNiCvczh1gn1Ld8UvUC7cylGiCWZZA5bnQr0JLG1L3Ryobtysu5ety0
	ygTKjFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEyKm-00000004xAZ-2GMk;
	Sat, 23 Nov 2024 22:10:32 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEyJo-00000004x3p-1fIX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 22:09:34 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 23AC3A037C;
	Sat, 23 Nov 2024 23:09:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=ggcfDzy4T2wd6OE/Z3K6
	o9nCDGY9SIX9C7Zth5qGkkw=; b=mrheDw3f9/c1M7uWYdSdjXZfspL54nuwPSA9
	kwVUd78i8gy+792IM4dEZ/atzbyV3kg2iMPD5d00RenG5xkdYl8h6xGJq+Wo8m7O
	tT4T34BCbLSC76luZhkGS6feezabh2pVoBdZawsTApjGI7FuWbf6ldS1garKQD7N
	IDEfkrsDNg9UnaM/jjMOoc4Aph7eU93iBLB1nptj+oRrDTDAQZv/j3nGLFrt3zuB
	74jY6EVfjBmm5NSUCgJbgxF9nGjjLKGRnhVlLVjNBOo5tYYz/3BVVkkDnnuo+fJK
	3Cl6dXDOi+LOea+NXBaEBi4bx6pse5vDC1LUfjFvOuIFSn1xh07ul/hBvKmoeAmC
	bfBjuQXB+OZYVT5RrCdIqrlGqC6hFo2IflskErKu2y8Cf/zSutPki9Cz5W84x8Yd
	thpGg1uzT0Rwi+rLA0PyIcDNLOXXLljPowOxLa4ugzyfdgfmtgSKhEYlWRRJlH/J
	8lra0RngSM8VIu1KwSs2U3tROUV+NzLiffS97CHf9k7NC5gQKgBsITbfrHU0NfnY
	geAgpFHg67fBDpvHhOeN8AfCruIBapj8MJRrs5xtitJDYmDyv14QkG3J08YHgtwH
	XHPkS3BYsUo1snyytbl3NHTpI1J04nZZIrJmdJVg2RiH84QU16rmZsqw2yeBAFnO
	D4Sk4Vw=
Message-ID: <f5f4be27-4d8c-4832-998f-8477030a21cb@prolan.hu>
Date: Sat, 23 Nov 2024 23:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: sound: Add Allwinner suniv F1C100s
 Audio Codec
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
References: <20241123123900.2656837-1-csokas.bence@prolan.hu>
 <20241123123900.2656837-3-csokas.bence@prolan.hu>
 <juzxtwlr5ayvjrrqem2hr3nbyem6oajwrvveio5brlzazdafov@r2aehknf4shv>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <juzxtwlr5ayvjrrqem2hr3nbyem6oajwrvveio5brlzazdafov@r2aehknf4shv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.1]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855607D61
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_140932_900145_ED6E8602 
X-CRM114-Status: GOOD (  17.11  )
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

Hi,

On 2024. 11. 23. 17:22, Krzysztof Kozlowski wrote:
> On Sat, Nov 23, 2024 at 01:39:00PM +0100, Csókás, Bence wrote:
>> Add compatible string for Allwinner suniv F1C100s audio codec.
>>
>> [ csokas.bence: Reimplement Mesih Kilinc's binding in YAML ]
>> Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
>> ---
>>   .../sound/allwinner,sun4i-a10-codec.yaml      | 31 +++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
> 
> Missing changelog - what happened here? If no changes, why ignoring
> received tag?

Sorry, I just forgot to collect it, that's all.

> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation: Please add
> Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
> or above your Signed-off-by tag. Tag is "received", when provided
> in a message replied to you on the mailing list. Tools like b4 can help
> here. However, there's no need to repost patches *only* to add the tags.
> The upstream maintainer will do that for tags received on the version
> they apply.
> 
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Best regards,
> Krzysztof

Bence



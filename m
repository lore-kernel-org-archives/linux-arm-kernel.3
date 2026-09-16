Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEE7C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Awx/qSMJsfDp5YFKo98US/4IxChQqsFBIzOvN17lZ2g=; b=w2Ix11nn4h5AgGJbzszD3edpgE
	4i7wHxLasecejMpgg1AgVLC/bxWoD5fwz4dMfuLt+yTI7dyUNC4hmPfn/cvB6KTHXH62cQJo+pEvS
	akcV0bUGdVpfz12kqz2Q362rVKDpShVdtNYd4z5KeSR6CK3I0RUXHcQkXZDLSNJWaJ9nCeVVvokdb
	Q79bLKIYv+yHeq9nY8BnlBP/JYqIl+Y85OpjnlperxRm4Nf9AlwdXlS9bjUMgmbOaUCqPBpihByeN
	CdNfzM2QyB5opF1d15pdzobd8aqTvpnj6ko1p5jNXFStLcVMrsDPzOrvMcW7Qx9KHn2N7KQkbVnOU
	ANlJhcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6x9h-0000000A9En-2QKO;
	Wed, 16 Sep 2026 21:27:01 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6x9e-0000000A9Dg-3V3g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:27:00 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hlX5R3dNfzKnS3;
	Wed, 16 Sep 2026 23:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789594011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Awx/qSMJsfDp5YFKo98US/4IxChQqsFBIzOvN17lZ2g=;
	b=im9OzdkXDGajHZYTNlRcWyDBOZJholJgFLe9R9NjoSNZx9LsAyzSKTgO0N4qur+kW7FVMl
	6uIO5coBY64vQfHI19PRRAz8r9Y61KHNE6QiQXBOcvFp54qBdKnAzCwsSvO8p55VtbradN
	33PYThsRqzNNfr20VYG5IlfQc6JXCt7rlPbmPNm5xoXzqioeOqJL32KIFHVpUnS/0jiQSX
	8xpJezTHawYbzcHWLtZRW+GFNgpbWQiqmU8++1MKJIlx9JIC/2D0g2/fomqOwWBXQ7Kslt
	FsGHAhDPfX4KALihngTSnIZepHa4d+JYfNWSUo4Q47NSqAHusHdRhSPxJ6RU1g==
Message-ID: <805629d1-ba2b-4e59-8d29-c374528367f9@mailbox.org>
Date: Wed, 16 Sep 2026 23:26:47 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
 <34f4c088-5268-4add-aef4-33b3d3623c12@mailbox.org>
 <CAL_JsqK8--7X5g4T05Y6bEGzsxrhTq2QyQRpE5E5uHBot3jLWA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAL_JsqK8--7X5g4T05Y6bEGzsxrhTq2QyQRpE5E5uHBot3jLWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: h3pk3hdfad8iwfsccm1r6mrg3escspem
X-MBO-RS-ID: 442b280c29c53d01ed2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_142659_017252_6DD4C7F9 
X-CRM114-Status: GOOD (  13.25  )
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

On 9/16/26 10:49 PM, Rob Herring wrote:
> On Wed, Sep 9, 2026 at 10:55 AM Marek Vasut <marek.vasut@mailbox.org> wrote:
>>
>> On 9/9/26 5:31 PM, Geert Uytterhoeven wrote:
>>
>> Hello Geert,
>>
>>>> +       /*
>>>> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
>>>> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
>>>> +        */
>>>> +       spi {   /* SPI_1 */
>>>
>>> As this lives at the root node, I'd rather change it back to
>>> spi-ws-2ch-canfd while applying, if you don't mind?
>> Please make sure the DT schema check does not complain about it,
>> otherwise it is fine, thank you.
> 
> It does complain:
> 
>        1 spi-ws-2ch-canfd (spi-gpio): Unevaluated properties are not
> allowed ('#address-cells', '#size-cells', 'can@0' were unexpected)
>        1 spi-ws-2ch-canfd (spi-gpio): $nodename:0: 'spi-ws-2ch-canfd'
> does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
> 
> The 1st warning is a side effect of the 2nd warning.
> 
> "spi-1" like the comment says if just "spi" does not work.
Geert send this fix today:

[PATCH] spi: dt-bindings: Relax node name suffixes again

Maybe that works too ?


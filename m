Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FA5FD2D9D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 08:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7zuVU4kSz42lHuB/Z7O1MfKKSTiVUlfXmHvT3WfrIk=; b=gQYLzfpTze5Rz5SUZOkYJLgr5l
	DXAnSR53Pw0hE8meiAb45/TEnPwOUtDevVjCt6WaTfQViNjQ5rUxk+VtSdZ/TYjT4Y8RD14U/Soen
	GaU2iQccWu+9zQ968MN8d9bgmRNPK9qN4q9uyqr+VF1uSzsCrV/infLiysorb7c0azxkqTvQ9CbPP
	Vwz8c81tBwaiMTqIAMcN5Xi53IxAFruDSwBtZ3amyxH7jwkOnKJHMokC/DgujenrkvHPZ7v5N3Jfb
	o/PAm05UDUmtC0f6hBL/Njb7Vz7x5oFvvLDpNuGMzhEr/gsV1FQdnl0F+1QmIvq516UG5rMLwI9vW
	h3tfhcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FOg-0000000BDBZ-1Dut;
	Wed, 11 Mar 2026 08:58:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FOe-0000000BDBQ-3lFP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 08:58:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 064EA6024D;
	Wed, 11 Mar 2026 08:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1BDC4CEF7;
	Wed, 11 Mar 2026 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773219507;
	bh=iGvI4Qyy3VTMCFms40DwkIoXkk9yGj2f8KU89uvrbHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=enx2TxRy7m1Q50tEQIo6QTelgoLVwG1Iha48zIL8dK4KY/YYQnuC/k3vkCgwRzNae
	 Lz/WhXsWzO6M53PFlWgHVdnPH3o8ZcWJXnENEryFbEmnJyUKs+g/qpqNL3uJ0l+JUQ
	 JZu76rtIrgKwUJxrAckhUYL2a9oX18q8z5w4sPdYwSjd9a11utdxa+FAH+NRFgAe7b
	 sX9D9Ze9MJt1JzwP/wxci/Ob6OYvw5lzemv9GB4PfV0WCyWVw3vIFszuHgnnFg0NOx
	 K2FeWUXzEl37BPE+gYnoWbJy3b0L/cYznPW7v1i87e7q8IvlUdLKduu8RvgjK+LhN9
	 P8vX/GuQwtUAQ==
Message-ID: <d9f9884e-b4f4-4f38-9732-66ff90408b4d@kernel.org>
Date: Wed, 11 Mar 2026 09:58:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Kconfig: provide a top-level switch for Microchip
 platforms
To: Bartosz Golaszewski <brgl@kernel.org>,
 Daniel Machon <daniel.machon@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robert.marko@sartura.hr, Steen.Hegelund@microchip.com
References: <20260226143615.65788-1-bartosz.golaszewski@oss.qualcomm.com>
 <84da053d-97d5-4d07-8e76-b162a5b23d2a@kernel.org>
 <CAMRc=MehMLoBL573cWjQNN2eCiTCyqCv1xwVKqfkZ5isBhBUaA@mail.gmail.com>
 <10bb25d3-2f46-4b62-affb-31257d51e24f@app.fastmail.com>
 <CAMRc=MfupCCr8J+qnJACVeri4nZZCnULWaRgSvi4LWs4J3-5vw@mail.gmail.com>
 <9132501f-76e9-46c0-839d-bde7246c3883@kernel.org>
 <244fdbad-0d9f-42bc-a005-5f5ef34d067d@app.fastmail.com>
 <20260227-wolverine-slogan-7af0661f6e44@spud>
 <c9df99ef-9bd6-43a0-9f22-721bd6bfc90c@kernel.org>
 <20260227111748.ddqdf4avpvfzu4cm@DEN-DL-M70577>
 <CAMRc=MdrrzoL3r-Br2pvR=TXxXVdS_ouf1ikNysd=GuhR1V84g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAMRc=MdrrzoL3r-Br2pvR=TXxXVdS_ouf1ikNysd=GuhR1V84g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 11/03/2026 09:32, Bartosz Golaszewski wrote:
>>>>
>>>> Here's the previous discussion when this was added not too long ago:
>>>> https://lore.kernel.org/all/20250811122053.4bfyoefln7wpz2a4@DEN-DL-M70577/
>>>>
>>>> Daniel is probably the one that "needs" to answer this, I think the
>>>> lan969x is added recently enough for this to not be particularly
>>>> disruptive.
>>>
>>> I don't get arguments there. The policy is one ARCH per vendor, so why
>>> exactly upstream would like to "having more granular control with
>>> separate"? That's downstream or vendor wishlist, not upstream.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>
>> The out-of-tree defconfig impact is minimal for us. As Conor mentioned, lan969x
>> was added fairly recently, so the number of affected users should be small.
>>
>> /Daniel
> 
> So can this be picked up directly into ARM-SoC please?

This should go rather via Microchip ARM64 tree.

Best regards,
Krzysztof


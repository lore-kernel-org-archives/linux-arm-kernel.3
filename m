Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0102105F7BC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBvFN3my5AVy2lrIhdejQCli64xpHH7XCUnkjZXPNFU=; b=BhFG2fT2UbvWjoHNhhPre58OiF
	Wpz4utw81W/B1TI2lL448yN+vnQKNVOjpVBvWfF2ajvxwVfy7NZEA78NUw3IJu+x2tPnd3MPqWkvQ
	EKpg9ZZEw/Djk2qo9++Fzxb59DVjMhSTKSdNtRpY96D6PS9ZQ10t9APEl/FSAHMetNyOM4goq2moq
	VzZjr4dtp7cwRAfNbmpDrhjGbsWeSFThgcvLEf3ArzY+lvYVe0P9PrWojszo+H4SYIicxCW2NGhEO
	C+tkm7npRJ3yNc8CRu2NPXSJU5/gRydiVGF+oDAWM5RCAIJo5rUJ7Avt8kRBUeTtno1RacHM4poiE
	qogc4Jrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14lJ-00000000ZwI-34jD;
	Fri, 13 Mar 2026 15:49:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14lG-00000000Zuk-1kEE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:49:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CA7CC4E4267E;
	Fri, 13 Mar 2026 15:49:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94FF960027;
	Fri, 13 Mar 2026 15:49:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF33F10369BC8;
	Fri, 13 Mar 2026 16:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773416946; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JBvFN3my5AVy2lrIhdejQCli64xpHH7XCUnkjZXPNFU=;
	b=MYW1lb/v7UD9mqMZtt9u4Yicuw08mgqjTl0y8Nyr7O3/y8JYD7Z864f9EBWgGlg5a0iJS1
	Up1QJj5OjMrrMsA5FhZNcFUxUn+3K0dgTK+00RVDaF9DM0xhcM9XWzgmDK8a9XCDIouLsz
	M5tV47t1J4N3YS+kxxjnjtVk+bhTD66GsVMMySFs21BG6NUL4WDjNxkYqSK4+gSnUUSXg+
	bpyNrkJnUSAQGhf/QOxowU0/kSOlNZVCvBkSjmud6eDkIIdabFYfqFfeCV6d7UpRI3/MSk
	y3bqRtVQGpdeov/joMjP4+aBRRANwUMt56MkXFGcVlfJogMbM1joHGkj/xBIZQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Elad Nachman <enachman@marvell.com>, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andrew@lunn.ch, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, mrkiko.rs@gmail.com, chris.packham@alliedtelesis.co.nz,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: arm64: add Marvell 7k COMe boards
In-Reply-To: <CAL_JsqJn87FdJmh=4phLL+DRQk8dz1iJE7=43f-ObFpEPpB_Dw@mail.gmail.com>
References: <20260122165923.2316510-1-enachman@marvell.com>
 <20260122165923.2316510-2-enachman@marvell.com>
 <87ms0qfd8h.fsf@BLaptop.bootlin.com>
 <CAL_JsqJn87FdJmh=4phLL+DRQk8dz1iJE7=43f-ObFpEPpB_Dw@mail.gmail.com>
Date: Fri, 13 Mar 2026 16:49:00 +0100
Message-ID: <87y0jv687n.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_084914_590401_EB91D125 
X-CRM114-Status: GOOD (  12.05  )
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

Hello Rob,

> On Mon, Mar 2, 2026 at 9:44=E2=80=AFAM Gregory CLEMENT
> <gregory.clement@bootlin.com> wrote:
>>
>> Elad Nachman <enachman@marvell.com> writes:
>>
>> > From: Elad Nachman <enachman@marvell.com>
>> >
>> > Add dt bindings for:
>> > Armada 7020 COM Express CPU module
>> > Falcon DB-98CX85x0 COM Express type 7 Carrier board
>> > Falcon DB-98CX85x0 COM Express type 7 Carrier board
>> > with an Armada 7020 COM Express CPU module
>> >
>> > Signed-off-by: Elad Nachman <enachman@marvell.com>
>>
>> Applied on mvebu/dt64
>
> It seems the .dts files are in 7.0 and the binding is only in next.
> The binding needs to go into 7.0 too.
>
> Please pay attention to the warnings. There are only 19 (unique ones)
> left for marvell since I fixed most of them.
>
Sorry for this. I have now applied the binding, and it will be included
in my next fixes PR.

Gregory

> Rob

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70118F588C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j14/w77pNCY6dGyDTRnql1CtUPQ/caeUaQRMtIjKP3g=; b=JrwK/DoBvrt0vl5ln0OfawfgCT
	KfcdL2vMMiFYTPssVfo5hH2nQzdAt9kjkkvqRJ9LR3kiYG+Y7/0SbpM9Fl3/pOopJM0grFeQVIeTb
	FO9T9j5hVsCjZMa/DhgRDIKxdshbJqi1p7xoU2OlMCUn63gndqRaAn906YX8GcL2UhYJMZ8/LhcNp
	i6fG+jJKVBCVHmRV+A9SOYgPhu/PgwBG5LEUcqtodbYcLMeiqIOxaEEsvCosL6vYvDBvqwfXETx9J
	KGi7qfCWtMK6cr/4/l0wb98eQgwD86Uu3B34hiVSFI4ZuWD6xTKsLue7iZS+6AQJpaohBaoQpLQAx
	HPBSqtzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoEz-00000006wTW-3DaR;
	Mon, 20 Apr 2026 13:00:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoEw-00000006wT8-3834
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D6F24448E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 13:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB55C2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776690037;
	bh=j14/w77pNCY6dGyDTRnql1CtUPQ/caeUaQRMtIjKP3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CXPoje7VLTGSLzYD5pz4vuLTXn/PwS/oFJOc2Xnc0bBK6qy3XN7kahuMf2RGMzm+7
	 Aa7pgMKlGRaLWfJzdk2n2YHq7s7eBosHd5wzFCBEkxABNU7tEM7Z6X/pvhspPR0It8
	 1AemoyrpkeM4gD0C9reWk6Kjt/qmoIhkEpy5Ru2UEcUVOH4lTRtyE2Ta7SP/zJhNLd
	 MPgfoalmRzV3KXQMw5wjqI1Ev7k2Hes0lts5885oSs/0elVQsieFIFWI8W9VQfDMkT
	 KhSLnYymbvGSF3LGd7OT8fnIU0gLd4gCxidf2iNaOo6LTuh2/K91N8U+J1rtvaEJR1
	 CJHIa2OfGeriw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a3be187ffbso3850041e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 06:00:37 -0700 (PDT)
X-Gm-Message-State: AOJu0Yws8L1zPTfLTXe9fAoEeaVSM9eisahdp2viCr0qGIVxu9A0bYl2
	069JP31sqBSKsu55U6KUAk+X1hOztNYNoDp2EPq0szNgFB1pmiMQHEaWAtdHJbfiDNUs1MWgdSQ
	NtGqxQIZYh7aoFcS2LgDOsgfAQ3MPYbg=
X-Received: by 2002:a05:6512:31d3:b0:5a4:156:aea3 with SMTP id
 2adb3069b0e04-5a417174a77mr4293857e87.7.1776690036524; Mon, 20 Apr 2026
 06:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260414211215.152850-1-stefandoesinger@gmail.com> <20260414211215.152850-7-stefandoesinger@gmail.com>
In-Reply-To: <20260414211215.152850-7-stefandoesinger@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 20 Apr 2026 15:00:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLkkV0h5R5=2sWNcPCV8h9vJHXCRsuaFxS7_bBZH0nZKUg@mail.gmail.com>
X-Gm-Features: AQROBzANcyyz1YUE9xSaaiat7IJgX2f4u8WLgFbC6HQhU952Z2QBKIp2Qa86ubQ
Message-ID: <CAD++jLkkV0h5R5=2sWNcPCV8h9vJHXCRsuaFxS7_bBZH0nZKUg@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] ARM: zte: Bring back zx29 UART support
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_060038_806656_0D203D37 
X-CRM114-Status: GOOD (  12.77  )
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

On Tue, Apr 14, 2026 at 11:12=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
> zx platform"). I did not bring back the zx29-uart .compatible as the
> arm,primecell-periphid does the job.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Topic should be prefixed:
"amba/serial: amba-pl011: ..."

Interesting with the AMBA pseudo-ID, but I kind of like the idea.

When bit 7 is set, bits [0..6] should be the JEDEC JEP106
"manufacturer ID" standard.

0xfe is assigned to "Numonyx Corporation".

Things without bit 7 set such as ARMs 0x41 and Qualcomms
0x51 are kind of cowboy values however. LSI 0xb6 is the only
vendor actually following the standard.

You could use 0x7e.

Or is this one of the cases where the Linux Foundation could
step in and actually ask JEDEC for a proper ID (despite 126 of
them being in use already....)

On the other hand I have seen how people just use these IDs
however they like, ST Micro uses 0x80 on Nomadik for example,
and the actual SGS/Thomson value assigned is 0x20 so should
have been 0xa0...

Yours,
Linus Walleij


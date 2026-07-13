Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541AEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 23:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XA2dLptzhu0nUEfqFTnwynbh4jwI52oxA+77WXPT/Rk=; b=JtUbxF/10oSZhZdWHXtOLW9pWS
	MYvAGtQ0W4JDMI7YIufO+xXLcw5GimCzcrdLEqZRum+6C89IRYOs3DizZQ3/YS+j3T3A3/tNk0lpB
	qbUxp8+Kq33CzGSXqZxbf5Lqfkg9MrP4p7+FCDS1y8df56oUB3gJqihwW3FGQfZ2HApL7kikTTsmP
	8XFim9GY+bglQU9cIEbYbN3+jQYvxuzDkUxYWd18sQoppaQ/gtgt6Y2zr5lCcZViuN+iOYOfoT1vw
	UlEeGzu8Z/X5YLyM8Me85hpAaMBIeA5joJrHn64/16/Qn2wDuoJhiKjCbhSDjESyUxIGxpmb7FazE
	mX49n1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ3X-0000000AYIS-0QTV;
	Mon, 13 Jul 2026 23:27:23 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ3T-0000000AYG3-1Z53
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 23:27:20 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gzdrH2v6qzMlQr;
	Tue, 14 Jul 2026 01:27:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783985231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XA2dLptzhu0nUEfqFTnwynbh4jwI52oxA+77WXPT/Rk=;
	b=vPYDZZPmJmDS9iIJcsWwKna8dAANTT51a58D8WjMr3kqcnWVjk+s4RjYjYvXrYeAbPMZup
	PHI6FHWZzDXCVqIkddK6tQIMeam9f4UBy/5xvSOsoP87MAaW4+Ia/suy865xgWQ5a2yYks
	seW5S9Dc6upEIkp9fdhvnT0d9awgaG8KLs4EWTJdyisKSn6oSxK15DlVA7fSbvVEFdH1Lu
	FoPs6NPDjvO9ih8wzeo3y7diICtCAqPx7VcxW+8y9Igu+a1oPsdp8muN0uPaJR4p22gq0a
	RaNl9wWVSIh1SusamdDaP//0Rt89C01HVQn9OOAESBnyPIY5VepWZZvCSXs75A==
Message-ID: <1d0d4074-90ca-4b33-9bd3-ff27aa0fd4d4@mailbox.org>
Date: Mon, 13 Jul 2026 12:43:18 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC
 carveouts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: jkiushhrxt7zs11gobawxupzowtdgffm
X-MBO-RS-ID: f81c410024f901d45b4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_162719_586409_A505C5D0 
X-CRM114-Status: UNSURE (   9.91  )
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

On 7/13/26 11:11 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> +               ecc@1e66660000 {
>> +                       reg = <0x1e 0x66660000 0x0 0x999a0000>;
>> +                       no-map;
>> +               };
> 
> Given all DB[0-7]FSDRAMECCAREA00 registers on Ironhide contain
> 0x0000cccc (md.l e98[0-3][7f]450 1), I think the last 3 regions should
> start at offset 0xcccc0000 instead of 0x66660000, too.
> As a bonus, we get 4.8 GiB back ;-)
I asked about that part internally already, and yes, it does take away a 
lot of DRAM. I think it is safer to reserve more DRAM and have a stable 
system than reserve less DRAM and deal with potential stability issues. 
I also think we can always update the reserved memory nodes in the 
future and shrink them to make more DRAM available, once we know that it 
is safe to do so.


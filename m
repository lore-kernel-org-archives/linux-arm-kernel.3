Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE563C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gPYjDd+JPWeY1o74poWekzAi3fnx4Dq4Me1Ix+wXdo=; b=cQCMPgj65jDsMv4rCFcivWed5q
	Xy0V78hNRpZkBhGjcVMgkDUyBu71TmmvNKHXaFRAZsIliUjbQDy2DfPVViVpCFhZ5CdXWB1xuB2Je
	YwQC1sHMkf9zKXindr4z/EQ7ejBTbT4jaU6rsFGuT4KT8hWZ3XC+d9PLm6yEKIPWmxLvbpgMMmNqM
	GsTYIQIHAJJ3p4wmMK45/j83gp8FHkHYTojFM2kQ2i/W9hlw4B1+AZ9jdryYV/IoFIbLQMY82R2kp
	+UPC42Qhc5VH4ehxCadrDbEI0Q5cCg9m5DAItpanDGjBPCyf8mp5Dhg6HVWfB52OI00GBUsbWjJwb
	eKC7u3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxbk-00000005pdE-3Vsk;
	Thu, 06 Aug 2026 12:54:00 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxbe-00000005pb9-272n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:53:56 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hG6fQ4wWHzKnSY;
	Thu, 06 Aug 2026 14:53:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786020830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3gPYjDd+JPWeY1o74poWekzAi3fnx4Dq4Me1Ix+wXdo=;
	b=SalejtA8AWY6uPEczWcOa/cZXzI/nFLnL5c8pcM7vKPRH0by35LMoHSCPO0bxDVd2UcA6l
	jhYVkOGyDEHUIMiYPVZ7vyz7VrmgANupuMqL5mgUgpXUnpDSMqZDY/i4lXRPFH5yTuj04w
	jFI09TbwjbrT+6Pl6EsquKJ44HK4DvMoTNxddBYGN0daeEJ6d2/nBy1rK7d4sFJ4MXMbRD
	MQN60NJ4i6cAgvb5gbjaFydu+znCZyOX0rbsfRAUZx9bCwphs2rKqd6ijJHI8a3XemtgIJ
	hpw32DVG+NB7Fme0Huxb6DdsBASNua/51sXMDmu7C8gDtcqN79/h8+K1n3bM1A==
Message-ID: <5920e231-a8b4-40eb-8239-23656fef02e3@mailbox.org>
Date: Thu, 6 Aug 2026 14:53:45 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1785941595.git.geert+renesas@glider.be>
 <89e6a71b35703f10e12f520af1f389b5f40f4b35.1785941595.git.geert+renesas@glider.be>
 <0124d3a3-81dc-44ce-88a2-9426c65ac46c@mailbox.org>
 <CAMuHMdXHPjzCidCkfyF0c9fndAmAte1DuhxGZt=WY=_jxpwU+Q@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXHPjzCidCkfyF0c9fndAmAte1DuhxGZt=WY=_jxpwU+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 9w1txx9bbib55itrouywbtz774kmecwr
X-MBO-RS-ID: 6c5d70869975684d6c0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_055354_689977_BD649717 
X-CRM114-Status: UNSURE (   8.40  )
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

On 8/6/26 9:49 AM, Geert Uytterhoeven wrote:

Hello Geert,

>>> +     if (!info->base) {
>>> +             dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &res->start);
>>
>> return dev_err_probe() might be more appropriate here, even if that
>> would be more chatty until the support for various MDLC nodes lands.
> 
> Indeed, it would be very chatty, and may confuse users, that's why
> I used dev_dbg().  We can revisit that later.

All right.

-- 
Best regards,
Marek Vasut


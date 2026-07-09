Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAF7C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBYB7b1WWhEAMItaDQhK+Z3zDJbr0ZJMB5I7IpRMH40=; b=AGZmtjY2lWTOQ+k23VCwUjiPVP
	PBh2ghFli4RuxHpMBViBl33/39sua04tiklcKemK6bD9zYOh1UDmvfhEVuR5zQUR3WPPg0/Cq4q3O
	/bP59w5CEk7f4LgsB4oUAEi2tk0zI2rrK72cfO7sf+UQ+jsYCtntzwCvK2/pfLPC1nyZT3j5+ZCCE
	rFr7HUlm5Jz3ri3OpLiCEF0WwCGA5H9jEoJ7FB5oLf3kXGGzHJD32x+ZcbLYGj4eorJTX/8G6VkuF
	SLj52doL/KIiHvfHCxJ2hTibjYhjuwVKS5zAYzE4BkttAklhNDacKPutsZ4iiYJoXMAL4rr85R5U/
	Hi2Dv0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmok-0000000296l-3U31;
	Thu, 09 Jul 2026 11:21:22 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmoh-00000002949-0Fdg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:21:22 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gwswT4P6Lz8v5B;
	Thu, 09 Jul 2026 13:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783596073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DBYB7b1WWhEAMItaDQhK+Z3zDJbr0ZJMB5I7IpRMH40=;
	b=OgCZhmCblaPezjAsJ8oRCkwQ+Idt+4vZolTS2e84ee9IbYbLrhY6LEdXryUY+tbnc4qc2i
	YlzbL4YPMr/OOlEkqL/AABfR0eLxPkfPt4yfMBqXzyKi3/l4UFsS4cEwwMQ/CSUnopYGAC
	wOSpwh2gId3hvpIMFE3rf6GquJoUgYtjbfguQ8gNNBw5Q3VWPdrU3IYxxL8fkVkAe00hME
	Ne0yFHREVENbvbiC8SfPTPnC8WPjaO5q6utuy7azK28PHz9YLBM5p790A8PaFFiKmyj6xP
	z9wY/+9GFXn7Q28TqmzCutuLlkljkk7EckRE4NB0znkO+j05spfnegEHY2iOrA==
Message-ID: <b4679822-85e2-4eab-8886-056e56db28eb@mailbox.org>
Date: Thu, 9 Jul 2026 13:21:10 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] soc: renesas: r8a78000: Drop duplicate "default
 ARCH_RENESAS"
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Huy Bui <huy.bui.wm@renesas.com>,
 Duy Nguyen <duy.nguyen.rh@renesas.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: d65fb8f0ee2d5d48ccc
X-MBO-RS-META: tiidnmgg35hcxzg5id87y43xxwgh69kt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_042119_271504_25712AA0 
X-CRM114-Status: UNSURE (   6.08  )
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

On 7/9/26 12:47 PM, Geert Uytterhoeven wrote:
> The Kconfig entry for ARCH_R8A78000 contains both "default y if
> ARCH_RENESAS" and "default ARCH_RENESAS", which are sort-of duplicates.
> 
> Drop the latter, to restore consistency with the other ARM64 entries.
> 
> Fixes: 5284d0b09d1bdc69 ("soc: renesas: Identify R-Car X5H")
> Reported-by: Marek Vasut <marek.vasut@mailbox.org>
> Closes: https://lore.kernel.org/a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>


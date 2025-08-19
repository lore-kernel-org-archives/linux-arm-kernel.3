Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284C0CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 07:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObL26OE97gG5flRbHvdO93Fpd5gaO/HRUMy/l+G5JRk=; b=Vl2uG4vG4Y+18uZ7lCtCgAag1D
	ADiOPXgK2tCz3IaqOyYz9K66W6Bw5cxji9gUQCs5YJlJvoffu7YeRUNhKf7sBVC1gYGUMapqwXCTo
	Kk6FzGDeNUe6ca0pl2m7ER0xad1ABXI3vJN6w16SrQcF4ULfG0Ugreb98AdfJM0o47PQSGnl3Rtji
	Z24STadLpMe0y4y73FnzEHpzIw0ezlwELxHwP/GTnykoQ+9MBlmSxrumykLqUUE95M0rsA1ZoDkuv
	fpb/0HQcO11Ug0FYro+wVVIlVG1H0lgX2P5hG7XVLU5nU6Y1u0/1k2Vn2WtAJpE+NGYQR/QrWNvRd
	0gCIC4qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGLF-00000009bd9-48RY;
	Tue, 19 Aug 2025 07:01:10 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFzi-00000009YdA-3gRJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 06:38:59 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 35F6D34A;
	Tue, 19 Aug 2025 08:38:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1755585524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObL26OE97gG5flRbHvdO93Fpd5gaO/HRUMy/l+G5JRk=;
	b=GLOmXOs4SK0S5ZeBtoSbCC4KJ8ATerfn7naXeU3hX+r/7f/HSj8lG6iznyNL1/cjpjKCkg
	BpG/G21iDSsy9UrSCCr5SEVGyCMLvl/l5insHYezX+qyvrOxSoyz3C2PqKyxXOiKgqYNQF
	Nb2kEBD0rLzRfcNvKHBEH8t6cQW07c96ywANk6DgRAW0xDHcTIZGTJkZmsevN4IxCRayVx
	Wh14y6dPXOEbHU/pSeLHWVjPUhBpv+OXnPoQg+pdE9R8yIVCZGkJVgFU/s/3Z8+6GJoQYR
	yhUwnHXSGfyu5QtMg+noXOTHVM6XGRuDTG6KKpbpeeYaEEY7U4QKpNKRuKQRCw==
MIME-Version: 1.0
Date: Tue, 19 Aug 2025 08:38:43 +0200
From: Michael Walle <michael@walle.cc>
To: Randolph Sapp <rs@ti.com>
Cc: Nishanth Menon <nm@ti.com>, vigneshr@ti.com, kristo@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, d-gole@ti.com,
 afd@ti.com, bb@ti.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, detheridge@ti.com,
 matt.coster@imgtec.com
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j784s4-j742s2: enable the bxs-4-64
In-Reply-To: <DC5T752T3P8B.1UC57G2GH35Z5@ti.com>
References: <20250808232522.1296240-1-rs@ti.com>
 <20250808232522.1296240-3-rs@ti.com>
 <20250813151819.5rthljjrpryfwezz@skinning>
 <DC1HU458W3QA.YLONSMYKK0C4@ti.com>
 <20250813181300.xfpsu23arx7xy4fy@anointer>
 <DC5C5JA237HD.1ACBQVG1LYQ7Z@walle.cc> <DC5T752T3P8B.1UC57G2GH35Z5@ti.com>
Message-ID: <f0353dea24751f2f2ad6e7735232b933@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_233857_792451_32FD7652 
X-CRM114-Status: UNSURE (   7.51  )
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

Hi,

>> Apart from that, we now have two series which partly overlap.
>> Should I repost mine, as that's more than just the DT entry? (Which
>> doesn't work as is, I'd guess.)
> 
> Ah, I don't see that series on the linux-arm-kernel list. If you can 
> forward me
> that I can work around whatever you've got.

That was the one Nishanth mentioned earlier:
https://lore.kernel.org/linux-arm-kernel/20250716134717.4085567-1-mwalle@kernel.org/

Also this:
https://lore.kernel.org/all/DC5KCSEUZQUJ.3KPENNUQBUFM8@kernel.org/

-michael


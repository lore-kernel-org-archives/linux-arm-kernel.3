Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CB6CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 20:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Date:Content-Transfer-Encoding:Message-ID:Subject:To:From:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tmUK5RaEabijpt54ibk4c+G+vXTWEzetNX2FjaSbF6o=; b=zCSuUuk13oTUjdkbI0kg6QWvWE
	jSIkT0TlXnDZ29aULWX4hGdQJiAE8kfQ+937wv2xtnB2TG6r98sOnzcsPm4fr6qtZQLr5DzXZRSuT
	PplPJAwGnWKUeV0Td02uJYnRNKZWMJ9KA10+aZQJPgcyXvhKRy80PT9DY1+xRKlyq08wdnUV/O3NR
	GP7gXOzhesak4B2/pZR05ACOXPP963vL3yGzDsf+ocVR+z98C4CsPgJFbBcFsjN6+OIJUUU9Dgamo
	iY8xvd8/lDUnft7/QDCNby6zpRH+IfxJzZrYe4i+dvlwRaZ2JM9V6T2dCXUToi9ZxdwsQkLTtp/fg
	0H+aXMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRxi-00000008Osm-2HSg;
	Sat, 30 Aug 2025 20:14:10 +0000
Received: from cmsr-t-4.hinet.net ([203.69.209.163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRuy-00000008Onx-0Uhs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 20:11:21 +0000
Received: from cmsr8.hinet.net ([10.199.216.87])
	by cmsr-t-4.hinet.net (8.15.2/8.15.2) with ESMTPS id 57UKB8NT398294
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 04:11:08 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ms29.hinet.net;
	s=s2; t=1756584668; bh=tmUK5RaEabijpt54ibk4c+G+vXTWEzetNX2FjaSbF6o=;
	h=From:To:Subject:Date;
	b=p/7m2eqqG6UQnKXBk6y7gwEdswN9MnRuvqbfoolpkoNhLsMNLrtXvFvP1dynzfaBn
	 u28/yRrYypzTpnuicmq31i/VfIESxLVVVE5E/o4M9WoyVROQM3qQSrkZbyr51xM6ZG
	 WarMwkVDJ2tfvwqL++G2zig64pNq8yBmCrmIs+2GU4jClBFMJ5qamwhmQxGjhuzhWC
	 GB+QB0htWr4594watKwSxBJk+DqKbZLoMCN6VzdtcR+/yV4VvqTLUUXf+hVAxPA7IQ
	 xyvQpXVVGQNsuXJIh4H37jASBnyzN2nIrl8x+v3qCC5vXpHxli1rBqeSio4PAZQfmy
	 qUp+1tid4jQTA==
Received: from [127.0.0.1] (61-230-192-37.dynamic-ip.hinet.net [61.230.192.37])
	by cmsr8.hinet.net (8.15.2/8.15.2) with ESMTPS id 57UK9Els863196
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 04:11:07 +0800
From: "Info - Albinayah 719" <Linux-arm-kernel@ms29.hinet.net>
To: linux-arm-kernel@lists.infradead.org
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gMzg3MTEgU2F0dXJkYXksIEF1Z3VzdCAzMCwgMjAyNSBhdCAxMDoxMTowNSBQTQ==?=
Message-ID: <01c3a711-003f-4175-105b-3617b5aa168c@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Sat, 30 Aug 2025 20:11:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=ZJd0mm7b c=1 sm=1 tr=0 ts=68b35adc
	a=v5BfitmIEQD35Mg+6JuSWA==:117 a=IkcTkHD0fZMA:10 a=5KLPUuaC_9wA:10
	a=OrFXhexWvejrBOeqCD4A:9 a=QEXdDO2ut3YA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_131120_462876_4FBBC002 
X-CRM114-Status: UNSURE (   2.75  )
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
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Linux-arm-kernel,

Please provide a quote for your products:

Include:
1.Pricing (per unit)
2.Delivery cost & timeline
3.Quote expiry date

Deadline: September

Thanks!

Kamal Prasad

Albinayah Trading


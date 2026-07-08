Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD48C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjBrVwKo19OFb5JA1WR5qxGZI/M4aEQHwbmWPVH9Fks=; b=pz2r/1PAF7CvETYB8xIRPAjX9R
	87LRmK3m2cWbdYHIkWmMbXl7E8qK9PN4EJnfcLF1Uz7zyN/PO+Lm2u3Z3K4qgf6u3QNxoxO+SuUcV
	ER3wu8+fjaSpsj03ltu8vZwoAvqoqapZElDpvU7AXnOHwuopYlhTqsAotv+2X4p6P836ZqTzNZWWy
	LoWJJXMPNs7a4nmMbR/Gth2FxP4AEpBtSeaB+XdxZEWpZzBFmIYZ99F3aeIZi+/+/b56ZJeRZ1Y0c
	QdAw+DJ0pC4k6HYORgJ+YyBygaUHctKQNJdzrohjyJcu9oJjn+votT4mnCvOcPiqf8gi3Z440L2ML
	/rsyBfzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaFS-00000000Tqd-1ykS;
	Wed, 08 Jul 2026 21:56:06 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaFO-00000000Tni-25fy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 21:56:03 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwX3N0DMLzKw3Y;
	Wed, 08 Jul 2026 23:56:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjBrVwKo19OFb5JA1WR5qxGZI/M4aEQHwbmWPVH9Fks=;
	b=wjFK/kaf3QZ/nDdcK3LeRFORDcRmlnZiUfoggHfLBBeTN7gSKVvaucq7jvglASAtoG5sit
	n/jo6T8f46y0Sc/sXaLsy3n4FkrQJokveJC3UtuyUqECqrvibEQmXoUHRh0Y4t8MBkgWJ/
	x2p+OZ4x73BxE3CrW6OJNpONdckpUQPHMZxK2g5Nwbu7DXQ5WzMvdGTetRilULoHb3PC6h
	jsuWaR/huwwAxV+2l813NtMEinZsTnA1O2ZcOH9ocGmg5dvVywLtcUgM3h+0d/8roN02RL
	eGweCpGG7R5mgGoHs46NaiHtb2d/aOJMzNQzviyBdzA8iBhCCqPNuM1A7KZK2g==
Message-ID: <7377ecb9-f9c7-4f48-8fb7-655822a8f526@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjBrVwKo19OFb5JA1WR5qxGZI/M4aEQHwbmWPVH9Fks=;
	b=qj8cBGg7BDmYDT3tr4495TkhB0y/gZRXQBV3ehVl0zvm4DuZP68iMhQYizADZmhUOQb3eF
	Q8coBPUBKq7g7n97/rjfX2pOWlka8Jr2cNEk22VqRc57JYl+vBsgPb4boBz/AZWHEQQZjq
	UJILwMFL06icODVX05wiIfqpCyNxMEmL9Nesl+2ehWqEC+veKpANMAp1xxtWQm4ROaBqTb
	FEecuxnXsfkMOfW3QG28KE5HUCDAv26QDIr4HMoMjdE4iAGxaAh7ifXA+7n5+QhaLQ4Lz4
	PIe2xrvIBNIs96Okks+1/mNgR0z0gnOWBreyqC4nDBAhwNaFnT/N0v9oft4yLw==
Date: Wed, 8 Jul 2026 14:51:27 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/6] arm64: dts: renesas: r8a78000: Add CPG node
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1783505142.git.geert+renesas@glider.be>
 <b3beaabd77ec73d3dea43cc603f2cae31290e273.1783505142.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b3beaabd77ec73d3dea43cc603f2cae31290e273.1783505142.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: u5q1xmaq9dmwg7pe7hht3rgzq961ntaq
X-MBO-RS-ID: 17fff366f2498b566c2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_145602_689611_9A525671 
X-CRM114-Status: UNSURE (   8.29  )
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

On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> Add a device node for the Clock Pulse Generator (CPG) on the R-Car X5H
> (R8A78000) SoC.
> 
> Convert all (H)SCIF serial ports from dummy to CPG clocks, removing the
> need for any dummy clocks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>


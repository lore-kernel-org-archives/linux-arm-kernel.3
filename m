Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF1DD2505C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 09:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmUNcnmU22/O7mw740x5Q6qEG3VlNWVyknuIw49QbD4=; b=va264nx5E9L819INCbZKOCP9Ad
	lkTwKseKuWg2N4rYZonNxTAPoiNILlbDzTdQhvhPrisf0DI+cMxh6OX7sj6UkkKvLjgyXb4XMsaOj
	Xi2h+SlWBCKQJx/g4FcCb3T2ZTXgWzO0GDlmWv4cizBYtv05PuK/xx79Zbclo08whC3+T8QNOHst/
	E37P1gXIIV7yWKdOzfdEKrcnL5PfzoOpsn8F9jMdQ0ejibEj1LGDCRThcBxdxfWdh0LF1ZefG/TvM
	AUSoLCNvCENgZ4Qe9LoOgaF8Q6vh1rId7Ah/EPULTg8z3DuxYay027eGIdjd6nO18SW8sI7DahANX
	/UKDFW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEBK-0000000557o-0n2q;
	Mon, 12 Jan 2026 09:25:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEBI-0000000557b-0pjN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 09:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D83760159;
	Mon, 12 Jan 2026 09:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01BFC116D0;
	Mon, 12 Jan 2026 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768209947;
	bh=pmUNcnmU22/O7mw740x5Q6qEG3VlNWVyknuIw49QbD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWd6EsT3ObLtYkB5k/QvLchJz+soOBsQn7gakjGexqU8DMzM3BMIUzqvgSZS5VpRU
	 tmeK6vyJQFLAw+zNbbk5hnWE+Ed0BZxRp59inHHJrwYp0ckljn4i7m5QqVZanVV/TU
	 PelznLQCTX1fUgUfmOJMG2RHTyL7+IMevQwx1P1DXTq79aE7c5mVu2n85Swj5lInKk
	 9gJR7xWZEJIsRPt3BsIjulvb55+vvO4j/xIUmHlNpFU4NX4mNY1Pn+20sdqFE8IJ0M
	 MzvNT1K1XU2dBMNkboOrNAquLXh2DcWy99Qbh/Um8lGM3fQNPJF/K5qgedw5dLawAp
	 UU/q7T3in9QIA==
Date: Mon, 12 Jan 2026 10:25:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: serial: 8250: Explicitly make LPC32xx
 UARTs compatible with 16550A
Message-ID: <20260112-hopeful-spiffy-antelope-334765@quoll>
References: <20260110024647.3389345-1-vz@mleia.com>
 <20260110024647.3389345-2-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260110024647.3389345-2-vz@mleia.com>
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

On Sat, Jan 10, 2026 at 04:46:46AM +0200, Vladimir Zapolskiy wrote:
> NXP LPC32xx SoC has 4 16550A compatible UARTs with 64 byte TX and RX FIFO
> sizes, and the platform UART hardware is well supported as a standard
> 16550A UART.

Driver uses dedicated driver/match data, so some context here about
compatibility would be useful.

Best regards,
Krzysztof



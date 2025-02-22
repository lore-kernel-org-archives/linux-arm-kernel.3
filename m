Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835B8C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 11:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNlxsLndcPoIjInqZQdWVtvA9nkiN43ptPaG8BsfZ0w=; b=4G0d33o75ghISf4/Z8SrJkBe9I
	gVaAD1vtjS0O/siVGyuuuZZfijsyr7aMQKcGDxjB06mWVrvT+tdiWN3QoZyJJmtV5quMHFhxRcG99
	EZ8d2DomJSt8d8JvDI7JLdKPcTywShMJ/vAWt2gPnGlmfRHKFQjdrVzOhnC5Isk4Uxt++MnVyr6oz
	RU0mb1H1D3ordJ173QXTPyGCEoVNYnyvW0NEFpmfrS8RrKhmMFge0CCi5/XmITsk9d4M5G2octzIL
	ZaQvQQi/fboJCcIuPjFxMLbRD8KyToUfLQhEefL0uKqvN9Fzx8tU+Bn43mDdXtz0gQonh08uVQx4R
	qE25FPaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlndp-00000007uPE-0O4a;
	Sat, 22 Feb 2025 11:25:53 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnUv-00000007tj2-0r0h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 11:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=rNlxsLndcPoIjInqZQdWVtvA9nkiN43ptPaG8BsfZ0w=;
	b=dnNUa52AOab8U1KTcJ7nMJIHMBnmOg0V1hp15vozqOPeCdXV4K00B4vFD67E2G
	9O8NMmWNBI3VcmqOPk6FAeZIt055WcW/d7eiL2uIlAiPkF2U5ELx8DeviU4Q4SCm
	W1KOYzkj0VlbRPzDOMLO9Bb0k7/WGgu6rILuf78NwfDn4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXqg74sblnHryPCQ--.22155S3;
	Sat, 22 Feb 2025 19:16:10 +0800 (CST)
Date: Sat, 22 Feb 2025 19:16:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: freescale: tqma8mpql: Add vcc-supply for
 spi-nor
Message-ID: <Z7mx+KwMrvYNRGuu@dragon>
References: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgAXqg74sblnHryPCQ--.22155S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxuWlDUUUU
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAv7ZWe5p-wfsAAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_031641_579022_33B8FC28 
X-CRM114-Status: UNSURE (   7.25  )
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

On Tue, Jan 21, 2025 at 11:30:22AM +0100, Alexander Stein wrote:
> (Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied all, thanks!



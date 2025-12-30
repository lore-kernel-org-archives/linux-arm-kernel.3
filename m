Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB3FE94109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 08:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdx1O5fx+1yJHMH6zRxOvwFLH2dvbZ1+6dc9t4rmK2M=; b=GRxEW91Jin1JWIW32SHtHt3nQe
	Kbgm2Uk5Lt2d28W+HaC9zMqavd3f20yC/ENCxjy1GMniabJyTKfRf5NRtlTuYK7fk36STSV9dkmCH
	joHHf7SbQoCrpwLNetXZ3xLfybH5yCy0FVu/N/SAE9vvtykhFo0SDJ7G9Kgx/R+WvPhDeIuovUucH
	7MEgQWr262IF3ldNsZgGI0M5c7HELQkFp09W7DQazCAUgm/7e+EoRxwKuxfWcaFGcayL4Ra+7gPBn
	Hfo5cKm3QNl5YXDFcCzwyHOxmAk7i8fs9IBAJnV42vZ7/jk8EjmlzqowD7U087Q1bzWfvYIjr0xB7
	2VWKze1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVGn-00000004al9-3hG2;
	Tue, 30 Dec 2025 08:39:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVGm-00000004al3-3eCT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 08:39:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EEBD46000A;
	Tue, 30 Dec 2025 08:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E715BC4CEFB;
	Tue, 30 Dec 2025 08:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767083995;
	bh=2dOZFcmc9Z4oX5yQZR4ajWRkx1TMtyp5DJ+PG+B2X8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDzlMKVRlXkF9UpB7FmM4wO/dZCAafrnPmq/jf0ng4UOm0tsxMMkJvaZeeYg/iwQL
	 7uVKA1gZR8xEyh7THb/tSp52TcZ6D5yw12zC88zThjxn4YQJHLyzfbREhIfI3UkTyX
	 wdJPr9xpwD5O8SX1AoGXKgUJX+qzbEgMdGT2tnVP2oQ9dc/C7R92JZkKeMlEXCG7hF
	 iGp08Te2GXnEkHjqtz/QKAFDw6nTVOlNrZcvw8vBRSG0+LsJKOjhHp2qYd5Mjpa/HW
	 OuiZqvlwq2tB7bh7HFPCionKnCkrI8dZbDU2f5HoPLhXrP9gbfwtpF9R9EPzhsceh5
	 MzRdwSNPn51Hg==
Date: Tue, 30 Dec 2025 16:39:43 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Haidong Zheng <haidong.zheng@nxp.com>,
	Danwei Luo <danwei.luo@nxp.com>, Lei Xu <lei.xu@nxp.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 0/2] Add devicetree for NXP i.MX93 FRDM board
Message-ID: <aVOPz3LOrLHqOM-w@dragon>
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
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

On Thu, Dec 18, 2025 at 12:39:20PM +0100, Fabian Pflug wrote:
> Fabian Pflug (2):
>       dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
>       arm64: dts: freescale: add support for NXP i.MX93 FRDM

Applied both, thanks!


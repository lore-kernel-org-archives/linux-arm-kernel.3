Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BCEC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kz328Jkxf+8X1DF5jn9LNfWNLIBNgP8sOglDIke6D+s=; b=x03YWWuc9CpWjfYxg7UykiZ3cO
	sz9Gs8WbntCOikCyVPs27lzlADVyVDqW/tdsTZdEy+AcTlpgn6gobUKVv+y241awT1m/ctQLy0vIZ
	G+zL6ZgOpIkrFd8LqCUp/zfdfKNmYEboR+cgQ98oE8chlE8wKFZHKPxilTqiDBcL8oJXpUTLOEVa/
	Mhxo0ycR9KwcwSq0cziTF2+7aNuSVuroNHeFZSt1AZ8NBgAT+4l1DLgib/qweCyKnTa95uzfHXMfB
	arBP+udsqUesxSfN1lWGqUMSfKfQh8zLz6Sr4EmnMllIWLc9lUcT6x+nKRyVedeWCyWijxdM2OkZJ
	XbGUgUMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogH9-000000057ne-41hL;
	Tue, 28 Jul 2026 11:47:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogH9-000000057nK-2Xvx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:47:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57DCD414F6;
	Tue, 28 Jul 2026 11:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967631F000E9;
	Tue, 28 Jul 2026 11:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785239230;
	bh=kz328Jkxf+8X1DF5jn9LNfWNLIBNgP8sOglDIke6D+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gdT9UaTr8H9qzj59Gqk9lm2OTK9NYQ7TkumIo/tEBM+oUeD3WB+7GCYmeEtKp8V28
	 Hq0O15kGjthYdOtdzGYvdNps1hvHT9bt0vSpvH5Xr9BYGVaoA+vJOj3dOfe3YB0TL0
	 nGktxq4Rul/JXef/5Pb8jBxEiIXDptRm3ozLkjFcM5liyTelQ8hsdFvhB5pFc/t2Te
	 1rKMBq78YDkm+Yzb4HfAaBrHnhiOy9crELqopiiAK22Dd+2RzHQz34qL1BWRD5vjUn
	 f91lNwaRsVYIwBQamJNMSMretqVs+YOv7rtZHicL3bqlaeatWg3WgOTmuzu8gULsxH
	 jzDZm+b4D6QAg==
Date: Tue, 28 Jul 2026 13:47:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Add MA35D1 Watchdog binding
Message-ID: <20260728-poetic-outstanding-salmon-6fabb3@quoll>
References: <20260724091427.1689980-1-zychennvt@gmail.com>
 <20260724091427.1689980-2-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724091427.1689980-2-zychennvt@gmail.com>
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

On Fri, Jul 24, 2026 at 05:14:25PM +0800, Zi-Yu Chen wrote:
> Add device tree binding documentation for the watchdog timer (WDT)
> controller found on Nuvoton MA35D1 SoC.
> 
> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



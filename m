Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58236C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoDT+GUcdvRS8V4HRHzW8OXQubEURsr9zpZYmlTOACM=; b=lzLq8QwUGEAlox78r4IV95u2EW
	TWfBAuMzbe8ZskPiaqFaHuMABGHzHKpBancOzm06DQQNlvelCEmZzGi8LH67/KHUPdlDzCSgm5Tun
	uKZstUIHv8hrAlPquSgTlMmmygS6ovB40gqbdcBaBcYQ09eOBhasTPs4x9q01OXKZqEb6tafdWv2l
	XrqeL5qQNi0U+Eo8z7t2gOM88VAh9L9fUNfQ14k6mF4++w3CWspTuVEpaZsQSBQP3d3q18ZzCtWqZ
	MW+7AdnnEFUKQb8JgfBJAbC9R7/PWwj/qAl3iq0so9ohG9YwtpKjxbmVBHvGv+TQDXCY33Luz1AaK
	Nqacv0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D6f-0000000B1zd-1bbT;
	Wed, 09 Sep 2026 07:52:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D6e-0000000B1zV-0PJ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:52:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36762407A7;
	Wed,  9 Sep 2026 07:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DACC1F00A3A;
	Wed,  9 Sep 2026 07:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788940350;
	bh=LoDT+GUcdvRS8V4HRHzW8OXQubEURsr9zpZYmlTOACM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kUcKZVTn6hHu9hfV7jAQRDfthPODWLj8wE/wtf8qxW0+YefPWwxWP91QkbKgsQ66w
	 NRJP8MgnPBGLNAts7Ylmdiawoq7BbOlPnUCvBm5iBSQ9N3tXN96C9l9O+tDO9zcojQ
	 mN3imgMXWK6ZDknlUilQNcdNULKibjFI150dnrwEwTwDTm4aNinoujRfrJIr4tguNM
	 l5TGfBvZsDfP78CGXjCej8bac+yt6MybSqDdQW+Ty3F13WSwDsr7QBEtQGhlCPKfA9
	 DYEsS9DfC5rzAfxpQhX3n9Oq2u2+a4HNsaLZsrGeRsSS6GdxkRfJyZpjKw+Jgvyaz3
	 KbnMr5dq6f3Fw==
Date: Wed, 9 Sep 2026 09:52:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	p.zabel@pengutronix.de, vkoul@kernel.org, neil.armstrong@linaro.org, pawell@cadence.com, 
	rogerq@kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Message-ID: <20260909-expert-fabulous-antelope-d64587@quoll>
References: <20260906032440.470788-1-hongliang.yang@cixtech.com>
 <20260906032440.470788-5-hongliang.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906032440.470788-5-hongliang.yang@cixtech.com>
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

On Sun, Sep 06, 2026 at 11:24:40AM +0800, Hongliang Yang wrote:
> Add USB4 and USB5 controller nodes for the CIX Sky1 SoC. Enable USB4
> and USB5 in host mode on the Radxa Orion O6 board.
> 
> The per-controller RCSU registers are accessed through a syscon regmap
> referenced by the cix,usb-rcsu phandle.
> 
> The shared RCSU slice of the two controllers is described by a syscon
> node; each controller references its registers through the cix,usb-rcsu
> phandle with offsets.
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>

So all your patches here have manually-created wrong style...

Best regards,
Krzysztof



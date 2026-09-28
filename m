Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A63CC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 07:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdXIHI0a65nZ2GffklqXXm3Br0b0902Xiiud5/y56Lg=; b=151v6Bq+mJF/I96MCoVs/YaglR
	Ye2nxJxME+qb7s6jkfvoT/0ymOQ/7tH0/2x5lYYhq/itNd9zR0WI2AjUVQ7uKzZdwZCneEJSetiEB
	hzlC9+2izP6zePj6o32KVSPWI9GANJG3FRt7ySfLsFtjqHqJg63A2PqqHi0+QRktcPy/huZpkocSZ
	l5DB39dygiceBlOGhD2++AiowTQzP6lrGqLK/RIRanu2/clw3ygLJfcemPuxalLKPnqhttqZ5eVO2
	L3OAqJZi7+7W4oSwZa6Mg2AH5ilbjZJGi6i4PvsciDNhiwQYkX+Vo02ODCWfpTyNKAOYguLnJ5Sfo
	7kw8iwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5eb-0000000HX7U-10HB;
	Mon, 28 Sep 2026 07:20:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5ea-0000000HX6g-1TEQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 07:20:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89EEA43D66;
	Mon, 28 Sep 2026 07:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F120B1F000FF;
	Mon, 28 Sep 2026 07:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790579999;
	bh=LdXIHI0a65nZ2GffklqXXm3Br0b0902Xiiud5/y56Lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QTQh4ImAowc8pNjjrpGChaBn2mMAqb49VPhd7Gfl8Rb+TA9uSKKw/lftv6UONPjLV
	 /92s99IOlIhuoyWFngMZQEwdzbikfWRrmgQ+iOPgVSdAnjh2OJ5QmlKDp0rpYAxuX6
	 d5KjUlAsmA8WMaRuwWEFmHhmkpcq4Saoci6ZFPmqZGyw8IhTRLzJ7WxH5wAZeSNpAR
	 Hf4j7ts9x1AY6sgrn0u5vpzdu65JtOMlsatmuoEH87ZTvxNtOi3IES4gPRg8Us4+FL
	 769olCYzXFnKjK5nNRtl1f6cPhPS7IRIKgS/vY5l5n5uhnVStMfYR64T0Gw8Vv7GY5
	 67ejDE1tn6WkQ==
Date: Mon, 28 Sep 2026 10:19:54 +0300
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] soc: atmel: Convert to of_machine_device_match()
Message-ID: <eccttmsgnt73gzc62hhceqw5qvnzyj4wwal4ejiod43n6ouzam@mmoori4k42gr>
References: <c3b4f8aceb5f0bc95fa10e6fa469574cfdaa8ee6.1788429505.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3b4f8aceb5f0bc95fa10e6fa469574cfdaa8ee6.1788429505.git.geert+renesas@glider.be>
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

On Thu, Sep 03, 2026 at 11:59:06AM +0200, Geert Uytterhoeven wrote:
> Use the of_machine_device_match() helper instead of open-coding the same
> operation.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to at91-soc, thanks!


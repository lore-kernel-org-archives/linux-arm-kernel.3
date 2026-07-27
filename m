Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D15C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 06:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yxh6Mdw9fi70t+DfkYCCKMEARqAii9qrQ2ipKqfvoeg=; b=i5SsPDglEusLYsTZmNfGrtYtu7
	ZYaysaU1O5ul3KmPmIQv1tE0PnVKdCGD50KyCYLZILVD3VXdExOYzU73LGEfyKXHZpU1aucKZFezA
	8N1RGIUsEJY0OGQJsfoU/G2yGPgyekLMrr1U1Vzv1ffoTTD3Q3a7KhPxsEh7hPve6+QPx6WGDmTjW
	2n0mLkXAYGzuAq81Z7cJGsLvtqgv2Zu0S55fy1NNZSRSgICziln2cqh6FMeSP952c91a2z/A9bGnT
	W/zVs9j/dYAI14s1FQ1LMdkPtYcz1+RxL9pN+79wvWv62exE7C1IeaifN5XchIROtvNZme92PExwr
	QDYMNrKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFFr-000000024Mr-2QLu;
	Mon, 27 Jul 2026 06:56:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFFq-000000024MF-1Kur
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 06:56:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19813408E6;
	Mon, 27 Jul 2026 06:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284731F00A3D;
	Mon, 27 Jul 2026 06:55:59 +0000 (UTC)
Message-ID: <322c0f62-775e-41b5-ac4c-73c77dadfa37@tuxon.dev>
Date: Mon, 27 Jul 2026 09:55:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: Read "reg" with helper
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260612215251.1888345-1-robh@kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260612215251.1888345-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 6/13/26 00:52, Rob Herring (Arm) wrote:
> The "reg" property is an address-sized DT cell property. The AT91
> compat clock parser only uses a small bus id from it, but reading it
> with the u8 helper does not match the property encoding.
> 
> Use of_property_read_reg() so the code goes through the helper for
> "reg" properties, then keep the existing range check before passing
> the bus id to the clock registration code.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm)<robh@kernel.org>

Applied to clk-microchip, thanks!


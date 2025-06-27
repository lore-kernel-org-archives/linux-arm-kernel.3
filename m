Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA0BC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9608Z9vgdnPMUPC+VsE9uytplxxqCYTB5+WUP0AjlnQ=; b=SuT6RhAjAQtLHmGI+1+OrWQWGu
	istpEApn5T9YC5MAvuQLTzZEVJKUqG27lgRfOFFK4VwZIdHkYBAKcVYWzHzhaXajFKWV1ClJ0QFoB
	qehzPF4e/pGMDQHGgI3AvieTNxE0LOhFF5DK07yardcRltr+xKuDrF0004E/B/Q1He2QlrPsQ9aHF
	BZRirbHZdG0RsSFYg53hnB8387z8FWr2JBiZ/oICATup2RWcZHaIT27xaMQkrR8q4KUU+hc2YzRE1
	dA8Zk0r4/w+gBF7dCZtZeosPitQGBMjf+tQwZAx+qnEnlKXBatN+k+0smlH04xgWN0s7Gbyd3CLn7
	O24UOlrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGk4-0000000Frkn-3dg0;
	Fri, 27 Jun 2025 21:36:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGXS-0000000FqKv-1yFl;
	Fri, 27 Jun 2025 21:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3848A5308B;
	Fri, 27 Jun 2025 21:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CFBC4CEE3;
	Fri, 27 Jun 2025 21:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059393;
	bh=LbfWVnsWMkOzpzcKvRL8GuxUnXtOZ8NVkjhS5qBLnno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cktOtafC6PR+kDVsCY0nZXwxhcwERjS0ucz1mkc8FKlzqBc7tq515FhJZQFvqK1bE
	 IiMPsKFUnfmbA+XJC5G9JMofV+rv6Sqdx3l3MVUYzLMAWbM6Erya2xKG83+EnMt7Qb
	 DVYC7CP81hdXMgFLsUPXiCZgpipZbc0jymAAjj298cqvN70gVwwWKXOY3G+T3dBoxA
	 dZpM0EcgCbW4d+hkvXv0I+dqZB9ox1+C0l8bteVLi8PzVHimG3uw+6uzIp9iy3e9pB
	 gCOMM+4QKLjzeBtXej2+LvmAVa0dKoyt4xSrA6roSh4QPw/klPv6QBmQMtVwx/xm+8
	 +j2qOzujjmi9w==
Date: Fri, 27 Jun 2025 16:23:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-serial@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 05/11] dt-bindings: vendor-prefixes: add JTY
Message-ID: <175105939209.166738.15034897899907823763.robh@kernel.org>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-5-f7f842196986@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-5-f7f842196986@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_142314_570256_E876FEF4 
X-CRM114-Status: UNSURE (   9.02  )
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


On Thu, 26 Jun 2025 11:53:58 +0300, Max Shevchenko wrote:
> JTY produced low-cost Android tablets based on various
> MediaTek MT65xx SoCs.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



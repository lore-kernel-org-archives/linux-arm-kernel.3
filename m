Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD84510706C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwkAM8IwSM3eMUh99Je7aorB0RL96VPkGjt/z5uiX2g=; b=f8fCd1idfR7tZzocE3rlXckxET
	afkUD0D/YRCLhXcqXwOvLdWxPId7IcVszCgESg2RihVITL7RaQhsEyfICY2xGR6ZPZ4W8NIYOexAa
	yBlOw/wMG7Ps2pYdav+E0ncy5EvZ8vxnocK7Z1xgjtUJ2jLUoXHPdYZP4qCfDb4FCIoRtnrewF9iU
	fltrQwT0y/2i0qmqrb8zcHDdeVMwBr55GITkJMBZUIuEtF4TYdOhpAS0+anjL2wf8CsGUuUjINWV9
	u02h8Ps1qJweQgvGaFH9flUedZzWlkteJy+K1aPFi2iIVI0wl/ESsRzQiXTrB7dyJROjgPxGZMASE
	Fv9Yxa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LgQ-00000001ikQ-3tsJ;
	Sat, 14 Mar 2026 09:53:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LgO-00000001ikD-07Bt;
	Sat, 14 Mar 2026 09:53:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D84416013A;
	Sat, 14 Mar 2026 09:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61BCC116C6;
	Sat, 14 Mar 2026 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773481998;
	bh=37R6VTCcTCRWcSDleqI5hHFt8e5llja0xDzhgFKV+/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9gFd2/CI6esLe1eMKcrCe8YoEV/43EE5D2pq4Rxnfz6mht1roWiMH/LkT3qwQ9tG
	 tqk2M2WXbnz9wEoWQzbu9vJH6p3djoqauWlV5I67uij3AvViLDqbzpqUozt2HmGR1G
	 TGDKPS8M/cK6U92L1Z0a7l+PIhpO6+QoRsmgLbrPSNrqlg+t/1mXDhvLOkpUGGgo0W
	 gAGD36Kr7eYwuwrsU0JnrGvtybQBHb85fmWCj7sogCqYe1AVlVMaMjq91Po/l7CHZY
	 wUJNUFOUmeGjM5fORB0BO7/lLUbEcUw+TqiytiMdTn7Oe+0qjtodRZsRkubj4AdqI9
	 zN7y3BcnhCU+w==
Date: Sat, 14 Mar 2026 10:53:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ronald Claveau <linux-kernel-dev@aliel.fr>, devicetree <devicetree@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Ferass El Hafidi <funderscore@postmarketos.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: amlogic: Fix redundant hyphen
 in "amlogic,t7-gp1--pll" string.
Message-ID: <20260314-sweet-amber-griffin-e81371@quoll>
References: <20260313070022.700437-1-jian.hu@amlogic.com>
 <20260313070022.700437-2-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313070022.700437-2-jian.hu@amlogic.com>
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

On Fri, Mar 13, 2026 at 03:00:20PM +0800, Jian Hu wrote:
> Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
> 
> Fixes: 5437753728ac ("dt-bindings: clock: add Amlogic T7 PLL clock controller")
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Incorrect DCO chain. I don't understand what Ronald's SoB is doing here.
Please read submitting patches document to understand how various tags
are used in Linux kernel.


Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4032FC98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWuEHByYW7PJ7uyRtCFsmzNtANJLIM43E0XB3a/uqEw=; b=RR7ijIenqv1XXyW+OANbS5gM8c
	4MGFocuQ08424zEs3Sjj6nkI/6t9tF156XwBelfarBQ1F69ohJcw/OeZPmITX4+kr4b67bb7U8jUH
	3NwLZBOkLJXkcy9aJ0dHAE4qF//Ma/FOMhCafgIWxbP5oAaV2W9RKgIG5jyKb9fQOtHkYQpywAzXy
	/D6UCiBTCaJqzYW8AOd/eqzGa+ZvHJK6NOvcL7s5CTHvXEw9SYQR5ZBBwkgeo/GYyqcKvrq3TyFfQ
	CSgTU6xeUpXgRcIZhyeQ98FP8/m811+reBwUavbUFDP5TMKxv5tBgHkV8gwEbnvoG8GjrEKHzDyUZ
	ju9RTLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LWw-000000088Ya-0LVT;
	Wed, 23 Sep 2026 11:52:54 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LWo-000000088SV-3tfu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:52:48 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 07E1E24002A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:52:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790164363;
	bh=lWuEHByYW7PJ7uyRtCFsmzNtANJLIM43E0XB3a/uqEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=fuStAAtGUtJzqWqcmpUSbJbW/JTKUgddsafXquXDY2531joRLiqTgqA0KCRIAyGw1
	 AZrjUUufBouNKFroAGLQeNyS1uoAthOKBExNSI+rDXR1zBl9czR8Iv2RIHwpBiUQ9s
	 BftzMVQ+ZzR1Kovuv3LGQ7lLGkT59cCpcTWcH/oNVitSNDizduMmLRA0nfSSIYhlgJ
	 thuUYxq+OwzVRGgv9cItck6IaHxGPNHdNqaDeMRcVsBaZkQe5Yf04+RBxwutcumPF8
	 HeK5wai0cA+vTMFS35cETC2Xkje2nYbk9jlnmSxXamf1s7nvwrCTzeZf/esIo0ZF7b
	 npojOoOCIuaRg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hqb1h5rjTz9rxD;
	Wed, 23 Sep 2026 13:52:40 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com
Cc: antonio.borneo@foss.st.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lionel.debieve@foss.st.com,
	amelie.delaunay@foss.st.com,
	patrice.chotard@foss.st.com,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on stm32mp2
Date: Wed, 23 Sep 2026 11:52:42 +0000
Message-ID: <20260923115234.142728-1-mateusz.nowicki@posteo.net>
In-Reply-To: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_045247_119159_81BD12C8 
X-CRM114-Status: UNSURE (   6.38  )
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

Hi Alexandre,

Gentle ping on this fix, Antonio gave his Reviewed-by on Sep 8.

On current stm32-next the SMC watchdog still fails to probe on the
STM32MP257F-DK:

    arm_smc_wdt watchdog: probe with driver arm_smc_wdt failed with error -5

Could you take it for v7.4?

Thanks,
Mateusz


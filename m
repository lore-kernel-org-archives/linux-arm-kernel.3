Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B4AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LnVr4bxrvtoXoEOBMXGA2ni36HYL7NPNwzBYEkZTL8=; b=BTleGNRPNGovpi3CYdiVTGXzrm
	T3Bt43Trml9aEgHk/LpZ6ltlTwFVUR9061G4vg5swAyQWnsOa1wcgCMu15R9cRayLz0NKEvmTJ2eV
	X0fSghNwICNz+dJ/lYOvW1N/Lx1Tym2BIRYdaNjYHm7hzVkXfHz6V6xLejQeDu73Gcsclmu0lGDzt
	xVs+uV9lc4soFB5/aT7Z12W1YYa9zotf7ve7MlGmFfVzM17aUiRR2bgBAtt42a2vGJqoJSQ2CIa2H
	+UNPfil3oxnU5HfmuCX31+6wB+KzFWlqjxYpID9/ebcWgJNe40V+96MqubsJt21FNV77mybqFbfid
	LkSdWLjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwLN-0000000CqEW-1JrL;
	Thu, 09 Jan 2025 17:29:17 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwK9-0000000Cq1J-1eUY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:28:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51DC4C0007;
	Thu,  9 Jan 2025 17:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736443678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9LnVr4bxrvtoXoEOBMXGA2ni36HYL7NPNwzBYEkZTL8=;
	b=GA3oKBxzwyfIoCO1TYSsL+nmnU+grFvxGwgS92PmehDXAo1r9lDjO8QPJ1vlrNfVlhGzAb
	tCuDyS6bAuSHgFeq5LrG4w1Hm10hipPyT0/OCwLSNODaLuzlfh12uPNfU+mhAf5V+jzldf
	UOCGDgzquSxyI4uQF9GCA8VILc4zoKoxKy/jaiq4tZgM/gB2OqMI6bisNQdk2GIaYF2b/F
	VN/EsOzUlzcEHALtbpEQ1K95VPKziU/B6k7pvlb3Diqz1jYk7+J/YtFAY2vqWqwUMtW8hW
	00VFHHCeXeb1uAE77PpHBKpj/QcKR4qIO2V9mF213dz1aSBJLlNPk3NvoRFC0A==
Date: Thu, 9 Jan 2025 18:27:57 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: RTC_DRV_SPEAR should not default to y when
 compile-testing
Message-ID: <173644288927.1016566.1170628492518027690.b4-ty@bootlin.com>
References: <7b8eefe3b0150101ba01c3ea55e45aa3134059ba.1733243007.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b8eefe3b0150101ba01c3ea55e45aa3134059ba.1733243007.git.geert+renesas@glider.be>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_092801_711131_2B5A108F 
X-CRM114-Status: UNSURE (   6.56  )
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

On Tue, 03 Dec 2024 17:25:05 +0100, Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.
> 
> 

Applied, thanks!

[1/1] rtc: RTC_DRV_SPEAR should not default to y when compile-testing
      https://git.kernel.org/abelloni/c/7158c61afdcf

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA815E88D9F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 15:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4rR+TEccZn7+c4PrR/Iewf24K4auV+TBRGFnxLB4wA=; b=4Q5DGJ5FxMrtbSHlMz93zAkGNR
	qKxsGiGbvaXba3P2SwzPE8Dfa6pn+DBBUeCsYDCf+ShGOPSEAeLQBMG8IoDV3lp/FzjnG9F6j8RTy
	B97radSVo7WgRWvJjJPPrwnVjKaVbL6p4bqz0rSdOymmX0Ex4r7fDmDUBLVU98cYE5v1+eAJY85ir
	8MEtYnJPN/UAYr2vmjbU26EhJrECwoh2H2JujpoqIh+x22zoIowqihj2v+nZLTkGkRGveBLTi0x1d
	6/sjg+vxtjNe1mUgJ4LXJcmyTmZp1eBu0OARzMjXJr5ALdWjlneXc3Co+w9hQ2SviFFc1EhLxffc+
	viYRt3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92yH-00000003ZAo-0Jrm;
	Sat, 04 Apr 2026 15:31:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92yE-00000003ZAT-1poU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 15:31:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D171A44479;
	Sat,  4 Apr 2026 15:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29066C19421;
	Sat,  4 Apr 2026 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316693;
	bh=Jj345pl+qal7aG0Q1tYZedCjsr+sVk8K+OmliaqF4sI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyALPOMMBXuS4jfm5YuWGWwXWTDZ+mPWNO6j+42krZLCWuex+1n7pFozJyM63Fo23
	 qaCV/wnj+GksER0nRdyNWnjPUz2LpRfqEkmFOYcVrTKctLh+BOa0DC2COATyeVM4Ht
	 h0BG6qBxEBHWT6EntTU8lk2uyiS2YsrdkbsJM7Jr7S5M0wVeFzVHmL6D/B+xLMaR6Q
	 Kj9pYqH6FwzJ6BPZ8xBdkXX5p1fMWt0Lgu1Dyr0pJqwqbUZGHPfgbuypFBwqGgFaC2
	 yKd3zEHP6LCFVzKAfnr354wcETmAPUhp1Sca7BlIyYUm8OXEANT/sBCDwPOpngotnl
	 /XevyBxnDHxBA==
Date: Sat, 4 Apr 2026 17:31:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org, arm@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Microchip AT91 SoC updates for v7.1
Message-ID: <20260404-quick-quartz-mouse-ac84ef@quoll>
References: <20260403070344.2553018-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403070344.2553018-1-claudiu.beznea@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_083134_497666_CED508C6 
X-CRM114-Status: UNSURE (   9.64  )
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

On Fri, Apr 03, 2026 at 10:03:44AM +0300, Claudiu Beznea wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-7.1
> 
> for you to fetch changes up to f3ae0049ff8a3d2cbd8c05857705744435629d0c:
> 
>   dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema (2026-03-07 16:41:03 +0200)
> 
> ----------------------------------------------------------------
> Microchip AT91 SoC updates for v7.1
> 
> This update includes:
> - device tree bindings conversion to DT schema for CHIPID, RAM
>   controller and PIT, PIT64b, ST timers
> 

Thanks, applied

Best regards,
Krzysztof



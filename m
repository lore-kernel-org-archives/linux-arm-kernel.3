Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB5AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEApVhEKro4cIy4i7/jFiHyzpWKgeh4lGRXILH8B27o=; b=aL8fbBuM/iSeKYhculPEiAnodZ
	gF+xJdLtENG9lBh1MkCNOSy15C7QMBUX3YzfC3AsZGvezJrEK6bhMWcmI5X0x/G+epJ/sR8UAysA8
	6h0Zsa7WEPo+j70ZlT5pL4vIdk6IM/Jizj9dc00Gk5IaGfymC7rbopTKgzAxygqkd+4NZhUD3hMrW
	wBzpXRLklRwuOOeh8lcEEiIY78MKfEFwAyf/x5TI5rkbbjd8CP/ko3EwG/C9K5vd5xwoUI7faR/n7
	KTmuivR9JVul4nzeA2g56457Ndio7ZYez21bsJP7kHeYmKjKATqRjE7jC/LJQPSHtY9sXoLQWUQwY
	FUzPMFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpwF-0000000BhU2-2hO9;
	Thu, 10 Jul 2025 11:59:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnYx-0000000BLEm-1roE;
	Thu, 10 Jul 2025 09:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LEApVhEKro4cIy4i7/jFiHyzpWKgeh4lGRXILH8B27o=; b=1i6ohUuSQGLB1RQDLcQ8aX7slN
	rCtl4HE1Jmt8moItY8qE6sUXz3ZL7qkzuIK5rpm2alSvSjWRYxE/zlYcJCo0JM1t5W4LNJXa6pRzE
	7FYMkO5jeh22avOq5zmtkk1cFjLT/nqkaTcUY4XxHWUm/fTexFMkx97fUnT3HbL4eieamno6JUARX
	ZWlM9AKxrsvhn+JRz0CFWJelYWuev1CKNvyGWjF4+JPxZ3hdwjE3AaDmg9nHDC6wP62clKFreocWU
	8c20PytHV4arBvD/eqNTPL0mlgklxzuexFr6SSVA8O7dnL34XGlMSuDct78uB7AIUaomY5w16PJJH
	j2t4UO5Q==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZnYn-0003fo-DT; Thu, 10 Jul 2025 11:27:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Stephen Chen <stephen@radxa.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH] arm64: dts: rockchip: Add UFS support on the ROCK 4D
Date: Thu, 10 Jul 2025 11:27:13 +0200
Message-ID: <175213961996.1887379.8837261670064168471.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250708155010.401446-1-detlev.casanova@collabora.com>
References: <20250708155010.401446-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_022731_480441_CF41E286 
X-CRM114-Status: GOOD (  10.48  )
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


On Tue, 08 Jul 2025 11:50:10 -0400, Detlev Casanova wrote:
> This device supports removable UFS chips, add support for it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Add UFS support on the ROCK 4D
      commit: 00abee2b18342d6c2f6f37225682fa7ca0d33142

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


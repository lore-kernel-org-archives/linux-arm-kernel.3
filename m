Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B762E674B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 13:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF9j4Zh6hODxeJEZzwpl1vVN/ET5lq8w58TpeUPzcjU=; b=oWZJpFV7QN/nufvOrGSobfZkLV
	CNU1sM+PcJHNTO98fc2srBUhg6CZ4nLGw71K5M/47DeGKfEvsOr1cyyskqwDRJ5ED13VTqdaiIejg
	cl+0xRL6nCHiferPZZm+QLDT6QiWmHc91rc4vWDIYE6kPMobly3HiQMLHzg8tIxXjD+v9n1QLsbjz
	G6RQoLwKaqNFae3KYnUiYKUfr9fVggzDyaL/S8PMvjloybUSYhDS/6/nv/iGknaWd5srp7wCs3/DX
	1QGFAkOdYLQk7b4Y0+5vJHXVRG6zC0AfVicd0vj9FoTCOY7iEosyxyNGFhpefPGuzyrx8bO751WnH
	mdrbEWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgOv-0000000DqT0-3CB6;
	Mon, 22 Dec 2025 13:56:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgOs-0000000DqQr-2TCR;
	Mon, 22 Dec 2025 13:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EF9j4Zh6hODxeJEZzwpl1vVN/ET5lq8w58TpeUPzcjU=; b=W7tEVU6gLErw90KYq1AQazMwWA
	9s9tdvm/2q9+qaPtBrb3/SEi7FAczy1LpoKf4AXSt8M3FOLZqCTjsijm8AmE82h23b/29xH0oF7Vp
	TkM4m3pT9MbUhKWTpcskmUi0sjdEDNnkfaViOdN/CSuWl28l5lL2aryR7ymCIG8PxPF2qwicJAi60
	0rfys1AGk4mNW37uJTTXrzGYNOO6N+Qy5n/Pyp6ZhBgWefbhlp+RxZ+11vTOunEYC79+gyIdepm5N
	1i5Jo/2vUBzYBflpJC7lmJZdN7AUEEiTaNWq+Vq3lX7ZbQVjX5SABnBt+yW/D2LfebaS/576Ja5S0
	e6aRyExA==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vXgOn-00063E-VY; Mon, 22 Dec 2025 14:56:34 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	=?UTF-8?q?Rapha=C3=ABl=20Jakse?= <raphael.kernel@jakse.fr>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix Bluetooth on the RockPro64 board
Date: Mon, 22 Dec 2025 14:56:30 +0100
Message-ID: <176641178738.1651325.3752551269386396461.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251130161259.9828-1-raphael.kernel@jakse.fr>
References: <20251130161259.9828-1-raphael.kernel@jakse.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_055638_627149_3CC6CF23 
X-CRM114-Status: GOOD (  10.69  )
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


On Sun, 30 Nov 2025 17:12:59 +0100, Raphaël Jakse wrote:
> The RockPro64 board has an optional BCM4345C5 Bluetooth device on UART0.
> 
> This patch fixes audio stutters by setting its correct max-speed and
> compatible properties.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix Bluetooth on the RockPro64 board
      commit: 9c68a9483e31a9ad25c5399bb5f066b2e4980ad5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


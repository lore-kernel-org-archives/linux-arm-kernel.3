Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B96C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRK33yxtCQeIXgKhMQvdIbclAkIuzgypZhMp7g390Uw=; b=ONkJb6Ex/Rcst1/B5HKdZac8JO
	tEMbs5aLcNKvIOn2DailjDwvVYotsenAcoCccPEOxM5KejcQ8hWzAsk2WTxR5IxubBFYbyUHXFkdG
	MDE5svi7UGmTFw+Vqu6ldF/zhWXo691XED/9k3lTIKWjxAGwYP7dupamz7Pe/14+WUwEs6lWjqiyc
	n41jdMLUA55murqe9RfdM31aSzhuBEmJflGZAApRfjfWGFoHjMEWKx/Ex1DVbwgTvK+pSKmJKnGYJ
	UaC4LfkM0KLgS00yVFNxs1QrH0sIJtcFKYPru23gYc1czKHEckPMksYjHA9LaUE51berV6Dp4h5Tu
	JakhrzoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u36-0000000B41j-442f;
	Thu, 10 Apr 2025 15:42:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tGm-0000000Auff-31hd;
	Thu, 10 Apr 2025 14:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lRK33yxtCQeIXgKhMQvdIbclAkIuzgypZhMp7g390Uw=; b=YibUoEhgpViGaO5kLSUA2hI+qt
	lwZcCAx30NFrvfuEDX8BB7arkuzhSJANxerUdUe4EjYEByMf/6ROv6Th1Mwfd+2XcsloD9zhC0OGy
	0ktMaZQ+X0LvMVC3TvsTlmCgCTLqudqX1kGpdBUYhx4ZrUWO6jnOKwGlQqfCBTZ4E6oIOyyB2PUzX
	NOJHkhlFPCX7wa5H3VBhbNXfrsByKzjhqj+JDyA8iOCXXWZctJ9paM3yghFoEKIclzljMlX33q6Rv
	9eJgSBOqM4UVzWGiQgffZk++qDuqsU1ZQfZ1zgN6w8P7APKvTrWEbq6vfy+JI2zfMaWV265jynPsf
	qfPB7rIg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2tGh-00012N-LF; Thu, 10 Apr 2025 16:52:39 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: rk3588: Add PLL rate for 1500 MHz
Date: Thu, 10 Apr 2025 16:52:25 +0200
Message-ID: <174429674410.910874.4317858718877059208.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408064612.41359-1-eagle.alexander923@gmail.com>
References: <20250408064612.41359-1-eagle.alexander923@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_075244_758273_CCB8ACC0 
X-CRM114-Status: UNSURE (   8.14  )
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


On Tue, 08 Apr 2025 09:46:12 +0300, Alexander Shiyan wrote:
> At least one RK3588 clock (CPLL) uses 1.5 GHz, so let's add
> that frequency to the PLL table.
> 
> 

Applied, thanks!

[1/1] clk: rockchip: rk3588: Add PLL rate for 1500 MHz
      commit: 831a8ac72264426ccd0ee5d2b0d74491ea7d2bfb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


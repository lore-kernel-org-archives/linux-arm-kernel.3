Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C499DCA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KiC4N41/KHigU06qv8He7zylxzTPNYQyWifnaopVfQ=; b=04wz9WVrqUoYvQ4gOuYdSSAg9F
	CVFseXCIjZ7lRB0qPEFYfaG2MCqyw0ZBQMr57fooREEuWmnyN04Z9N4yFnRpESLsGqXWoSR5qOBwH
	Wlr0F42iidi3RzureBTxVy0ZNoNFm6kcjfK7AxcRDEZ7Z9T0Vte0RwIhVo5jcJbYD9fJUNUKV/ppv
	r8DWpYW4bRakSVP5atxm/yXmxxDCRrWA4VlxD6N99mDkzvPayazhjOr8/5jPa9p11lw3Fvcchg62p
	cs+ezribf1eswbBzed9xjfmm3cbOMJZoFq6MzkCM4HEoHou/T5qFzvD3Kv6oXzF3TdoxcEV7D8c6j
	nxrtaOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNUc-00000006n9E-3IOn;
	Mon, 11 Aug 2025 08:02:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNKM-00000006lGM-2dqO;
	Mon, 11 Aug 2025 07:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=1KiC4N41/KHigU06qv8He7zylxzTPNYQyWifnaopVfQ=; b=CgnpbDDnSRDZtTYOR777mqH/Y8
	B/6E0EA7JUyq61MEu6+3YVYd0rs3JGriIs7mFCD+4JZ09sRdB6PNgCUgPVGekA9KwrKmm+u73RceM
	lwxX4Y4Xv/l6JhtG3Iw86Izy6kEEgEenvBWHhUNVctzKyXTE31BnNWut4srzL0oV/clR1flUtsN2k
	9uiVzh/7rqBzsikonyA8VZsh+oQi4xFYBT4oktGgptjNXOwCELp5dKpUKnGuE+F4yBz6U1GHize3a
	6H8zY9SKzgqawBE4TRGq0StTPDc92r9/WNA8CMoRV52+0Es/6667CU1WaV2Dg4ldaI2o2MK/gFQxx
	+PLn3beQ==;
Received: from i53875a0c.versanet.de ([83.135.90.12] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulNKK-0007Ro-PA; Mon, 11 Aug 2025 09:52:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: anton.kirilov@arm.com
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	nd@arm.com
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HDMI audio output for NanoPi R6C/R6S
Date: Mon, 11 Aug 2025 09:52:01 +0200
Message-ID: <175489870459.808197.8017772403276802011.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250807170012.88178-1-anton.kirilov@arm.com>
References: <20250807170012.88178-1-anton.kirilov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_005218_699906_3CDCCDD9 
X-CRM114-Status: UNSURE (   9.70  )
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


On Thu, 07 Aug 2025 18:00:11 +0100, anton.kirilov@arm.com wrote:
> Enable HDMI audio output for FriendlyElec NanoPi R6C/R6S boards.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI audio output for NanoPi R6C/R6S
      commit: 91ec67fa33250059a0c52bbf3148302f364a6e99

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


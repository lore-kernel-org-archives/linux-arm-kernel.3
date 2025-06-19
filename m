Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D363BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 21:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/E7FuKxOhj6v2SCRuHODjTXc3/S3zVFKDl5381MANVw=; b=QFP2S8udONJiIseVWuDO3jk4oX
	A5vTJKR2994epK5dg/MVNpJmwhn99Xw3u4Ki1/LrhNmWE6d0XUrI4Qdb1D2KDJjF01B91ISi4IiDJ
	a5Npn65f4/TO2IiMBmMtvvFMBLUDHt/xk5nUndIf6ms6KUDSy+cbzzRakJEtuLgQIrRDRz3WjiM5w
	ioByf/v7XhARNJlAFVZRlvfLPhrFXQuH8S5abKEm2uUjCzMc/ct9N8k5cJW2Y3GeqDSoh6lz83YZ8
	bz8qwUi7Ec9Wl96shylERXohbuXrKMPTcq6sB+tz8Oz+fLbY6tdRzfSsmIFbvCYxzjWJ+cRb/ZhgV
	hWH+vAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSMm1-0000000EIPg-2LYh;
	Thu, 19 Jun 2025 21:26:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSMdu-0000000EHbC-1qM7;
	Thu, 19 Jun 2025 21:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/E7FuKxOhj6v2SCRuHODjTXc3/S3zVFKDl5381MANVw=; b=JwPr/f6i5WgF7XoimdPvbXx3mA
	pwSYD3qjsN97w2QYudv4umxVAixHX7+2msbGzRZezOvPKXoFd/b0mjIj5Jeae1ZgclyUkYFPHEn3b
	jp0nryEoqOK8zMEmJoUiBJut1fr9sgGAa9V4Myg6Ah4AjPH4eF8gb2MRMetKC5cy/NsNWIzVpsUrn
	A7R7bUXUq5Cr/g2GLkVhC8lkD6OKleROP6y6ZcWSz78lvUfj6Jtw1cNRJN4gEoNZjb5v+4Vh9mvGf
	7zb3k0efUHqNMzUxIQWMW8iVVfHmnhAZiLi4yiPJco04OTOvXMQ7nt2tI/+2REuPUd1gYwbGoQWrg
	9AzxVmMg==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSMdd-0007fA-Si; Thu, 19 Jun 2025 23:17:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	detlev.casanova@collabora.com,
	conor+dt@kernel.org,
	dsimic@manjaro.org,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable gpu on rk3576-evb1-v10
Date: Thu, 19 Jun 2025 23:17:25 +0200
Message-ID: <175036770855.1520003.6023832068451703480.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250618063609.690332-1-andyshrk@163.com>
References: <20250618063609.690332-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_141754_477736_9CF22306 
X-CRM114-Status: UNSURE (   9.25  )
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


On Wed, 18 Jun 2025 14:36:01 +0800, Andy Yan wrote:
> Enable gpu for rk3576 evb.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable gpu on rk3576-evb1-v10
      commit: 974baaa147022a6230768ad73313154ce0a77c0a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


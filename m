Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A833C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cCF6vjX7ITShKbqsLVLjUwSKKlXqYMqcfegwunYLhM=; b=Ugc4j0Vs6pb01zyA+sBr0dgq1S
	bfAFW4fcThLenRpMRL70jRCtkONMNuuSBy2GNGf0kmRbY8vDdLxD2WXnki2zLc2K/DH9uoZIQO2a4
	T/aZAerEVDvbjNp158IgBLZIxSAokApJZH2WLhUhAH+A6qmjQyeGYcSzPhOQZq91O9VIOEEBwUtYj
	H5KCcM2F6X6B3NLYUy+SyjdHlkosIfe/lyxPN+PxGCEUEtVNQtdSezSDJ3qinjzNZN+EYTJTCT5n6
	71zToCD7qHtM4y2Uk2JgDDyjAoWW77LrKUrRKJMfUtnkMwttw35xIj1kqTncWkwOO+i4jMIzIb3ry
	y97SShAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBCg-00000001ntg-1uvv;
	Mon, 30 Jun 2025 09:53:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWB5O-00000001mib-0v3W;
	Mon, 30 Jun 2025 09:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4cCF6vjX7ITShKbqsLVLjUwSKKlXqYMqcfegwunYLhM=; b=cha4O35OOJHdKOGKk6ME/vjkG/
	gkFx7rAvs1cXJErSj+lYsZ5N0RxvwHGZ/mCmpq4tIDNmKkf5h/g1i60rYTYovtz4i3vk0NsiZ7zIx
	RDnDNXUHBy9nHXYdBr6/slIZgfiaBBzetZQ52L2X2IG4XWnmCUu8h8IrRSVmUsp5f3TB2MFI9THSl
	z3pvDEUJ5ZjGD/7hyVThTZHfWlN/9rExzTCZpT011eLj8uoDPBvdvZvYeHFPhKgGcQK4gTmATdOie
	uKmiJ88iWT6pho2e/Z3mQ4JAb29yi+PnTtsvj/6gshptThLXbODuz5WnHI5iyBvcPIodu3blcxva8
	lITv+MWQ==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWB5K-0006Zc-4K; Mon, 30 Jun 2025 11:45:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix eMMC HS200 mode on Radxa E20C
Date: Mon, 30 Jun 2025 11:45:44 +0200
Message-ID: <175127673172.138768.2799587757457210088.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621165832.2226160-1-jonas@kwiboo.se>
References: <20250621165832.2226160-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_024602_254389_7B2E797C 
X-CRM114-Status: GOOD (  11.59  )
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


On Sat, 21 Jun 2025 16:58:30 +0000, Jonas Karlman wrote:
> eMMC HS200 mode (1.8V I/O) is supported by the MMC host controller on
> RK3528 and works with the optional on-board eMMC module on Radxa E20C.
> 
> Be explicit about HS200 support in the device tree for Radxa E20C.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix eMMC HS200 mode on Radxa E20C
      commit: 6e3071f4e03997ca0e4388ca61aa06df2802dcd1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


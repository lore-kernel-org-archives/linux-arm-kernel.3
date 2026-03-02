Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39A9E9B36C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=at8PnShVMfshtIkjpE0qopOFBgp0mzWKYpLQrhnUqZU=; b=NeUu+dG9MtHkRozaCenwNltywc
	nu6YaeTt0Aj/fqVXkqJX7YBF9PlL9I8aG4RhWH1VowgJnmhwY16JJK/JAemJYZ4rfiwdIaVflUejf
	Uyb3DweBvD7IPsKO3IJRLBGfzrlnpCDuzM4gXlx9gKTQXdBNT8CvbNKytaU/xgiwkCeXZrC42aMip
	8LK3bKTZTKrXVWGhWgN2hs2iJc/srWA8+cewjQc8UQNwKbmLXIdrA2cJzVu9RmZyAGQG14MJT2GY4
	hgJGP+dThX81GIpPAvuPZW5C/YLX5FzDgkOoToLVmoL8yepRw58dkGcjtcGvO+j+WOTZSBOe4yQQZ
	/Q6n5CNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1d7-0000000CqKF-3PWL;
	Mon, 02 Mar 2026 11:40:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1d4-0000000CqHG-3mjp;
	Mon, 02 Mar 2026 11:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=at8PnShVMfshtIkjpE0qopOFBgp0mzWKYpLQrhnUqZU=; b=213ordRxKdkoLy7UcfBCFG9tJh
	aZLqgrPFOyu9CeGiEJknDIpr8HwuK5HFjGfOalw2xLxC0fpCFgMZBT1CYahsRdkM/KG9aMx1psD3W
	NrJAc49oMQ2SR7MilRMP9h889rut+iepDflfyYlk4FLmao1nTdHUO0Uyg5EVf6U5tL7uLIQjvmueQ
	RZynFA7gEULVorWl+dS3/7QBCqh8UUiGqrZCN2CMZxxDt+bpqNaijUAEIB5oznlVcYDckHsTj7JiX
	BcHqSlr+fIyv6BAKSUFgabWmSOl8bufUxua39wAK+x38K5kQVeyWWJY4M86fd5bqlq2yuMZG0HZIt
	oKq5Henw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: rk3288-veyron: Remove invalid property
Date: Mon,  2 Mar 2026 12:39:53 +0100
Message-ID: <177245158237.769695.12935872735393881924.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226144842.2727107-1-festevam@gmail.com>
References: <20260226144842.2727107-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_034002_982957_77E06F04 
X-CRM114-Status: GOOD (  10.50  )
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


On Thu, 26 Feb 2026 11:48:41 -0300, Fabio Estevam wrote:
> The 'regulator-suspend-mem-disabled' property is not documented nor used
> anywhere.
> 
> Remove this invalid property.
> 
> This fixes the following dt-schema warning:
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: rockchip: rk3288-veyron: Remove invalid property
      commit: 56e224f848c4e2a6f758bc142ae9d293544adbae
[2/2] ARM: dts: rockchip: rk3288-veyron: Fix the Bluetooth node name
      commit: 801d1afc6b6cdfb67b0098a795d2130ae0f775a1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


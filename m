Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FE0E9B372
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNcvX7o0uACaqfGQIHmPD7RzV0GRL2BHct2k8eJvLpk=; b=Bia5HIW4d2JWBURehZ82Ofy46/
	uLcPkSGJ1x60ZsBaN1mMya1EsV6/xv14Aa1bdGVN5i4svjMFGOYXomDWI4u8M/W5mVLLAScrEbs7v
	4Yq/qUDZbZDxXFdtaQR7HdD3kYbdd3xN4ICkwFWie0RgmXoQKordoYToFnFfNrQHc40SOpI8ejZBx
	M9GvztuKhctkUYb3Q7odd63eeaT9/zC1BHo2+pIngMdSWWmuPNM0dkVGf3FIL19pxESePAINtX8Ze
	Fj6ZpUChJGp6c3gR7aNnpxmTjkd/gQnmFoVJhFSUDmAeolqSkYI4wESgZYrGKV+/IRL5XrluEpX2I
	3PfSopFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1dD-0000000CqQz-2lqV;
	Mon, 02 Mar 2026 11:40:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1dB-0000000CqM7-2kyZ;
	Mon, 02 Mar 2026 11:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=cNcvX7o0uACaqfGQIHmPD7RzV0GRL2BHct2k8eJvLpk=; b=QEONd7IlIdN7v6YzOiC7ar8qr6
	avGFh2Mu2OE+NFXZaph7AIUBosUCY0CzSyKAfAfrfk6Mf/2gCOzVvb2aT3QQWYmC1ZzYhPys33Zv2
	7gsrxn7GAEtFmLpNA2GPzWYeLj7LlZ3O7SE+FaE5Qzd/S7lvFhMisau4TrjtgKqX61VYjlbdMvo0Q
	tZMGf4lxIJ5iAkfNUBJSYw/KGxqJcgeGYPXM5RSz3tWILBViWr4fueqiRYdTCI6UIDQGOp5gtDyAN
	Nlm8GnX06LgCkOSoAMu+RVav60Pp43pwN5QlFqjkyoGtQlZLxHT6rVITa0esEhqAaFQWNL9rrSdfC
	b+QqR81Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix sdmmc pwren pinctrl for rk3576-evb2
Date: Mon,  2 Mar 2026 12:39:56 +0100
Message-ID: <177245158240.769695.7263646798737263068.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226102052.63-1-kernel@airkyi.com>
References: <20260226102052.63-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_034009_726262_C9985151 
X-CRM114-Status: GOOD (  11.16  )
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


On Thu, 26 Feb 2026 18:20:52 +0800, Chaoyi Chen wrote:
> In rk3576.dtsi, sdmmc0_pwren is configured as part of the sdmmc pinctrl.
> However, on the rk3576 evb2 board, sdmmc0_pwren is used as the regulator
> for vmmc-supply. Therefore, we need to reassign the sdmmc pinctrl and
> remove sdmmc0_pwren to avoid conflicts.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix sdmmc pwren pinctrl for rk3576-evb2
      commit: 7d939032bd7e203e1c907a8c35e3672eeee08246

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


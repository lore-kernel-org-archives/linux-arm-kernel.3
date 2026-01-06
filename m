Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CC7CEFCF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKSy9T80IKDTUT4rJm6tF29ciu71tA8nroiwuv6DMCM=; b=XxozAKIMDFqurfC1SI7nIPlkTh
	fgjuKJPQXXMczj7mvXj43eRl5XPAhxM6kg9P+k30qldeFgvODVL+4ryW1E8wIEtxzbeK8xre50SOV
	HAManOn4TBXWKwKr7A7JZuCvsGrfawwdw52Rb4FP9PKX/iTU8/wSON+S2eV/DEepSCRO2LCGn/Z/+
	9XH4qsrcwLTI+mF4+F+SF37avobrm9xPsy9nLADGXwiAYFkE7W6cLSVkIESSkBJCH+ZTGLE144oGI
	oMH6EXVMYg2dLTArXvNQDo4N6zrdj+W38hUzUpn2ZjhbUs+bAPnq1EaMDMnuLD9JFgkB+FwDeobBW
	7tqj+4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC0W-0000000DhEY-2klY;
	Tue, 06 Jan 2026 18:42:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC0Q-0000000Dh9i-2gTZ;
	Tue, 06 Jan 2026 18:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=eKSy9T80IKDTUT4rJm6tF29ciu71tA8nroiwuv6DMCM=; b=RJ/MqWrLOj3blZgZ7htOadqicN
	tTP7/qvr8cLEDE9L1jjdeSlUL6gLRZkSzxKKxq1JtHURzoX8d5lyC/qVxPAoNy0usHl83q8xkyxZ8
	bvBETxsWQVdBxjW5vZirNK+axS4MIViu8DMhKOg9gaGqNVGWkk2mDjO3GeItHNtDWnfMxQr2t2yOD
	Djr+Ndf2NQsM7vDNVZ57CPLvhP3zhPQ+3YUemzXyg/RYk5Vnqwey2Umejuh7ugVpCFAgWQH0/D9HS
	mOFPZ4czXuuqk23b2J7mQwT3DkbbholHInMvjIfmVMNnPkEdM/9QYu+LH+UVK3tFx7IUAUA6auUqV
	gBUfdbww==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdC0M-001Hfs-Dm; Tue, 06 Jan 2026 19:42:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Clark <inindev@gmail.com>,
	Alexey Charkov <alchark@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: rockchip: Sound fixes and additions on RK3576 boards
Date: Tue,  6 Jan 2026 19:41:55 +0100
Message-ID: <176772487188.3029798.5459621815338520362.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
References: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_104210_735326_E2C10E0C 
X-CRM114-Status: GOOD (  14.62  )
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


On Mon, 29 Dec 2025 14:11:57 +0400, Alexey Charkov wrote:
> Here are some device tree updates to improve sound output on RK3576
> boards.
> 
> The first two patches fix analog audio output on FriendlyElec NanoPi M5,
> as it doesn't work with the current device tree.
> 
> The third one is purely cosmetic, to present a more user-friendly sound
> card name to the userspace on NanoPi M5.
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: rockchip: Fix headphones widget name on NanoPi M5
      commit: 5ab3dd9d0a63af66377f58633fec9dad650e6827
[2/7] arm64: dts: rockchip: Configure MCLK for analog sound on NanoPi M5
      commit: 3e4a81881c0929b21a0577bc6e69514c09da5c3f
[3/7] arm64: dts: rockchip: Use a readable audio card name on NanoPi M5
      commit: 309598fca339abd4e8eef0efe0d630714ca79ac9
[4/7] arm64: dts: rockchip: Enable HDMI sound on FriendlyElec NanoPi M5
      commit: bde555926b61740c6256a38a9cf5a4833be345cc
[5/7] arm64: dts: rockchip: Enable HDMI sound on Luckfox Core3576
      commit: 87af7643234a2b4cb49a97dfe7fb455633b3185d
[6/7] arm64: dts: rockchip: Enable HDMI sound on RK3576 EVB1
      commit: f5c9549964adbac931e163693bd17db872976679
[7/7] arm64: dts: rockchip: Enable analog sound on RK3576 EVB1
      commit: d8872b9dd9208c493f1f3811d42997fb968de064

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


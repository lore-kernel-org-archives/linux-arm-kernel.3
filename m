Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F7FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 21:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEghm9KEzi4KEAVXKXRCeAyZ2hXh9Vd2xugtHnvbzp0=; b=19o0cavyiLkK9spyWe4lLa0Dhy
	N1pv4RgIT2lITAY4MZfxQ3Q0B6kqI+IVow3ae0+QBLl71C4uQHh7HQ7NdSe3zHdV7ytq96JgmBJZR
	GN04ebo9YcBJ0Q8psoe8aFZZaURPX3RH5GNSDYRquB90noDNw773HN8DYIuzCYulLtftCywZIsjtp
	9jvK+wRm9mhh/wKvghHxIcZ1UoMtRbTDfTC+R4XulIo+ahOVxnzT3bpvfxMAMbmUWv7/8KHWdCOYP
	kgLb1HfIEBmWEo7eVlMrMlgTFtYfyz8hOmKNMhr5t9ed8THoxbFUo2ANl3GG7z+0tVRp+R7GER+K2
	qeZFOXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nWx-00000002Ydw-2g9N;
	Sat, 26 Apr 2025 21:57:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nLx-00000002XLg-3904
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 21:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GEghm9KEzi4KEAVXKXRCeAyZ2hXh9Vd2xugtHnvbzp0=; b=eLMEsN4IxoTROZ4eRKiSlhdbEM
	U8OW5wX3coXicFzzeQE3UIJ3nE+ArgFtZyr5n6nIw993Ls0tapsHTuhc52xnFvk04E1jRXKaUKOlo
	c8LeNfEzLoTnUIWp4R0d2szx9/fLTnMX9W5NazIA7J8Hsf5KfhgqNOKnlSl99Y4w9ttzBNED5acnT
	UbSnV8x3c+lXxoyhszE8s/viNhlKpx9HyGledDNObqLFUTrgaIpYR/ydNSV6gnrt3LGWGck+sZBfn
	eUBuKuKaj9kLIaenSWPA7G0nY2LfDl6702gsCq5a1FLxlf0ylGbWQvwiHnONVFHmVAWkrUJnyJDZs
	/vO9S+sQ==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLp-0001OR-I3; Sat, 26 Apr 2025 23:46:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Add eDP1 dt node for rk3588
Date: Sat, 26 Apr 2025 23:46:06 +0200
Message-ID: <174570370112.31943.2977804072806541531.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250426071554.1305042-1-andyshrk@163.com>
References: <20250426071554.1305042-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_144629_782496_D8DBBD88 
X-CRM114-Status: UNSURE (   7.85  )
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


On Sat, 26 Apr 2025 15:15:40 +0800, Andy Yan wrote:
> Add eDP1 dt node for RK3588 SoC
> 
> 

Applied, thanks!

[1/2] arm64: dts: rockchip: Add eDP1 dt node for rk3588
      commit: abef2de3db010c79c584b8bffdb40f779fb7cb6b
[2/2] arm64: dts: rockchip: Enable eDP display for Cool Pi GenBook
      commit: 26cdcf6898894e0c27049841b924dab7c5bfe055

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


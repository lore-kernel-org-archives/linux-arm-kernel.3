Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCE3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEiKFjkzgKWigijgMZ+BYkH9wSj7Ws/rYW5aY2RQxSw=; b=zCFvD/lcks0O4f8JLPNUu3W5js
	/qUDwSjKHfxDYNMPc+I9A9S/NfkZGeD6NwFrwjoNYchqwkNnbNU8aZzThPeibsq/K77sdD+fANifd
	QveQEHXtDpNPZeaBOD1v6kpN6Cuc8ugLD8nMQ/+ic6y3Z9JYsuKqHZ7bvxe1JsgdWBJVNZg8d7o2y
	nXyOjKkHG58DLw5ejri19vEQ8Zcj6HFifZC5vO8FzEkOvzMGzBP3dnag1fEqAQnMWzCnrz7vKIwZU
	7cv6LobJW/AgNimhXb/RhImFYP6pb1fZYk7nIXpvoUBtKr6Px6+4O/+OuLXbQkb6B+41WmC0GKb4u
	U+hq0W4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvtb-0000000Clqz-140r;
	Thu, 09 Jan 2025 17:00:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvol-0000000Cl0a-0mvw;
	Thu, 09 Jan 2025 16:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AEiKFjkzgKWigijgMZ+BYkH9wSj7Ws/rYW5aY2RQxSw=; b=2ljEwoeDxNVWPLF+XZ8grBMuGb
	9eH8SI7UJKrKfbVC4315nZWMV0MgWyIixymPkH3BOmLdAS4LtaV7JWoNPM4S+wi7Ly7ZtTnsVF0aN
	Oc/XaDofnwoFYm7ytgKOwOm6vtgXEa4RtvMTlCC/ATZWgy3o6QMzfs11F8lBoglPccHMlaYPgxFaH
	5ZhHRL9SfIl2BJxgDAkhwaNft1/VagNohieqevar/WU1LxCDtW9r08otorj0b8UDjC/4GuTAXWkYS
	9N1I9vSB8jsNiNvyaWx/fpbB52zyI00uYagjNpsjrJClo6BKh4n/IqP0KgARL1VfbvU/MUswfEQfO
	qW7nM8Fg==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVvoi-0003hx-Eh; Thu, 09 Jan 2025 17:55:32 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Klaus Goger <klaus.goger@theobroma-systems.com>,
	Jakob Unterwurzacher <jakobunt@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Subject: Re: [PATCH v4] arm64: dts: rockchip: increase gmac rx_delay on rk3399-puma
Date: Thu,  9 Jan 2025 17:55:18 +0100
Message-ID: <173644170629.2899934.9406584209909558440.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213-puma_rx_delay-v4-1-8e8e11cc6ed7@cherry.de>
References: <20241213-puma_rx_delay-v4-1-8e8e11cc6ed7@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_085535_228512_CB8A4F3D 
X-CRM114-Status: GOOD (  11.26  )
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


On Fri, 13 Dec 2024 10:54:58 +0100, Jakob Unterwurzacher wrote:
> During mass manufacturing, we noticed the mmc_rx_crc_error counter,
> as reported by "ethtool -S eth0 | grep mmc_rx_crc_error", to increase
> above zero during nuttcp speedtests. Most of the time, this did not
> affect the achieved speed, but it prompted this investigation.
> 
> Cycling through the rx_delay range on six boards (see table below) of
> various ages shows that there is a large good region from 0x12 to 0x35
> where we see zero crc errors on all tested boards.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: increase gmac rx_delay on rk3399-puma
      commit: 9d241b06802c6c2176ae7aa4f9f17f8a577ed337

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


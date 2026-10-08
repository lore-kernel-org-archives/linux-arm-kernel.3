Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34740CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 15:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3B0mHhf+tucMipCoCNuU/qvaCcnXfH+FNicCEU1fu9I=; b=YTZCVc/FU9NwxEL8BhVivXAx4u
	zQTzFTOeaZgXfESV+6+VOVljKJgj0OP29GAEV964XRUgv7MP77RSPTZS35YOY65lmAFXBKGIKfkM0
	F18u0XirbkJ1TPK06EV4iASz/HER5aYHYX7vWxRRG692ATx+qaO0oVwSyYnNehsXc9+D9vagkcBev
	9HFwoX5mgBCxsnIoSvxhyB+PYld0xFACIyiZn8sO0II7F7crENbpf4r1rJqzUcmmvcoUJ7g7HmSPA
	oqOxmcEtbb4gq9MOM5CM4+4xCy9sFPQVdKvg0AyY6TWKgxy+CSiy8dKiLF4dqbRakvL3WR9greprO
	rVt0zBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpnC-00000004adx-2WFg;
	Thu, 08 Oct 2026 15:12:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpn9-00000004adG-3112;
	Thu, 08 Oct 2026 15:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=3B0mHhf+tucMipCoCNuU/qvaCcnXfH+FNicCEU1fu9I=; b=ht6FEC96ux3DhnPn+54IleZF35
	q5tWEsykFh52f4T4XIXpbFttQUGTX/GDw94gNpEFvly/t8iL2Jrqfv7gzUW4YFMLdRVYvBxA3Uq/v
	gVuPy0lV1sBKZqhjkJanmkgVbIilQefu3SixoA4fGOjPyG4jQ/3jcbscgsbjdp6UhGXo0luIOkW58
	2roBm0QRP13NwEsP/zbF75REF5I+Iq8+45Z/99IPTvh1Qkl1V3XE6s9M+SNMWGLCtWgbOoDMeilBa
	RYIFpLOfGFMpncpMiviECCwZbpB7Fuh7Y26w0LEeAB61r5i3cyRvGmo4gAe1KEHC7n+o+voBRpQhX
	GmkxAvXg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: enable NPU on Radxa E52C
Date: Thu,  8 Oct 2026 17:12:03 +0200
Message-ID: <179147232047.3420474.6626937665444807668.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816100000.3707339-1-amadeus@jmu.edu.cn>
References: <20260816100000.3707339-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_081219_942708_AF2ED865 
X-CRM114-Status: UNSURE (   9.19  )
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


On Sun, 16 Aug 2026 18:00:00 +0800, Chukun Pan wrote:
> Like the RK3588, the RK3582 has NPUs. Enable the NPU cores and their
> MMUs, and connect the regulators. Remove always-on and boot-on from
> the regulator because it is connected to the NPU power domain.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: enable NPU on Radxa E52C
      commit: f204f28bd1fa9b4cf3e47488ba3ba25251aba18a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


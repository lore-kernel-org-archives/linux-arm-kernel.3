Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63921CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 21:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jd4VHP8Wahob2y4nWiCEs5CV0DeZkhS5T6k11qjWGHM=; b=f5O3WxMQ7e+RXueR8uuCgcvm8y
	H+CH1yFudPvQuhNZrm/rTOVwKtKrSQ5pfaG34vQvr6VKyvWrht+JlucKRuOCoRztYGQnC06449gV9
	jJRGznMc8HXVtjo/psRFMUZXOGVzMvLFJDuh0wtLUe12gA2HmDWm5qtz6ti3hh5I4qUk8W6loTN7+
	AVDCSwkqUniRZPyRrr3KsbKw9kvEQ5sSWh9IyaELpuMxhqfV0ZzGDx3tYijWtkL+LeNMfXoJlyiLI
	vhhx1j8Om9gp5as5xQeP4b3irF1Yd7NiVipfZponVt8ZRUhPz4aahfg1i6XDL+q2HElo+5fxp4nbD
	gTqR/2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTaP-0000000FL4u-2ILf;
	Sun, 04 Oct 2026 21:17:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTaM-0000000FL1c-3ISS;
	Sun, 04 Oct 2026 21:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Jd4VHP8Wahob2y4nWiCEs5CV0DeZkhS5T6k11qjWGHM=; b=U8Kri3H0wqf5Ake/uNakeou7jZ
	qxFRcWg0o0/GT1wYe6l3BKRO2oV5gBMLddZ9vqsXf7Q1c37qjqV2GpeRSz5yYwaLOvh4MW20VFi1h
	EiLGjm+UXtxcehDbGYo4AjOpvXh5CQK6gN/HsOSgN/d0QuySeoG3SrpdF5RvBB23J1lCiQ2hJ966I
	coYvY7pRDjv/OxUlbw42c6Dpid3aDB4161ZUOWxoxGoxJb+r8QqI94PkoHrCSHm7FPErWB3U969cT
	zaO2maLVk07P47OtWOeEwWVYgTWA6DVUTPmNhqNmA45HIoCQWbl+srsn9cEHsK8dTCVq4J2DGodma
	mSJmoY1A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Youngwon Son <yoson5375@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable the NPU on ODROID-M2
Date: Sun,  4 Oct 2026 23:17:25 +0200
Message-ID: <179114864090.3283966.7430942053173707754.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261004172115.5105-1-yoson5375@gmail.com>
References: <20261004172115.5105-1-yoson5375@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_141730_822890_7DB35DB1 
X-CRM114-Status: GOOD (  10.75  )
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


On Mon, 05 Oct 2026 02:21:15 +0900, Youngwon Son wrote:
> Enable the NPU cores and their IOMMUs on the ODROID-M2 and wire up
> the vdd_npu_s0 regulator.
> 
> As the regulator is now controlled through the NPU power domain,
> remove regulator-always-on. regulator-boot-on is not needed either,
> since the RK8602 state can be read back.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable the NPU on ODROID-M2
      commit: bda971ceb9aa263512b46a785abc9218d3e08d17

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


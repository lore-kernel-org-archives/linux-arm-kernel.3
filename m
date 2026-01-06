Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DBDCEFCEC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNJKOe7dZBqtB2Q11qCQuBBieA0ZJeo2d+TUinZp+gU=; b=vcqEq/h0Avs9BNobA97wPuHHXH
	U0iNSZuxqCPN5hRY8/obcswVqjw25vlLkxdBz89reya1GXWFnC/LFwC41gzTiOWs4Y7HdnQdPIWcf
	UWrhRkxE4CMFZWlStCd5doOiE75vm7aYygk7gzFz7i4SIIJnHH+dxAPVuNZKd57d6IWmZJtqtHfjC
	Ik/XdAlJmFP+cgFKAMPhTXqQp5HjBkYNSYclnAqzQ4ofoLAhezyfAnU0K6Qizm2z61sG7e49WhOMm
	DhQ26TKDKZEE4CxIeP3CivNueD1B0JClj/m2xw49GLHso7+ILUh0jnWfrufmeGkfP/CsttMwW9JVI
	Up41MH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC0d-0000000DhQC-2DQB;
	Tue, 06 Jan 2026 18:42:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC0Y-0000000DhFq-3oFM;
	Tue, 06 Jan 2026 18:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jNJKOe7dZBqtB2Q11qCQuBBieA0ZJeo2d+TUinZp+gU=; b=yVkmSm93YESmFzbN4kw9wIEc3i
	vBCyeNE+ohLBBF3aBXTuDEKySq6SQuMWEujZqHob+W2eAkt+BR9nNbYT4KjichlYJW9FPSwLR5Pon
	alqbiOLDSLkUYUW+3iy9EtaerN3/r+yHLrEHcWr7HRs55sSozd0zu578BpuyHeqiq80Sif8S2T0Zn
	ElyizRyh8NZy237eYR7zbFeb71I7msHFp68xQcjTSbTMPz7TJ+xeHx7bpD8JvvrT0rlVapit0+1O1
	6BWNjxFzQbfzSm8DpmD4ibfNM1NibLaqD15jWhSKiMNcI6Bn7ITHZ219jTlUUcL7LcC55HlPlkm9e
	rXL1GtUA==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdC0O-001Hfs-2Z; Tue, 06 Jan 2026 19:42:08 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	Liang Chen <cl@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix wrong register range of rk3576 gpu
Date: Tue,  6 Jan 2026 19:42:00 +0100
Message-ID: <176772487179.3029798.9845347740107350561.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260106071513.209-1-kernel@airkyi.com>
References: <20260106071513.209-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_104218_975592_C2740286 
X-CRM114-Status: GOOD (  12.74  )
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


On Tue, 06 Jan 2026 15:15:13 +0800, Chaoyi Chen wrote:
> According to RK3576 TRM part1 Table 1-1 Address Mapping, the size of
> the GPU registers is 128 KB.
> 
> The current mapping incorrectly includes the addresses of multiple
> following IP like the eInk interface at 0x27900000. This has not
> been detected by the DT tooling as none of the extra mapped IP is
> described in the upstream RK3576 DT so far.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix wrong register range of rk3576 gpu
      commit: 955b263c421c6fe5075369c52199f278289ec8c4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


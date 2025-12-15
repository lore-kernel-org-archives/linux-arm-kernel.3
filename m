Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22535D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zn/uhcRYE9P5t+xoL0MI1jmstVKavxgMn3GHiQkhybw=; b=tQdOxb2TdkV0D5efdgJ0HMJGTG
	pxTQnTHHbcuLJ51HT0HA/MZi4zyUt4VXo771oIFmF3RHsjdRz+NcuB3nDURICCBdGw/xVMCFkmK8T
	3ADIFf1aiZp6AvrJZrxGPtguJiOIfMjbYBrX+m0fkDqW+PSEyh9YzImwHyg+nHzryIpsIlZ55n7GF
	ithf6UUM5hiozP9ybiSlV4GC6ItSafnZDDm8BAFMnFvzJeEHkxxWhqr9ksI/pwsGztCzoEmtViHq3
	y3Xhz/TuXdy0tBC7nAk057fAJwyBfXpJdYj4v8p4V3rgKCEFlEfH1TQzb8in0IdYdXBI4UnAOuOo/
	EyCL6NEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV73Y-00000003YjH-0ddX;
	Mon, 15 Dec 2025 11:48:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV73S-00000003Yf5-3zA1;
	Mon, 15 Dec 2025 11:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Zn/uhcRYE9P5t+xoL0MI1jmstVKavxgMn3GHiQkhybw=; b=hud35EViFGxZ44fZq/v+HIIQPc
	dTRWejKOXGyjBVZYEnUaTWVXrXqNNvaXb0ZOjA9g56ZKi0xzkx3dU0esoYNKQQMZfZdcX4c8xIYQE
	qiaoTd+1Ed94OHM37OruzmwCxKQPmc5FDDKsC65nkd4K72GpiHX/8mkrMFWQdLm4KEFjaazyDYCLR
	fwHjpWRGKy9Az61I/7fQ12RroiyyZDrNYwwu5O9UnAzxLDR6nmVPbuQNo6NHS4UxKLYo2cfawOxme
	M1X7l8myTK0zzAYxzRKaJjrUwcHm35eqrsvmJ+zWnfkVzFnumdBzKA+t8t3i+3YhlXxnUW7fbzps/
	faLM5GlQ==;
Received: from [192.76.154.237] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vV73A-0000On-2C; Mon, 15 Dec 2025 12:47:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Torsten Duwe <duwe@lst.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable SPDIF audio on Rock 5 ITX
Date: Mon, 15 Dec 2025 12:47:31 +0100
Message-ID: <176579924017.1404176.3512598682044953071.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251124183056.B853068C4E@verein.lst.de>
References: <20251124183056.B853068C4E@verein.lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_034755_047411_1EC3E9CD 
X-CRM114-Status: GOOD (  10.27  )
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


On Mon, 24 Nov 2025 19:30:56 +0100, Torsten Duwe wrote:
> The Rock5 ITX has an S/PDIF (TOSLINK) socket in its I/O-shield, whose
> TX signal is wired to GPIO4 C1. Activate SPDIF TX unit 1 and select
> the proper pinmux (M2).
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: enable SPDIF audio on Rock 5 ITX
      commit: 2cc30da80a28a8a5d1337230c3586eb2f9580120

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


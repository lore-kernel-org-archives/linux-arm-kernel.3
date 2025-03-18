Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6462C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 23:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hJklCrqpGSVlV2NvA/25kazNO3qOwA+/saPAYFTsoE=; b=eGM8paPywerCKU1nobQW9uajtZ
	UiUl9tEk2e2KitnQf5GqStMWz+ctVpkNE9tZU0ZoVUFyiEi6qHbuRuRne/ns83FwO0hHZaMB+rfBB
	L6kfKlcWAVzO1q3OTQ1Qj+oDjiuVpoweIoYnHAnpXgkPL/mCUNS2DINn4zxNrOaThd9WNMU1l8ids
	a51Ub6AAOUyZpO9NnnRVX7qCaaCagjgFBYyetCTZ3y0z1X4JaOR2jIeZO2zOeaipqDHV2ng5j/wwy
	MHqAXPJt3UjS0xYoH9/ZvyCXdxILltuG2bjEbeX08/WzsfKSwYNHpEiAPtqQucpKYLXtXqlx9EClD
	8qaj/NhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tugKW-00000007Num-0yfL;
	Tue, 18 Mar 2025 23:26:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tugIo-00000007Nc1-3CxI;
	Tue, 18 Mar 2025 23:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1hJklCrqpGSVlV2NvA/25kazNO3qOwA+/saPAYFTsoE=; b=wLAnBgKqHED21WT6XjMrhnXKBX
	uCL/df03qRP30+8Sh81jR2I6nyiuwAJmAKsOxer+twO52bMh+x4a/HJmG7AlziZjTSHRjEztiy6Wp
	mHhAgE8rtWwuIjAA5fds296cbyArHgQLRRhVAv9CWqOs23gQACutQb64nEhXIXNbFdvZVibHBvryP
	MSx8qIFSnSaM+Vh8W/1z7njom4+m4o8lIU/cgdVm/xRqi9kBSx3rt2+Z+95nNKXMGTeBmSLfxbQly
	e2K+tBtStJObxHuDaaN49peT4hiKTuhLI0mLUlW8sLNYV1FT8auRM/6V0lDf9uI/Af8Cb1igzFYq2
	685H4FKw==;
Received: from i53875bc6.versanet.de ([83.135.91.198] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tugIg-0004Fw-3Q; Wed, 19 Mar 2025 00:24:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: remove ethm0_clk0_25m_out from Sige5 gmac0
Date: Wed, 19 Mar 2025 00:24:42 +0100
Message-ID: <174234022086.1144821.10038416716073358190.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250314-rk3576-sige5-eth-clk-begone-v1-1-2858338fc555@collabora.com>
References: <20250314-rk3576-sige5-eth-clk-begone-v1-1-2858338fc555@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_162454_817964_825179F1 
X-CRM114-Status: GOOD (  17.17  )
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


On Fri, 14 Mar 2025 16:35:50 +0100, Nicolas Frattaroli wrote:
> The GPIO3 A4 pin on the ArmSoM Sige5 is routed to the 40-pin GPIO
> header. This pin can serve a variety of functions, including ones of
> questionable use to us on a GPIO header such as the 25MHz clock of the
> ethernet controller.
> 
> Unfortunately, this is the precise function that it is being claimed for
> by the gmac0 node in the Sige5 board dts, meaning it can't be used for
> anything else despite serving no useful function in this role. Since it
> goes through a RS0108 bidirectional voltage level translator with a
> maximum data rate of 24Mbit/s in push-pull mode and 2Mbit/s data rate in
> open-drain mode, it's doubtful as to whether the 25MHz clock signal
> would even survive to the actual user-accessible pin it terminates in.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: remove ethm0_clk0_25m_out from Sige5 gmac0
      commit: 73d246b4402c3356f6b3d13665de3a51eea7b555

Actually applied this some days ago, but b4 is of the opinion,
I didn't sent out an applied-message yet, so doing that now :-) .


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


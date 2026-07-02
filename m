Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1261EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi+og8zzAWmwxBq5244UzdXz2emj9itakwbhrlFY2Rg=; b=og/DRFgXmL57IswOzgBnxq1KrS
	WTBJEVlE+WtKAl/lpz8GlXqvFkwMuzHQ5TI2Eu/UYNPwX8OjO4za2hJwd/zT9l3iKAQ4aLTqFvi4v
	IkEiX2sXehCXWp9XjCN0G1MFuNEVA794v3wtelxxn1lthD6GQ6Mk+4eBDMrVGesbeIBXVs7DPciJS
	kwVDo/2+zmzWkgEfrypzQMezFbVdJgDLmvbflkAy/LPnSYr0GE3WGtqIyGg1AtM0qHMk4pF+MOEYT
	ahAbjRSbRdu3YvW/Q2NoKkvCslUT/oIDpyOoHNNCzEg8ZAAiskS/MghxbE5UsPQ3MdTc1E+h1fXxf
	NBqn830Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMil-00000005JW0-21bO;
	Thu, 02 Jul 2026 19:05:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMih-00000005JNs-0P8y;
	Thu, 02 Jul 2026 19:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=qi+og8zzAWmwxBq5244UzdXz2emj9itakwbhrlFY2Rg=; b=fJWXkvhsrFUM/UOKyZLZFZfBVg
	zCVaQzvT3DI3HJVrg6GGZloSryXaOGLJwnEwzR/J9CjtWNO2Lz2Iihjx+ZgsoI41Ifrd3aIXGHGTV
	+3+1tqy4VF5cGHS9WJ6w1cLfggdYqUE+8kXJ9TrxixjEx4JU51AHayan0fTn4Jj3mz9pLvNZj4aja
	i1VxQuT+y76p/zq7ncejlP4w8A7ARadsR1Xi5nRFugBOGXj8guRKVBxg1Qr5Karz3Ve/6+TtmsvFq
	vQdBB+85KKLuOUubSvkIQC7ZOat9kgZR7azHzl0E+pzPMfdgOdEj5tF9dRs3sBSThqYrr8YNLOH+x
	7fU+z35w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC reset polarity on PX30 Ringneck
Date: Thu,  2 Jul 2026 21:04:52 +0200
Message-ID: <178301901902.3838694.15610180855070263903.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626-ringneck-emmc-polarity-v1-1-90cefe57b316@cherry.de>
References: <20260626-ringneck-emmc-polarity-v1-1-90cefe57b316@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_120507_143631_091B757E 
X-CRM114-Status: GOOD (  10.98  )
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


On Fri, 26 Jun 2026 16:40:38 +0200, Quentin Schulz wrote:
> According to the Jedec 5.1 specification, the device is held in reset
> when RST_n is low, therefore the polarity of the line must be that, as
> specified in the Device Tree binding (mmc/mmc-pwrseq-emmc.yaml).
> 
> Due to the wrong polarity, eMMC devices with RST_n_FUNCTION[162]
> bitfield [1:0] set to 0x1 (the default is 0x0) will be held in reset
> forever.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix eMMC reset polarity on PX30 Ringneck
      commit: 549081d9af61cf046cac15281e9a6ceb9b2592e9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


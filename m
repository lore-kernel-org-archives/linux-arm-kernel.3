Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C6CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 21:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyVq9gE+8a0STJLL9I8+U45gbX2e/0ltR2qoqQaj8Ak=; b=zvc4PNMZ/jxd2hJaZ+SvSUfyD0
	GLb0F9XcLq1lffaba602MZT+tCuynwwI3vctv/+B982Hu4NkVpW/c6tFDTn+XrS3t6TflOhKwDBO9
	NpOX8OC5pE30vpt4Us5BAgBgSV5x40gfl1KQm3BGqwMI06R1PSgnPOjpJ6ksPzqGyc6Y+Lc5JsjBP
	fTsKVHc+JNx1+Jn0+wnJHldR0DSnkicmEJ/74GGk1ggUt5+wXEP+haMzKslpJ1eNAbVl+XgC8DVmc
	XDdIpvRafkYbS5+vLTbJeO8AoY5WUvYjis0qumMWFffWAPZmZngSEDHwAWP5+I0CYN/JLJAgIP878
	rXFupFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nV8-00000002YW5-2oFE;
	Sat, 26 Apr 2025 21:55:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nLv-00000002XL6-2pKi;
	Sat, 26 Apr 2025 21:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FyVq9gE+8a0STJLL9I8+U45gbX2e/0ltR2qoqQaj8Ak=; b=ROfm/sQD00zi9MxnailTqqRhTM
	QJHzYwMO09uaRoOoAnqWsZlO4FCZCES3PGcRK3BTYgTJhtDK3JrN86sXmgkbEr/virYfaQK8kyXbh
	gnWvTqCZOZcgWYeqj+QP7sUT7jTGjFYk44cN8XYaLhodwwXqp2bFifSXTEi21ezb3qJvJNQR+fGlE
	rvDI+Hr1UGWC6PIF1thAPdgD5wG3AibqpFsSNNOOJ2N6tLvKNIrAv8fKA+LvNFIqW0SY7ZQ42IlOq
	oAGcShv/hqpV2IeU5FGjF6OI5l7Qv1iQ6cE5e9hC1JR9iO1pLFvUAXHWJfKAh6a5MQQm2NPThXeT/
	EOAkWhlg==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLr-0001OR-7D; Sat, 26 Apr 2025 23:46:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacobe Zang <jacobe.zang@wesion.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com,
	Muhammed Efe Cetin <efectn@protonmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: Add board support for Khadas Edge2
Date: Sat, 26 Apr 2025 23:46:10 +0200
Message-ID: <174570370110.31943.7845871822930134911.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250424-edge-v1-0-314aad01d9ab@wesion.com>
References: <20250424-edge-v1-0-314aad01d9ab@wesion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_144627_707868_45BA935A 
X-CRM114-Status: GOOD (  10.12  )
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


On Thu, 24 Apr 2025 18:14:39 +0800, Jacobe Zang wrote:
> These patches add board support as following:
> 
> - HDMI audio and display out
> - BCM43438 bluetooth
> 
> 

Applied, thanks!

[1/3] arm64: dts: rockchip: Add bluetooth support to Khadas Edge2
      commit: fef7d8834c5646f029f95ff0f3c3e11d449465b6
[2/3] arm64: dts: rockchip: Add HDMI & VOP2 to Khadas Edge2
      commit: 1307bb6e1a4c0b1144a77f77aff728219cf10bb5
[3/3] arm64: dts: rockchip: enable HDMI out audio on Khadas Edge2
      commit: 6bf923a7d0138e8e7d8165f6642c8121fb115571

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


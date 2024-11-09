Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE01DD5E36B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 18:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXT6QzvZKFkWm+65cSnJhI8KPPDBdvN3VCzrV8WIxWU=; b=OzI45qi997HAy1NqKOA/VVjUEa
	RbREHIyu4kBhI0RM8AWZp10lYmoBSSu1cQ1h5lO+coVUm0zCCHD2zVlnqgavqgX6Z79qhORGR6OYO
	KnnpzRNzX+aj0pRzVyfRV5WUVJfBx+RmbjRzqciUWKG/y5o05KF+R5A18ETN1Y3nDTQriOCisQf1E
	99m5WSKqzqR6hO0//29LRCJLp28zGt56/ED9DE5Dho/1PnAqWAWfflWXXRW55sCxBW0azGekBT2ln
	nBSel8i+R3fUeo2+UvYyzWuc2CbND5nwpXd1vrPeTuEger4IIUUhOcsr5x1fZfKwjS0jhKQ+JtEsX
	5Sy2I+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9qD5-0000000Do6O-1Rlp;
	Sat, 09 Nov 2024 18:29:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9qBI-0000000Dndy-3YoL;
	Sat, 09 Nov 2024 18:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nXT6QzvZKFkWm+65cSnJhI8KPPDBdvN3VCzrV8WIxWU=; b=0+nvDSCDc8B2s1LDXV9u6vPQbz
	8EMEWJHF31eVfqezZCq0NzfQkzZHnbNYl4m5jpXYFIVnZq3dsnmBgwoHJU3Is4BIPBc42EsIfTD1I
	KemBi5W1aa2LOD3M9qiv449hN1LCj8ra0D/IfNkFvA6i6Erljk9IZLbseKTyWLA4gpMnJ2nNjrsA/
	kZx7fOPhPCP8dljOVs4s3fV0jZ0uQFu146aVShwAr2tGwrLBgeiRkxRCumr8wycwRmHbEktXqa7zA
	ysI9RpzoFHiqSTgEbyPJ97VxKx9xe7bdnjpMDa7RzoP7w6XKJPsFwnCjJzEMfSz2hsg+8r6VyHAoF
	YAEnuSPA==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9qBG-0007Km-Lv; Sat, 09 Nov 2024 19:27:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Yashin <dmt.yashin@gmail.com>,
	Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: add Banana Pi P2 Pro board
Date: Sat,  9 Nov 2024 19:27:10 +0100
Message-ID: <173117675957.1131306.53694028790039821.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241030202144.629956-1-dmt.yashin@gmail.com>
References: <20241030202144.629956-1-dmt.yashin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_102732_905343_2081B3CB 
X-CRM114-Status: GOOD (  10.87  )
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

On Thu, 31 Oct 2024 01:21:42 +0500, Dmitry Yashin wrote:
> This series add support for Banana Pi P2 Pro based on Rockchip RK3308
> (RK3308B-S variant) made by Shenzhen SINOVOIP.
> 
> v1 Link: https://lore.kernel.org/all/20241028213314.476776-1-dmt.yashin@gmail.com/
> 
> Changes in v2:
> - Drop ASoC dt-bindings patch (applied)
> - Fix excessive board naming by matching to other Banana Pi boards (Heiko)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: add Banana Pi P2 Pro board
      commit: 8068f5939569127ee3fb73a677cc2fe73103697e
[2/2] arm64: dts: rockchip: add Banana Pi P2 Pro board
      commit: cdf360b13afc9212a83e76d0f3897d0388a82621

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


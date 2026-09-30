Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3EFCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 22:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uagXdD5ciqWTaFMPdi5UdXHkMYzb1UdXrcKzNq3ujLI=; b=Ef0msRjf1QZo5uFEGL+4NiiCvp
	0CWuBZS6POrwV2EKxorProJAwJK1Urvii0Ltgb+BmYoluGogO2x0gbGKLpD4N/zv3dWKX4wm/AZ6b
	y6Ca3lV7sEnVfytp8kXMXMCM92MAZPa+k9PAlO8D1DzY14hu2YquvKoNd+wfzPdE6ZV9pX/u9Gxe9
	OvVCsumYzrr/0uKGfmM/NEuubaHF94JZ6HST+hF/EyRwst8o2+doLZ6c/o97trDDtfhcEs6gLqpbr
	U1WMSLJFHq2TCfPKTjzJnNrlBjTvQtkwyx9DN8FrxUcmb1NWScJm75jpgHvw1s1Mw1RGDKxcaG4kR
	wsPxlzRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2pB-00000007N1c-07OV;
	Wed, 30 Sep 2026 22:30:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2p7-00000007N0p-0e3O;
	Wed, 30 Sep 2026 22:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uagXdD5ciqWTaFMPdi5UdXHkMYzb1UdXrcKzNq3ujLI=; b=E3W6CVWmY+yb8nnlbSnwl2yKMK
	tLYbkZFBZeMNpQe9dh8OHn/4X5XN0oKY82AJ8Ee7CXfEj+jqI/lgc1Mcw09nhUSYatq6lzHVzFrsS
	kcgeGXg3DF/N2pd4UNAF8lXTPgR952v9CH/kUhzo1HX2DP8MZHN528WnLl8e1kTpUCuaXYYE0fjw3
	OPHkkwyiMJZLFNLa84ulcOSCGfDExKZ0D6PHcdT2PI+BbHU/lefiIJh0mgd6ylZ6haDTyFlS//fQT
	eYpKaPmJ92myblzvAU656TF/+67u0oueq0h18RKGgl0azpzsk0yd9Ffe/94IUl288r8VETclSjh8A
	M/1/+WwQ==;
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
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add MangoPi M28K
Date: Thu,  1 Oct 2026 00:30:34 +0200
Message-ID: <179080743116.2419406.13197098568454460130.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801080018.3220034-1-amadeus@jmu.edu.cn>
References: <20260801080018.3220034-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_153049_199200_C97F036E 
X-CRM114-Status: GOOD (  12.33  )
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


On Sat, 01 Aug 2026 16:00:16 +0800, Chukun Pan wrote:
> Information about the MangoPi M28K is here: https://widora.cn/m28k
> 
> MangoPi also has a version called "M28K Pro", which replaces the
> RTL8111H with the RTL8125B.
> 
> Changes in v2:
> - Add USB 2.0 support
> - Remove merged patch
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add MangoPi M28K
      commit: 4de49bae600f265a8b214cdd33f7d018a171c007
[2/2] arm64: dts: rockchip: Add MangoPi M28K
      commit: fa932a9b632ff0d80390b940e6aabe38ac305fe1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


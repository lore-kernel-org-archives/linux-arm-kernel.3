Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF2AC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 22:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XrbiVVXrsE/B+PTaSAIPJh0SzK7NoLZKAMpvhcbTBc=; b=aXx7t8TqLwsX5dQ+0k7jx1I0Sw
	CU6BD3/HqdPxIcbANi8fMdU0+1t1asdlp+E+F4K036IjzPaAmdAFsxMJxtn8h4rQKoSX+XxOFeCC3
	EoOcoYAg/Il+KhTN2Xz4YUEP1e40xHnk8DYrBKbvcOOBfrfyAJXxAjxwg14rF8IDlQX5ns++M8++Y
	P+7XioxVpRqyBcKuFGnvaIz+rGiSBa0n405CT0N4WCBl+59IS3Y86s9447XLmhi0otz+PQJbZs+oK
	b4QjJAMD4OshReA3DD9QqAnzVcRbYZgVd8bVYAfubXtRWvoTQaRXCAhtO9C69LRFXo0IwKI/02B1R
	WM3xYR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nhy-00000002ZHe-2X3r;
	Sat, 26 Apr 2025 22:09:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nQd-00000002Y4Z-0kS4;
	Sat, 26 Apr 2025 21:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6XrbiVVXrsE/B+PTaSAIPJh0SzK7NoLZKAMpvhcbTBc=; b=Yr7W5+18DsyQVkNm+GoK+jp4Bw
	VB4kKTWM/Ytiq3fh6mkYdS6S60yWJlfkvY9IBfL6QUv9MORSntqY6zO15I9UYsag169oxv6OYQq+q
	mkB3IjUdo1S6B+LLO9gn/D/jcY4ZpXi5CC8b8Sbw5B04nw1Qgl+3y3qFN87jZfV+YfzUtZb6eKcaz
	GMFle8V3BGictHtod1abh1/NfwvvaKrRv8WVu2y94rUcUHVAWGZ9HIvXJgpAuZJ4q+z2cemDtdn6G
	DHwVIifs3Qfk46IXiM91K5RZ/nb070i0MlAgOz8ZlM6I/Xf6yZc6kIWuPKOVqFdd6Ljqxe6Po2/st
	Ls1fovjA==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLt-0001OR-JL; Sat, 26 Apr 2025 23:46:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Markus Reichl <m.reichl@fivetechno.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add vcc supply to spi flash on rk3399-roc-pc.
Date: Sat, 26 Apr 2025 23:46:15 +0200
Message-ID: <174570395442.32969.5908465165720861045.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250411140223.1069-1-m.reichl@fivetechno.de>
References: <20250411140223.1069-1-m.reichl@fivetechno.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_145119_213066_ABE3B94A 
X-CRM114-Status: UNSURE (   9.96  )
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


On Fri, 11 Apr 2025 16:02:21 +0200, Markus Reichl wrote:
> Add vcc supply to the spi-nor flash chip on rk3399-roc-pc boards
> according to the board schematics ROC-3399-PC-V10-A-20180804 to avoid
> warnings in dmesg output.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Add vcc supply to spi flash on rk3399-roc-pc.
      commit: 86d8dfd4a5c5df883b7ce07b7e98b8439f468581

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


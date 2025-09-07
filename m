Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAE4CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 17:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5qAC84QQZ/QIIjMkOrBJNSXRAH+jqUUh0eQKO1pdy8=; b=tlA4LHWYxOxdTs0bSyDoyOR2l5
	YkZn89kDvLBqzJ3dGP/sDwQNgjWZHl3xwHylY1aVQIdajiiLFXGpI5HCPV0aWD1tsyHZPMHPA6oep
	GN3k1YNi24GWeE6bpK83Icx1pgbII/eYDcjpl8odS0I++fHYsk+DEutStQtWqkiGiPyCfE23OgwlP
	WYpWA/TUZLZu9ipVcNZSCII55bFWX+7bJZTAI58fx7K6OmH1HaNXR0rRlChjQGdXSp37DHAhKlyxL
	5goypCXdcNG73++YwqHRU95zUFSNof9gv1yDci9d3wjO6Cyha618yjZ6be3uyH6fatL8a+/VPSnxD
	4RGj00Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvJNV-0000000C8Pf-2Mxh;
	Sun, 07 Sep 2025 17:40:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvJDh-0000000C67s-2Vnt;
	Sun, 07 Sep 2025 17:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=j5qAC84QQZ/QIIjMkOrBJNSXRAH+jqUUh0eQKO1pdy8=; b=CBA1qJ0GfbxgilebHgXux7lmZ7
	nwcJPJjaROY6R8w5t/mGoF1q2Td9NX9rbZJQoAE5+WP14SfZDQxwabDgYnokyLpXlH+kBsD7FZq8+
	FUKBnVXM6qnYv6mRVxzDDkliut5mo1fPX931hdaDVA+ePeVWgx49n6xDfLjY+ibsgWu0WDadLhpJS
	n2VaALtZw+t+jCUQgcYSA3FqNHlMu2ReG4zNeW6uiFu/gkJYDaOuX/vmME1dKfKt0NMZDwD18ZFuq
	oXQkYDKTCcSZ+tyxxvqCTrhK9sluU9WxBWbHzcI7end+NWMgo97AjnEeqvsjIgWoFpFfFaVW2btso
	+HRH1KoA==;
Received: from [61.8.147.163] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uvJDd-0004Ii-Be; Sun, 07 Sep 2025 19:30:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add vcc supply for SPI Flash on NanoPC-T6
Date: Sun,  7 Sep 2025 19:30:12 +0200
Message-ID: <175726620391.195224.7684283599123514872.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905-nanopc-t6-spi-nor-v2-1-098b476d9509@juszkiewicz.com.pl>
References: <20250905-nanopc-t6-spi-nor-v2-1-098b476d9509@juszkiewicz.com.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_103029_635610_17C4A9D5 
X-CRM114-Status: GOOD (  10.54  )
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


On Fri, 05 Sep 2025 21:01:51 +0200, Marcin Juszkiewicz wrote:
> FriendlyELEC NanoPC-T6 LTS schematics shows VCC_1V8_S3 being used to
> power SPI NOR chip.
> 
> This fixes the following kernel message:
> 
> spi-nor spi5.0: supply vcc not found, using dummy regulator
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add vcc supply for SPI Flash on NanoPC-T6
      commit: 41194ee115685ec2dbbb80e20d1090cc3a4c64d8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


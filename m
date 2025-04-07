Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11987C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z35n/I5ZQnUdwdTSCOwVuX+sPzMGiNSaTdRQEUGKfpI=; b=dyIykqH5SAExTJF3Qdkm5kwwR7
	dvC335i/hNGmCJ6GH+E00XDfQ0bJWhVlOjKaKJUBRzOj9o1Z4IWY+FLJpTFE2lx1Qge6LDV62vGQ/
	JZocGIn8NsGxizrrkREN8ePl5iHgfhxvYTUot7gK5M+/v15WIeECynQXgvBBBgp6AOMJ/2zl1ew2T
	H+NZyIezGtbdBb3fgKv9aRVgK+d8HJuTeQACiby+sCtqBfo/TsPnQqIV7H2iXmWUyQG081GfTjR7v
	ce6yvvCKzorBjbHawhIbTqTb8n7GcG19nW7N1vrN1WYw1aeVGx56i9zEU1arFaom7zi0yJhRu6P9x
	OIWonOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1h5P-0000000Gody-2rn0;
	Mon, 07 Apr 2025 07:40:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gkA-0000000GiUK-0LCf;
	Mon, 07 Apr 2025 07:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Z35n/I5ZQnUdwdTSCOwVuX+sPzMGiNSaTdRQEUGKfpI=; b=hvmV7kbE3LWi26OEOqi6sohWRp
	wqBbKble0X4bqSf+W5prcG+tOoIe8pXOYPeeCwCOYoZvTX5tbFGVTNHxHyDwVB+HjVclPBmhhz7n1
	dOlKyScPYnXcfGMs8KniXHbq9NbxkrDgEkYKFtyrf2ia4ZmY2Iwk9sE+TPJb3oePDTfSLb14OPIUn
	2yci4Jf7fk/1tHnerKCkQnBOZZOUiT023NvGy/wXIOAlY/bbzGzfPnpLSCHe2onXE6gNGazJO29Ii
	pDmSMH7wPyVag+TVECufHaEBzfUbD87ZfyQfxeSf/Y4xIN+zbWeyjEUvcil4OzB3ZV2BGCUXw5LnV
	l1FguUGA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1gjy-0000tP-9S; Mon, 07 Apr 2025 09:17:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andrew Lunn <andrew@lunn.ch>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Improve gmac phy setup for QNAP-TS433
Date: Mon,  7 Apr 2025 09:17:46 +0200
Message-ID: <174401024397.372530.4895011120714473164.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1742331667.git.ukleinek@kernel.org>
References: <cover.1742331667.git.ukleinek@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_001806_120360_F7921EE9 
X-CRM114-Status: GOOD (  12.49  )
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


On Tue, 18 Mar 2025 22:08:44 +0100, Uwe Kleine-König wrote:
> as suggested by Heiko I split the patch to improve the phy setup of the
> gmac ethernet into two patches. The initial patch can be found at
> https://lore.kernel.org/linux-arm-kernel/20250318184550.47642-2-uwe@kleine-koenig.org/ .
> 
> Heiko also suggested to add Fixes tags. I'm unsure these are justified
> because while these patches are an improvement the old devicetree is
> working fine. I suggest Heiko to add the tags if he feels strongly
> enough about these.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Correct gmac phy address
      commit: 831263a4164e189c47e3a9ea189cb4b5bc078b1e
[2/2] arm64: dts: rockchip: Add gmac phy reset GPIO
      commit: d01e09a9f7cd4fb5a947e3dc718242b51b581615

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


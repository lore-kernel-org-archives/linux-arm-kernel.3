Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24EACD98FD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJeR7t9tgTEHlG4D2WrgLlF56zewIPkv9VSl1Jojg3Q=; b=oTBUoaG+v493C4muETF5fyOrq2
	qfexGIDmDF5P5yMxpz8VkLXF4kRfMwAOgc/g72UHGZxbPzAxMmFFxVEH3wz7n3ARGUJdXW5g9lXe8
	faUjt6RW0Rwz9f8iIW+50tTcRkXrvlrnM5P79XYZDxpDcjUAehZbARSouIDUme2DqtOgNJGcc2cIM
	WXYL9gGKbppLdd01ELv2V20kuEwkum6nAb0z4rqWR/XdPEJV9PNA9a/BjTBm+/P+cSmrtL8P6IiAx
	nmW97SOyM0VlGkxR9tlBwnyjonRFAivdC5mAHbpV33elV3Um2cNBV1EyoXtI4qcA4UEKF3nHPMjIM
	V4YUanmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgMy-0000000BEGu-1Wxq;
	Thu, 13 Nov 2025 23:04:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgMo-0000000BEB0-0IAd;
	Thu, 13 Nov 2025 23:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=BJeR7t9tgTEHlG4D2WrgLlF56zewIPkv9VSl1Jojg3Q=; b=FC+RosTwSMQHdLw7GIrZ+a1ZRn
	rHhFRpXZqm1Ug+EY6LHJDYigw0jDWvHtIUoW4XpS4Skx5CEixPJpwxc66jGYpu9qgoWzy0Zf1Im+R
	1LtINKhkrqZYVI2YnXemn/1sVpml4ABSJtbyrdcPDdj+xJlSShlXL4V5g2NL5yS4Kox+zDMy2rWFV
	Q1Vv4bdGeNrnqDcnSy2uMhVBJhJT2rnpETnbyazsAheRA/TE++y4E3FNLUUs1t1UU53Xs7l9gPW/f
	5/Ll2Hamxq+iy0XG8Lilr41osaZSQpFeTYkUoHNieq7ZsJWObYspP/56DJ2EdvmQi2KDyt1+3UoNn
	s60YnlWA==;
Received: from i53875a11.versanet.de ([83.135.90.17] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJgMl-0005bo-RV; Fri, 14 Nov 2025 00:04:35 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: dts: rockchip: rk3288: move edp assigned-clocks to edp node
Date: Fri, 14 Nov 2025 00:04:26 +0100
Message-ID: <176307502903.495066.8544378087012934104.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <7d6fa223-ab90-4c44-9180-54df78467ea5@gmail.com>
References: <7d6fa223-ab90-4c44-9180-54df78467ea5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_150438_105445_FAA25662 
X-CRM114-Status: UNSURE (   9.94  )
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


On Sun, 02 Nov 2025 00:18:13 +0100, Johan Jonker wrote:
> The rk3288 power-controller node contains an assigned-clocks property
> that conflicts with the bindings. From the git history it shows that they
> wanted to assign the rk3288 EDP_24M clock input centrally before an edp
> node was available. Move the edp assigned-clocks property to the edp node
> to reduce dtbs_check output.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: rockchip: rk3288: move edp assigned-clocks to edp node
      commit: 10712ce694a67304a99dbba20f8cb146ca5f4fd6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


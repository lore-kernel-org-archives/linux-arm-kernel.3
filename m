Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC16CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 19:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfo+fkpfY9grTAyC+1zdbUT1BIaN20nZVt7M4K3K5pg=; b=aca4BkcXXT7MgYCagcTF2uaLjH
	MI0W5ac+Q/yYL6MUzBLlMYujEE7sx2gf2uxLc3f6CcyEJkT5m6zNi0KRMB6r5RdACUXFDluIGS/0M
	fMGVZqur/VxYGUQIuddBiQY5NPlpGD24XUafQZywVyzzlGqyN8G9LLMVCmx373cCkU1ahML2N5KrP
	YMYh7Vim2zoGkGLYoxBQgbjmwprHgBkWi3/UGldjJWO22KAEdnAA4IQhAjjK5G9O3VNPuHwcVFeOP
	WvN1nQ+s+cIE6lubgfQcN2fyIMelcacwpp3vG309tPgbRyIHew6fDEJETvsM+OOlWjfbo0TzY1KE2
	fpcFbJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduwi-0000000DJBu-1Eew;
	Sun, 28 Jun 2026 19:13:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduwf-0000000DJB7-3twm;
	Sun, 28 Jun 2026 19:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kfo+fkpfY9grTAyC+1zdbUT1BIaN20nZVt7M4K3K5pg=; b=bg125zN9beK0JBe6EXswp1z86i
	W4OCtJPdDzOsvp3XkyT2bpgqQPaRiGQVWbMPom/LlqAySt6Pgd6UM1AHzUCSHvFepUaJpKm5iV+Wi
	5vILZ5nL3wmMsnE0hGlk8quMNxHI/Dtp0QnFGrffLEmpo9VBASK2So6oWVp1DwKtUz90xmmlQ8e72
	pK3+lVtSepXem5YVduoXQ56Q3yJxcV96+YA/GYcVm3gYWB4YgjIoEoAkddcqljyJcqASvzbqa9NDZ
	KFYCBeiP1itaAx3C9LT6J4FXqqdQP0s7CJYG1jnO5uzJRX+wAi3c6/pnjWx+vLcCZKDDSE5Wvf+0N
	HHiseXmA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC reset polarity on PP-1516
Date: Sun, 28 Jun 2026 21:13:23 +0200
Message-ID: <178267399836.3089434.16007967740669483311.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612-pp1516-emmc-polarity-v1-1-4816c1c909f7@cherry.de>
References: <20260612-pp1516-emmc-polarity-v1-1-4816c1c909f7@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_121334_068532_FF647F38 
X-CRM114-Status: GOOD (  10.80  )
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


On Fri, 12 Jun 2026 18:47:34 +0200, Quentin Schulz wrote:
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

[1/1] arm64: dts: rockchip: fix eMMC reset polarity on PP-1516
      commit: 2a08921edcab6a462fa6ddb02c91b90b5ac92429

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


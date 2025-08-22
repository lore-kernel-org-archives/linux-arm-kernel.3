Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65086CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBn1vmJsIt6Ek80bx8yrAVNfXar4FH8V3p6SVBqOIRM=; b=B40GqlmcKrVUjGaAnzaml1Nn1I
	lJZviwdFRyZ3NgrP8k9eYuHtN2Z501gEWogbRUVNoeYRUaWqjxNKdnAUMFNRAlpZBzonBkLuL5bx2
	sMsIjPfbZbz7qwLDPU89hljxZ/YepJfcB+s4s6iwBwFK04DHvkG4E4GPKKHCbF7SbzfbASGeu1qJl
	mdcl2RV3A3Wwv7nNM1Gu+AMG1H9y9avthHYFuZ+J5TNT7QVxF0ZjJVsbvDXI/BpxN/zttq31E8ZLG
	8s+JuRgmLQswuAu5MKIfW2TC0UqkXFwE6Ttf8c1BJ+2Kwvl+uGHpGdiaBpcVTLRVea08G/0COxiDr
	A/fTKvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPrL-00000002J0a-2sK1;
	Fri, 22 Aug 2025 11:23:03 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIM5-00000001Ndv-3ltP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:22:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=zBn1vmJsIt6Ek80bx8yrAVNfXar4FH8V3p6SVBqOIRM=;
	b=YHCbvlp3mx4IB+ynXJg68XtUjaIPKEBS5OswEYTJ2pDh/iSbv6t7e7vUGKOlwx
	TXjLCFZ/2a8x47Xqf47jZt935Bpy5X8VazOEXibfKGxZxR8BWKzELJRS/NYZxWCA
	Lc8R4OiwuHN6W9OpoyrZp/rHx2/y2X7x2Z83/kEcn3FV8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDn7yZZ4qdopcskAw--.47231S3;
	Fri, 22 Aug 2025 11:22:03 +0800 (CST)
Date: Fri, 22 Aug 2025 11:22:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: ls1021a-tqmals1021a: Remove superfluous
 address and size cells for qflash
Message-ID: <aKfiWY2gomK2wbxr@dragon>
References: <20250725061633.267174-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725061633.267174-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Ms8vCgDn7yZZ4qdopcskAw--.47231S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5BMNUUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxvSOGin4luwZgAA3m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_202218_252892_D143FE2C 
X-CRM114-Status: UNSURE (   7.07  )
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

On Fri, Jul 25, 2025 at 08:16:31AM +0200, Alexander Stein wrote:
> The jedec SPI-NOR flash node itself has no partitions, but the partitions
> subnode.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B1DE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 17:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kumm/W0FHgZSD4oybYWw1z+Pbst7geYbMRmP2AAXzZA=; b=yGaEPtLO6DkkCsVzfgnYszqvuh
	Y7G3GaSIYWnxkkC3d9LNTtywIMGVprks0HJK8hlywaUXT0pg4JRaghLBZRSnAWs+FSq8+WY9DGX3f
	MKFFPUlzrla3YJqchE4rwjtf/SC0pMG1a6nNfYpJmixUGUWiB7IGl9lgN8ie8dzQdfzGh3z+lK+Ho
	9eec7BMrwrg2AFfzf4ioV7+84RFimuiwKLSe0UITpNmLRVQAhADkm7yLgmJWJuqQ/s7A5lFACr7+X
	5ITqf6EPFrAyuqp60MsD3SO5sGhnZf1bKNS7ZgQJYTsxitixcShd1Ym1MIhihdSgUP/vy0aEM2jDz
	7q+S6S7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKdS-00000005bKj-0TvY;
	Sun, 08 Dec 2024 16:59:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKcP-00000005b5X-2Cxn;
	Sun, 08 Dec 2024 16:58:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 467B85C4A2D;
	Sun,  8 Dec 2024 16:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D8EC4CEDD;
	Sun,  8 Dec 2024 16:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677132;
	bh=c0/oRVMKi8RM3KwoeAcA/Gjd8kM3l17avco564yZ2a4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K1TMMbtSwtNRoSSGL5/o42luALup4wGtbz8DdgNYee88KT0cI2Iunz3HRGwvRzXe7
	 8NQOspNB9we09oCA9fNlDyPkbaeIJxbU7vl5SrgE+CEHqD/4IX/B/P8EtzqfAdI8PH
	 UIGIHe3kMff5sZY2QqruBfc1vX2bHGzZRwtVg1EhffH33gXWX5eQT2doWN4lO0Q+Lk
	 jpX8t5DukEZ2JFmyJ7t8pS2tmhuiX9vElu8tUKprlVuTeHr4ObvCRVAVTNE0DHEB3R
	 RC10gEhmmSKZpsh0CkvB8rJnNXYobyoP8vrq3XniSZYw6qM31sBHaAzGQ1qwCmW4mu
	 6RIFzFgBLMmhQ==
From: Vinod Koul <vkoul@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20241122073006.99309-1-amadeus@jmu.edu.cn>
References: <20241122073006.99309-1-amadeus@jmu.edu.cn>
Subject: Re: (subset) [PATCH 1/2] arm64: dts: rockchip: rk3568: add
 reset-names for combphy
Message-Id: <173367712869.1031947.3262464465649332012.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:28:48 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_085853_620575_1558059A 
X-CRM114-Status: UNSURE (   4.39  )
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


On Fri, 22 Nov 2024 15:30:05 +0800, Chukun Pan wrote:
> The reset-names of combphy are missing, add it.
> 
> 

Applied, thanks!

[2/2] phy: rockchip: naneng-combphy: fix phy reset
      commit: fbcbffbac994aca1264e3c14da96ac9bfd90466e

Best regards,
-- 
~Vinod




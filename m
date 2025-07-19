Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD2CC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qXl/txmWEl/CHkCfq4k8N/fK5Ptvhrb+z6hE3Agwig=; b=QsIodCIQlrsDYLMuc/DgX9aKKr
	LOJemYTSlvLijTIZU8+1Rmyy4ocr3Eg0Q8mpOr5tpgzmw5F7rZPfzUEWR7DAXdAvilOsFMRFyBZqj
	nDyZn1Tls/NEMaaS6+xkuyXu9uzI/IFnOYQnT8YJQPT/A6qvEh5X2NOvbidGSKik37QlG2d/18Dxg
	1ohv1bcmVND92+GS0cNWakTI3hsTPgPW64y5hm9tEV9s+0IqH2+uC49J35OxITjVqIgcsTgcTeQC/
	WgDTTeoWOcOF4SCRQHzK4Kt2cxxMD/zVV44VLIYYkhwJ165XQFisjWYEPf3M+E4HkJTPypZ0OeocF
	h8Bqnb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud8cV-0000000ELcF-3SRP;
	Sat, 19 Jul 2025 14:32:59 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud8a1-0000000ELVK-1e8r;
	Sat, 19 Jul 2025 14:30:27 +0000
Received: from localhost.localdomain (unknown [119.122.214.181])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1c936174f;
	Sat, 19 Jul 2025 22:30:13 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: knaerzche@gmail.com
Cc: amadeus@jmu.edu.cn,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	ziyao@disroot.org
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and NanoPi Zero2
Date: Sat, 19 Jul 2025 22:30:08 +0800
Message-Id: <20250719143008.54288-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <104a501d-b9b2-494e-b073-932ddadd7129@gmail.com>
References: <104a501d-b9b2-494e-b073-932ddadd7129@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a982317b60e03a2kunma5e02ceb86108
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTEMaVhhIGRgaSkxDH0keSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VKQ0pZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVU
	tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_073025_597200_F00C6D77 
X-CRM114-Status: UNSURE (   7.49  )
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

Hi,

> The issue I was seeing is that there actually *is* a variant called
> 'RK3528' which at least according to the latest datasheets slightly differs
> from 'RK3528A'. We are doing development based on 'RK3528A' and calling it
> 'rockchip,rk3528' which might make it hard to add the non-A-variant in
> future (unless we call it 'rockchip,the-actual-rk3528').

I think this can be ignored, because rockchip only provides RK3528A chip.
RK3528A should be a revised version of RK3528, which solves some bugs,
so we have never seen the silk screen printed with RK3528.

Thanks,
Chukun

--
2.25.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1461EC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 06:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4Ha1FVFN2uUU+67c9KnfECEJZ9OCvPmJ/d97dfxDMA=; b=nmjykKXAuRSzTwXUQRL9iBJ6rV
	drWvzhfKt1Chehqcq/7AHErbmkKQe/+fiqtpFA2nS76/wwRgq+wM0sSUyrR6t85BmT4DkIKh8juRS
	bhig39nFtDpWtjyfaowyt2bUjF6fsDqqYjkCaWhJuqaE/RjFuapqei2zB8TaIf6SZD8weUhY2XBhp
	nlGy3t8aF5mMGg42pu7ULUZyKx/1yk5s0IZ+HazklOdto+yfbLE2cyHU4wsRj96Kpxb1sMofwwdTm
	TxUHsW4M44M1d6Q7gAPtGxIjx19KDktZ9RTHkUrvmUMc5e8cr+y3Qjq+jGyO4KlAlgpHcHqmBkzS1
	c5NgKSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuDR-0000000HNh3-03Js;
	Thu, 07 Aug 2025 06:35:05 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uju9N-0000000HNOZ-1xQl;
	Thu, 07 Aug 2025 06:30:55 +0000
Received: from amadeus-Vostro-3710.lan (unknown [119.122.212.7])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1e971c1a0;
	Thu, 7 Aug 2025 14:30:44 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: ziyao@disroot.org
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	neil.armstrong@linaro.org,
	shresthprasad7@gmail.com,
	vkoul@kernel.org
Subject: Re: [PATCH v5 5/6] phy: rockchip: naneng-combphy: Add RK3528 support
Date: Thu,  7 Aug 2025 14:30:36 +0800
Message-Id: <20250807063036.480766-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250728102947.38984-7-ziyao@disroot.org>
References: <20250728102947.38984-7-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98833990b803a2kunm2e2160d534958b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZS09DVh0dSRhNTU1NTE9IQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSVVMWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_233053_695435_6455DAB6 
X-CRM114-Status: UNSURE (   4.90  )
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

> Rockchip RK3528 integrates one naneng-combphy that is able to operate in
> PCIe and USB3 mode. The control logic is similar to previous variants of
> naneng-combphy but the register layout is apperantly different from the
> RK3568 one.

Is this a typo? apperantly -> apparently

Thanks,
Chukun

--
2.25.1




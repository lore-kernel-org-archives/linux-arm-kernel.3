Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EF5C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 04:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bKLsiE2/QA5QCqFpB3Od+4JuklbxxahhhoDTq4f0fk=; b=bTcYIuslFiMRFfonXcxBssKUut
	EM2E5CVucHr3KKjMH3doSOLHnAEskbqvYWpuPXHN2u5gEBVGTaDHxWtQ1dxX3dfKX6ZMg5IgbWRrb
	w9rfOWUM5vYXlWBJe+sZ/6JD87GghAlpzcdm+uOJ+hHsRNLBdWlKK8Ii0xbzFhEM5W1K+RknnAKOV
	00dgcO8AKcaLogn4/QLbr5dr+vH2yZl8LFB+hYBhuDw00feAngTYgx3nHEnhAjYW1ggPFkG3Weqpk
	jOb7w1q7E2CX5VbJLn+SEF4/mEfZxPmHhTjzjKi+y7RyhNUyohVppensoCn9/ITkP22/9L40MitUH
	D3wrKrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuay-0000000AZZf-1rKF;
	Wed, 15 Jan 2025 04:01:32 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuZf-0000000AZPr-2RgX;
	Wed, 15 Jan 2025 04:00:14 +0000
Received: from amadeus-Vostro-3710.lan (unknown [119.122.212.126])
	by smtp.qiye.163.com (Hmail) with ESMTP id 8b92a360;
	Wed, 15 Jan 2025 12:00:06 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	heiko@sntech.de,
	kishon@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	p.zabel@pengutronix.de,
	vkoul@kernel.org
Subject: Re: [PATCH v2 1/1] phy: rockchip: naneng-combphy: compatible reset with old DT
Date: Wed, 15 Jan 2025 12:00:03 +0800
Message-Id: <20250115040003.29306-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <df8e0ff8-355b-4c18-9349-0f04ae16e01b@kwiboo.se>
References: <df8e0ff8-355b-4c18-9349-0f04ae16e01b@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGkJKVhgaH08aGR4fS0lDGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSVVKSU1ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVU
	tZBg++
X-HM-Tid: 0a94681e573303a2kunm8b92a360
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PjY6HQw6HzITOU4oED8fDkMd
	ED8KCj1VSlVKTEhNQkpITUtMSElCVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpJVUpJTVlXWQgBWUFITE83Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_200011_846150_3A890522 
X-CRM114-Status: UNSURE (   5.11  )
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
> The commit fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy reset")
> broke backwards compatibly with old DTs and has already been backported
> breaking i.e. PCIe and USB on Rockchip RK356x boards on stable and
> longterm kernels.

The dts changes have been merged into v6.13-rc7,
maybe it can be sent to linux-stable.

Thanks,
Chukun

-- 
2.25.1



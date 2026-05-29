Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25DECD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAjtsdidcTNlLuPfbOM0f0pnQR3T4z8w72nQ0mDwTbU=; b=0laemz11y312mJZZH0+HaVLMWR
	SQVzyeTTnyq9/7bxRoqHlgI/FGolOuRVTKTwO6uo2X/Je7zEr9db7/NxufJMYosAE3E/8NH5AhdD3
	vN1bdIWWI9SUNdOSWC7I9qPHK9MDflDE39bRVchPv7zFe1LX7TkLeRBt5yXQgJBAxCDyzh1n4PyPZ
	Tdugs9yC7hJXxfC2Lj/AKAejmk6KjCeNYyzat7Vgz6sLVkEnPmb4GJ679L0u44RBFE2PIxdFL8yU0
	jlVZeUk/m3UdRaw3MTxIToMbg2/FyPQjqpX1Nk85ypgf0I0Ebznm6enLMHdaOrvZPncmUjBawB1ua
	kktQcOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrCg-00000006qlY-132a;
	Fri, 29 May 2026 07:00:22 +0000
Received: from mail-m12819.netease.com ([103.209.128.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrCd-00000006ql5-1MBn;
	Fri, 29 May 2026 07:00:20 +0000
Received: from localhost.localdomain (unknown [113.80.141.91])
	by smtp.qiye.163.com (Hmail) with ESMTP id 404b9eac1;
	Fri, 29 May 2026 15:00:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: amadeus@jmu.edu.cn,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/5] arm64: dts: rockchip: Enable USB 2.0 ports on Radxa E20C
Date: Fri, 29 May 2026 15:00:08 +0800
Message-Id: <20260529070008.558036-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3879225.zToM8qfIzz@phil>
References: <3879225.zToM8qfIzz@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e728896b903a2kunm7fff2069af89b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGEtCVhpJHx8dQx8ZQh0fTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUJKWVdZFhoPEhUdFFlBWU9LSFVCQklOS1
	VKS0tVSkJLQlkG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_000019_603432_67260B8B 
X-CRM114-Status: UNSURE (   5.36  )
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

> So if anything, that controller should probably have dr_mode=peripheral
> I think?

I forgot to enable CONFIG_USB_DWC3_DUAL_ROLE.
With CONFIG_USB_DWC3_DUAL_ROLE=y, the warning disappeared.
No need to change to peripheral. Sorry for the noise.

Thanks,
Chukun


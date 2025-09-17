Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB74CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXguhlFTPWzEFDkGuGbhfnet5wFn0zSdbLSaV0L44pw=; b=ZGnC/duKkM3hdhr/mYQKKYI0xJ
	GGyLybZZqLpzxFxnsClxzNqGBd1ri0tmrpwZHRKoP5YwyNc6TzGamP3r/PhJVI1uAklcJzbEm3Csp
	wT6M64kff3wJndhDDYWoyVf0i8yXzBTemqQP329wao715ivJc6GHtr+jtoZczgw+mS2fBYE7qnKZb
	e4fLr+XfOC5ZptR92lg/TLhL4myj4FfUj1nDmUo+FKpzzp3yVV+tyQinkCwp4ubDZls0e+swazTCZ
	QG+zBZSi3TqSniUkbTjF5Awjg7z4bkAwZ4BUwadiw5KBWU/O3S4iAU9UEz8TxEcnjCV6zjpeLRw9z
	zL18grCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uym9h-0000000AO6f-3HG5;
	Wed, 17 Sep 2025 07:00:41 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uym9f-0000000AO5V-00UP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:00:40 +0000
Received: from localhost.localdomain (unknown [119.122.213.2])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23172db05;
	Wed, 17 Sep 2025 15:00:27 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: wens@kernel.org
Cc: andre.przywara@arm.com,
	andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	jernej@kernel.org,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	samuel@sholland.org,
	wens@csie.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH net-next v6 2/6] net: stmmac: Add support for Allwinner A523 GMAC200
Date: Wed, 17 Sep 2025 15:00:20 +0800
Message-Id: <20250917070020.728420-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250913101349.3932677-3-wens@kernel.org>
References: <20250913101349.3932677-3-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9956797fa103a2kunm2e50bc1654ced5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS01JVhlLT09IGU1NHh1CHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVJWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_000039_235008_7CE7454E 
X-CRM114-Status: UNSURE (   4.77  )
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

I tested this on Radxa Cubie A5E and there seems to be a small issue:

When VLAN_8021Q is enabled (CONFIG_VLAN_8021Q=y), down the eth1 interface:

~ # ifconfig eth1 down
[   96.695463] dwmac-sun55i 4510000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
[   96.703356] dwmac-sun55i 4510000.ethernet eth1: failed to kill vid 0081/0

Is this a known issue?

Thanks,
Chukun


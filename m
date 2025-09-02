Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B368CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 07:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kn41AuD1tHC9cKxc8T65nTd7ets+m7wbkebswHfdUoQ=; b=dJjyGp3mGqDuIFDvrxy2ynPqNO
	1lgFIzhNeUQPNIkbQmYmnb2VmFgUQm1oTzrYbBlb1GBJ61jq47FEQIOjdcrB6X59O5kot3Ntw5tVg
	H0pf2RpTrTXEjqJwjyKudrWALEez7l6u3+In7UbT+wcF+59CHcylhsgLxgVcruONjsdcBQD/7/Imr
	2Ln/q6Zc1SBhYkmOQ2rvxxjEhi6gMZbumsEQAEhKTpOm3kJ0p0LCdPgz8qlp0BbTzQztCIVzzf48d
	iNYllCY7M8FKaca6LDjERJGcOhdfLwASr2SflteBXzRKho8cZXikSlc2WUn6p9y+NfXSqb2Vo9tVr
	fYh6Lqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utL3C-0000000Feii-1ATB;
	Tue, 02 Sep 2025 07:03:30 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utL0R-0000000Fe50-1OWu;
	Tue, 02 Sep 2025 07:00:40 +0000
Received: from localhost.localdomain (unknown [119.122.212.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2164fd079;
	Tue, 2 Sep 2025 15:00:22 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: xunil@tahomasoft.com
Cc: amadeus@jmu.edu.cn,
	andrew@lunn.ch,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HINLINK H68K
Date: Tue,  2 Sep 2025 15:00:19 +0800
Message-Id: <20250902070019.856305-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250901100639.234ba07b.xunil@tahomasoft.com>
References: <20250901100639.234ba07b.xunil@tahomasoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99093a0aff03a2kunm41dc6c2c7aad6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCH08aVk5CHUwaSEJLHR1CS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSVVCWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_000039_572832_4631EDDD 
X-CRM114-Status: UNSURE (   5.71  )
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

> So what I said earlier regarding rgmii vs rgmii-id DOES NOT hold up
> under more rigorous and careful testing.

So the following question does not exist?

>> Changing this makes a huge difference in the ethernet throughput speed. With
>> rgmii-id mode specified, throughput is about 6.5 Mbs. Changing this to rgmii
>> mode increases throughput to about 960 Mbs.

If the iperf3 test does not reach Gigabit, you can run it in
multiple threads. e.g. `iperf3 -c xxx -P 4`

--
2.25.1




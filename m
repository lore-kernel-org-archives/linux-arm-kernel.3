Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EB9C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzlGOpGQzeCXZtQkQGt/enf4g4Md7xr7WSnEf7vTN7c=; b=z78+zWLRQQyKpPEuZx5lpFcyGH
	Qnu0X8LlDKBnCbeJh2sISZ0srmXKfcoOMqNf421W7g5Au9aZjK8FPfAwRS7dh4OEoZna+yuLM0mAB
	ryZ4lCBpkOTGYnd346zAkXTqOfDS/z9tLgUxr5pjKoEF9shwXWX8Uk7P2EGr1aXgt4M2q6RwNrxTG
	t2Ezefrxc1l2CTAK7RXu5HROp2zT5A+lLWtH8oLX6m0d9jwhLJvsryXnVOCjbrnFsIYui/LKvjzpM
	+8O/kHubGB7q52U/EP2tqkWzTF7fhVx4/Tw/oGYcQP18m0WRbqfLYGi/0aQg0ietwyOl0gBQNxNwu
	Gi0mfZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseT4-0000000AeZx-1X2D;
	Thu, 13 Mar 2025 09:03:06 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseRM-0000000Adhk-3jRk;
	Thu, 13 Mar 2025 09:01:22 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id e266ff78;
	Thu, 13 Mar 2025 17:01:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Thu, 13 Mar 2025 17:01:09 +0800
Message-Id: <20250313090109.1910997-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <60065c0b-4597-4976-b74b-172556c4e156@kwiboo.se>
References: <60065c0b-4597-4976-b74b-172556c4e156@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTElIVktNTkpOTkkfQxhCGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1
	kG
X-HM-Tid: 0a958ebc86e603a2kunme266ff78
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ky46EAw*MjJJNhBKTiwNQw4Q
	TxNPCThVSlVKTE9KQ05NT0xNSUlKVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQUpKTUw3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_020121_119678_971696EC 
X-CRM114-Status: GOOD (  10.31  )
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

> I have not seen any issue with PWM using the merged patch having
> pinctrl-names=default.
>
> Please see my Linux tree [1] and U-Boot tree [2], those are little ahead
> of what has been posted on ML, e.g. it has working USB2.0 host, CPU opp,
> Hantro VPU, GPU + opp, arm and logic pwm regulators for E20C, ROCK 2A/2F
> and Sige1.
>
> Please see my Linux tree [1] and U-Boot tree [2], those are little ahead
> of what has been posted on ML, e.g. it has working USB2.0 host, CPU opp,
> Hantro VPU, GPU + opp, arm and logic pwm regulators for E20C, ROCK 2A/2F
> and Sige1.
> ...
> [1] https://github.com/Kwiboo/linux-rockchip/commits/next-20250311-rk3528/
> [2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528

I tested your kernel device tree on E20C earlier today and still have
the same issue. But if I replace u-boot with the link [2] you provided,
it will work fine. For reference, I was using v2025.01 plus this series
of patches [3]. So it looks like u-boot does something and kernel doesn't?

[3] https://lore.kernel.org/u-boot/20250123224844.3104592-1-jonas@kwiboo.se/

Thanks,
Chukun

--
2.25.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4829BCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZS5yMj+W0uDIkaihV6OdEscGShMOc5I2MaVmQSf9Gc=; b=XYRZvcsdWVroeNLrYNxwCl6Rqm
	bPG0qQVc8sEkj4UufMjUo85mOfaQUh1jLs+7jBxPqKywzTnmvGchzAfAViut2oZDh8KYwkpG8uVrV
	kA/jWvbeKSvRWFb0Uj3MHxBR6TFIQdto629cEppkDDOXXJzqeoAcS9jvmVODbyNI93TFAOQkkh3Fx
	vOuNbhi0e3Xn/XbZLaiDgSEs/T3PAzj2tK9TtVz9FgDvoO8jn3rxAg+t1tqtuvQfKjrZPZSwiQ7qY
	klRIykXQz9uYCF2M0kId3qD8HXDoXC+kme+DJhvB74mIdww/DNVD0CyQsqIkduUufOf13/SYCckL8
	043o8N3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszEh-0000000BTdi-43wk;
	Mon, 01 Sep 2025 07:45:55 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyWc-0000000BOD5-1HAp;
	Mon, 01 Sep 2025 07:00:25 +0000
Received: from amadeus-Vostro-3710.lan (unknown [119.122.212.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 21418c670;
	Mon, 1 Sep 2025 15:00:11 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: xunil@tahomasoft.com
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HINLINK H68K
Date: Mon,  1 Sep 2025 15:00:08 +0800
Message-Id: <20250901070008.68662-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250830171409.592c1f63.xunil@tahomasoft.com>
References: <20250830171409.592c1f63.xunil@tahomasoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99041382c703a2kunm1c90e51f35d11a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSR9DVh1CSB9KHRlNSRhNTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSVVCWVdZFhoPEhUdFFlBWU9LSFVKS0lIQkhCVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_000022_550172_751C216A 
X-CRM114-Status: UNSURE (   7.79  )
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

> Please change phy-mode here to "rgmii". This change will yield an
> ethernet speed throughput change of a factor of 100+. 

> Same as above: Please change phy-mode here to "rgmii". This change
> will yield an ethernet speed throughput change of a factor of 100+. 

This doesn't make sense. When I first submitted it to coolsnowwolf/lede
in 2022, I used "rgmii-id" as the phy-mode, and it worked:
https://github.com/coolsnowwolf/lede/blob/master/target/linux/rockchip/files/arch/arm64/boot/dts/rockchip/rk3568-opc-h68k.dts#L24

Are you experiencing issues with both eth0 and eth1 or just one of them?
Are you using the generic-rk3568 target for U-Boot?

I can't reproduce your problem in my test.

eth0/gmac1 (as lan):
root@OpenWrt:~# iperf3 -c 192.168.1.100
Connecting to host 192.168.1.100, port 5201
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.10 GBytes   942 Mbits/sec   29            sender
[  5]   0.00-10.04  sec  1.10 GBytes   936 Mbits/sec                  receiver

root@OpenWrt:~# iperf3 -c 192.168.1.100 -R
Connecting to host 192.168.1.100, port 5201
Reverse mode, remote host 192.168.1.100 is sending
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.04  sec  1.10 GBytes   939 Mbits/sec    1            sender
[  5]   0.00-10.00  sec  1.10 GBytes   941 Mbits/sec                  receiver

eth1/gmac0 (as wan):
root@OpenWrt:~# iperf3 -c 192.168.0.2 -P 4
Connecting to host 192.168.0.2, port 5201
[ ID] Interval           Transfer     Bitrate         Retr
[SUM]   0.00-10.00  sec  1.10 GBytes   945 Mbits/sec  1191             sender
[SUM]   0.00-10.05  sec  1.09 GBytes   935 Mbits/sec                  receiver

root@OpenWrt:~# iperf3 -c 192.168.0.2 -R
Connecting to host 192.168.0.2, port 5201
Reverse mode, remote host 192.168.0.2 is sending
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.06  sec  1.10 GBytes   939 Mbits/sec    6            sender
[  5]   0.00-10.00  sec  1.10 GBytes   941 Mbits/sec                  receiver

--
2.25.1




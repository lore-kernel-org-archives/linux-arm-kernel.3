Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F66EC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 14:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjX6UTbc8Eyw4QDyGAmmhh1Q6RVEqo6xpmuStGehXEA=; b=cdh/E0a8kxW8zHkzYKbxvc9Wv0
	jO/SmDolPMcyLo6ND1hlcVGNxoHATZQKbd9Uhmdb+Z2bRSVokPrwjHky0rVu6jyieEAq21uRRhoMU
	Uxofe9o0nZPrVzfnq+sHMMrcxD5Lz386Q3Jy6dv4F4VMw/vLdtxLLpapUtV6GbHhDCkt6E+OlVtcS
	GZMVmjqUcACBzv2ec+gSVq6QMKw2T83HEaQgY2vMbKx6mJue2ZjpaXmeOnclvF86RR8BMpIBeWef3
	Ds3A7K3/YRJDVKJvHgGxIWJoILAznOKT/jOKHi0lDcQqYeVhJPtsL2ZqG0AuQH2BEZcPp7yOmto+v
	fiSRPCCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul6ec-00000005fM2-1NoA;
	Sun, 10 Aug 2025 14:04:06 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul6c4-00000005fA8-1ZfR;
	Sun, 10 Aug 2025 14:01:30 +0000
Received: from localhost.localdomain (unknown [119.122.215.209])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ee09b3ec;
	Sun, 10 Aug 2025 22:01:23 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: alsi@bang-olufsen.dk,
	amadeus@jmu.edu.cn,
	andrew@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	netdev@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	robh@kernel.org,
	ziyao@disroot.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add RTL8367RB-VB switch to Radxa E24C
Date: Sun, 10 Aug 2025 22:01:15 +0800
Message-Id: <20250810140115.661635-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <db1f42c3-c8bb-43ef-a605-12bfc8cd0d46@kwiboo.se>
References: <db1f42c3-c8bb-43ef-a605-12bfc8cd0d46@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a989449398503a2kunmca8c4679547084
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSxpJVh0fT0tKSB4dTBlPT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJS0JZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSEJVSktLVU
	pCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_070128_586615_EB4DA23F 
X-CRM114-Status: UNSURE (   7.92  )
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

> I had only tested on a next-20250722 based kernel and on a vendor 6.1
> based kernel. And similar to your findings, on 6.1 based kernel there
> was no issue only on the newer kernel.
>
> I will probably drop the use of "/delete-property/ snps,tso" and include
> a note in commit message about the TSO and RX checksum issue for v2.

After my test, this problem is caused by commit 041cc86 ("net: stmmac: Enable TSO on VLANs")
https://github.com/torvalds/linux/commit/041cc86b3653cbcdf6ab96c2f2ae34f3d0a99b0a

It seems that this commit just exposed the TSO problem (with VLANs).

Thanks,
Chukun

--
2.25.1




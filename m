Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D720AC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfOySMDmpoS5HuphBd1rvokjO0KuWwcs9uYT05oqnpA=; b=jm3vnDjYY/RIsCtQnUnxT293Si
	dnyUKOYdmwnQxVPw5871xcmA7aSIL9E92wJ47FJWQ56kvT9GkBkv9vLRL7dA0UEuTIP3TJ8n6HCT0
	VZKzUkJWDhPk4KeNB+NIxp38HBAx4BCxjK2LDtMYqRn8jDPA5PLewic65W1yxOXOIBTboNX3cKdP5
	85kBRrLS9uWBKRfSdZwJNthqX+jOq2mFn8YHVqFbvARkcy2q4FDc/jVFjXy5yx4sN2xdxMXzwVPMV
	yCa+3rUnCUeA8ujCl3m8oqwlZYO0Z2nS/kiDobU5HICimoa5Ta4euIGOVdV2m4nCBBJfPTxCjAE00
	Op1lmHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6m2-00000001auE-09Ln;
	Wed, 30 Jul 2025 13:23:14 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6jW-00000001ad4-3NHw;
	Wed, 30 Jul 2025 13:20:40 +0000
Received: from localhost.localdomain (unknown [119.122.213.139])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1dc0b97fb;
	Wed, 30 Jul 2025 21:20:29 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: w@1wt.eu
Cc: alchark@gmail.com,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	ziyao@disroot.org
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Wed, 30 Jul 2025 21:20:26 +0800
Message-Id: <20250730132026.214754-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730071145.GA26734@1wt.eu>
References: <20250730071145.GA26734@1wt.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a985b7dd39f03a2kunm09ab435824e847
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQktMVh9IHk9CHxlITEsZTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVKSEJZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_062039_000691_70D4747B 
X-CRM114-Status: GOOD (  12.56  )
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

> My point is that if you disable cpufreq, the CPU is running at 1.2V, which
> is even higher. I don't know why it's running at this voltage, maybe as
> the result of initializing some regulators, but that's what we're getting.
> So the question about safety of running between 1.13-1.15 resolves to
> "it's at least safer than running without cpufreq" in the current state.
>
> And as I mentioned it's clearly linux and not u-boot that is setting 1.2V,
> because under u-boot and during kernel selection and image loading, my
> board is at 0.95V. It's only once the kernel starts to boot that it bumps
> to 1.2V.

If opp-table is not configured, kernel will initialize the pwm-regulator
to maximum microvolts. This can be solved by configuring the pwm-regulator
in U-Boot (waiting for U-Boot to synchronize the DT of kernel 6.16):

```
&vdd_arm {
	regulator-init-microvolt = <953000>;
};

&vdd_logic {
	regulator-init-microvolt = <900000>;
};
```

Thanks,
Chukun

--
2.25.1




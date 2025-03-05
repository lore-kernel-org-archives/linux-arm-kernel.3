Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55DDC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Q3ca9iDSRtjv7k3bnX/1mtQVI9Vba6A7ajJziJN3wc=; b=FkCIEuXHE1RL/DO1hLQMC2o2DV
	Y5nNGO6MZtDOQI1k9y6gKr6LExqa0LUFr68rEUae1g/scoI0pAQNao5euvVDxDePZFRlIe8sj7AuB
	FwgHIqtFlHrA98qIsZAYnIJzVDD9kQzbrqqf+rT1BZwpOGocI26su3dyuhNZmu8q2vjKZv9WWjpS2
	QCsTWScrvex1BzXCZ9xZ/9GBsxu6IHqq4aYZ+OrAVGeEvwjs75xE8iQEqLUxNwGBOYE1Fyrc+1GxR
	lYpKyagHHeCOMXEILCGrMHfj4WfFwM9VxZWcbDaGcumevwiE3mwQHJHz9Buq6OHgy7DD/1Dilkh+A
	u6AGKLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnaL-00000007xiG-3Qgg;
	Wed, 05 Mar 2025 12:10:49 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplcx-00000007c3q-2ZbZ;
	Wed, 05 Mar 2025 10:05:25 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c02:1dd0:9019:911e:6b73:1fea])
	by smtp.qiye.163.com (Hmail) with ESMTP id d05d5703;
	Wed, 5 Mar 2025 18:00:17 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: ziyao@disroot.org
Cc: conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 6/8] clk: rockchip: rk3528: Add SD/SDIO tuning clocks in GRF region
Date: Wed,  5 Mar 2025 18:00:15 +0800
Message-Id: <20250305100015.1353849-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250301104724.36399-1-ziyao@disroot.org>
References: <20250301104724.36399-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQk9OVkhKGk5KHUtDSRoZQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtJQUofH0tBQktKQkFCSkoeQU0ZTEhBSh0eGllXWRYaDx
	IVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1kG
X-HM-Tid: 0a9565bfb64d03a2kunmd05d5703
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBg6Pyo4FTIBFDg2NC4pMhIS
	SxAaCR1VSlVKTE9KSk1DQ0pDTE1KVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0lBSh8fS0FCS0pCQUJKSh5BTRlMSEFKHR4aWVdZCAFZQUxNTzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_020523_816339_AA2F29CD 
X-CRM114-Status: UNSURE (   5.13  )
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

> +	nr_clks = rockchip_clk_find_max_clk_id(rk3528_clk_branches,
> +					       nr_branches) + 1;
> +
> +	vo_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3528-vo-grf");
> +	if (!IS_ERR(vo_grf))
> +		nr_clks = MAX(rockchip_clk_find_max_clk_id(rk3528_vo_clk_branches,
> +							   nr_vo_branches) + 1,

drivers/clk/rockchip/clk-rk3528.c: In function 'clk_rk3528_probe':
drivers/clk/rockchip/clk-rk3528.c:1105:27: error: implicit declaration of function 'MAX'; did you mean 'MUX'?
 1105 |                 nr_clks = MAX(rockchip_clk_find_max_clk_id(rk3528_vo_clk_branches,
      |                           ^~~
      |                           MUX

It seems that missing definition with older kernels.

Thanks,
Chukun

-- 
2.25.1



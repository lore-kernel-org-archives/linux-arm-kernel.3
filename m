Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B6CCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 09:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRzOSQJq6pYhULsOf4dyOJDAzACfekZDem0Wrs0ESrk=; b=lYBBUoMuoo2bccV/2mbuRawES7
	e8Sv/YdvysJpCMayZoqEuoGYjkwjeRy5V379B+dr/kcOacJBubgSSLRwwb87VLRZuLjqCUuEYx7PR
	HcKOqjeBVRNvIWN9j1HD3YcDJE17ys9xetBEfrNyq+wtqOfsM1eQp/pDBzXfn/Bjvn1zIC3Ogyedw
	VlTtcSloG0WSaMTAdMFTSqLNdCcTs8QGXvw6LEQJsLMG0rN7zKRlCp7jlcEuYJi6L/kFPeR7+vDRC
	6X65DiZmP9nFd61PztljSd9qqh8zhBSgNFkdLkQeMe7QSnzPpG+g7zYHBVK34eYpXfkSn35F+zFRm
	SZfJBR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOID-000000025wZ-3Tt3;
	Wed, 07 Oct 2026 09:50:33 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOI9-000000025w6-46OS;
	Wed, 07 Oct 2026 09:50:32 +0000
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50294cf3a;
	Wed, 7 Oct 2026 17:50:26 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: amadeus@jmu.edu.cn
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: enable NPU on Radxa E52C
Date: Wed,  7 Oct 2026 17:50:20 +0800
Message-Id: <20261007095020.820283-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260816100000.3707339-1-amadeus@jmu.edu.cn>
References: <20260816100000.3707339-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa115c57bb403a2kunm498eaa4535d129
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTxoZVksYQkJNTE9LHRodHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktJQk
	1LSlVKS0tVS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_025030_610033_804FC79D 
X-CRM114-Status: UNSURE (   5.29  )
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

> Like the RK3588, the RK3582 has NPUs. Enable the NPU cores and their
> MMUs, and connect the regulators. Remove always-on and boot-on from
> the regulator because it is connected to the NPU power domain.

friendly ping


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E88ACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8wWwJQ6n85vQKF07cQclK7dX0TiA464A4GhASF01+0=; b=YVE9+xXTRESoFIx3+gx9ZJnP+2
	zZY8wnGgHca4GsB9lBIx4UzVDj9fGjyH6vXAcxmCkk97YafDDCED7KLep14G3zG4ElNUtEmpSPcjR
	fOtBx69ND8ffJGShfJz+k0HJAZW3OpcRLIrIjNhbCBJVPIBSskGpidDy7tFMjQLlTSoXyhYMx9+Wv
	VMAXmkYM7BYfPyDWLJIOq8b+V0+owXDXr+V5msh7BV11u5Yr3v5dxsKoqztdf8k3D9pfEEF5XcoPK
	Nv2xpPN4cyzs6eGKPoczItJDU//mqvmT9kS8FOXJrcaKvOBmx/G8cpKBJmO+cp9VXVLJNdF1ktjNR
	qQaB+Diw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8TI-0000000GSz0-0Z73;
	Thu, 18 Sep 2025 06:50:24 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8TE-0000000GSxS-3HVq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:50:22 +0000
Received: from localhost.localdomain (unknown [119.122.213.2])
	by smtp.qiye.163.com (Hmail) with ESMTP id 233a88a56;
	Thu, 18 Sep 2025 14:50:15 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: wens@kernel.org
Cc: amadeus@jmu.edu.cn,
	andre.przywara@arm.com,
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
	samuel@sholland.org
Subject: Re: [PATCH net-next v6 2/6] net: stmmac: Add support for Allwinner A523 GMAC200
Date: Thu, 18 Sep 2025 14:50:06 +0800
Message-Id: <20250918065006.476860-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAGb2v640r+TwB7O+UAB9PehZ2FaXDjhVerK6j_CZ2+caJoJ9zA@mail.gmail.com>
References: <CAGb2v640r+TwB7O+UAB9PehZ2FaXDjhVerK6j_CZ2+caJoJ9zA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a995b96860203a2kunmec52b10073125
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGktDVh4dGEJPThlOThkYTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVJWVdZFhoPEhUdFFlBWU9LSFVKS0lIQkhCVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_235021_050323_3A5A1425 
X-CRM114-Status: UNSURE (   7.11  )
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

> I don't have 802.1q enabled so I didn't see this.
>
> Can you provide the base commit you applied the patches to?

Based on the latest linux-next, 20250917
with these enabled configurations:

CONFIG_IPV6=y
CONFIG_STP=y
CONFIG_GARP=y
CONFIG_MRP=y
CONFIG_BRIDGE=y
CONFIG_VLAN_8021Q=y
CONFIG_STMMAC_ETH=y
CONFIG_STMMAC_PLATFORM=y
CONFIG_DWMAC_SUN8I=y
CONFIG_DWMAC_SUN55I=y
CONFIG_PCS_XPCS=y

[   38.818801] 8021q: adding VLAN 0 to HW filter on device eth1

When the interface is down:
~ # ifconfig eth1 down
[   69.181869] dwmac-sun55i 4510000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
[   69.189827] dwmac-sun55i 4510000.ethernet eth1: failed to kill vid 0081/0

Thanks,
Chukun


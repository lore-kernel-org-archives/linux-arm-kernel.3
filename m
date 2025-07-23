Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FB9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gf3Nt1GpnPDAnuQpMPDjEerkZEvXDqIK4j68ByOlj6k=; b=U7y2U0vSDQKSAlXWwSZzJWnsEb
	4bK5r6+OwgbolpS/0sa0niKETmAFWZJpgkA9lRHiEpvpPV3+9t3UwLJU15N0pqk4qXhZYzEdy0CJO
	iPcPfjPer/fbCO0vi0raaMdg8CbpLB77f9Xmzsxsn9D82JKsfmVgeDvXvgThb6h0jgBxiMSaViCBq
	q9qKHhfZDRlO+TqlzrkxMG6YyIrx3AqkQGvusLE6k4N2PyuWDzQ8rJDQEN7zTojaxFa0JZLefYqaC
	AoHpQcKyt6ktsxYvzHGJYC3/E54d3jd2mCsoB4C2P2zLWryKcOM1AmB9xX8DaZbDoYZdA8OxAk6pi
	TsXjbGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaj4-00000005FEh-32UB;
	Wed, 23 Jul 2025 14:45:46 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZrP-000000056ft-0NU1;
	Wed, 23 Jul 2025 13:50:20 +0000
Received: from localhost.localdomain (unknown [119.122.214.181])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d02843b4;
	Wed, 23 Jul 2025 21:50:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: xunil@tahomasoft.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 2/2 v2a]: New board support,LinkStar-H68k-1432v1 (RK3568)
Date: Wed, 23 Jul 2025 21:50:08 +0800
Message-Id: <20250723135008.1077970-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721201714.233962-1-xunil@tahomasoft.com>
References: <20250721201714.233962-1-xunil@tahomasoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGUwYVhhCHksdTkxKGkweTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VKQ0pZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a98378c927103a2kunm1bf04eacfc331
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OVE6Mzo*NTEYPjIBDT42GjIN
	L0oKCQJVSlVKTE5ISUxDTUpMS0xNVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUpDSllXWQgBWUFKSEJKNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_065019_293589_C6E0C341 
X-CRM114-Status: UNSURE (   5.57  )
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

> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-linkstar-h68k-1432v1.dts
> @@ -0,0 +1,740 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 AmadeusGhost <amadeus@jmu.edu.cn>

Please do not add my copyright.
I don't know if your board is the same as my HINLINK H68K board.

> +        model = "Seeed LinkStar H68K-1432V1 (RK3568) DDR4 Board";
> +        compatible = "seeed,rk3568-linkstar-h68k-1432v1", "rockchip,rk3568";

Seeed is the name of the agent, not the actual manufacturer.
LinkStar is an alias given by HINLINK. Their versions and names
are quite confusing, like 1432V1 here.

--
2.25.1




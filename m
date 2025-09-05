Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F69CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 08:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLXprBz6iQnI31xsjzwP1BEli1UTHMA3TxupZiC7/KU=; b=3Gg8YdsZRtYqsTH1pxwqeaP/yO
	BwoZCf61rPJEy/uiRZ8Gv3dd4eO8ip4zEa0UfSAptKa8hVlTZsss4tr5AEjaA8C6xjUcu0H4o8gf/
	ovvSEWEKBbRfRJue/jP5j1QpdbWspiETZzQ4UBWcnkfgymphsSjeQzAWL2zsJNkzCprGG5YRykr6w
	huNBFL13U3K+Q8isnIm+rwECmMsQ/70dWAGpl2hvQkn3A1m7AKaoPka7Ovp8jrcIgvacpMXuFs0pS
	CdH+UuXufNGm1EtWlF6IxDmXfBym881RrWTs6OfvtQLGHh3VIkg9qCYliHYsZrb6wCcx9t9nbFQun
	zER6S4iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRdR-00000000IVB-3vHE;
	Fri, 05 Sep 2025 08:17:29 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQQj-0000000HRcp-2VZL;
	Fri, 05 Sep 2025 07:00:19 +0000
Received: from localhost.localdomain (unknown [119.122.213.41])
	by smtp.qiye.163.com (Hmail) with ESMTP id 21cc66823;
	Fri, 5 Sep 2025 15:00:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: amadeus@jmu.edu.cn
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	ziyao@disroot.org
Subject: Re: [PATCH v3 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Fri,  5 Sep 2025 15:00:02 +0800
Message-Id: <20250905070002.320775-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250801080025.558935-2-amadeus@jmu.edu.cn>
References: <20250801080025.558935-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9918ace5d103a2kunm6ede5b84233df5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCS05LVk5PGE8fQ09ITUJIT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVPSllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_000017_855260_28FAFC00 
X-CRM114-Status: UNSURE (   6.91  )
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

> By default, the CPUs on RK3528 operates at 1.5GHz. Add CPU frequency and
> voltage mapping to the device tree to enable dynamic scaling via cpufreq.
>
> The OPP values come from downstream kernel[1], using a voltage close to
> the actual frequency. Frequencies below 1.2GHz have been removed due to
> the same voltage.

Are there any issues with this patch?

Thanks,
Chukun


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183DAC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 03:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wo1mKRm8HkVKkBZhtoJnGAKQljZzngI8DYVaXebG5gg=; b=KE0O6aKH5Y2tbGGIZ9S+tY7GuO
	YZzcOa8Lea6HIDFqSmo67hzZn1DxNb56xrv+gPg/sGsD2Bm06wBk7gQTGfiOxKwZdCP4rh612Pbpr
	fGi2Sxn6ACbTJo9nHMqTewwjR1VF83+6ku/HzQz5i6vXyRk1ECJhCJ3BDzBXrA9ZeQAqeS+J2trum
	qCfdq3Y4GVh8AfLRMj2rEMgKwmaIu4lDlFz2w45IAIcKAKHiskneglcNjpnTizAUg3Zbka/J92L/B
	rCPDKBzGGVlUE8bmqMdJ4SbaxQwnHP7AeQ/CLg4hjHim7W87Dg470mX/JY6ymnfst3Of2ekc5hIOl
	Icut9uSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89nI-0000000FrJf-1X0i;
	Fri, 25 Apr 2025 03:32:04 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89lR-0000000Fr8e-07sF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 03:30:10 +0000
Received: from localhost.localdomain (unknown [119.122.214.249])
	by smtp.qiye.163.com (Hmail) with ESMTP id 131231831;
	Fri, 25 Apr 2025 11:30:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@gentoo.org
Cc: andre.przywara@arm.com,
	andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	jernej.skrabec@gmail.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	samuel@sholland.org,
	wens@csie.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
Date: Fri, 25 Apr 2025 11:30:01 +0800
Message-Id: <20250425033001.50236-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
References: <20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH09DVk9JQkxJSU1NSE5IS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VJT0JZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a966afecd6603a2kunm131231831
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OhA6TQw5ITJWTj9KAUwvEEgt
	CAkwCStVSlVKTE9OTk5KQ0tMSkpIVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUlPQllXWQgBWUFKT0xONwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_203009_226708_48ED9AA7 
X-CRM114-Status: UNSURE (   5.30  )
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

> On Radxa A5E board, the EMAC0 connect to an external YT8531C PHY,
> which features a 25MHz crystal, and using PH8 pin as PHY reset.
> 
> Tested on A5E board with schematic V1.20.

Although the schematic says it is YT8531C, the PHY on the V1.20 board
is Maxio MAE0621A. The article of cnx-software also mentioned this:
https://www.cnx-software.com/2025/01/04/radxa-cubie-a5e-allwinner-a527-t527-sbc-with-hdmi-2-0-dual-gbe-wifi-6-bluetooth-5-4/

Thanks,
Chukun

--
2.25.1



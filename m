Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC19FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1URRL+D0IW55GxDynNyuWn3Vy4glMcloxA1EwhRJKk=; b=nnGpw3m93LjXR9dAp3RG3huQpf
	fFlqxm0M6GHCpvn6/i2LyaqGyNdqlJyGftDBaRcT4yUrm9JCvJ5NYNXP3OkRQ8vdd2D7vpmwCJpmT
	8OcS1HsyRG7CpOO8VKi7Hi6HG9eitPUY5JAaHlv4KIoDvXX5LZIcmGbd4/cugJCu6CNjgv3uKw/eL
	WzKPOReLGbtbO3dEaLfqFJEetbFlS/IhfIeLxKlM2H4XHJfcKvWE+rJWsg6Vj680h6A1ip1822ZF0
	hZB+BHnYIAVLrVeSxoYKmU/LaPMe8XLk1QYTLm9HSWECnwPuDmalhGw2PG6Q56Hhb8gMJhSy+5yrB
	3ZrDC4dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKMg-0000000H99U-3aqS;
	Tue, 05 May 2026 18:19:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKMe-0000000H98j-0wQZ;
	Tue, 05 May 2026 18:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=u1URRL+D0IW55GxDynNyuWn3Vy4glMcloxA1EwhRJKk=; b=bwpaPBEYmEDx62hZUYUWPQDLi8
	tMB7vkwQVMm62ZrY/wO0b1XJRTZZZt87h6knJMK5aERnj8JmIFBXWCd9Lcyeknjmjqi9YcN8qYc3y
	XtEm4jLv4QObWULVUrqNQzds4s60zQiIRf5opGW3Cjd646VNB5DbCWeXeGSQWCHbH2hLaJDxvD3g4
	Zcq2Ch4Z4zpybgarvXQjhmJMSzZQYSYhFrODqgqQPGoR7QooqsyjNwx1paLSm4OtsOBW8t+oxZFft
	W55avGO3XYqmNfrgYitVLA5O6n9y61wIfdE9SdXhKDvtbjoMRKnDSvmaDGumCcZdV3NYeuiAPjEjo
	t+8A6Urg==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Gray Huang <gray.huang@wesion.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com
Subject: Re: (subset) [PATCH v2 0/7] arm64: dts: rockchip: Add peripheral support for Khadas Edge 2L
Date: Tue,  5 May 2026 20:19:09 +0200
Message-ID: <177800448365.3286457.203841726866148802.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429063712.2150938-1-gray.huang@wesion.com>
References: <20260429063712.2150938-1-gray.huang@wesion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111924_319884_A2E14200 
X-CRM114-Status: GOOD (  16.97  )
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


On Wed, 29 Apr 2026 14:37:05 +0800, Gray Huang wrote:
> This patch series adds support for several key peripherals to the
> Khadas Edge 2L board, which is based on the Rockchip RK3576 SoC.
> 
> These patches build upon the basic board support that was previously
> applied to the rockchip tree. This series enables essential
> functionalities including power management, RTC, wireless connectivity,
> graphics, display output, and USB support.
> 
> [...]

Applied, thanks!

[2/7] arm64: dts: rockchip: Add HYM8563 RTC for Khadas Edge 2L
      commit: e477eff6303b3c5cb9bdbe5f6568ce1ef74b5f66
[3/7] arm64: dts: rockchip: Add AP6275P wireless support for Khadas Edge 2L
      commit: 76cf96cd9e21aa6c3846d1449aef991a32d3e13b

Some remarks:
- when individual patches from the previous version were already applied,
  please rebase your patch series on top of the relevant branch:
  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/log/?h=for-next
  or just linux-next in general
- I've renamed the rtc node, nodes should always be named generically,
  in this case rtc@51
- as Diederik wrote, please don't do unrelated changes
  I've removed the cpu_l0 / cpu_b0 re-sorting from the wifi patch
- For the cpu nodes, you can do a separate patch with the sorting, and
  also add supplies for the other cores. I.e. while the kernel only "needs"
  the supply from one core for each cluster, each core should have its
  supply declared in the DT.
  - rk3576-evb2-v10.dts does it correctly
  - rk3576-evb1-v10.dts is also mssing the supplies


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


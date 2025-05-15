Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D925C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaorzZ1NhBrQjON3+nty+UxvATBO1FN3Ey2kw1dXSHA=; b=nKGN3umaMDgaz7a3L2WfHHvhtk
	QTo7XCgAfJ4nvddTQNBhzC+4LKvPPllAEbu7tVDHX0z1ow+jgonh1/3sSLvww/o3Odh+vtnJBHz7y
	ZvLi77hu5MNsIA7MEArU9qvrkyyJq0aZnb7mWtjA25YLHlA+ogveKipO0JWhGHm9wcsiK3LzGfER+
	TffyDFHlAQ5O9A898S6U5D/2a6X7aFVKkjtKAu0X4JGbF3hsKzkryD9ElrFh660ikntpfVd9QxcT+
	boACN7fH7IebmYkNHgHScFXnozpKQzyrQ0UNg7OYmDlAnSm6Yq+IbGR1B6Huohfcf/UES1rlvDnta
	DNNyiwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYBX-00000000eoJ-369D;
	Thu, 15 May 2025 12:59:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFY3D-00000000cxm-1yVK;
	Thu, 15 May 2025 12:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QaorzZ1NhBrQjON3+nty+UxvATBO1FN3Ey2kw1dXSHA=; b=QwMHcV9K3OBIS1QzeAX6NAb4vg
	WPH/JpNo0ANxNir+AML2JbRsJV8k69cVa+APK/0gg2iDCyQEzi0w8eqb18VswH+blDAvspTSWPr/G
	fqd1amrwEtNbXqn3t9BPsPPKpa4877g4MfcsIXXzPfY5U/4r/GfLDXz3Q2GPxUBvYAKwYMs+wuTj5
	1/4dXyTZZZswUt9hdt8AMOgsWAlvK2/ALPsPmvT0fr2KzhAhuGPWStGK6ioyXDOVuiycEgTI6yMc5
	yhnj4BkI2CFmHBsBzLeQfPOAu4WjiJY5l+vHw0dTibVHMDD3Lfkdv36+dzUMWFb0kXnUxLVzX7FBf
	ltdmNQMA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFY38-0004ph-0W; Thu, 15 May 2025 14:50:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	nicolas.frattaroli@collabora.com,
	ziyao@disroot.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3576: add missing slab.h include
Date: Thu, 15 May 2025 14:50:42 +0200
Message-ID: <174731343064.2524804.7884388044477445638.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250515082652.2503063-1-heiko@sntech.de>
References: <20250515082652.2503063-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_055103_507346_C6EEB12D 
X-CRM114-Status: UNSURE (   8.92  )
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


On Thu, 15 May 2025 10:26:51 +0200, Heiko Stuebner wrote:
> The change for auxiliary GRFs introduced kzalloc usage into the rk3576 clock
> driver, but missed adding the header for its prototype. Add it now.
> 
> 

Applied, thanks!

[1/2] clk: rockchip: rk3576: add missing slab.h include
      commit: 92da5c3cba23ee4be2c043bb63a551c89c48de18
[2/2] clk: rockchip: rk3528: add slab.h header include
      commit: 276036283716b9135525b195675ea42801bde204

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


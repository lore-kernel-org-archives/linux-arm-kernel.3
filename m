Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23733C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=St1OHBKFenhOMKyOuAwGEmP4LdUW/yuDHIRSEsAWFS8=; b=LhjvZX2jSe6vlaD/Q+jnrGtZ01
	FSBfshRBnpcOrV2yuV9Kme4JjP47vB1wtOcB7fTbtkQEtCBKM1aGACdHzhRmxqs2EJ9whhYtqVoqn
	j77mRM6bDCWnUAbx8BDWhLqFPw4pxEpmn+wDc9kELcb8ctH56NATSDQrU/5/vYkD2W8Ys3aCNwEIS
	8NC4QG4SyX2jGxdewaTyoLqRA503MZ+chSgLHvyGx45QEypApFWjSnPvAqNNfU7FUtaW+O4epTTCz
	EXHSlcNTdKQJK/5vADxjPIRoZJvSmKSICpHx7xcwNfnKBmwG2rJFfrpX9AXQA8de/vVaDQ/4eHdxk
	lUCzzNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMao-00000008dSO-0mCX;
	Wed, 12 Mar 2025 13:57:54 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMPm-00000008c6E-0z3G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 13:46:32 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CDkP6x1509037
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Mar 2025 08:46:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741787185;
	bh=St1OHBKFenhOMKyOuAwGEmP4LdUW/yuDHIRSEsAWFS8=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=mSuNL+tlziSpgsYRGMRiAZ337EviHVssQ6jBwn+up9evY1iXCQFcMhUBoTZVkvW+q
	 KjSb3If1wJbfvaX3vSwXiHQG21r39sy8yEggoUrw+XQhtvHjOFhnXGjaxshtjEyBEO
	 928tO6XhikbpMfXqlvssgvjsThwEWX5NwCM0u3To=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CDkPri117711;
	Wed, 12 Mar 2025 08:46:25 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 08:46:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 08:46:24 -0500
Received: from [10.24.68.192] (dhcp-10-24-68-192.dhcp.ti.com [10.24.68.192])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CDkLqP125702;
	Wed, 12 Mar 2025 08:46:22 -0500
Message-ID: <dec6ccc4-76df-47c3-8622-2c08035eff3e@ti.com>
Date: Wed, 12 Mar 2025 19:16:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [GIT PULL 2/2] arm64: defconfig: Updates for v6.15 for TI K3
 platforms
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm-soc
	<arm@kernel.org>, SoC <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>
References: <5d612c0e-4cd4-469a-9856-dd4552d74412@ti.com>
Content-Language: en-US
In-Reply-To: <5d612c0e-4cd4-469a-9856-dd4552d74412@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_064630_338206_61C8E828 
X-CRM114-Status: UNSURE (   7.34  )
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

The following changes since commit c7691aec5e991cec9c5c5fdab08c24856a1fc56f:

  arm64: defconfig: Enable TISCI Interrupt Router and Aggregator (2025-02-06 09:10:24 +0530)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-config-for-v6.15

for you to fetch changes up to 75a41c26351a77cd5dd01e14d059eaf11358689c:

  arm64: defconfig: Enable SPI NAND flashes (2025-03-07 16:33:25 +0530)

----------------------------------------------------------------
TI K3 defconfig updates for v6.15

- Enable Support for SPI NAND flashes on AM62Ax/J721s2 and other boards
- HSR protocol support for AM65/AM64 ICSSG based multi-port ethernet
- Greybus modules to support CC1352P7 chips on BeaglePlay

----------------------------------------------------------------
Ayush Singh (1):
      arm64: defconfig: Enable gb_beagleplay

Ravi Gunasekaran (1):
      arm64: defconfig: Enable HSR protocol driver

Santhosh Kumar K (1):
      arm64: defconfig: Enable SPI NAND flashes

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)


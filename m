Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA6DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 00:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0s1cuRQDI03ZmYAra8d2S/5PVNufFiIiyT4p8HAjNd4=; b=cAK9fDRYbOeVlYaV/fHKLfY/bQ
	di3K2Tx6j7m3Zp+xDABlkhoJ1OrV+zTyLFVpbuEguLz3nQuUAuKLkffrUEUlipQYTBCMzYrKWmGx8
	JHpX7Hxuj6Vk9Dfj59MTneCH33IFJAyFZyuzIso9NymCw801QlbyPyMBK7hPl1HV7FXzCr9W4Qrio
	eUu5Aj8jhqqDzZ1+FtwudPCUHhW4QrbnCUcRPstz7NategEFWHFEbKKYzrhX0A8oJVu/JpvPpHHG6
	2TSo0K0wXpJMTeyU4jQMUTP7zndUXALCxuzRrORNlXdfiEtkDCwHE2acmFoWPzFJV2OaRk5CB8K4C
	2xFIcj/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTrc1-0000000EEfw-3arb;
	Sat, 04 Jan 2025 00:01:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTraW-0000000EETM-0onT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 00:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4534D5C5C18;
	Fri,  3 Jan 2025 23:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8879EC4CEDE;
	Sat,  4 Jan 2025 00:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735948819;
	bh=Et6JqiybWk9MSa1Zne4js3r2VxnP/jj4oz63xhlzhuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cpn7WtY/kz5+PtH14NJRo86nlCfALN85ERUjlRAFZ/3i60BaBXTQTN8OU6U4NdBhW
	 d9cK0wBQcpqsujZbaqPCzQfZfMWcnsNsiMPkyYnxjS0WbsIkw2UKxLXr3VEqJXr0Lu
	 D4kPrEjWZjSwEF5SKUPfTtG/9ax0vH/M/7oVt/SOaVJn04li22SDJRvW6Ewu3RHVYq
	 gienaPWVNbJCw8W2N3Ztw+6AQN3cyx1cInSi9YB3d165c8C6BB/bpdVWLCJ0WSD+TJ
	 Yw0guNIb3ilpwghDiL5T6RU/MpDbI7iftgd8HMuCg4ZKf20E/mYa9KhYkNxuQf2H5l
	 i1jq7+Wxt8YnQ==
Date: Sat, 4 Jan 2025 01:00:15 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] i2c: imx-lpi2c: add target mode support
Message-ID: <zjgclpreptiv3vtc3bstsuupdrv5rtydzedx2ktgjuzumdtosr@z6xlgawi7lie>
References: <20241230033846.2302500-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230033846.2302500-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_160020_292324_B7D1B1B4 
X-CRM114-Status: GOOD (  12.24  )
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

Hi Carlos,

On Mon, Dec 30, 2024 at 11:38:46AM +0800, Carlos Song wrote:
> LPI2C support master controller and target controller enabled
> simultaneously. Both controllers share the same SDA/SCL lines
> and interrupt source but has a separate control and status
> registers. When target is enabled and an interrupt has been
> triggered, target register status will be checked to determine
> IRQ source. Then enter the corresponding interrupt handler
> function of master or target to handle the interrupt event.
> 
> This patch supports basic target data read/write operations in
> 7-bit target address. LPI2C target mode can be enabled by using
> I2C slave backend. I2C slave backend behaves like a standard I2C
> client. For simple use and test, Linux I2C slave EEPROM backend
> can be used.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi


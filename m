Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3FD606C599
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QVwyRT/g;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPCRA8IK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=E+gFfKSu5wbXjHhUqx4vgvALLaHfN5yAHer232Q3C4o=; b=QVwyRT/gjGZnOilWo27AvrBvJc
	CBy/AEjRZbiQix6sIAA8aXm95t8KAJogp4DHHJ7ndRqwNx4yEc+uzqxRcxVas/QGzqE6SPrglgI5S
	E5oQj5ATD99FHV+8MRDTmQYQ8ULDQRA/uuHMFPacF1fNpOC64P64z0rO78xfWIIQntj0I1BJkfeix
	Wxn8uxrtrPAqy6oetpgLvOBRleq+B9oNqgx8Bnn0M9wR7PmLTxN0k96M8Nj7QOuZYykqoIaKVc5ch
	qExgrLKu8H4KAQUNHtKV3s0USB1/yYwM+p5idZttOeBK7W2/waAsFIwBoAKDgrEhLyb0zVHrwrZCc
	7qm5LApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiao-000000072Qg-3CA8;
	Wed, 04 Nov 2026 21:32:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOian-000000072QO-0a4Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42C8E60601;
	Wed,  4 Nov 2026 21:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557F11F00A15;
	Wed,  4 Nov 2026 21:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827944;
	bh=E+gFfKSu5wbXjHhUqx4vgvALLaHfN5yAHer232Q3C4o=;
	h=From:Subject:Date:To:Cc;
	b=QPCRA8IKezUxADtMCbpAVk4xmiVgCLx0TbQBp6UxHs5d6IAXhQk9C0FzXQt7ghLmT
	 DYZ0aO2JuVN8EVFJ2ed7XvQctehxvbwgjgLkFTE6QVLTBw5+FWZlk4ywtpLgk5ifaP
	 o+KLEwM/BTjfFAxc7x/g7iVHnQKbXSL5SP9TjykHL8mGphCtiQ9o+QidYpRuvWrL+I
	 HgEoC02JkPH/0pV67BbwZwouYxLXAA/+tKrS0DFK53toSi8jg8hgf/BvDS+Oy2gAzB
	 Ziiqmj3SQoVHw0iV1NrQPy8l7d5XyK+mGNH/+VbE4TekHN4RxgfVcfR/ZebxG4gxS+
	 6W8UCJvXD3YFA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 00/16] Update U8500 defconfig
Date: Wed, 04 Nov 2026 22:32:16 +0100
Message-Id: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDMBAF0KsMf+3ANNTY5irShZqJnU2URIsg3
 r3gO8A7UbWYVgQ6UfRn1ZaMQI+GMH2HPCtbRCA4cV5eruP9aEU4apqWnGzmfY3Dpvz2Ik83dqM
 XQUNYiyY77rj/XNcfkrkc/mgAAAA=
X-Change-ID: 20260827-ux500-defconfig-update-960042b7b600
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Refresh the U8500 defconfig against v7.4-rc1 and update scheduling,
memory management, storage, networking, security and peripheral support
in focused patches.

Bring in selected postmarketOS features: initramfs support, zram,
multi-generation LRU, pressure information, additional cgroup controls,
filesystem modules, nftables, virtual networking and compressed firmware.
Build Bluetooth, wireless networking and evdev as modules alongside the
existing peripheral modules. Use audio graph card2 and the TEO idle
governor.

An LLM coding assistant was used to prepare the configuration changes,
write changelogs and run validation.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (16):
      ARM: configs: Refresh U8500 defconfig
      ARM: configs: u8500: Update scheduling and accounting
      ARM: configs: u8500: Enable control groups and namespaces
      ARM: configs: u8500: Update boot and memory configuration
      ARM: configs: u8500: Enable storage support
      ARM: configs: u8500: Enable IP routing and filtering
      ARM: configs: u8500: Build peripheral drivers as modules
      ARM: configs: u8500: Enable I2C mux support
      ARM: configs: u8500: Update media support
      ARM: configs: u8500: Disable unused drivers
      ARM: configs: u8500: Build IIO sensors as modules
      ARM: configs: u8500: Enable security features
      ARM: configs: u8500: Update debug and CoreSight support
      ARM: configs: u8500: Enable audio graph card2
      ARM: configs: u8500: Use the TEO cpuidle governor
      ARM: configs: u8500: Enable compressed firmware loading

 arch/arm/configs/u8500_defconfig | 189 +++++++++++++++++++++++++++++----------
 1 file changed, 141 insertions(+), 48 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260827-ux500-defconfig-update-960042b7b600

Best regards,
--  
Linus Walleij <linusw@kernel.org>



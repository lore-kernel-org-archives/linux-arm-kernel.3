Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123A8CEBF91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7rKaLNkAwCYMMRnugIPYZ8Z/w6cHytL9V9Zh/N934I=; b=HgZWHwGVTHrpMJ/VS/J9YnkQfm
	VKYaSwAfsXutL2Y7APIIKaB18he9axClTz1EBFWHCLDHmw8lFXC6bW2BwXsvtK1q9xVsdBtYjfeOQ
	slHM0AVv42uO2jE4N0OOAj16mU4E81Haqce4o3HMo8qtYtz2tirdDKOiL6I3ZD3U+sojo1KNE8KpE
	RPidhM8NdUwz2wVHa1OhE/GeSrUHXREg0wu2PRP88QlXhCMLedgHAUFcUv7K72PPnSFLl8gkuTD+S
	rizS0GhDpdRY4ZelDiu9Bw+HSjaD8xztr6XFHz6Ytsoi+n0sJfNIZkK1WuLlhTF74X1XiI9abN9SQ
	0heF5ziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyRQ-0000000G460-1IcW;
	Mon, 17 Nov 2025 12:34:44 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyRM-0000000G43X-3APZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=v7rKaLNkAwCYMMRnugIPYZ8Z/w6cHytL9V9Zh/N934I=;
	b=DVpUvla4Dkjdw5LYEl7GMWNKYUvbq4wkWc9x60PSFmrXJYbsIf8M2TnTSWFkGO
	g0KxvvGUt4/2mUjekfxJ1oNJNKahmiByuDA5fQv1jpL+rQjF9swJf2veKymOegEE
	uW5JVOKbpMp3X2A4QDNMkgELI2uSKSNQCMudjtGUDtEYk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnXIhOFhtpoZUoAg--.8347S6;
	Mon, 17 Nov 2025 20:34:27 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig changes for 6.19
Date: Mon, 17 Nov 2025 20:33:51 +0800
Message-ID: <20251117123358.2009662-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123358.2009662-1-shawnguo2@yeah.net>
References: <20251117123358.2009662-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgAnXIhOFhtpoZUoAg--.8347S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxGFyDGw4kAr43GF4Durg_yoWkKwc_GF
	y7W3W8Gr4UArWUG3WYqwn3urWUKa1UJwn5Jr10qr43ZF17tr1Utw1UXFW8Wr1UX3WUAryD
	ZrWUAr1qyr1UKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0dwI3UUUUU==
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhO6IGkbFlN1yQAA3g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043441_143501_22330913 
X-CRM114-Status: UNSURE (   5.40  )
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

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.19

for you to fetch changes up to 910ab02fbbfe1621a13b366b3761b6dd9d499c32:

  arm64: defconfig: enable i.MX AIPSTZ driver (2025-11-16 20:56:27 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.19:

- Enable sound drivers for imx28-amarula-rmm in mxs_defconfig
- Enable i.MX AIPSTZ driver, i.MX95 pinctrl driver, Ethernet and PCIe
  support in arm64 defconfig

----------------------------------------------------------------
Dario Binacchi (1):
      ARM: mxs_defconfig: enable sound drivers for imx28-amarula-rmm

João Paulo Gonçalves (1):
      arm64: defconfig: Enable i.MX95 drivers for pinctrl, Ethernet and PCIe

Laurentiu Mihalcea (1):
      arm64: defconfig: enable i.MX AIPSTZ driver

 arch/arm/configs/mxs_defconfig | 2 ++
 arch/arm64/configs/defconfig   | 5 +++++
 2 files changed, 7 insertions(+)



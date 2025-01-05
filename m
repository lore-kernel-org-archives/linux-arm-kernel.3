Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F41E77198
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 09:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvaoX9cLj1j/PbPbkHelZ5srVkW5zdoaCOit3aZBk9c=; b=3o7kbCp1/8r1usRS/4qSiVL/13
	SBR9msMcK3ytPx3VrcVZGBYF0RXQPjXaIQnAUnozXbAMmEtHitsr4JS3gIIxFRmsmiETLq45JZJI4
	SmJtadGpb5fzJJaOC9jfU5zaME2NGbh07IRKEEpxbPBBoIrxfiJCuM8QhxZjIUWCDCgqrXx0CvG3o
	/SbQOwXpOOtuyGDAhXyixgqT9vGV3wkKcujixFPEGxTECh7LXTf/TC/y38BPVm5L+8IHonuk5aiFw
	ABH6pCauaQtKQ4lFzbeo7CL5kPP34w2PW74UxWlNiyKzM9bWX3+xeC/DiOTQ2xbgV0wpcgzdL0AHO
	6IVdNOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNMU-0000000Gdnq-3wgA;
	Sun, 05 Jan 2025 09:55:58 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNIg-0000000GdOf-20v1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 09:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=AvaoX
	9cLj1j/PbPbkHelZ5srVkW5zdoaCOit3aZBk9c=; b=CvSpIHcIMM/+kmwy5nAMk
	pre3HBNRo6x2XdEde1KmPj9BjQgf1b7GpOzbPkAxruhyrY8Ay8AGFSlVLS8/6hrY
	SM6SgZr26f8eJ7l+ZoGu96t6PNi8Y6UHaGe0qhHaV/Zz31hnrNh8pzbRKfVEZEkx
	CVdUFCYQ0X2Gm3R/wuoVDM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXGWwuVnpnZZRPBg--.62165S3;
	Sun, 05 Jan 2025 17:51:44 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX dt-bindings change for 6.14
Date: Sun,  5 Jan 2025 17:51:35 +0800
Message-Id: <20250105095139.714590-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250105095139.714590-1-shawnguo2@yeah.net>
References: <20250105095139.714590-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgBXGWwuVnpnZZRPBg--.62165S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxXry8Jw4ftr4UArW7CFg_yoWfWwb_Ga
	4xA3WUJrWUZF1UtryDGr1xtr15Jw17JF1UZ3W5Jr47Ar17t3s8JryktrWfXF18XFs8JFsx
	AF4kJw1kXr47AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Tq2tUUUUU==
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhnLZWd6LaNicgAAs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_015202_912703_A4EB11CA 
X-CRM114-Status: UNSURE (   4.46  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.14

for you to fetch changes up to 9723142eae655bcf4d26feb6893acfa03e011587:

  dt-bindings: arm: fsl: Add ABB SoM and carrier (2024-12-09 16:35:30 +0800)

----------------------------------------------------------------
i.MX dt-bindings change for 6.14:

- Add compatibles for i.MX8MP based SoM and carrier from ABB

----------------------------------------------------------------
Heiko Schocher (1):
      dt-bindings: arm: fsl: Add ABB SoM and carrier

 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)



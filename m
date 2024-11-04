Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A248AD132A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIFOGsqEil/CZqwfy0ewPkNvhV31ePBcClT4E1DSKDw=; b=2iyX1se0F7WrX97pdE8REAYZdK
	hzLOZTF3QMtiU+xbsUwhNWnofjOfjPs8syASWewdqxhGwZ6gINh2tFuA8grLRCOCOYkA5SdffQFG4
	WPnv5YuzWXbbqV2ygmLzxmPxKVfOCG4gUDxANzwmis3vKUasyrapU2mC/+6k0QxAxGpd4o8SYp0lv
	KHXvcIoEuc0QP18tWRoDFnS0JsUyQv+FRnIW+muulGVXWZ9Lg2oaIHbqamK31JtREq9malDJtfxxO
	VfstFyya2WybJwp0huUWwhESk5mSlKrYkjg7PKel/krqpIrZtJBGD+X6oj7Me7y65Akxrttm7bXOu
	TYEYKvrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7t4D-0000000D5lD-3dm6;
	Mon, 04 Nov 2024 09:08:09 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sxY-0000000D4kv-2tB6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=aIFOG
	sqEil/CZqwfy0ewPkNvhV31ePBcClT4E1DSKDw=; b=Hy3jQy+VOTyMsA3Hcxfm1
	ORovaENGXHd3E7tV/etgx7o/z1bkCAqDQR6NW9MSJcFqYz8kEoJwWtJAobonHDlQ
	Py3jMR0d3mavafy5/y6LdzbHRwfgteBLrVJa8jOpJmn8kNXOgIbGUHAxvv+ICchU
	inT76/lNDp/LsnFwQixgds=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXD75LjShnSBmkAQ--.16437S7;
	Mon, 04 Nov 2024 17:01:03 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] i.MX defconfig changes for 6.13
Date: Mon,  4 Nov 2024 17:00:55 +0800
Message-Id: <20241104090055.1881860-6-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104090055.1881860-1-shawnguo2@yeah.net>
References: <20241104090055.1881860-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgBXD75LjShnSBmkAQ--.16437S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry5ury8Zr1xJr4DGw43Awb_yoWfKwc_AF
	yxJ3WUGr4UJryDGF1xZ3WxZr4UKw17JFy5Zw1UtrW3uF1ayr1jy34UXrWfZr1DX3WkJrsr
	ArWDJw1DAr17KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8sXo7UUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxGNZWcoYr+P7gAAsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_010117_058522_4DABBBC5 
X-CRM114-Status: UNSURE (   5.09  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.13

for you to fetch changes up to 0fd75ba1750318cd824713d43f2480159c2a54aa:

  ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E (2024-11-04 15:15:57 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.13:

- Enable BD71828 regulator and NXPUART Bluetooth driver support in
  imx_v6_v7_defconfig (needed by Kobo Clara 2E device)

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E

 arch/arm/configs/imx_v6_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)



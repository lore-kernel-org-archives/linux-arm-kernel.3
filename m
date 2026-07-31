Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59DAC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:MIME-Version:From:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OWyILn+Pp++L/PxP5JfzjsB6Yv2M6go0TZoxaEbhatE=; b=1Bq7AK4/2HWZNYHBINidjL2gyh
	/Ae6EWGt3Yz4nrZkfxppyz2AVtdXt2mBnQdHq9etiZPF0AdG3Pv45C0MzzxTxRgJmtrJHpHYVCnwm
	jk8s9nMLv/8ugi+JJqJmmso7P5644JUY97tep5gTBBopI67cLSqzZgzL4mwFxwMey+hFmv9I82+TM
	GtH+iKtnExks8/brfZdrXl7PDsNUvdyf/7sd538d1zZ/e15HgcP5robT0usIFJyi/6oCq1EHzNN2o
	GD1BsCum9F4cZPG5SN++QaS0qqrqfhmq8KR0RoXlDwpOhdl/l8YlUNaRazB7rW0SmasBdsaycB2u8
	rHK72FFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiPE-0000000C2Ur-2V6h;
	Fri, 31 Jul 2026 08:15:48 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiP8-0000000C2Sh-2F7u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 08:15:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OWyILn+Pp++L/PxP5JfzjsB6Yv2M6go0TZoxaEbhatE=;
	b=6NkYvgWiBBt3oOaTaDoB/5YnfR/8KwrUlWxvdEylYHdxKszq2LxGaTuYie88GWrMd1H25YOia
	AZpY4qPjj0fAA5pMdae7ubmFK/ZkSgQ2K9BJlA72Xp/MnKCSjrBwBYfr2C4/U41ZwT2FiygN9xU
	REontTjBql3AnczEnsApklA=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hBJY53wkbzLlXZ;
	Fri, 31 Jul 2026 16:06:01 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id C22854057C;
	Fri, 31 Jul 2026 16:15:29 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 31 Jul 2026 16:15:29 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 31 Jul 2026 16:15:28 +0800
Message-ID: <6A6C59A0.4070501@hisilicon.com>
Date: Fri, 31 Jul 2026 16:15:28 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	<xuwei5@hisilicon.com>, <zhangyi.ac@huawei.com>, "Wuliebao (Joab, Turing
 Solution)" <wuliebao@huawei.com>, "Shenqingchun(DanielShen)"
	<daniel.shen@huawei.com>, <huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	"Zengtao (B)" <prime.zeng@hisilicon.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v7.3
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_011543_066725_8315AA39 
X-CRM114-Status: UNSURE (   5.15  )
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

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-7.3

for you to fetch changes up to 73ff3f98b8ab7630977ab6de2ce672918da8e774:

  arm64: dts: hisilicon: Correct indentation (2026-07-07 17:00:14 +0800)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v7.3

- Correct indentation
- Drop unused clock-names and reset-names to fix warnings

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: hisilicon: hi3798cv200: Drop unused clock-names and reset-names
      arm64: dts: hisilicon: Correct indentation

 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi |  4 ----
 arch/arm64/boot/dts/hisilicon/hip05.dtsi       | 14 +++++++-------
 2 files changed, 7 insertions(+), 11 deletions(-)


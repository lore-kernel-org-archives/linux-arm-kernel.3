Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E91CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 08:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:MIME-Version:From:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OX8DgfWF30QEwxNEMg3rfeDEk29FdACgJkomvM/mw7I=; b=HAyRVznJUiRmKc/PaLr0xGFSsU
	bnNpFMv1m1y19pG/tuEix7QFzsmsjVGxoqXRjymssBhYX4Ql38s7wflLRDSL7Nn46AZ/RoXsQPzSN
	O9VYbVK2jbYsVbDY+s1zDBElERvnauOqnvbsfFjTXGjaCpBFtogw/3ddLhORCuIx9GaExMzwGrvvM
	ATz6J+3dfadOidTvdhMj1A6Z/287Se3FfjOMB6ff/jkLU7Ze7eD6NC/LqJUixnaYeHqMOImy5oki4
	m37HhrMiZRRmlYGGTvIPtg+WCPMXQtbY65T1QDpzOuas4DLTVAI4BRUAale1slBn50/YQI1NG4Rh3
	yoQ1ynJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQ2I-00000000KEq-3MfS;
	Fri, 05 Jun 2026 08:36:14 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQ2F-00000000KEL-3Hde
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 08:36:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OX8DgfWF30QEwxNEMg3rfeDEk29FdACgJkomvM/mw7I=;
	b=1Z6eLHqLo8i5hGoDClzEjbV2FpLGfRzbkqAwmUIwmT9uzD92KtEUxqu2rafEfC1JEUUYhIHh8
	3rXiu6xHpLklj/7fo+h5BA9eDRSeDs22uL+5zL64C9od40r7qt/T42x36QdbU3dhllPwNSNGaRA
	zioyY4c2jA+KjnT7LeeJDAg=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gWvhg1QHjzpSv8;
	Fri,  5 Jun 2026 16:28:19 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 1FC374056D;
	Fri,  5 Jun 2026 16:36:01 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 5 Jun 2026 16:36:00 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 5 Jun 2026 16:36:00 +0800
Message-ID: <6A228A6F.7010502@hisilicon.com>
Date: Fri, 5 Jun 2026 16:35:59 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	<xuwei5@hisilicon.com>, <zhangyi.ac@huawei.com>, "Wuliebao (Joab, Turing
 Solution)" <wuliebao@huawei.com>, "Shenqingchun(DanielShen)"
	<daniel.shen@huawei.com>, <huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	"Zengtao (B)" <prime.zeng@hisilicon.com>, Akash Sukhavasi
	<akash.sukhavasi@gmail.com>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v7.2
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_013612_013465_9859F30A 
X-CRM114-Status: UNSURE (   4.37  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-7.2

for you to fetch changes up to b54fcf7a2df1124a21195afde508369e47067a1f:

  arm64: dts: hisilicon: hi3660-hikey960: move role-switch endpoint into connector (2026-06-04 15:23:27 +0800)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v7.2

- Move role-switch endpoint into connector on hi3660-hikey960

----------------------------------------------------------------
Akash Sukhavasi (1):
      arm64: dts: hisilicon: hi3660-hikey960: move role-switch endpoint into connector

 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)


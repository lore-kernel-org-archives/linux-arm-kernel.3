Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9171061B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 11:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:MIME-Version:From:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fuZB++b9TMG3PcHaNcWo/qvXmPZlIGwLXm1jVsEqRAo=; b=w4odqIwuS8imkg7SFreQzLI4hW
	dvgUSFGtPeJ33+30p9Bt+P7iWnIvwe4gIW1SiAy6oC0zyFiXy34HqQ4VCYF6QLZLzDPB4kR2t43Nn
	dQgK/bnwFRX5C6SlYjobREZ2u9XTxZbDpiMWihDfG52YKRLsyh6jAi/j2xBbWjijJLaEUwiMBJUF5
	uL4G0ljUwlDp5/zbFtu5mr2WLh5oZ+RraR0kzi5ECur3ntW1oPMzYK4837XVLQRirQLLPNILySzkH
	ojc8XbTxN7cgDJ/u5jvIV7VLHx2U+YOM9cDkP+j5Lc1gvgmustjyVmt+4/uQVRl1u/f7Bo8Pl8EoH
	wC7qsQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7X9t-0000000CqoN-2XqC;
	Tue, 31 Mar 2026 11:21:22 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7X9o-0000000CqnI-0ES8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 11:21:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fuZB++b9TMG3PcHaNcWo/qvXmPZlIGwLXm1jVsEqRAo=;
	b=bzN6K8FfxjGKKhW4fQfZ3xq4FpzFCrNkRH8rLJ7oqnQlXgc8qKlSEuyOwaLeuXYfrGCSaKPzM
	dG2bkKJKHLqGYshOwm7+qH05x/Me7R8SVy2dgZbDsWUm7bgTmqaU1d6p/fRPQCMbkHz/IYTqfuG
	IcRvTvfQDgM7BqISF3850LI=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4flQX806Y5z12LDF;
	Tue, 31 Mar 2026 19:15:36 +0800 (CST)
Received: from kwepempk100004.china.huawei.com (unknown [7.202.194.225])
	by mail.maildlp.com (Postfix) with ESMTPS id CF55940576;
	Tue, 31 Mar 2026 19:20:59 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 kwepempk100004.china.huawei.com (7.202.194.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 31 Mar 2026 19:20:59 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 31 Mar 2026 19:20:58 +0800
Message-ID: <69CBAE1A.4050509@hisilicon.com>
Date: Tue, 31 Mar 2026 19:20:58 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	<xuwei5@hisilicon.com>, <zhangyi.ac@huawei.com>, "Wuliebao (Joab, Turing
 Solution)" <wuliebao@huawei.com>, "Shenqingchun(DanielShen)"
	<daniel.shen@huawei.com>, <huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	"Zengtao (B)" <prime.zeng@hisilicon.com>, Jonathan Cameron
	<Jonathan.Cameron@Huawei.com>, Bhargav Joshi <rougueprince47@gmail.com>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, <xuwei5@hisilicon.com>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v7.1
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_042116_663581_3DDD9B74 
X-CRM114-Status: UNSURE (   5.42  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-7.1

for you to fetch changes up to f17d7a0f8ff6f9864d8f82e99c46cee1088e945b:

  arm64: dts: hisilicon: Rename dwmmc nodes to mmc (2026-03-27 06:53:02 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v7.1

- Rename dwmmc nodes to mmc to comply with the schema

----------------------------------------------------------------
Bhargav Joshi (1):
      arm64: dts: hisilicon: Rename dwmmc nodes to mmc

 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)


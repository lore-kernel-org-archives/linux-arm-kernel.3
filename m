Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDA110BA432
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 07:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:MIME-Version:From:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CG3vtCf5Sbk7c4icMmkdOZzkT4cdHrn6RucaZdWVV8Y=; b=Jps+8PENrCQyuJ+DV+tFtyiiGH
	rfWLlscxFSNy+NtoZJXY3O80wkk8ckI2HVNPl2G12HHlqa2oJE+iES0/zqXOMBysnNnOxwj2vwHH8
	I0FaLbtO9EoznxIeRgM6azLf+DEQ0cfGLhFu5aqs8XyDd4Py+uKYRQrveMOz9cFQHCqADQzQlUNpG
	N2lvkv+Qd3fhu+qoN9yPanRLuL1j0hY/91lyVNmGn5MPJD4NTWkpfwmJqiR00Ew8sHHIyd1MVfu/f
	f/n9DoTJYQTqczSOzoQWPrDCAWK3v5WI8Pya+E7VE9myL8cG5dKxZg6Q8bqM6NHnZX8MeCkbYtgj+
	Z/smE8Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61Xu-00000006sea-2CXZ;
	Fri, 27 Mar 2026 07:23:54 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61Xs-00000006sdW-082x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 07:23:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CG3vtCf5Sbk7c4icMmkdOZzkT4cdHrn6RucaZdWVV8Y=;
	b=GGiTR81Zi+gS6MxqzwsQF1PDIk+ukhK8SnbZ51KoVUae0BprhAEAHKBMUI63W5YR1WbJjUK6E
	xFeeL108OxJRMT+euunBpUKRRLc+dSa9lSVQsjC1UKkNxW1NTXk6cEDZeejZq8oA46EcKC4T1R5
	ii2R6ezGGyVjedfhe4PB9jE=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fhsS56zf8z1T4M0;
	Fri, 27 Mar 2026 15:18:13 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id BFE444056A;
	Fri, 27 Mar 2026 15:23:47 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Mar 2026 15:23:47 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Mar 2026 15:23:46 +0800
Message-ID: <69C63082.1000806@hisilicon.com>
Date: Fri, 27 Mar 2026 15:23:46 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	<xuwei5@hisilicon.com>, <zhangyi.ac@huawei.com>, "Wuliebao (Joab, Turing
 Solution)" <wuliebao@huawei.com>, "Shenqingchun(DanielShen)"
	<daniel.shen@huawei.com>, <huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	"Zengtao (B)" <prime.zeng@hisilicon.com>, Jonathan Cameron
	<Jonathan.Cameron@Huawei.com>, <shiju.jose@huawei.com>,
	<salil.mehta@huawei.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [GIT,PULL] arm64: dts: hisilicon: fixes for v7.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_002352_266149_CB6B357D 
X-CRM114-Status: UNSURE (   6.43  )
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

  https://github.com/hisilicon/linux-hisi.git tags/hisi-dts-fixes-for-7.0

for you to fetch changes up to 1af997cad473d505248df6d9577183bb91f69670:

  arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges (2026-03-21 03:38:11 +0000)

----------------------------------------------------------------
HiSilicon dts fixes for v7.0

- Correct the PCIe reset GPIO polarity for hi3798cv200-poplar
- Add the missing dma-ranges for hi3798cv200

----------------------------------------------------------------
Shawn Guo (2):
      arm64: dts: hisilicon: poplar: Correct PCIe reset GPIO polarity
      arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges

 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts | 2 +-
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi       | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)


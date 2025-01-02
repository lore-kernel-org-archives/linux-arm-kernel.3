Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7533BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 11:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:MIME-Version:From:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MuuWstJ4Esx1hbK9in4HoM1qbP3k3NKDOLWFTb/PPuU=; b=NWMmLgoHm1kkIQAilLUDmofB0B
	jYMg9xk86MjRR1B5yO1tDWkPWTlFHAXyL3ZtETMWGgq+YC4VK5QmLinqk894OntGPMPZdi0D+uIab
	VVb4lifoIMfxAT80XNNdu9X3kldzx0knulObWRa7NaQjDTwPoEnS+AyHlcEd4q4Odp4lUwvBltMzV
	gkh3PeQWK0QxiRzog7IYq2S5Ml/0fLMAkyXv6wXKZdEJZ7bBlaamY63/VaKm5DVv2coJ4ZnAHKzzF
	TBQoQaDk2ThPh/EQlvQDKchfO0u8+hEuGuRhp2wit56KB4rSEC5sk6/opO2oSMC6JyQP4diPF0da0
	6igzc1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJlD-0000000AILa-3sic;
	Thu, 02 Jan 2025 11:53:07 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJjx-0000000AHwv-0mi9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 11:51:51 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YP4jV3cQnz2Djrp;
	Thu,  2 Jan 2025 19:48:46 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 53AFE180042;
	Thu,  2 Jan 2025 19:51:40 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 2 Jan
 2025 19:51:39 +0800
Message-ID: <67767DCA.8060902@hisilicon.com>
Date: Thu, 2 Jan 2025 19:51:38 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>, <xuwei5@hisilicon.com>, Rob Herring
	<robh@kernel.org>, <zhangyi.ac@huawei.com>, <daniel.shen@huawei.com>,
	<huangdaode@huawei.com>, <liguozhu@hisilicon.com>, Jonathan Cameron
	<Jonathan.Cameron@Huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<shiju.jose@huawei.com>, <salil.mehta@huawei.com>, <wuliebao@huawei.com>,
	<tangkunshan@huawei.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.14
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd500014.china.huawei.com (7.221.188.63)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_035149_404492_D87457D0 
X-CRM114-Status: UNSURE (   5.44  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-6.14

for you to fetch changes up to 4a45f8c502a8b8a836c3c932a18d538856097ac7:

  arm64: dts: hisilicon: Remove unused and undocumented "enable-dma" and "bus-id" properties (2024-12-17 12:03:08 +0000)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v6.14

- Remove "enable-dma" and "bus-id" properties from the spi node on hi6220

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: hisilicon: Remove unused and undocumented "enable-dma" and "bus-id" properties

 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 2 --
 1 file changed, 2 deletions(-)


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25723D11704
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 06:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:MIME-Version:From:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pwObm2Aet0DPVLrYfxW0N5bX+E9+hZV7f62ZlKejOJs=; b=ZQpoYK4giDMO1zqKjSYPcBQC+Z
	AtZVD2fSc2L7YLnji7laMwZj80Mo4B1VBpWL0j/04G32MaK7pMjo26RYhYw+t/am7/3hmFAIEsUcU
	+eRd6TFROkBv+EIiUc94Bwcpl1xr9ryBQmeaI5DHJjn3w6043yhMXYCrEd/sUn89bCo4hd8XNIEaq
	F06b9doqa17BwoQd5Fy5b6mUH7UfbB5u3o2bLWhrhu8QFu2ZK94DfOWy987xBzrLHPPrHQnUAR9lz
	eXfp5pW0SPsQO6SuSuce6TBnJms7pToqNvSgrnSCe3B0gQ7PXcJrSSN/mSafD/TaeLGARbVuc5JDG
	kLWdKFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4EBP-00000002jRY-0pQm;
	Fri, 25 Oct 2024 06:52:27 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4E9p-00000002jIQ-0Yk5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 06:50:51 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XZYJR66tczdkNC;
	Fri, 25 Oct 2024 14:48:07 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 0EB2518006C;
	Fri, 25 Oct 2024 14:50:39 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 25 Oct
 2024 14:50:38 +0800
Message-ID: <671B3FBD.8050905@hisilicon.com>
Date: Fri, 25 Oct 2024 14:50:37 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>, <xuwei5@hisilicon.com>,
	<zhangyi.ac@huawei.com>, <tangkunshan@huawei.com>, <daniel.shen@huawei.com>,
	<huangdaode@huawei.com>, <liguozhu@hisilicon.com>, "lihuisong (C)"
	<lihuisong@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <salil.mehta@huawei.com>,
	<shiju.jose@huawei.com>
Subject: [GIT,PULL] hisilicon: driver updates for v6.13
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500014.china.huawei.com (7.221.188.63)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_235049_381177_E729F80A 
X-CRM114-Status: UNSURE (   8.30  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-6.13

for you to fetch changes up to e3c289c0916e2a3d7859a0cf851ea242fa23ec1e:

  soc: hisilicon: kunpeng_hccs: Support low power feature for the specified HCCS type (2024-10-14 08:54:51 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v6.13

- Add the sysfs to show all HCCS types used on the platform
- Add the low power feature for HCCS by adjusting the lane number
- Few cleanups and improvements: correct a PCC typo, verify the die, port
information, base address and size, update the lane_mode to max_lane_num

----------------------------------------------------------------
Huisong Li (6):
      soc: hisilicon: kunpeng_hccs: Fix a PCC typo
      soc: hisilicon: kunpeng_hccs: Return failure on having not die or port information
      soc: hisilicon: kunpeng_hccs: Add the check for base address and size of shared memory
      soc: hisilicon: kunpeng_hccs: Fix the 'lane_mode' field name in port info structure to 'max_lane_num'
      soc: hisilicon: kunpeng_hccs: Add used HCCS types sysfs
      soc: hisilicon: kunpeng_hccs: Support low power feature for the specified HCCS type

 .../testing/sysfs-devices-platform-kunpeng_hccs    |  45 ++
 drivers/soc/hisilicon/Kconfig                      |   7 +-
 drivers/soc/hisilicon/kunpeng_hccs.c               | 514 ++++++++++++++++++++-
 drivers/soc/hisilicon/kunpeng_hccs.h               |  33 +-
 4 files changed, 580 insertions(+), 19 deletions(-)


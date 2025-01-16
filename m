Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60340C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 12:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkDxRiSvSObKUlqJf8fSoM+oEcmAf6NnKO78a1hMnmc=; b=lIjRAHGC+NR13WkiGr0uVHVVkc
	8F9VDu16kz1r5bgSQy/hsK7zzrrfhbkbLA2J0qcltpZm1nip+nOSPUJ4fXkxft/w35Y7k/Jk6LTFe
	NckO1tqQ6jjGfmr8OHqKdRturUvdUtEJKrIi6YF1ubp7l+Hl2iHMCnPNX0QppY5yh41dsopRsU1hg
	lEdPqOEv25a8U9T79JjPyThSt0839hLq5OKc33uDlXRm8MQ+oruOz7u4+NZtyNYQ2Zfspvj+FKIkD
	fwi9MFl//km8UoyUf5Xdj/SqK2uU57KNYpXmamaD6WMQXQ7MzVCvoMSwYKYyJ1UIifCStluHB9Ehm
	pHvE6PdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOod-0000000Erd2-0HQF;
	Thu, 16 Jan 2025 12:17:39 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOnL-0000000ErRC-3Nqc;
	Thu, 16 Jan 2025 12:16:21 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YYhcv2l5nz67nqN;
	Thu, 16 Jan 2025 20:14:39 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 97C9D1409EA;
	Thu, 16 Jan 2025 20:16:12 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 16 Jan
 2025 13:16:11 +0100
Date: Thu, 16 Jan 2025 12:16:10 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: kernel test robot <lkp@intel.com>
CC: Yenchia Chen <yenchia.chen@mediatek.com>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <oe-kbuild-all@lists.linux.dev>,
	<yj.chiang@mediatek.com>, <tbergstrom@nvidia.com>, <yujiaoliang@vivo.com>,
	<u.kleine-koenig@baylibre.com>, <treapking@chromium.org>,
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] serial: 8250_mtk: Add ACPI support
Message-ID: <20250116121610.00004052@huawei.com>
In-Reply-To: <202501160328.DUMWkTOc-lkp@intel.com>
References: <20250114033324.3533292-1-yenchia.chen@mediatek.com>
	<202501160328.DUMWkTOc-lkp@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_041619_993048_11995461 
X-CRM114-Status: GOOD (  15.28  )
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

On Thu, 16 Jan 2025 03:45:33 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Yenchia,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on tty/tty-testing]
> [also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.13-rc7 next-20250115]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yenchia-Chen/serial-8250_mtk-Add-ACPI-support/20250114-113715
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
> patch link:    https://lore.kernel.org/r/20250114033324.3533292-1-yenchia.chen%40mediatek.com
> patch subject: [PATCH] serial: 8250_mtk: Add ACPI support
> config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250116/202501160328.DUMWkTOc-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160328.DUMWkTOc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501160328.DUMWkTOc-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/tty/serial/8250/8250_mtk.c:662:36: warning: 'mtk8250_acpi_match' defined but not used [-Wunused-const-variable=]  
>      662 | static const struct acpi_device_id mtk8250_acpi_match[] = {
>          |                                    ^~~~~~~~~~~~~~~~~~
> 
> 
> vim +/mtk8250_acpi_match +662 drivers/tty/serial/8250/8250_mtk.c
> 
>    661	
>  > 662	static const struct acpi_device_id mtk8250_acpi_match[] = {  
>    663		{ "MTKI0511", 0 },
>    664		{},
>    665	};
I'd drop the ACPI_PTR() use and just set it unconditionally.  This table
is tiny so not worth complexity of doing anything else.

>    666	MODULE_DEVICE_TABLE(acpi, mtk8250_acpi_match);
>    667	
> 



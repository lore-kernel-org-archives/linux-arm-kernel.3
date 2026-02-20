Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29761C56204
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlD/PNnYcqmWY7VC/XbBl5Mb7IvYgw6IfOHsy2m/ZS8=; b=y5XSpL/89hicJswSenfdyWiA+g
	k8skEikaSjJa+zQnMTmJIFXdAat+Xf2dbuvyqTgoXmotVnTRsyyzGhIlqUkZCOlIH6ivI5fzrMmT9
	ysMCyjQ65YzJaS2dI9+iS5iPSVAsYw0XryV2YmrtKE39hVmHso5+oxzu3h92yhDfndp1PJH/VuaLO
	tbqLkLvdIWM1QfpjwgK8KnOmwtfTMRyUZnxFkg1vhTojnoL+ze60RbQotf37Sgld07sXdApXnWsVC
	UxoP9F1SHdLUt4nuL5zTVQjGhV6NzIvoggGFPuvsQSYdZTgNwksqwBYsTIuYll7FxRJFoSYWRuFw/
	/dfH12qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRZG-0000000Eq0T-0tWE;
	Fri, 20 Feb 2026 14:33:18 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRZB-0000000EpyQ-22ga
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1771597987; x=1771857187;
	bh=qlD/PNnYcqmWY7VC/XbBl5Mb7IvYgw6IfOHsy2m/ZS8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NIKOiXNxYonLwfO4TAlXq4EB63vyM7/6bACW7FQTM7bkdXmHrz3sQWJqmbCXYc03l
	 vkf4UlJQ87xHUfiigBjjjyuBTqG0wn4IAE70I/Y6HoT7rW59eEMgZMNVOdgJyzYX+w
	 VBSWuYgy2OoAIvuuHcWYeWLFQQeYvTQ9XMGJiYhZrD2A3cVobzY/redLaChLZmcGV3
	 /7g+N3bfKy5mLVkxrSS/uUhYBEDcI3YV/iq2yWVAalvylDSHVDYMn3Tc4ChuCbW5s+
	 hIdtUr6Ya1BJm8KM8hqxUA4euBLiYlyd5S087cNIEPFjHvkU26oJyJc7uFc1Z11oVp
	 +UwP/nH92sP2g==
Date: Fri, 20 Feb 2026 14:33:04 +0000
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, Harry Austen <hpausten@protonmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <monstr@monstr.eu>
From: Harry Austen <hpausten@protonmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: clocking-wizard: add user clock monitor support
Message-ID: <DGJV2ICCB72N.39T6HN62PUHPE@protonmail.com>
In-Reply-To: <202602151704.qepyfVlc-lkp@intel.com>
References: <202602151704.qepyfVlc-lkp@intel.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 5b0edd8755628df423df7963b1dc7428928e5e67
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_063313_684728_6809D460 
X-CRM114-Status: GOOD (  11.06  )
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

On Thu Feb 19, 2026 at 6:52 AM GMT, Dan Carpenter wrote:
> Hi Harry,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Austen/dt-bi=
ndings-clock-xilinx-add-description-of-user-monitor-interrupt/20260215-0215=
54
> base:   ea7282e99ead6d2a294cef40acd2a29ada3ab71d
> patch link:    https://lore.kernel.org/r/20260214180933.42143-3-hpausten%=
40protonmail.com
> patch subject: [PATCH v4 2/2] clk: clocking-wizard: add user clock monito=
r support
> config: microblaze-randconfig-r072-20260215 (https://download.01.org/0day=
-ci/archive/20260215/202602151704.qepyfVlc-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 14.3.0
> smatch version: v0.5.0-8994-gd50c5a4c
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202602151704.qepyfVlc-lkp@intel.com/
>
> smatch warnings:
> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:1183 clk_wzrd_user_mon_work() =
error: dereferencing freed memory 'dump' (line 1182)
>
> vim +/dump +1183 drivers/clk/xilinx/clk-xlnx-clock-wizard.c
>
> 68614f228e6cbe Harry Austen 2026-02-14  1176  static void clk_wzrd_user_m=
on_work(struct work_struct *work)
> 68614f228e6cbe Harry Austen 2026-02-14  1177  {
> 68614f228e6cbe Harry Austen 2026-02-14  1178  =09struct clk_wzrd *clk_wzr=
d =3D container_of(work, struct clk_wzrd, work.work);
> 68614f228e6cbe Harry Austen 2026-02-14  1179  =09u32 *dump =3D vmalloc(WZ=
RD_NUM_DUMP_REGS * sizeof(*dump));
> 68614f228e6cbe Harry Austen 2026-02-14  1180
> 68614f228e6cbe Harry Austen 2026-02-14  1181  =09ioread32_rep(clk_wzrd->b=
ase, dump, WZRD_NUM_DUMP_REGS);
> 68614f228e6cbe Harry Austen 2026-02-14 @1182  =09dev_coredumpv(&clk_wzrd-=
>pdev->dev, dump, WZRD_NUM_DUMP_REGS * sizeof(*dump), GFP_KERNEL);
> 68614f228e6cbe Harry Austen 2026-02-14 @1183  =09iowrite32(dump[WZRD_INTR=
_STATUS / sizeof(*dump)], clk_wzrd->base + WZRD_INTR_STATUS);
>                                                           ^^^^
> dev_coredumpv() can free dump.

Whoops. That makes total sense. Pretty sure this can be easily resolved by =
moving the
dev_coredumpv call after iowrite32. Will do in next patch version.

>
> 68614f228e6cbe Harry Austen 2026-02-14  1184  }
> 68614f228e6cbe Harry Austen 2026-02-14  1185
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks for the report!
Harry



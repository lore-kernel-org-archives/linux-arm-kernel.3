Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4C0E99055
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 08:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JS0s+sMh5+ewy1DfxEghosKaPfurtyPM6ofxGjjJm6o=; b=Dfo5/2TAE6M4M2VCHXcEpGR/wD
	HVTgAEGFutpzsdrQDAMZaO8IVmEiayf1ccSIvrh8QibywO036y5XsykyiVO1USSQKLuk7+j0HT7c7
	hXrft8GAeZoSH8hPGxXUTh1D4gRQCJHKmQDYwasM/kt5KZqN0IzLdKuDEoo0kC1S5vKX7J92qNdzT
	yiH6n7Hlrv8SUBWw0M9bGBe/t/06PRWMCqb1KeYg4YoZmpIZ+fWOpKWnIK4J4v+yEYumvBWLYLj9v
	dbupDtqUq2qF5eva+raIEC3unQdRlHJkEBg3YK/cEh4cAKD02/tgdM/JRv5bp4kpaqKsMmu8b4Tna
	2V8hLOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB77r-0000000BpqM-2KqQ;
	Fri, 10 Apr 2026 08:22:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB77q-0000000BpqB-06p2;
	Fri, 10 Apr 2026 08:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JS0s+sMh5+ewy1DfxEghosKaPfurtyPM6ofxGjjJm6o=; b=BRVbgLX6rfQgIFXXlA+/uefojS
	mFc0uZgBysEm3vFp4exdFimcvbYBrB3QaoTW/mFfAvB7Yw5dVN+CuDd0yj/3kYcbjC/07cMtcHjVK
	gybQdujaUnzaWyEBiN1T3O06+PyDjE0ixDlAojIwb0XZznACD8YcJz4A9ohtoldgGJk5zjAGfCsJq
	CMQgY34pXrDUW9b5arkedmMYnURM2vIVEdP1L/NXCDl94sgnlU5E+zFISsDyL+247Om04PbOIk6X+
	Tn3t7o0addbvO+LmfSzLfF3uMvl2WPW6zcorzSk4FfFK1kfZKGCMqwtzknclAGK7F9Blvm7eNuZVQ
	DLu9Y6Kw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB77m-0000000D4kg-2A5m;
	Fri, 10 Apr 2026 08:22:00 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63A8JcIfA2678929, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775809178; bh=JS0s+sMh5+ewy1DfxEghosKaPfurtyPM6ofxGjjJm6o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=XgEU51QUMR6TsTTKF7a9IJAwy7WTY0F3TSeg8RaxLuuGc0jEAT8BQOEtsut7KQWS0
	 CTzhpI22ofswvzrziqtxepXd1N6+W/R4fUZv+BxkKFaxRgc0eXCztjmygPAd0L5Cfe
	 tkzgfGO2DwHQyk3W0Tmc9+81in6UDRdEHBhuUzzXezZNzvvDo20svbwSNY2/HcuHh3
	 v7MKKcl++XNSYnt5VXfNOakEDQwnY+pEy3l1268wuyBVzAiWcK8TtlVXozZ5sNg8/y
	 TK+lxJUTtFmnTdK5XJVQsKajlYAEccfnd1XbCMp1fw76OhchjOk8vYEo5gS7OjEU8v
	 8xLZR7kyEeV4Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63A8JcIfA2678929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 16:19:38 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 16:19:38 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Apr 2026 16:19:37 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <bmasney@redhat.com>
CC: <afaerber@suse.com>, <conor+dt@kernel.org>, <cy.huang@realtek.com>,
        <cylee12@realtek.com>, <devicetree@vger.kernel.org>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>,
        <jyanchou@realtek.com>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-realtek-soc@lists.infradead.org>, <mturquette@baylibre.com>,
        <p.zabel@pengutronix.de>, <robh@kernel.org>, <sboyd@kernel.org>,
        <stanley_chang@realtek.com>
Subject: Re: [PATCH v6 05/10] clk: realtek: Add support for gate clock
Date: Fri, 10 Apr 2026 16:19:37 +0800
Message-ID: <20260410081937.2859395-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ac_RcGSpVBpt3S7C@redhat.com>
References: <ac_RcGSpVBpt3S7C@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_092159_196180_5F82E320 
X-CRM114-Status: GOOD (  21.60  )
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

Hi Brian,

> Hi Cheng-Yu,
> 
> On Thu, Apr 02, 2026 at 03:39:52PM +0800, Yu-Chun Lin wrote:
> > From: Cheng-Yu Lee <cylee12@realtek.com>
> > 
> > Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
> > disable_unused for standard regmap gate clocks.
>
> disable_unused is not implemented below.
>

Will remove it from commit message.

> > 
> > Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.
> > 
> > Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> > Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > ---
> > Changes in v6:
> > - Add the headers used in c file to follow the "Include What You Use" principle.
> > ---
> >  drivers/clk/realtek/Makefile          |  2 +
> >  drivers/clk/realtek/clk-regmap-gate.c | 69 +++++++++++++++++++++++++++
> >  drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
> >  3 files changed, 136 insertions(+)
> >  create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
> >  create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
> > 
> > diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> > index a89ad77993e9..74375f8127ac 100644
> > --- a/drivers/clk/realtek/Makefile
> > +++ b/drivers/clk/realtek/Makefile
> > @@ -2,5 +2,7 @@
> >  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
> >  
> >  clk-rtk-y += common.o
> > +
> >  clk-rtk-y += clk-pll.o
> > +clk-rtk-y += clk-regmap-gate.o
> >  clk-rtk-y += freq_table.o
> > diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
> > new file mode 100644
> > index 000000000000..8738d6c6f8dd
> > --- /dev/null
> > +++ b/drivers/clk/realtek/clk-regmap-gate.c
> > @@ -0,0 +1,69 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2017 Realtek Semiconductor Corporation
> > + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> > + */
> > +
> > +#include <linux/regmap.h>
> > +#include <linux/bits.h>
> > +#include "clk-regmap-gate.h"
> > +#include <linux/clk-provider.h>
>
> linux/clk-provider.h needs to be included before clk-regmap-gate.h.
>

Ack.

> Also Sashiko reports that linux/export.h should also be included.
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com
> 
> Brian

Ack.

Best Regards,
Yu-Chun.


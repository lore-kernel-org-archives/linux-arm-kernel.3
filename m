Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B66C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 19:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLbyLsf9FX0KbpSXX6bUE1SzNZRH7YkQFATpdZmpDj8=; b=keLr+aPht2sOifCM3Z83/Dfws9
	lLXOjQkkvQeUfPJ8DRS5LAvEEsjufvlh5DUq+Aa0UNPJArfArq6+miU9RigY7N+pnF8tdtgVg9m6m
	rltXBLdt/2125h0Cw3DU6qnwDgE6cecbiilfYKrN4YJ+vccjYDGZZuYN8jsO32lEKYAMFASAbrutf
	RoxzlXXYRNjumnR6nOkbMzMVo35d/uh3oYsKaRu3p1b2rW55KV6NmgKFwyjWLFWXzHge8/bdtBhf7
	OeRMK8VSPxfp5fehwOVSzVG7R/j84R8Zwu2tCg9hivv17ur5PbE7eLSGlQkBDaaSVV73Bral9/kGa
	OzWRQObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rR3-000000000bc-2o9t;
	Fri, 18 Apr 2025 19:31:37 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rO9-0000000Hb1I-3sCi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 19:28:39 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IJSXHU1006059
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 14:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745004513;
	bh=XLbyLsf9FX0KbpSXX6bUE1SzNZRH7YkQFATpdZmpDj8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vfR37JR4ziX3aKK7Sc5kZ1T6B8WdM2lLYwnxsKwAa5pL5DqJHZB6e+eIjVHK6Qwi+
	 S7TA2pFd8Mh8y/4lGTNhRkq3zjss80sN5fllVkP4uY/0T0g5gvOiVejcfYBaNHTXYd
	 csS0gWpo20a6BNwV3hDWCXodTacMi8V3YBLnuC9E=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IJSX27001929
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 14:28:33 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 14:28:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 14:28:32 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IJSWcR017086;
	Fri, 18 Apr 2025 14:28:32 -0500
Date: Fri, 18 Apr 2025 14:28:32 -0500
From: Bryan Brattlof <bb@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] soc: ti: k3-socinfo: Add JTAG ID for AM62LX
Message-ID: <20250418192832.tw22jacridxoaw2q@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250417084904.2869369-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250417084904.2869369-1-vigneshr@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_122838_054430_B62D7B45 
X-CRM114-Status: UNSURE (   8.46  )
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

On April 17, 2025 thus sayeth Vignesh Raghavendra:
> Add JTAG ID information for AM62Lx SoC so as to enable SoC detection in
> kernel.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/soc/ti/k3-socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan



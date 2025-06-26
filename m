Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966C2C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0ZNVMkUtmtDeX1WqjBnG1Spg/z8nwse68E2o5e9q/E=; b=FHKwGJ1boC9k5aWPDBiHOTaLyz
	z9T7jyXzNUTp+HH/1ps4G8OiQHwkKDxuBPXdOrbcyXqUrR6Bke7363jFMnIS7iMrD/zdwhUUDPVyR
	Yjj3UdSURNZZAo0JJRvIGKc6uCF+4ca2JMzw4GcOShWbdbo/KdV/B1h7QxmxqVKH12KGQi2iQgKbF
	95a/foaPawIP9acFzIXBx5FibqgCXuLQtVLTa5rOeeNfFGAPBKP0A6weOCynABhL+Wxt6jUaapwJw
	WKuLbAW8Tk+AEEh4FKHJz0aztTq6rJjDUp9AizCyHD1zkwm5j+cG3+SeCJt1wBVNQtkB7Tpv8dVVm
	HOkcZYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnW4-0000000BuZN-17Oj;
	Thu, 26 Jun 2025 14:23:52 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnJM-0000000Brze-21df
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 14:10:45 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9B38F40E015E;
	Thu, 26 Jun 2025 14:10:42 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TbYHqpyYlbtU; Thu, 26 Jun 2025 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750947039; bh=x0ZNVMkUtmtDeX1WqjBnG1Spg/z8nwse68E2o5e9q/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d3APXVmdrPkfYakMMvxi889t5BDcMTLZP6N9jd58++heM0JmucpBXmB9jaY/SjWj8
	 oODAPZUoKcTNrT3FF8yYK6PTBGZnXewasgSkxUlvgYZa38ps3vehWg/Q3WNKcJ4B0b
	 frz1CAgXPV1G24iRqjjf5TvK7sCC20pAteNx5ptg14W5Ev3ElIJt+bhXzQY2aNJ94S
	 5yJwUYnwUfrwTzcMFY+4/F7G2PWzDCbTcngooJAzZK5hCwF+Fx8PxWUd59nhbodHcf
	 Q6MuXwQDdtAB1uvY2oDBm9XKp0n568Yvib64DiuAjB507tmIxlQ/AjK1ol8+/zrSqf
	 WzFA/mnSgOVrU6IspdlTWYsI+EEkWsSQ0y4mjg6pez21gr5EuGSXMGYWsSvfKvvw/8
	 gEydbC1zWKxcTiuP+azOvJzHksoAKTWE6M4mhSjf529txokI5+s1YcaIcfa1Wd/CEw
	 iNU6VGJKodd7u824zhDQwBT51d36X2W0hTl5xMTQy9FHt04lq0YPNkXdE/z62vdwNB
	 /0t0S1vlw8pyFp3AOuXoR0hL0I+jCpJiBJkB9bXm5yKzVMQNLQ7RdBIX/81SGTCl3V
	 ToGtzTK34exEfP3pe+WLrsV+sRpIi84rIe+KR8klgjdeN0OgEsvpMcx2cH6jAXd3lm
	 YJKCsPBRZ5bqSCikUcmjw3f8=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 10F1240E00DE;
	Thu, 26 Jun 2025 14:10:29 +0000 (UTC)
Date: Thu, 26 Jun 2025 16:10:23 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH] EDAC/synopsys: Clear the ecc counters at init
Message-ID: <20250626141023.GBaF1UzwF9ITE8-LBQ@fat_crate.local>
References: <20250528065650.27646-1-shubhrajyoti.datta@amd.com>
 <20250603090536.GCaD664IbJB5IoR06g@fat_crate.local>
 <SA1PR12MB894764756C6538EE985BDE24816CA@SA1PR12MB8947.namprd12.prod.outlook.com>
 <20250604093735.GAaEAT39KGW1KJDrjD@fat_crate.local>
 <SA1PR12MB89471067967E0A5F46CEE1DF8175A@SA1PR12MB8947.namprd12.prod.outlook.com>
 <20250611164018.GAaEmxctC+ESUCvBNT@fat_crate.local>
 <SA1PR12MB894766DFAD90E9DB15A3268F8174A@SA1PR12MB8947.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SA1PR12MB894766DFAD90E9DB15A3268F8174A@SA1PR12MB8947.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_071044_673817_D2A56CBF 
X-CRM114-Status: GOOD (  11.86  )
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

On Thu, Jun 12, 2025 at 11:42:13AM +0000, Datta, Shubhrajyoti wrote:
> Please find the diff below

Good first try, however...

> -/**
> - * zynqmp_get_ecc_state - Return the controller ECC enable/disable status.
> - * @base:      DDR memory controller base address.
> - *
> - * Get the ECC enable/disable status for the controller.
> - *
> - * Return: a ECC status boolean i.e true/false - enabled/disabled.
> - */
> -static bool zynqmp_get_ecc_state(void __iomem *base)
> +static bool get_ecc_state(struct synps_edac_priv *priv)

This function's signature should be:

static bool get_ecc_state(void __iomem *base, bool is_zynq)

or so.

Or you'd have to invent a proper way to figure out what hardware the driver is
running on. Definitely not:

	if (!priv->p_data->quirks)

I have no clue how the device tree stuff makes the strings you pass in
synps_edac_match available again but there should be a proper way to check the
hw you're running on - not some arbitrary random case where zynq hw doesn't
have quirks because once someone adds quirks, your scheme is down the drain.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


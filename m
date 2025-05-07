Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DDEC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjPNmdnxXBiIPY12FlXpuGsba5Ly/JzhgqEh19IK/qs=; b=264VSSLmQrk1lsfdqfmK0fluzX
	xAoFErc8S2yFHb0fEFzqPbsQO3BVg0+OIcrXIIME+juRjpsdzKejDJOmj7cRt44zE3zUDkxy3Mygw
	YxdT8EbiT7ucMXMivlazNN0L29QwPWodhmjpnIVy8QeeqmORfxM+yaBdqmFM8fhDrGYgGikgHgXV/
	J38jhkQRpsJX8449So09mqekcNH9B36wQo62YQhM5C1zr8ex9uhmV9P4TCAx31QmerLCMvtyxXres
	TGmGQKrL/JnWWjsMwNTrRJaHz57Sx6TT95bXwDDSzBx1VkR3NQifDQKHH7k/cDwB0maZpCqI94G0Z
	2A0Z4kJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfKr-0000000FgKY-2ANL;
	Wed, 07 May 2025 14:01:21 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfCI-0000000FdhE-1l6q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:52:31 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 547DqEwB828907
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 08:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746625934;
	bh=qjPNmdnxXBiIPY12FlXpuGsba5Ly/JzhgqEh19IK/qs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aLlV+rCS4UXbBRkkQGHsgQTtC8TBe08x9WPBgrBV7dGGYurJQ79bZtmlgY4nZDPn5
	 rQyhSYA5xFwtBFO+XheQdWIysa51siZ0+ItsG1uwoUtyNB5Fk8UHDZUXH8k/sQv192
	 AOmfc8HVi50LfduXmpxtKNcHQoeXVhUiI/pzg/xA=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 547DqEno009511
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 08:52:14 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 08:52:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 08:52:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 547DqDpr032312;
	Wed, 7 May 2025 08:52:13 -0500
Date: Wed, 7 May 2025 08:52:13 -0500
From: Nishanth Menon <nm@ti.com>
To: Guillaume La Roque <glaroque@baylibre.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Davis <afd@ti.com>, <vishalm@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
Message-ID: <20250507135213.g6li6ufp3cosxoys@stinging>
References: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
 <20250505123615.yqzdv7dlel7kyojf@degrease>
 <fa33b7d6-8e28-40bc-9219-41dab643e88f@baylibre.com>
 <b1949ec7-a0b3-4c4c-a439-93afced7bb0c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1949ec7-a0b3-4c4c-a439-93afced7bb0c@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_065230_569136_C6C20107 
X-CRM114-Status: GOOD (  12.88  )
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

On 15:28-20250507, Guillaume La Roque wrote:
> Hi Nishanth,
> 
> if i remove MAILBOX it's  enabled by some  non TI drivers and/or ARCH_XXX
> which have it in deps so all TI drivers are still enabled properly but not
> sure it's safe.
> and PM_GENERIC_DOMAINS look OK to remove it.
> 
> if i try a defconfig based on android defconfig (more simple than default
> defconfig) with only ARCH_K3 enabled i need to set CONFIG_MAILBOX flag to
> still have same TI drivers enabled.
> let me know what you want to do.


Let us drop both from the select statement - from our K3 perspective
there is no longer a need for them to be built-in. Thank you for working
through this.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


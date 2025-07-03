Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6E5C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkjKWy8yhoZ987+3foqsduRcrWwEcugIYUWq0+gy8nE=; b=g6fg4HugKFXqgnp1yzArDYiP3u
	rzL1O1lxdhi1MF/5m4K+f8bI3+mKeZosXZJWFw67MqNG//evLFBcnLQci2XlcmgMGvVG991Mcy0Ya
	Qbt5iteshII78kxfg6LHa8NOtOkueSXZOIJjQnvvsUJDd0uc7J773EcBjVVmps784YdSiIAQczqnH
	yZyQD2chPge0JAJbEjOIR3xlMq1ac5zVgVqqLr31c3tBYHSdZW7twY06uDkxSxkHRWsa7t9V1XS94
	QQqlMWwpjryp4sDNkRVELReZlIGpqLcaR3M0RV/u7MZW+JPvRVY++s/yzU+1wDjesF4qfP9N+qFDd
	7Vgg4Tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKqC-0000000BeIQ-11w7;
	Thu, 03 Jul 2025 14:23:08 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJ3B-0000000BKee-2XSd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 12:28:27 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 563CSDqS3538125;
	Thu, 3 Jul 2025 07:28:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751545693;
	bh=QkjKWy8yhoZ987+3foqsduRcrWwEcugIYUWq0+gy8nE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xSESKE3NFLWEFLG+QvGZeMTwqbPd/t/LVxDEh+a2/IbU0FGTHUk0YFVjJRqxXetSj
	 tIv//kknACE2fQ1ITzU7SCSypIJMIxDU9F5KFlvyTxuByPBDdp8fIVOy/Fm0Wl1KmZ
	 VOA5N9v678rCXKZngrEqBCBc6DeuKdR2dyHLRR3w=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 563CSD7n725387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 07:28:13 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 07:28:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 07:28:12 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 563CSDWQ1103740;
	Thu, 3 Jul 2025 07:28:13 -0500
Date: Thu, 3 Jul 2025 07:28:13 -0500
From: Nishanth Menon <nm@ti.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
CC: Guillaume La Roque <glaroque@baylibre.com>, Andrew Davis <afd@ti.com>,
        <vishalm@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux@ew.tq-group.com>
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
Message-ID: <20250703122813.jh2muwzwe4ok6b6d@process>
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
 <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
 <e0773f0e-8d2f-4918-aaad-aab6345fdb81@baylibre.com>
 <9042d63de85f7ae8bf73760e9d2d7652c18a738c.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9042d63de85f7ae8bf73760e9d2d7652c18a738c.camel@ew.tq-group.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_052825_731529_9EACA45D 
X-CRM114-Status: GOOD (  28.66  )
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

On 09:25-20250702, Matthias Schiffer wrote:
> On Tue, 2025-07-01 at 20:57 +0200, Guillaume La Roque wrote:
> > 
> > Le 01/07/2025 à 16:36, Matthias Schiffer a écrit :
> > > On Mon, 2025-05-19 at 10:20 +0200, Guillaume La Roque wrote:
> > > > 
> > > > After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
> > > > select on ARCH_K3 are not needed anymore.
> > > > Select MAILBOX by default is not needed anymore[3],
> > > > PM_GENERIC_DOMAIN if PM was enabled by default so not needed.
> > > 
> > > Hi,
> > 
> > Hi,
> > 
> > > 
> > > what selects PM_GENERIC_DOMAIN in your configuration? linux-next fails to boot
> > > on our AM62x-based TQMa62xx if I don't (partially) revert this patch - I have
> > > not found a way to enable PM_GENERIC_DOMAIN and TI_SCI_PM_DOMAINS without
> > > enabling other unneeded features to pull it in.
> > > 
> > With master branch if i apply this patch and i do make ARCH=arm64 
> > defconfig and check in .config  both TI_SCI_PM_DOMAINS and 
> > PM_GENERIC_DOMAINS are enabled.
> > with linux-next it's same. i don't really understand link with  PM part 
> > in this patch and boot issue on your SOM.
> > 
> > I probably misunderstand something.
> > 
> > 
> > what is your problem exactly ?
> > 
> > if you can share log or link to jobs
> 
> 
> Hi Guillaume,
> 
> with arm64_defconfig, this problem doesn't occur, as other CONFIG_ARCH_* symbols
> also have "select PM_GENERIC_DOMAINS" (with or without "if PM").
> 
> We are using a smaller config specific to our K3-based SOMs however. I have
> attached a defconfig that shows the problem - if you use this as the base for
> .config on linux-next, there is no way to enable TI_SCI_PM_DOMAINS, as nothing
> selects PM_GENERIC_DOMAINS.
> 
> So unless I'm missing some other configuration that would actually be useful on
> the K3 platform and that would pull in PM_GENERIC_DOMAINS, I think that part
> needs to be reverted. I can send a patch to that effect later.

Is a better approach to select PM_GENERIC_DOMAINS in
drivers/pmdomain/ti/Kconfig instead of depends (similar to what
drivers/pmdomain/qcom/Kconfig or drivers/pmdomain/arm/Kconfig does since
TI_SCI_PM_DOMAINS requires PM_GENERIC_DOMAINS?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


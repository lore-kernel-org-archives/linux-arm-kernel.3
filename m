Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037DACE7A97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCqKYK/L/8HcM7cbCCb2uNeFw5NxUYZAmqnxj57e+x0=; b=tbLR/3GetqDGJnJpxCHR1NWm3P
	U2m3pPf6tV9rpCCcbvNwGriaa5IqTx7TujX4Jb8rboW3jmDvw0zsyNQJdoVLR+b3UsnbcM1dC98qD
	pHwjiawkWJscWoCPikghUXePOci+CxONfaqkrWOggXPsQUpniGWDAfFxpSKssHHqfKwC7mqnLZ1pf
	8yoDey03Tl1YSBKoYMdIITExSwJhv4bfXkRU0btNBFVptdYjerZy26EVCTlG/5RGMVgI1mH/d5dtT
	hEIhKOlmxn9muOvL+jycZzOmr4Jxs1uCPnDA+ZwF0ZgxoRK4SP+pDmUfMR3R452lkZypFCdHr1PaQ
	5D30sN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpsz-0000000BsGZ-49jF;
	Fri, 14 Nov 2025 09:14:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpsw-0000000BsFY-00l8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SCqKYK/L/8HcM7cbCCb2uNeFw5NxUYZAmqnxj57e+x0=; b=T4F3hy1aiMfG8qyUVKMQ5pPkIB
	/BexcHWfabJK9JTVS+0/8W0NH8d0RErdwa/pOcCVtepl0LfGRIGOjcyJuOFkZZV2AOSNjkqjmQa3P
	ejAhN6dWG+a5kSfCFo1A/JaThcuF3KrUZ1PknHg2TDUPpSLD9n1zXIhUV03WTl3KvVk7NhSJ2kGoj
	vYjeJHbZpWxPg5MLw0W7dmNe4A3lHPCYG20SXypAAbq1Et5ZK5GmKjNvapHfun3qrf+0U21Rf83Ps
	+mIWdfKCdaG8iCnswh4cgL9Gwaljii4M11+X18s4PPJbFqitsIdtCm91hKQjRNUtEcYJHarJV637G
	puy7fTOw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33016)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJpst-000000006dH-3dt6;
	Fri, 14 Nov 2025 09:14:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJpss-000000005jc-3LYd;
	Fri, 14 Nov 2025 09:14:22 +0000
Date: Fri, 14 Nov 2025 09:14:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clkdev: increase MAX_DEV_ID to 64
Message-ID: <aRby7gFkanx3vs_3@shell.armlinux.org.uk>
References: <20251114090934.1471533-1-alexander.stein@ew.tq-group.com>
 <20251114090934.1471533-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114090934.1471533-2-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_011426_038370_CF0F954C 
X-CRM114-Status: GOOD (  10.96  )
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

On Fri, Nov 14, 2025 at 10:09:33AM +0100, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 
> On the TI AM335x, there are clock IDs like
> "48000000.interconnect:segment@200000:target-module@0:mpu@0", which is
> 58 characters long.

This looks like a device that is using DT. Clocks for such devices
should be described in DT, not using clkdev. When using DT, there
is no need to register clocks into clkdev - this is used for cases
where its not possible to describe such relationships (e.g. non-DT
systems.)

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


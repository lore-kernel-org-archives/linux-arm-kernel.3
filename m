Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E61EE6B46
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2U7tzrVZTCL+XAHpoaT0TWx+yFIL9ac4hJe4PMMNu8=; b=AI1tEZO9/Wd2Ohvox8zVbXr/Jd
	xrsLurLcuFNeHDHC0TaFltbe/4WbM5qW64kARkcSjx+4Cgc3hCxyq5XUJCUXx8a++6SE6ym7kEE6v
	pG7teoTaPhIR5B7MgCwLjlQn4PQtQ5KWroAT25/t2ld5tmEfdmUSDZYqpXjKS0A3Xv5/PvOtrjnqI
	wpQwtVSnflRkhd4zeqGkK+8oIoKHFbcPwwylGlLrd3D5yL0DsdUNMZ6EP07Z0KtT2MwByBShQZ2D8
	znqJHq5ygEzaeVWxpNk452yhklPpTL2OP2DPkBuWQBJBeTwAwcfV7eVyjamQvTWGuPBDrykEe0nsJ
	A3wWF3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQgZ-0000000BhBB-1BU6;
	Fri, 06 Feb 2026 18:36:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQgW-0000000BhAg-0kWI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:36:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA525339;
	Fri,  6 Feb 2026 10:35:54 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E124E3F632;
	Fri,  6 Feb 2026 10:35:57 -0800 (PST)
Date: Fri, 6 Feb 2026 18:35:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	broonie@kernel.org, oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, scott@os.amperecomputing.com,
	joey.gouly@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com,
	shuah@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Subject: Re: [PATCH v12 0/7] support FEAT_LSUI
Message-ID: <aYY0h1DtvDpEyekd@arm.com>
References: <20260121190622.2218669-1-yeoreum.yun@arm.com>
 <aYWuqTqM5MvudI5V@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYWuqTqM5MvudI5V@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_103604_264196_B38E2DD8 
X-CRM114-Status: UNSURE (   6.78  )
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

On Fri, Feb 06, 2026 at 09:04:41AM +0000, Yeoreum Yun wrote:
> Gentle ping in case of forgotten.

Not forgotten but lower priority given that the merging window is about
to open this Sunday. The LSUI series is now aimed at the next cycle.

-- 
Catalin


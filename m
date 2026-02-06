Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886A3EE6B49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jD/dT8djpHkQKxuhhW0wmHj9yIs4evCfjmco2cWza84=; b=gnXA6g+JAOaDZiF1VVdM8XZeG0
	Ot4QHlzqXKjPJ8M+qetStACrt4vz1D7TcFyhxeCg/17PX6ghSkPoYdZU6ZeuISbqjG5eaw+FdXeZ8
	e+zx0+n0xX8DRRIYsLDOoJ3+08HHHe6Atb2lJORqDyzRiqfN04UEtaUXEbTPMhvDPSrmd6/vSaSP+
	/+tEpd2DlEu0PBvIo6kIUtvNNmGI3ChkeAtmh+ybFLs1pRMBM+Vcy+m+ofozjL+6ddLL+Tm6PnsJr
	c2KdRcTTZWRa19WpR/Y4CXcuU/5QujcGHu+VuX2WratSEWWxmKI6vs/41mlPvlDe1wfA5yWTUdqla
	+Egio6tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQhV-0000000BhHH-2bk1;
	Fri, 06 Feb 2026 18:37:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQhS-0000000BhGQ-1DaR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:37:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B738E339;
	Fri,  6 Feb 2026 10:36:54 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 763D53F632;
	Fri,  6 Feb 2026 10:36:58 -0800 (PST)
Date: Fri, 6 Feb 2026 18:36:52 +0000
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
Subject: Re: [PATCH v12 1/7] arm64: Kconfig: add support for LSUI
Message-ID: <aYY0xOdUxn39ZPZh@arm.com>
References: <20260121190622.2218669-1-yeoreum.yun@arm.com>
 <20260121190622.2218669-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121190622.2218669-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_103702_368386_EEB9C6F0 
X-CRM114-Status: UNSURE (   8.81  )
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

On Wed, Jan 21, 2026 at 07:06:16PM +0000, Yeoreum Yun wrote:
> Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> previleged level to access to access user memory without clearing
> PSTATE.PAN bit.
> 
> Add Kconfig option entry for FEAT_LSUI.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

In general we should move the Kconfig addition last for bisectability,
unless all the other patches introduced are ok on their own.

-- 
Catalin


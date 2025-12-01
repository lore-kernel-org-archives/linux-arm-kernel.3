Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17B1D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 15:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEAao4/Uq62vodeaG36pvApUk8O0OB2XIyx7R4Zgbqs=; b=C8wOzLGJc6PDbuiY+OjU5jNT2u
	wnR0muHow+Z4zvQr4P5W/qv1F7RsbOfgC8rLSyK25G/y+ypPxp/RIfdpJ9SZd8ETSfbk1Fea1yOKa
	EzLmZqO0LePKdd7oj7gv1euROMclFCz2fBJ32cc2yBu/nrKWyNF6gO8+sIpQfE05u6v/ThK5rGZgz
	pkw0/LBKyFLqi1077H+rBOxX0gcaK1jC6Qpp0tNNtKVdYtGtVx79CU2o10HlVxUKrMlM/RV2NCyD9
	hiKJwUbE4f2uxHU4Swvpp0iNT0dTNZOIjf8HiFeOulvctu3FH+mU4Ow6/dNeK7QgL/r0XPAaL8ipg
	YgoXDOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5lE-00000004AvC-0L9w;
	Mon, 01 Dec 2025 15:24:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5lB-00000004AuG-1b5O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 15:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qEAao4/Uq62vodeaG36pvApUk8O0OB2XIyx7R4Zgbqs=; b=dppgcujpnIdMOfwgj9licWeZXf
	BgWFbFj6O4GhFXbJR1Lx3yeFH5gsi4xyit8O5cDrJmUqlRnYYhdWDRX4zPQc2i8ktUuZYr9VonOQO
	mX6in5t726hSWpw8Xx4yOERQQSUhY9iaDjjUFP32RQd/6qccUOF1CkqnnJmV2ASW4gy3zr1Q7V2Xa
	hm8du8uSneBRyK5jvG+ek5NT5VGNNOhNzlt5o+u1Y1vASPzz10UNPLyENmZwgydQTksxVxFaJSV8t
	kgS8Cs5/l/TPIPmpnXYaSbT3/RKyi3unMdfkILAW6GYYIY+7mQMTZrfeMzyw4ozEW1xg9DmC5RZUo
	0RiFTddg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42702)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vQ5l4-000000000lU-072J;
	Mon, 01 Dec 2025 15:24:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vQ5kz-000000006ZN-0z1e;
	Mon, 01 Dec 2025 15:24:05 +0000
Date: Mon, 1 Dec 2025 15:24:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com, ldv@strace.io, charlie@rivosinc.com,
	deller@gmx.de, macro@orcam.me.uk, akpm@linux-foundation.org,
	mark.rutland@arm.com, rostedt@goodmis.org, tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] syscall.h: Remove unused SYSCALL_MAX_ARGS
Message-ID: <aS2zFVPAzMNQnfTF@shell.armlinux.org.uk>
References: <20251201120633.1193122-1-ruanjinjie@huawei.com>
 <20251201120633.1193122-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201120633.1193122-2-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_072417_421913_F363BA39 
X-CRM114-Status: UNSURE (   8.60  )
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

On Mon, Dec 01, 2025 at 08:06:32PM +0800, Jinjie Ruan wrote:
> The "SYSCALL_MAX_ARGS" appears to have been unused since
> commit 32d92586629a ("syscalls: Remove start and number from
> syscall_set_arguments() args"), so remove it.
> 
> Fixes: 32d92586629a ("syscalls: Remove start and number from syscall_set_arguments() args")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


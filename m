Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ED0CD8CBD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6t2p8YbLBHcslktU0UoaLjCR0MumsgT3xwVUYNWTUxA=; b=ZNBhfXDkHitbNH9ifEWu37jbzb
	iaBQ+6rs2KbhD62X7IGXShf9+Ep+arqZ2E2J2SK0e/QTjZACPPaIrmZGf/FfxnYIgKggwQ5ARlxau
	gfWimyPQtdFUnUddrSB34U1lFjBWIgP3V9gKTPB38vIA1aPla2Sy4CcvKV7+AgEy4YAmaAn+ZvnxQ
	vH4t/+SmNZDabM9zNvmNqA63lBBDzhdzXBCCm9YRsVnNYBNj8icq9wPY+wM7q2Yx+PedJCEsqxH8k
	9OgY12P2zK5VK8KtCxB+TExWxs8SRqKka+ydTORKtiOL2wMj/uHeabbXlw5QG60AwmZC1YlBFyngs
	ohvyOaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcAd-0000000AwQP-1CTg;
	Thu, 13 Nov 2025 18:35:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcAa-0000000AwPy-0tmK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6t2p8YbLBHcslktU0UoaLjCR0MumsgT3xwVUYNWTUxA=; b=y8WfZTN6cL6otaUWpXfGU52xBx
	ma4BsYIpHqG6zDl+oXONdln+e99CHmTERVcpqyn3iIEYioR8FkoIKAaMY1CT9q6rgsTLddIYKMRni
	7O/qqMj/ytuAIlcj3b9DZyM7f/+UR5nJOXcIsnHOP6xXCbv1YXQp0W6HCC4QHThfkYEX4W7YXune+
	Vc+chLKOhjfatyvpx/w+qblGKqgBAQfByQUX/ia4vgFq9rIoLn9CWTgIw5B/WgWLoA2s8+r7Nh3xI
	9QqjjavTiaObmkqvttkC0m0AzAmeqRp864xfUT2dwnG9SAa01+ozlylkbq83PYr+lckC+oht+alM/
	ENxiyWXQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43958)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJcAC-000000005rZ-0epR;
	Thu, 13 Nov 2025 18:35:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJcA5-0000000054u-2qcp;
	Thu, 13 Nov 2025 18:35:13 +0000
Date: Thu, 13 Nov 2025 18:35:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com,
	christian.bruel@foss.st.com, krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com, shradha.t@samsung.com,
	thippeswamy.havalige@amd.com, inochiama@gmail.com,
	fan.ni@samsung.com, cassel@kernel.org, kishon@kernel.org,
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v5 4/4] PCI: keystone: Add support to build as a loadable
 module
Message-ID: <aRYk4Xj1SNEFYW-J@shell.armlinux.org.uk>
References: <20251029080547.1253757-5-s-vadapalli@ti.com>
 <20251113181355.GA2293401@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113181355.GA2293401@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_103544_251152_80FDD414 
X-CRM114-Status: GOOD (  11.63  )
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

On Thu, Nov 13, 2025 at 12:13:55PM -0600, Bjorn Helgaas wrote:
> >  config PCI_KEYSTONE_HOST
> > -	bool "TI Keystone PCIe controller (host mode)"
> > +	tristate "TI Keystone PCIe controller (host mode)"
> >  	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
> >  	depends on PCI_MSI
> >  	select PCIE_DW_HOST
> > -	select PCI_KEYSTONE
> > +	select PCI_KEYSTONE if ARM
> > +	select PCI_KEYSTONE_TRISTATE if !ARM
> 
> This is kind of a lot of dancing to make keystone built-in on ARM32
> because hook_fault_code() is __init, while making it modular
> everywhere else.
> 
> Is hook_fault_code() __init for some intrinsic reason?  All the
> existing callers are __init, so that's one reason.  But could it be
> made non-__init?

Yes. To discourage use in modules, because there is *no* way to safely
remove a hook.

While one can call hook_fault_code() with a NULL handler, that doesn't
mean that another CPU isn't executing in that function. If that code
gets unmapped while another CPU is executing it (because of a module
being unmapped) then we'll get another fault.

Trying to throw locks at this doesn't help - not without holding locks
over the execution of the called function, which *will* be extremely
detrimental on all fault handling, and probably introduce deadlocks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


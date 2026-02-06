Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28392EE20A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 13:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VYDcNsu3l2vYO7esn8OofQyBRc5bqWat8FlNo6FkqQ=; b=a7Ne9V4ziSg/6p7klYK25P8Fvy
	sVkPxjh3RFewVVSG4o1OvLnH3l0M6d4pbhgxFAwbJ6TUaX281hCDeKKTpYwx2m/nrVMdfjquQtxKs
	VciJrLcc3qyq59Tb96WIUIg8YAnvN1O70WqoV3vGaAnver8b5JnzsCPuUNVSuI0IznQoVAbwaXTEe
	yFfs6KD8kqFAb/nSlV1Wv7kWm4Pd04la/wNnlt98tWIBF+IpRwz+XuQJaxa4HrKw/0DTDDC+tGqw6
	hkELr5cZNnZt61iKiP6rAl9iERq0ywI2Ko2Pcab+sbCqUZ3tg7KidEGvs64YLWA+R1znLZMcQykTu
	lnNk4FPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLu5-0000000BMiM-2JJc;
	Fri, 06 Feb 2026 13:29:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLtz-0000000BMgb-0FV7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 13:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3VYDcNsu3l2vYO7esn8OofQyBRc5bqWat8FlNo6FkqQ=; b=MDkhhR0Hs4tAi8OLzPWnjgDWMK
	j88AUMTi3Hd6Ql5Zo9dIAg4ZSvFFRSLqb0USZpzQZUkeiKDz5jWW73RNClYdhUMmMW6xlgcTBgIJJ
	xlvsRBvjKhvwMNyeIbjICl90oBUx5SsHgYowILvfez0sPrQ5uycOVJwdHXE/EXWYpI6kSOAB/ZRiw
	1mxfk0RgKUjwvwK8OnreCZ4NKs+ODy3pcDp/nPhcm+1jDTSL5PliGtH0BpHbdys31PZQvRDJRRrBS
	hNdqDJJ5USOqyKAxdUo/alJCMbfNWH+ZpM6uYsvACdmPnoNuNyvhhDH/q3v/xGnRLy7DU/QumFkM5
	rDf41kdw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50064)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1voLtt-00000000882-0uKm;
	Fri, 06 Feb 2026 13:29:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1voLtr-000000007O8-3yEW;
	Fri, 06 Feb 2026 13:29:31 +0000
Date: Fri, 6 Feb 2026 13:29:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] ARM: Implement ARCH_HAS_CC_CAN_LINK
Message-ID: <aYXsu7pSZaSum1vh@shell.armlinux.org.uk>
References: <20260206-cc-can-link-arm-v2-1-290cbf369fb6@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260206-cc-can-link-arm-v2-1-290cbf369fb6@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_052939_096118_2C7144F7 
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

On Fri, Feb 06, 2026 at 02:02:38PM +0100, Thomas Weiﬂschuh wrote:
> The generic CC_CAN_LINK detection does not handle different byte orders.
> This may lead to userprogs which are not actually runnable on the target
> kernel.
> 
> Use architecture-specific logic supporting byte orders instead.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Damn, I've recently merged your v1 patch. Can you send a follow-up
patch to my patch system please?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361D2EE20A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnKJ/MewCM9UWI1cdbNzOQBZpB+bbW/UDi8u+JAhSaU=; b=mMAF6O7EV3O/r1FVGA4xqZLywM
	EFDL3tWPH5lFHISmsoT94pes9/gUR9xmESHScIKqSWQLv3AsYW28fITouAQ4pxoOz079fOcnBlRK6
	A/2Y1/qEQA0foat7nQA/OpH0Oyi1sweNK2z6XAYE5tErtnK+S3Erc4326efo3Uhivw/Q5RQT/PsMW
	oyesi1LY5s1QkkUqAjJX2dqUt3AMWKCmB3sy4mlM95kIa6ZlQvbttnIHB5YhYnIaJhNKCHaMj5jjJ
	wjDcxNZlZaHPTjSaSibEtw0h4VriGCsbmw2PUbb5jlD0RY2vO/NMsa4gQjWrXP88gVmDPxHesUEjU
	40MoUlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMG0-0000000BOZh-1QUh;
	Fri, 06 Feb 2026 13:52:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMFw-0000000BOZA-21xX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 13:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DnKJ/MewCM9UWI1cdbNzOQBZpB+bbW/UDi8u+JAhSaU=; b=yJZwfPGLCHKMdCrLh1FpUESbzb
	2f4Aw8MlarVHruBx1+o7pQYjyDDI+B+jCzJlKSOH/nGi3OqJTkHBfbUn+j+9A59qP+HmNvn+iS7AP
	jtH5ww/qH2prtQpvxctQpxvmcysErpiblEInXJKEZn3gA+DF4h/nhXEBM4LuSuD3P+uswyau5EigF
	4OdkUd4fglXbYDUduYylj2fnYn/odoXDV1sYViG+McM7UCVpgYxuybggW1L1cDGbX0GLKTFPmx5Jr
	WsKFpTY5h621fykAbRLUQwz/GuPvIowE5C71HiMJjao4CMBzibhK6yXBqo8P88ZtWA5Q35hFCc3uP
	HvLGHuuA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45046)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1voMFu-0000000089R-12yX;
	Fri, 06 Feb 2026 13:52:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1voMFt-000000007PA-02Oe;
	Fri, 06 Feb 2026 13:52:17 +0000
Date: Fri, 6 Feb 2026 13:52:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] ARM: Implement ARCH_HAS_CC_CAN_LINK
Message-ID: <aYXyEIwnYdmcl7Lr@shell.armlinux.org.uk>
References: <20260206-cc-can-link-arm-v2-1-290cbf369fb6@linutronix.de>
 <aYXsu7pSZaSum1vh@shell.armlinux.org.uk>
 <20260206143150-e32f59b4-eaf7-4c2c-ba14-5cd03906bb18@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260206143150-e32f59b4-eaf7-4c2c-ba14-5cd03906bb18@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_055220_925332_D14A2B20 
X-CRM114-Status: GOOD (  12.37  )
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

On Fri, Feb 06, 2026 at 02:32:42PM +0100, Thomas Weiﬂschuh wrote:
> On Fri, Feb 06, 2026 at 01:29:31PM +0000, Russell King (Oracle) wrote:
> > On Fri, Feb 06, 2026 at 02:02:38PM +0100, Thomas Weiﬂschuh wrote:
> > > The generic CC_CAN_LINK detection does not handle different byte orders.
> > > This may lead to userprogs which are not actually runnable on the target
> > > kernel.
> > > 
> > > Use architecture-specific logic supporting byte orders instead.
> > > 
> > > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > 
> > Damn, I've recently merged your v1 patch. Can you send a follow-up
> > patch to my patch system please?
> 
> Oh, sorry. That was a fast application.
> 
> Do you want an incremental patch on top or the full v2?

Incremental please.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


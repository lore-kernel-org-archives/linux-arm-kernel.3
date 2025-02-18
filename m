Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A7BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VZaPhGDFIj0K374e69EsB2q90XVhzBFLGncOIer42w=; b=DM1iHbeRyu8xSUMCHQqGMjlcy0
	EC8sg2oPG0Ei38IeRJrfTXwo/HWjww7NGc5/TmkbNj5hf2y25VISGvZNFTGeQejFJcUwGz2xUIPY+
	dZLfuRjq1EhFwEJjWZxponvyBHAc6inFyAf7NJcMnFrJoIDxWiMf9N17luVJ5f4IxYOeahp1uoSmW
	kxwpPJ5TXIthmqMPxeqAZH3fdzykvL4r3zHCsmaGZ/VCDwQbItluEdbN62RGKsgUkmj0DkbP3KgoI
	Bje9kELxbFWsa8bM+j5hkCXQvmAxTsfb8lNuh0dHQTD68n+Av+GLNkZleFjbSqjU8inltxwLLMOyr
	jXKGkWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKyA-00000007nDE-0HHx;
	Tue, 18 Feb 2025 10:36:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKpU-00000007kaN-0BWL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5VZaPhGDFIj0K374e69EsB2q90XVhzBFLGncOIer42w=; b=04WhkOQErXn7MDlifr5TYzuxT2
	ZHCfetxWFMJFQs61BXpjOXzQYuLkt9Bkoghq3Yy2zk3VSwHMMqvy4T7Q3Rmj//6Y7mBZafjAOeWWX
	QWmIqbWBvC9e8OjhOmRv4ep9SLhtdvHvr3tFr6LEPJH0DHdYSwG7mnpDzMm4xIfhjAiJAE5HV4Z0i
	A4yFvA+bNUvMFdr4X47XMHINBocmR3fmesfgedbBzLxdknOW83ZaVkXgHR1HcrwbyhLFi1BLlhlJQ
	f7u8NIJ+Sb5K4m0qPOJxARLF+6/5sxhM9bvkAno2cCLndP73rCaEtpNoZuNA5Swn3vXEkn+LUwwFy
	WZcSrKyg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44206)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tkKpS-0001Xr-1J;
	Tue, 18 Feb 2025 10:27:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tkKpR-0007BK-0z;
	Tue, 18 Feb 2025 10:27:49 +0000
Date: Tue, 18 Feb 2025 10:27:49 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: mm: Don't use %pK through printk
Message-ID: <Z7RgpaLeIPMQ7kgp@shell.armlinux.org.uk>
References: <20250217-restricted-pointers-arm-v1-1-aaa0fb22e18c@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217-restricted-pointers-arm-v1-1-aaa0fb22e18c@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_022752_080868_EF97F851 
X-CRM114-Status: UNSURE (   9.73  )
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

On Mon, Feb 17, 2025 at 08:38:37AM +0100, Thomas Weißschuh wrote:
> Restricted pointers ("%pK") are not meant to be used through printk().
> It can unintentionally expose security sensitive, raw pointer values.
> 
> Use regular pointer formatting instead.

... which means that the warning is pointless because no one can debug
it when someone reports that this has fired.

While I get the security issue, changing this is severely harmful to
fixing problems should this warning fire.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


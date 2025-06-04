Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246ADC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHzBxjsH020GxBtBRNdihpHGR375f1xb06ZuyU5mJTo=; b=GwNHA/HSOA/yP8wOIgRKljTRcV
	kogc6fjBU74rQrdp8PT8bxvvlpY3Yjh1qqpcLQ5I8Qb7vTT+im7USDunQMBX2HgDwRZzwLLhZzK4q
	Iyimqgd9aszcR4Z4yU6HsS3oMQOOem/h8K/Kg9tQZxTuMOaR6SvcBzN16mNh7iqn0BvE8i/YoLjJe
	PkE8PUIoJzjbnM85NxCkRa2xLi4nWngsw+u1deOjqEMSCqRVQB3lGe/YqxoDxwGZDVJeHlohACMPk
	NxQJH+gfzc+0MHyGVoyDyx9drKCQq3T/ZXOpYUWWAFf+5gEJo79VeCxzC4GCS6Q4634MdjvwY5CbG
	7qMPczeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjjx-0000000CviG-3a3F;
	Wed, 04 Jun 2025 08:44:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjFZ-0000000CrFk-40SN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 08:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WHzBxjsH020GxBtBRNdihpHGR375f1xb06ZuyU5mJTo=; b=NH7HcVWWDTwypRgVjtyHW316n1
	SFMPuslv/eMdHYEckdjcuxLq15RYtwo7YmXwDWY+Hm9ArxMvEYnQQuXUN5MDEFqiKto3m2bBf85he
	9qPSZ+VXi0dWdAY5ueq9kVaTUD+67bxUXJaGuTMPtrn1BaExp/MaQBAEeXuAAH0255lqtkaMPD1qu
	oUe0F+mq5sTSu9I8H1QPzWB9o5kB64kCPrVABb57xebPh6c+LpnQmKrOgumGQ/cnFCJEVZJo0ZuJz
	Hp4hVmzcTcTIytZV6zvWK64IR4sNG7tUtdBX78dOM5hzv48YeTvlNbjpAKaBZX6ONz+J5S7J1NgCG
	r3pyT2xQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55740)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uMjDU-0006y3-1m;
	Wed, 04 Jun 2025 09:11:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uMjDS-000127-23;
	Wed, 04 Jun 2025 09:11:18 +0100
Date: Wed, 4 Jun 2025 09:11:18 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: John Ogness <john.ogness@linutronix.de>
Cc: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>,
	'Michael Kelley' <mhklinux@outlook.com>,
	"pmladek@suse.com" <pmladek@suse.com>,
	'Ryo Takakura' <ryotkkr98@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: Problem with nbcon console and amba-pl011 serial port
Message-ID: <aD__pjZ_o7QMbXhC@shell.armlinux.org.uk>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
 <84sekh5cki.fsf@jogness.linutronix.de>
 <TY4PR01MB13777DAC71E234B9E58CC6C0DD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <84wm9sne7w.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84wm9sne7w.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_011329_993423_771D32AC 
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

On Wed, Jun 04, 2025 at 09:50:03AM +0206, John Ogness wrote:
> You are correct. I wasn't aware that the clock framework had a usage
> counter to allow recursive calls. Sorry for the noise.

It's documented:

/**
 * clk_disable - inform the system when the clock source is no longer required.
 * @clk: clock source
 *
 * Inform the system that a clock source is no longer required by
 * a driver and may be shut down.
 *
 * May be called from atomic contexts.
 *
 * Implementation detail: if the clock source is shared between
 * multiple drivers, clk_enable() calls must be balanced by the
 * same number of clk_disable() calls for the clock source to be
 * disabled.
 */

similarly for clk_unprepare(). It has to be this way if you think about
the fact that clock sources are not unique to clock consumers, otherwise
the first clock consumer to disable a clock will disrupt other
consumers of that same clock.

It's been that way since I created the clk API, which predates CCF.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


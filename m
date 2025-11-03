Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC98CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfoQUh36QE7h8qt3hF9rnB1Y0l49JXwFNS9QZ6PhD74=; b=LlZDiqUX//B/sztM2SvCr9m7ZU
	M+zZw5LZHhjDGb+J2tkFTECJBH7eY3LcNb4S9ScTQiHe2A17b/rx5etyNjfB4ie4xSQmlJiWi6/2K
	K5lUUG5/LjF6X0vJmbi5+SL9NtWhXHzDRs5bqZHk1F+OmmdO9Z9z4SS8xnDqbYyq/gVd/T9z8X3z3
	GsqpU/dtUX25H+ZCehdDkjOmQWZdSkHB5E9CmbFNTygocSFPc+XzuKEBH9BbfwO3BwVDVwu/RkRG5
	aHXbXsr4GYM4+EiwEhDcCoKOaGXX903QkeBA91mUtyfuR/V5wRqrJOIdQQ65HA3xnwl0M3zmLYGbc
	kDlHdQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs6D-00000009esx-0zId;
	Mon, 03 Nov 2025 10:47:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs6B-00000009esW-0XLY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SfoQUh36QE7h8qt3hF9rnB1Y0l49JXwFNS9QZ6PhD74=; b=ZD7a9bk8YePsQT1gCLHkpemXYH
	jhhr//2fwcanBJEPfFnIzR9Kj5qNOUYwkH/a2hZUUeo9NW1VBzJeZBdCOSQJg1LuxKtAWVpqNl7wU
	aUrLae87cb5hpCzJf7bIRkrKc+vIbuclKrSXn0N4OdXXbNGTDAeg7RjZTptf4kBAyfmHpK22Dwuf6
	SaplTqH3s6g/mBJxCDzqVf5asyAAGEH4ta90oPgzCzczsoOCtn0G9WlKvLC+3cA52CrK9c2KBR9hE
	JNMLsgrK3LBJKihiVC0FBn8OlXBiB36aFp/3i4YCquBgToxfch366UNf5WzynDG+TPyOCB7NTnYvU
	ixOPMqZA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42202)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vFs5z-000000000a9-1PlG;
	Mon, 03 Nov 2025 10:47:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vFs5v-000000003jm-0uly;
	Mon, 03 Nov 2025 10:47:27 +0000
Date: Mon, 3 Nov 2025 10:47:27 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Furong Xu <0x1207@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 0/3] net: stmmac: phylink PCS conversion part 3
 (dodgy stuff)
Message-ID: <aQiIP0_sQmdwrzu2@shell.armlinux.org.uk>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQiBjYNtJks2/mrw@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_024743_169639_FA64EDAD 
X-CRM114-Status: GOOD (  13.01  )
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

On Mon, Nov 03, 2025 at 03:48:53PM +0530, Mohd Ayaan Anwar wrote:
> My rate-matching patch was for IQ8 which has the QCA808X PHY. I am
> putting its testing on hold until we sort everything out on QCS9100
> first.
> 
> So, for AQR115C, what should be the way forward? It has support for rate
> matching. For 10M should I remove its .get_rate_matching callback?

Yes, AQR115C has support for rate matching, but it depends how the
firmware is configured. Different firmwares for this PHY default to
different settings for this.

Some operate at a fixed speed on the host interface and do rate
matching. Others don't. The registers in the PHY can be reprogrammed
to change this behaviour and the PHY reset to change the provisioned
firmware's behaviour, but mainline doesn't have that code.

If you enable debugging in drivers/net/phy/aquantia/aquantia_main.c,
then aqr_gen2_read_global_syscfg() will print its configuration for
each speed via:

	"Media speed %d uses host interface %s with %s\n"

messages. Unfortunately, aqr_gen2_get_rate_matching() does not take
account of this configuration, and just assumes they're all the
same (reporting rate adaption for 2500BASE-X and 10GBASE-R interfaces.)

One thing occurs to me is maybe your PHY firmware is provisioned for
rate adaption with the 2500BASE-X interface for 1G and 100M speeds,
but for 10M, it's using SGMII. The above messages will tell us.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


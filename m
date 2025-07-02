Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A0FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 21:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2gzKkiuh/7XKQtv3DJDDajNDBRpKD1gmdPIiBKuNb0=; b=U1ahTglZqRj5MK3kCC5FPL3x2r
	8PSFO3dAmblSN1n6ZXrN2mf6T7zHhnN/U2luwcvngjpwgtQl5243rFFm13tTbRkr3nKI0h1yDn4mU
	zO7FqkYyGFU1tNrDtZ1FjPZrpYamBYb3+9LiOnl5Pb3k5/t4zbY4vjsl+inH4yFtTCd3JEH8BRNc/
	/UqJWli69d45nD+o2IKw2z7z+IZIytCivn6d/tN2ivdziMWVGrUuBMUWGqbbqsI5Jw2bu3JO0ubn2
	Xna4rjBfQVTVSkRGlRfAPU0z9GmcLWLM//+dYDzuOdNYO31fBu/JKTIi5irldxeeF9IFASkMYzGW4
	t/6sUkZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5SB-00000009e6b-3Mss;
	Wed, 02 Jul 2025 21:57:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5Po-00000009dif-1WtU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 21:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O2gzKkiuh/7XKQtv3DJDDajNDBRpKD1gmdPIiBKuNb0=; b=NrnPD4OiDyjcOqPJKQyfvjewYI
	YyS0T7bf7+dUxAxIu6E7hM8R3UNc3BFnHTEJEM7G0a0jIDcsIrHsdNtQuNMEFi1LFjJZ+DoRB4RYW
	6b4GWy+3OiY7sMDX8MDtZEeLCZZMOly4GlUB3LfoCVOvmE9QvQKCwPGGv8xP0s95SoOxUmqOBJzAq
	3UoBHMHJohQI1Qa9r7q/l2b0TQ5gIwQDwMHOZzSdfqhvGvKict8vlJQBIwj64ATUSRdEML5KX1agz
	D3TN9EOQeJUrKNgUdNlzZg3N5pjDqW7EWc9QfKpPYgAQedxo3WDatmcvsa3lwQ9NCdEO1F3NsZxik
	+ioV5jUw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45462)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uX5Ne-0008Gr-0D;
	Wed, 02 Jul 2025 22:52:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uX5Nb-0004QW-2f;
	Wed, 02 Jul 2025 22:52:35 +0100
Date: Wed, 2 Jul 2025 22:52:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: DT: imx6-sr-som: Replace license text comment with
 SPDX identifier
Message-ID: <aGWqIzNvSVw4olz5@shell.armlinux.org.uk>
References: <20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_145452_404450_D64BECF4 
X-CRM114-Status: GOOD (  14.05  )
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

On Wed, Jul 02, 2025 at 11:41:54PM +0200, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment heades mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

As Florian has already mentioned, the preferred format for the summary
for arch/arm is "ARM: ... " and by extension for arch/arm/boot/dts,
it's "ARM: dts: ...", not "arm: DT: ..."

Please ensure that *all* your submissions follow this preferred
format.

When in doubt, do a git log on the file(s) you are modifying to
discover what has been used in the past.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


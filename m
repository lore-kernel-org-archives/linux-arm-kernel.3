Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3269C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvYluRdkIYTZI6ccj4hQ+kAHZsTnKaccn8jpIrnuS3A=; b=AwbjLmMge+aldmx/KHJkYq6ghF
	CBH1+4+rhUr0uITvbNkb0SezUVSLuMp7ntOvdDO2ZQVC5mh11l2HCJnBSD3yp9/AfrEfYTyHjq0ME
	NCmhIQk5k5K16l5JwbyRrpPhr04no84TMM8jDm5duk7t4x0lH1feAddZSWsJbbdkMGr6lCl4MCbhS
	Qsr3Ni0vbXlcj/9PQmoIZ7PanDxUgN6iRZcmEjwsXUOWakpzaFziwRwIPU/xYyq0wPoPVZ1scGRfL
	AK/VYtPFE1o+LBJRkBX7mqhURVnvhMfEApEzvby8ec01svGd8Sr/bp4TSY8GCzDfFVy3vhLBYvALN
	Vd/slsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2z0-000000051dz-0PDD;
	Mon, 17 Feb 2025 15:24:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2t7-000000050nF-0OSx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NvYluRdkIYTZI6ccj4hQ+kAHZsTnKaccn8jpIrnuS3A=; b=2UefaQrU/d+T+mYtpph7dWPoXp
	aVvHZBJgTEnrOinhX8HEMfrJs70OqL4CD3KhJuGXaJGvR9OpbNBqCMg+gEX1R/V7jE4RuB6j2CHxG
	Puzdg59ZwMIzvxt+ZI8HuIo6fHQbXq3ijGCm1odfEaEchH67hhBwbD2n8tyNyPBo+DRU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tk2st-00F0Ij-7o; Mon, 17 Feb 2025 16:18:11 +0100
Date: Mon, 17 Feb 2025 16:18:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	'Pankaj	Dubey' <pankaj.dubey@samsung.com>, ravi.patel@samsung.com
Subject: Re: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
 bindings
Message-ID: <18746e2f-4124-4f85-97d2-a040b78b4b34@lunn.ch>
References: <20250213044624.37334-1-swathi.ks@samsung.com>
 <CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
 <20250213044624.37334-2-swathi.ks@samsung.com>
 <85e0dec0-5b40-427a-9417-cae0ed2aa484@lunn.ch>
 <00b001db7e9f$ca7cfbd0$5f76f370$@samsung.com>
 <ffb13051-ab93-4729-8b98-20e278552673@lunn.ch>
 <011901db80fb$8e968f60$abc3ae20$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <011901db80fb$8e968f60$abc3ae20$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_071825_132312_B8839B31 
X-CRM114-Status: GOOD (  16.64  )
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

> > > > > +  phy-mode:
> > > > > +    enum:
> > > > > +      - rgmii-id
> > > >
> > > > phy-mode is normally a board property, in the .dts file, since the
> > > > board
> > > might
> > > > decide to have extra long clock lines and so want 'rgmii'.

> Hi Andrew, 
> What you said is right. Generally, PCB provides internal delay.

It is actually pretty unusual for the PCB to add the delays. But there
are some boards which do this. Which is why you should support it.

> But in this case, due to customer request, the delay was added into SoC.

Idealy, by the PHY. However, in terms of DT, the board .dts file just
needs to say 'rmgii-id', meaning that the board does not provide the
delays, so the MAC/PHY pair needs to provide the delay.

> The following doc on rgmii says that "Devices which implement internal delay
> shall be referred to as RGMII-ID. 
> Devices may offer an option to operate with/without internal delay and still
> remain compliant with this spec"
> https://community.nxp.com/pwmxy87654/attachments/pwmxy87654/imx-processors/2
> 0655/1/RGMIIv2_0_final_hp.pdf
> 
> Also, the driver is in such a way that it handles all four rgmii in the same
> way. 
> 
> Considering this, could you let us know what will be the right approach to
> take in this case?

List all four phy-modes in the binding. They should all be
valid. However, the .dtsi file should not list a phy-mode, since it is
a board property, not a SoC property.

	Andrew


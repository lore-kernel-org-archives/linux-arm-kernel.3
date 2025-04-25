Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ED5C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rygg94K3zvEB+ZzHbtjPNTtEtK0krqj/Y+/TH56unmc=; b=1lsLNlsgPsnNjWq0U+udpEFK5d
	YjFNpk5mdUB3h2eWJEc6oXbFK7/syvw+a6jiEZOf1+rMnzHhCjHMj4Q8GrxA02V3lljA/KcxVLpA6
	2izeHGUrKs7cWinQ+cxwJr1RvQPBvSjHIuSJF878gtwns7lQFEWhbpwUUTOgad8YMaKaLm0BUdyss
	R0/HtVXcRdWxFRLJreNQCkwqVRtJOvBVUdRDfEfs+PKJFmUinNU2qhqHhotOHI6Iv9ZAZO9ZxCiTk
	Y0vELkPxTnxQrWRFXx9o5gAOPeghUSYoji5Po+U52s9OcS/hjG7uqWyJwL7FKGDR0taHFcrEI3oue
	t63f659Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8M2j-00000000FCd-2xPP;
	Fri, 25 Apr 2025 16:36:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L4M-000000003mN-2ykF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rygg94K3zvEB+ZzHbtjPNTtEtK0krqj/Y+/TH56unmc=; b=4HP5JZt4ncDGeyZcYm6V8Dec6w
	Wr/Mo6FR4kV+wIEU9CKCkRLuQNLvG5qwXnFXUKM/8J8zTas35rghKLKrFq47A6OfiQnLaNv2cvB6V
	y9n4qz7IKwY4mJysU9CWJpDIuraGQMBjH55GaBg7aKxvOzEODCBGkquxQS/U/SVFFYxw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u8L4A-00AalX-JR; Fri, 25 Apr 2025 17:34:14 +0200
Date: Fri, 25 Apr 2025 17:34:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
	samuel@sholland.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Message-ID: <cd7fd026-2f82-43d1-abdb-482bfe600bb5@lunn.ch>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <20250413134318.66681-3-jernej.skrabec@gmail.com>
 <20250425135429.174a1871@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425135429.174a1871@donnerap.manchester.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_083426_743539_7AB4B0D5 
X-CRM114-Status: UNSURE (   8.24  )
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

> > +&emac {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&ext_rgmii_pins>;
> > +	phy-mode = "rgmii-rxid";
> 
> So relating to what Andrew said earlier today, should this read rgmii-id
> instead? Since the strap resistors just set some boot-up value, but we
> want the PHY driver to enable both RX and TX delay programmatically?

Yes.

There is a checkpatch.pl patch working its way through the system
which will add warning about any rgmii value other than rgmii-id. Such
values need a comment that the PCB has extra long clock
lines. Hopefully that will make people actually stop and think about
this, rather than just copy broken vendor code.

	Andrew


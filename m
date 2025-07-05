Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F455C83030
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9DdcRnfhBPVW8W/FOonIsGDCqFd6aCoYB1it47q3jI=; b=089bRl2lXJk2rYeosiIQ9jRKRI
	OvgWR1p5oEYaqAVKqls66rGnlIPdZFdrHYQHAYALq7sPla+GqVIeHdeQbSQGKrRBJDSwFjsPgY29R
	v9BxISroR2GY5a8WuUYxyl92FTUR72et9pK/2hlNNYev5KagH4+4L96PLNKasBAxEokRRjnvtbqPD
	Yqz5wMTJV1ni2Q++DdSdhRlLHRlPu6O1m7OGspRWob+5jElM5Wvy7TPIuWZ7lwWzK5QqLdovIQRWH
	J3DqEPEKrD29nZMomYauDloXmwTuplNKLK+uVJCH8LD4M+qhOEkbqiWSIiYF5/ynOwd4DKBkF2M5C
	tSMbDAKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY5FM-0000000Gjhs-41C0;
	Sat, 05 Jul 2025 15:56:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY5Ci-0000000GjVI-2Ol2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 15:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=C9DdcRnfhBPVW8W/FOonIsGDCqFd6aCoYB1it47q3jI=; b=oMXBtLL69nrFLRPhn8plV4StT+
	zuaDIJP3Dv1xML9osG1Blf2kQE9PLJdZwDHY0o11qQ3A/S7QYfM8xl/MiYCUKDz1MTVPbFmxf791f
	YNxhkwwi+9lynapFkvITxXGOzjZdWZbfoyL2jMOVCtSdnvi9QZNl3Vhcu1Pzubhnp6Dw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uY5CX-000Qaj-UY; Sat, 05 Jul 2025 17:53:17 +0200
Date: Sat, 5 Jul 2025 17:53:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net 0/2] allwinner: a523: Rename emac0 to gmac0
Message-ID: <e9c5949d-9ac5-4b33-810d-b716ccce5fe9@lunn.ch>
References: <20250628054438.2864220-1-wens@kernel.org>
 <20250705083600.2916bf0c@minigeek.lan>
 <CAGb2v64My=A_Jw+CBCsqno3SsSSTtBFKXOrgLv+Nyq_z5oeYBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v64My=A_Jw+CBCsqno3SsSSTtBFKXOrgLv+Nyq_z5oeYBg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_085328_608465_C0F2AA3E 
X-CRM114-Status: UNSURE (   6.78  )
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

> So it's really whatever Allwinner wants to call it. I would rather have
> the names follow the datasheet than us making some scheme up.

Are the datasheets publicly available?

	Andrew


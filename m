Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21976F0183C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MirfIR7Fld7DvyfLq9p3EnVSzA7tLEd1Eqq9yuQL0IE=; b=Kq+lhDUMXnZpYWCFD+xpDnxoay
	+/qo6yvC5Pq/1wi2coDmDecvQAPCaZ7dJk3i4NyXpfaI1oeWf5LgyxF4ZMpmqqz3iLsuHbq2+2Y6f
	u4JC7tZcdcbnuy0QbJ64q/gP/qpKAbevVoJ8xWR5M47NgJfZzpLSdjR5ZC+aVHuhIYcmJy/z3oVSO
	uUztF/EHIjtcyNjx5Egs3yrMEwnjHRCB65hWc3bU82M6KGBV/n8pSeCMxoLojfuaZlUb+QaEgtWPX
	RQBA79+6MeWLBnub5Q5OkVR31xBmcdETTaTqpwfbP8yzlSkF48foQax+JFyEr3tuSGW/LkYKRVfok
	Vuh9LW+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVkE-00000003ptA-1yo8;
	Fri, 06 Mar 2026 14:01:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVkB-00000003psH-2Awd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MirfIR7Fld7DvyfLq9p3EnVSzA7tLEd1Eqq9yuQL0IE=; b=QUMireeO4aEf+KSITfWawFA2LF
	tNODAY3TgouFyFnjIaz/qRnEmmVmogpGG2NJ6UqEqrsu0060jU5jWIdfnkdCdR3GSRf8aVDmY7Ysa
	G8UxqUuGORMrtXu7Om66TDY6wGkMfm89B87fMBKkiTUGEs6g0vw7DTdGj07qIPhff2eA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vyVjh-00AU97-OX; Fri, 06 Mar 2026 15:01:01 +0100
Date: Fri, 6 Mar 2026 15:01:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"taoren@meta.com" <taoren@meta.com>
Subject: Re: [PATCH net-next v6 5/5] ARM: dts: aspeed: ast2600-evb: Configure
 RGMII delay for MAC
Message-ID: <344e1aed-f2a5-4249-90c1-2b848ee39d7c@lunn.ch>
References: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
 <20260302-rgmii_delay_2600-v6-5-68319a4c4110@aspeedtech.com>
 <d38f54b2-4a99-4a54-8403-e4f4a9704386@lunn.ch>
 <SEYPR06MB5134AE0B0042E05E8E58A5239D7DA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <70ed84fd-ac9d-4157-ad20-36deec0c5f82@lunn.ch>
 <SEYPR06MB51341775B041AF86CC8769F69D7AA@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB51341775B041AF86CC8769F69D7AA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060131_561684_E4E58CEE 
X-CRM114-Status: GOOD (  10.06  )
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

> Could you please help confirm how we should proceed with this project?

That is up to you.

If you do lots of small patches with good comments, you probably can
do it in Linux. But you need to convince reviewers you are not
breaking backwards compatibility.

I think the bootloader change is simpler. But i've not worked on
bootloaders for a long time.

> 3. Send a patch to correct the phy-mode settings in aspeed-ast2600-evb.dts so that they 
> match the bootloader after the fix.
> 
> mac0: "rgmii-rxid" -> "rgmii-id"
> mac1: "rgmii-rxid" -> "rgmii-id"
> mac2: "rgmii" -> "rgmii-id"
> mac3: "rgmii" -> "rgmii-id"

You will do this anyway. However, just so that backwards comparability
gets tested all the time, i would suggest you only change mac0 and
mac3. Leave mac1 and mac2 with old settings, and add comments that old
values are being used for testing, and they should not be cut/paste
into new .dts files. And add a comment that mac0 and mac3 require the
new bootloader, if you decide to solve it that way.

	Andrew


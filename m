Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324F6C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 22:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFDIZWe85lWzdsVOO9D9K4RCfE3MGF8f7zr5mhPvBlE=; b=JY7lFLz9ar1LPZoPONs8t6HGmT
	VBqMoYlMepE1g+ADg1eIOxlI/hWikEDxS2+kNWyrhhPY0rZe9r23Y7CMl2TR1oVnELnjh7RstmIVC
	xqsju32qtUHze+AjLM1ku1UJ381fFqsmv/Hi6syq1LPDh8Vz5WmCuIDUxGi0F4HOhEaWJz78nDMXo
	p3I1yOGSQXvtI3vToqdS7ABxwkK9sjQQrG6XNglJg2xzH0Iio3Qe+6bG9ELpaqnMt31NAffSA4ZN/
	o2RWCP0Ynqwa2R5a+OgAX2MB61ppeyUJh1BWsc2TZLmyiJEMmf2ZIX9soLCJe1hhtuxSvoYE217a0
	oBwcEGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEFF1-00000007xYe-1s7z;
	Sun, 11 May 2025 22:33:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEEBE-00000007tcO-2OP3;
	Sun, 11 May 2025 21:25:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pFDIZWe85lWzdsVOO9D9K4RCfE3MGF8f7zr5mhPvBlE=; b=FAhkc07qAlQhbeIcSsYcowD/zh
	28GpGuhOHupvuPXTxs3uoYu4gGBRZh48QxNridrAuo7FSpll9ucBiUpcOcV3Wasl5auLvpKmHrck9
	XMnw0yvBadv1bjs3/UaOm8ietfTKaUB52YDpLbewhnMce8udVoP1i9PxmkQhCmtiEzSw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEEAp-00CHOm-O9; Sun, 11 May 2025 23:25:27 +0200
Date: Sun, 11 May 2025 23:25:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux@fw-web.de, olteanv@gmail.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
	sean.wang@mediatek.com, daniel@makrotopia.org, lorenzo@kernel.org,
	nbd@nbd.name, netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: Re: [PATCH v1 09/14] arm64: dts: mediatek: mt7988: add switch
 node
Message-ID: <74afe286-2adb-42d3-9491-881379053e36@lunn.ch>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-10-linux@fw-web.de>
 <bfa0c158-4205-4070-9b72-f6bde9cd9997@lunn.ch>
 <trinity-0edcdb4e-bcc9-47bb-b958-a018f5980128-1746984591926@trinity-msg-rest-gmx-gmx-live-74d694d854-ls6fz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-0edcdb4e-bcc9-47bb-b958-a018f5980128-1746984591926@trinity-msg-rest-gmx-gmx-live-74d694d854-ls6fz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_142552_605318_3D679A6A 
X-CRM114-Status: UNSURE (   5.71  )
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

> i will move that into the board dtsi file in v2 because "normal" bpi-r4 and 2g5 variant are same here.

Maybe you just need to expand the commit message? What does this .dtsi
actually represent? The SoC, or what is common across a number of
boards?

	Andrew


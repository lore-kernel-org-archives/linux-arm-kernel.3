Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F6CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 07:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrREUu7M01yLFsWWMlhR00gmICA+eyNOf8xAkNy8plw=; b=nMjYRhlkMrUmMu6+BNgy6kYwIy
	aWaHHtZ5hCVCRyQ95H7pB1Y76sY/1rlQuemWZq5aE+SsaBMnWBdk+GZkVEvZAHRx5t9u6aoXBBzPV
	McbXQEVEAAcYyLe4EGnjrdo++uzlKa1YpD9ZXH2I0fLb0Qoi61BARHpCOriaqhLVZ5JYHjHsL08ot
	tDEa6pnYl1CE867hwCunneVhsTT83d+BXSfsMXns5UqtQjqQ+BOXjwcu4QcfiwYKGS7pIr9GEBZaN
	QzczLmnMukI48pameoFlKOofe2GZR5jvvp2bLtVO+g3OVJPSSshdZovcu0ypnglyFwnlSUYdBH+nw
	/pNOjgHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DnK-0000000GEOc-1LXg;
	Fri, 25 Apr 2025 07:48:22 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DlS-0000000GE19-3Yk6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 07:46:28 +0000
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 581A6341540;
	Fri, 25 Apr 2025 07:46:25 +0000 (UTC)
Date: Fri, 25 Apr 2025 07:46:21 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andre.przywara@arm.com, andrew+netdev@lunn.ch, conor+dt@kernel.org,
	davem@davemloft.net, devicetree@vger.kernel.org,
	edumazet@google.com, jernej.skrabec@gmail.com, krzk+dt@kernel.org,
	kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	mripard@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	robh@kernel.org, samuel@sholland.org, wens@csie.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <20250425074621-GYC50408@gentoo>
References: <20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
 <20250425033001.50236-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425033001.50236-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_004626_910675_2D23EFAA 
X-CRM114-Status: GOOD (  11.53  )
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

Hi Chukun,

On 11:30 Fri 25 Apr     , Chukun Pan wrote:
> Hi,
> 
> > On Radxa A5E board, the EMAC0 connect to an external YT8531C PHY,
> > which features a 25MHz crystal, and using PH8 pin as PHY reset.
> > 
> > Tested on A5E board with schematic V1.20.
> 
> Although the schematic says it is YT8531C, the PHY on the V1.20 board
> is Maxio MAE0621A. The article of cnx-software also mentioned this:
> https://www.cnx-software.com/2025/01/04/radxa-cubie-a5e-allwinner-a527-t527-sbc-with-hdmi-2-0-dual-gbe-wifi-6-bluetooth-5-4/
> 
IMO, then the schematic should be updated, I could definitely adjust
the commit message to reflect this change, but don't know if further
action need to take, like writing a new phy driver, I guess a fallback
to generic phy just works?
(google says, the MAE0621A is a pin-to-pin chip to RTL8211F..)

-- 
Yixun Lan (dlan)


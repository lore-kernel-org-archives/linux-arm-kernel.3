Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BA7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 23:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6p9CG0ucUJyWWPCmR1i0n8mseOGxxjsoZi2KpUvwYFM=; b=ISgbbY0pi1LxUPldX7Yjh0pppA
	DRMEDapnr5lk//ubX/c3VL9PkIDsTwSripd1ywyijGLx/Bpt4jb2k5gGRMYeLZsd6A31kaX9k27az
	PjfY0nZZJ5LHT+s6LFZqmizk97y1OGaZUeUsCuzFvq9Aq4dcvAe/7fU4MW9NJ6kat5mYFFKWJ34+X
	DaH1UrPY53Udg0N3pKUuLZ4QGEtgUIBI1qtXUByPsFyb62/HPcTw10HBm28cfX13sC0uXJpxozEe/
	+0xfFxBhNAUccrSvtB8abJu1zNnAdsBJyYUQJp783GU8DK2+/7PqaSHoV04MUZrz68L46toWSbhXS
	fhQOSShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbws-00000000cb8-1Vq4;
	Wed, 08 Jul 2026 23:45:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbwp-00000000cZp-30WM;
	Wed, 08 Jul 2026 23:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6p9CG0ucUJyWWPCmR1i0n8mseOGxxjsoZi2KpUvwYFM=; b=g87yIN0rgi+sraGKqIr8gUPHCy
	KihKUu5dmKFk8wq2yK4l3x0zh1cQGvT9i/avJ7sZ2Z4HAg3Y6ChHyMConek8beVh3js8Lk30B0sQr
	3L29RcNh0+uaH213xG5rMvbd0mimJkjukGpiIDH2umxA9HhmhjFO+hX23LHRpmMoXPYM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1whbwT-00BPV2-GM; Thu, 09 Jul 2026 01:44:37 +0200
Date: Thu, 9 Jul 2026 01:44:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/5] net: phy: mediatek: move MTK GE SoC
 registers define to dedicated header
Message-ID: <788172f8-1005-4df1-afb7-320a135bdaf9@lunn.ch>
References: <20260708102341.53919-1-ansuelsmth@gmail.com>
 <20260708102341.53919-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708102341.53919-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_164459_757409_EA779A7E 
X-CRM114-Status: UNSURE (   8.23  )
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

On Wed, Jul 08, 2026 at 12:23:28PM +0200, Christian Marangi wrote:
> In preparation for support of special Software Calibration for Airoha
> PHY, move the MTK GE SoC registers define to a dedicated header.
> 
> It's also needed to generalize the cal_cycle function as Airoha needs
> only part of its logic (the wait logic) to complete a calibration cycle.

Can this be two patches?

	Andrew


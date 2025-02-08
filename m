Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B667EC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 09:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6z2YuJvuFYLB1q3qrklBHPoovjtO0uF04fHOBairAc8=; b=MprXViEnU1o3TkwyKMaO2AV6fg
	gjzaJ6KZ9CjPugB0VsPLppDrfq6wDMyBbufQflhQQu1s3OWttQ3epODtzM/+BLflcoa7uIegYcLvB
	qxHEZgSZjLa0k2buhUJSP2IA/5y4/Q6WnDLqXJT6EY90PjLyc7k4gLxQ7TTn2xyCaKc5knQ2xfVzJ
	9t8koWWm3YZC7QxRbD2TAxbvRaOLcBlRsmRrm2Ca4Iw46oFNd3X4Nxn0pcGu7tjc0SVplZ7rBM07V
	haECgudb79qvLZtG4FfiTg7qnhz75RxSshGlwgojq55/CrtwNyrahwAn/dA//Jy+zOcez26FL1Yd5
	3ZqyaxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tghZu-0000000CgRJ-3tYA;
	Sat, 08 Feb 2025 09:56:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tghYW-0000000CgFs-1ruH;
	Sat, 08 Feb 2025 09:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6z2YuJvuFYLB1q3qrklBHPoovjtO0uF04fHOBairAc8=; b=SAQT4A7+Yf2xm56Y7XL9ySSHBb
	W5q8Ek+Po1V7nlNjnPQgQZBqildLpjUNFrF+75RYTQ7QF/ea++oIeEHlfGKphNOO6r3fKUqgVUlQQ
	sU6+mQnrvQaMsdCEH+NH5OoXM9vW0KqyUMZ4AGs+IGobVB3F5x1uhLlj6woKrPDTMSIGjjvIL314M
	NYlB4UrB9mZt5xYGSKAyT8sefDzEaM18xc5sv/7yuy9K/25IOd28RVF0XdlV08Qrm1jyI/o1vXmrY
	+RfoOLyafUkYZUSj5OwRt3uc6CYoXYca4EDVvASn942f9DUA6htoqdsmv8ox2YuTNHuKJTGkLz0lE
	UVlVIjMA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47998)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tghYK-0000JR-2D;
	Sat, 08 Feb 2025 09:55:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tghYH-0005NI-2t;
	Sat, 08 Feb 2025 09:55:05 +0000
Date: Sat, 8 Feb 2025 09:55:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: ethernet: mediatek: add ethtool EEE
 callbacks
Message-ID: <Z6cp-TCckCNReUPd@shell.armlinux.org.uk>
References: <20250208092732.3136629-1-dqfext@gmail.com>
 <Z6ckCZpOo1_rvmh6@shell.armlinux.org.uk>
 <CALW65jYG3vv9aCY_HDU4Wyij1kqfiOVOsZ3YnvioUf4AgSbnaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALW65jYG3vv9aCY_HDU4Wyij1kqfiOVOsZ3YnvioUf4AgSbnaw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_015520_488612_15E67C22 
X-CRM114-Status: GOOD (  10.10  )
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

On Sat, Feb 08, 2025 at 05:48:46PM +0800, Qingfang Deng wrote:
> On Sat, Feb 8, 2025 at 5:29 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Sat, Feb 08, 2025 at 05:27:32PM +0800, Qingfang Deng wrote:
> > > Allow users to adjust the EEE settings of an attached PHY.
> >
> > Why do you need to do this? Does the MAC support EEE?
> 
> Yes, the MAC supports EEE.

Doesn't it need a bit more code to configure the MAC?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


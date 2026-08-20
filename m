Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D67C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 21:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IraYJR8xbyQeqc2R0ipywXHXerqP8H5Ms/wpHOhoDYU=; b=UDr/M8/mTgLPgNCSygOBlQrDVZ
	v1VBbAzmYEAO4cN1GrYyhaQ7O3+xZeVuTIszTryATWt34iDPrzdvTqu8nDmRMeJSmaR/Gkf3qN8LW
	R4NJ9mgYsIgCgjoGbOSvW0CAjGqthug9GR6vvjsVlNry6qZyyxP9OdzQlnwxKlgiQkSexRjugzM3A
	+pQ504zjaXlDsXcSWT4kb+e5SzgYauhUU7nlL6px8D0WWaCD3aHlAMm0rvTr78im4Lup+75Y051oq
	kGZ4tx3fNHkGYqeFHZBkIAvCj3hWNiosPkyFfmtHAY0bUlqhpEqW/F/q6006YtAmvpMvYZ/moIX40
	UjFY+3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9sC-0000000CBkL-0PvA;
	Thu, 20 Aug 2026 21:00:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9sA-0000000CBjl-0bhK;
	Thu, 20 Aug 2026 21:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IraYJR8xbyQeqc2R0ipywXHXerqP8H5Ms/wpHOhoDYU=; b=K450eMW5Pz52gDGMsb/Dq5ATbU
	e3VdOZgwKzuYnDt6TdrFGkKnybpIWfrq1COX50af9dTOBRodnsKWnfj3zHa6SyDLIhfy7ROf6dq9Y
	baHJuFy9/V/zo36oIpATAhUx7BEhq0YAfUpKn7lUTGXlZxcWhEK4GuRqt4ECcM6g6R9s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wx9rg-000qQb-V0; Thu, 20 Aug 2026 22:59:56 +0200
Date: Thu, 20 Aug 2026 22:59:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	chester.a.unal@arinc9.com, dqfext@gmail.com, sean.wang@mediatek.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, yangshiji66@outlook.com
Subject: Re: [PATCH net] net: dsa: mt7530: do not advertise EEE on MT7621
 switch
Message-ID: <b6c8df34-417e-488f-8aa2-98c0c62f6642@lunn.ch>
References: <20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com>
 <aoSnqurLLgdVT_Eu@makrotopia.org>
 <CADDoYm63JMq=5CyNvqkTo65BgS927iURKMmhvhD=B-ytqq3Ygg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADDoYm63JMq=5CyNvqkTo65BgS927iURKMmhvhD=B-ytqq3Ygg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_140026_185810_C7D96744 
X-CRM114-Status: GOOD (  18.41  )
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

On Thu, Aug 20, 2026 at 11:18:23PM +0300, Vladislav Karmanov wrote:
> Hi Andrew, Hi Daniel,
> 
> Thanks for the review.
> 
> > Do we know what is broken here? MAC or PHY? If it is the PHY which is
> > broken, it would be better to put the workaround into the PHY driver.
> 
> It is the PHY that is broken -- the MT7530 internal GE PHY (PHY ID
> 0x03a29412, driven by mediatek-ge). Landen Chao (MediaTek, 2021) puts the
> root cause there: "EEE of the 10-year-old MT7530 internal gephy has many
> IOT problems, so it is recommended to disable its EEE."
> 
> That would point to the PHY driver as the natural home, but I think the
> DSA side is actually the right place,

There are a couple of parts to disabling EEE.

In this case, you need to disable advertise early. So the PHY probe()
would be the correct place to do this.

You also needs to let phylib know that EEE is broken. So the PHY
driver should be calling phy_disable_eee(). That will prevent the user
from turning EEE back on again.

Since it is the PHY which is broken, this will cover all usage of the
PHY, be it integrated in a switch, or standalone.

     Andrew


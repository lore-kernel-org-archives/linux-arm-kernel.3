Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B467FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFHtlpuxfkGLGAsAi8YBJ+suE1pM91LaalHIl10DLRk=; b=aXTzqs6ZidkY70lOUoq3XbKYDY
	oDVq62IG+bbkwu/zY6lmYgCYxR7V37uowYQhLSY2XEAVuwxPCIu/J0Khfh03AAqRY9sFWm2al7bpT
	dabjC97s0CFyReh4kjhoMZTXx5CXzTEuI5i1IWfAo5SurzP+yAK7i56/5mk+TD9VfNJZ9EMDL5ZdF
	o7yLOV4W3Nr5DFZpZgs3glqy+KEg3FZIAuM8JIe8tEkf5pQN8rMnrcG+oUrMUPSphcLkYCxneizsd
	Rj5nFOmCnBcApsSfOmIKywuLZmguLQJRX9QhL9YLuCcN8GalY+bPLglvvelUSVriwp9Kem0Q8rFi9
	beWfmEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeos-0000000F3c5-0Cn2;
	Mon, 24 Feb 2025 20:12:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmekV-0000000F2fv-3aqn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cFHtlpuxfkGLGAsAi8YBJ+suE1pM91LaalHIl10DLRk=; b=RCImGLoN9FVTBSF99b3TmZW0wq
	TSXSIn16+hRenI5vNiVsy2FnM+dWfXCQnNfX+ilWZuAFXJpMu1tBJjpsVc+RTmg962BUFkQsuYRU7
	PDnVHYPSkUOoqNTs6YzN9RwVeQ0I/vuoQo2FudoLtNBSwtQfgn/CkwkC+xKL6J6tUIrw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tmekR-00HHQY-41; Mon, 24 Feb 2025 21:08:15 +0100
Date: Mon, 24 Feb 2025 21:08:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v3 1/2] net: stmmac: dwc-qos: name struct
 plat_stmmacenet_data consistently
Message-ID: <40aed266-1a51-40a5-b09d-dca66a9e5ba2@lunn.ch>
References: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
 <E1tmbhe-004vSt-M3@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tmbhe-004vSt-M3@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_120819_891621_D2EEAF64 
X-CRM114-Status: UNSURE (   7.34  )
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

On Mon, Feb 24, 2025 at 04:53:10PM +0000, Russell King (Oracle) wrote:
> Most of the stmmac driver uses "plat_dat" to name the platform data,
> and "data" is used for the glue driver data. make dwc-qos follow
> this pattern to avoid silly mistakes.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


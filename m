Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB1310D1485
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 22:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksn/ONXvwjFSl7uoWMydoUCTQ2n21ymYZkV8pvqF/8A=; b=qDu0NN9vVnF7h+rtrta94Y1sv3
	FMAmC362OdY3wrJTMF0ObM8IfuELa5k8OQ91WknkFgV6w9Mv6O81yU0OP8+v4sfzQ1MHy9YUijD0J
	xF/JVXaRnMTjcfeO/qYzq6Hq7lWsuHkF8iZvtZxeT07zdKdcbxJvhCYMOrBvAYCkwI8Yyd332yyyz
	pPZaIwU0ij7DXy4zBjn5he/MvPiU9aBqAd2MC96WmwCYTdzwc9C+mbLifA3SFSJue0ectfuWJ+dxV
	V2jGCMs0Z523FqepOy6mp13ENw+0cnjvarD5XQNYLMNQA0YZLFjYOWSTGDkFQFdZ1UwbTiKKqNJTB
	Lpbe8qNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6c6i-00000009M9u-3jh7;
	Sat, 28 Mar 2026 22:26:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6c6f-00000009M9P-1oop;
	Sat, 28 Mar 2026 22:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ksn/ONXvwjFSl7uoWMydoUCTQ2n21ymYZkV8pvqF/8A=; b=IrbqNRvGeY9gFvxXGYjzBeb65D
	oyV0CIkcphy8AMq9OdHok9Wx2jkD+i8SPTdK44SuUZj++7tuLMzSf/8u/IibGJNzOskprqmp0TiCW
	UiiYtbkj4Yk+2XkiibEtMIdc++DkTFZXZ4stjxKKTZTkcOER3QXkWghjq5eH0f6Jae/UFPtSUPgj+
	AbHdISz6jIVhlHDqKlsJ9SJBWs2h3uelqwy3YjN9dO4s0EYnn0jzKoPGXXT//ZPr6js1sr2/0I+Fv
	hPqkENCp+Y8NJ4vDaCl64J2Zv9URbJvXvkQlc5yp82CpA9kCS/QlIVPkreSVOTuGXN2kHo1mCvwKB
	YuaeBQVA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32806)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w6c6a-000000007W4-46Aa;
	Sat, 28 Mar 2026 22:26:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w6c6X-0000000012S-1fvd;
	Sat, 28 Mar 2026 22:26:05 +0000
Date: Sat, 28 Mar 2026 22:26:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@red54.com>
Cc: linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: dwmac-rk: Fix typo in comment
Message-ID: <achVffNlW_VPZu5W@shell.armlinux.org.uk>
References: <tencent_833D2AD6577F21CF38ED1C3FE8814EB4B308@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_833D2AD6577F21CF38ED1C3FE8814EB4B308@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_152613_488091_A131DAAC 
X-CRM114-Status: UNSURE (   6.48  )
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

On Sat, Mar 28, 2026 at 01:43:31PM +0000, 谢致邦 (XIE Zhibang) wrote:
> Correct the typo "rk3520" to "rk3528" in comment.
> 
> Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


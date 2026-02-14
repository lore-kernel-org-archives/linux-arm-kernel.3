Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E606FEF5852
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 19:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cu+TqsuHAXYizEfNBI0UDoQ498p1s8mX09LKRbQR0g4=; b=UwjEv91WwSt/uDj85m0CXS0uMv
	Ap/8E0prgn0Fsb0pyiqmckEhJuO0nYAs/KK4+J9BAWHeQROBNdYfXYEcMbIKdWwlpx9SHxFAOLTq4
	eFm4P5GfS2+uw+tKfmN+q4nl00GfnojS28HYIMENaEAT0xWl3XsI0OcUS+qAx4oYhBtVh4u99HucW
	xzgh3TgUdh4O0+Oa4I9MD6VHcr5mSCIQJQSZI3Kj31W8gyR04K6TKfnSioCnvjQ98ZJO7OFji7krb
	WwNnhjDDTrD55U7W+EUgrZmEIJawkHd9VnyIB3I0hEhVJh24x9Vw6B9vRflojoPNJazjsuLiEKa9M
	3bi7TFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKuf-00000004rq4-1dt5;
	Sat, 14 Feb 2026 19:02:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKub-00000004rpc-07PD;
	Sat, 14 Feb 2026 19:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cu+TqsuHAXYizEfNBI0UDoQ498p1s8mX09LKRbQR0g4=; b=s/RJfSbHpNem+gp3NJ6JTnqJQS
	fxoaewFnUWkdh4CzkZq5dJSLKkncMY/reCTtwACFwPCnPpv44SQAt42IKKzn6aCVxsEAH+SX85IR+
	VwPDaw3zr14DSsm5ODITZJEKB7aJCHRburoWQYIOqTMmv/3FaoxszQu1K0kJiPryY8eFAooGLmgVZ
	ZgGE8NBwDSy+MaKcNPNLN0WiUscah3Oq/QL3NsxXQ3Z8GD+deTqyGTGr8tZymD3FeDNg9GqTBoaAQ
	GJRHzuHVAHv6TLa0HgGoXqvTyjrtIkFUTImQKXRVHznsFd2sT+q2G8jVryzQKfAS2TwyQ+WT3nIpD
	YaIVBGkQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52392)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vrKuC-0000000060D-2rUa;
	Sat, 14 Feb 2026 19:02:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vrKu8-000000006zz-2kpK;
	Sat, 14 Feb 2026 19:02:08 +0000
Date: Sat, 14 Feb 2026 19:02:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yao Zi <me@ziyao.cc>, Heiko Stuebner <heiko@sntech.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: Problematic understanding of phy-mode in Rockchip DWMAC driver
Message-ID: <aZDGsJNLZIty0242@shell.armlinux.org.uk>
References: <aY9s5PXP4zZ7R6fa@pie>
 <aY9xsslT56D9LGLe@shell.armlinux.org.uk>
 <f1e047e1-3f1c-4562-ab43-af2fe358fe04@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1e047e1-3f1c-4562-ab43-af2fe358fe04@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_110237_379983_2732113A 
X-CRM114-Status: UNSURE (   8.70  )
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

On Sat, Feb 14, 2026 at 05:50:15PM +0100, Andrew Lunn wrote:
> Rockchip have recently started adding support for a new version, and
> appear to of listened to what we have been saying. So it could be the
> next generation of chips get this correct.

Have you seen any proposed code from Rockchip for their new scheme?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


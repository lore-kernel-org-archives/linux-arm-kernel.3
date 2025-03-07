Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7858C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yXC3Xb/MwcJsrS6HKxPIosX6qAp8S61W2EzWPVkdLs=; b=SgTywdzZMLujQPlXIgpdiLtkkb
	vHubuIxH6oA7IXaLKA1xbOarB80RJIZurYfUIyTA3N4woqyYuej/qKDmSQFiew8LSK7/iHReTr8FY
	tU8QRG6MKFa+AXq/iHwwYujeN4q2BpHmIXdVa6g/6QU+eVme1sHu4c+/RQxsDh5qGBmI318oX89tz
	Uha3nCuwtI2lT/SvdspzTPOY0pVsEcRLkWBVCeWUkxnPHTYJoLANlJBzUL83AbAKxALNkqfsh45y0
	DNHuP4aQk4iYZgyOyzTIf+F1pMlaTyqtUud3rx27SGDO0FCOFGVpnpkbazlhDGCQlJ/PDR3uyhXnn
	H6FNCbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXld-0000000EKbk-1eZ8;
	Fri, 07 Mar 2025 13:29:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXiR-0000000EK5e-307v;
	Fri, 07 Mar 2025 13:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1yXC3Xb/MwcJsrS6HKxPIosX6qAp8S61W2EzWPVkdLs=; b=Lgz4obnibvnyDjcgTZ1AqLd2zb
	AsZiwJ2FdYiMvyCFUsI66uGC334HGH0cdGlpYyAFknDsAHNRvhcN4rgo17fLWrhFiGjL4XRThwTWg
	CsMlngXiBFry440wVZHrrnxOxVp/1cVxLJhRhkQDdisV0BAURoA/RF1f3vL9UO4he3v1dC4LuMOmJ
	8bfxYx4h/l93v5mcaeuW0vug4fQe8pZXobtEWCA0XvX6u3I6o7Ie74l3KWTyW4yGS3mAbXGjDDg2+
	wy8FrifhvvaUd0bOSDMyRrO6xq2HJcYN557WPOz5OmkLK3ZSpQC0R/XnFHsPeNtR/BUfPVd+37F5l
	9PII3t0w==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXiO-00000001LEC-3Qpq;
	Fri, 07 Mar 2025 13:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1yXC3Xb/MwcJsrS6HKxPIosX6qAp8S61W2EzWPVkdLs=; b=JGPn4/aVIXPXE7o/ElfV+U26Co
	UETfL8Rcs2Wq+/+AgkMbywLJM/iE9EIiTTj34gqwImUs3UE1zT/XZeEMzktenZwlNEvt1J4v4hOUT
	AzI2q/m+ksf9wvg9aGH026Z0T1LP+nR46y9kMHn7QV3nq3rygJ2JVVOOkIZ3WG7w9Lv8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tqXiA-0039Aa-GR; Fri, 07 Mar 2025 14:25:58 +0100
Date: Fri, 7 Mar 2025 14:25:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: Enable Ethernet controller on
 Radxa E20C
Message-ID: <c7fe0371-76bc-4cb4-ade8-e22112c1475d@lunn.ch>
References: <20250306221402.1704196-1-jonas@kwiboo.se>
 <20250306221402.1704196-5-jonas@kwiboo.se>
 <e0e8fa5e-07a2-4f4f-80b9-ddb2332c27ea@lunn.ch>
 <cbd6d3ee-8ad1-443f-9506-e28240ffb09e@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbd6d3ee-8ad1-443f-9506-e28240ffb09e@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_132612_941438_B2B4C11D 
X-CRM114-Status: GOOD (  14.65  )
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

On Fri, Mar 07, 2025 at 10:16:08AM +0100, Jonas Karlman wrote:
> Hi Andrew,
> 
> On 2025-03-06 23:49, Andrew Lunn wrote:
> >> +&mdio1 {
> >> +	rgmii_phy: ethernet-phy@1 {
> >> +		compatible = "ethernet-phy-ieee802.3-c22";
> > 
> > The compatible is not needed. That is the default.
> 
> Interesting, however I rather be explicit to not cause any issue for
> U-Boot or any other user of the device trees beside Linux kernel.

O.K.  But any system using Linux .dts files should be happy with no
compatible, since that is how the majority are. Because PHYs have ID
registers, generally there is no need for a compatible. The only time
you do need a compatible is:

* The ID registers are wrong
* The ID registers cannot be read, chicken/egg problems the driver needs to solve
* The Clause 22 address space is not implemented and you need to indicate C45
  should be used to get the ID registers.

None of this is specific to Linux.

	Andrew


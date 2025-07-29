Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B163AC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 21:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wf/0uZWB4TN7Fbn1MCE47FdY12dXgDlIhEUAvFCkfX8=; b=QVLgDokqJIcWfVQSENBL0++jYf
	grEIvJjewubqhH/B8LC2Pji0GYnzvIRVkXoVs6mXXfpwoCGyRV+j2LqO2TzK+aeczXfwFz3L7ks/y
	EarXG6fwW/bWPOCQBslqPnqq5Os0/IOWSccoOrp8vtmFgns/QqHVt/4jgJbm9M9VFq+l5hUn6bfkw
	ur2zNykC1egTtJycVGCda+Mid+OBdOjyZdfkkvWgCCv6xjNdXiA6gvq5oc9VDlbi9ZN55Yh4w1qF3
	mJNzuCSO868DcTolx8v/8egwhvLv+s3SBk5D1gcbD3L5bvNBH8bTdpVNg3qjW3ZVv9WO5mSn2Ho95
	7DOMUlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugsAn-000000008br-2biE;
	Tue, 29 Jul 2025 21:47:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugs8J-000000008UR-3PSP;
	Tue, 29 Jul 2025 21:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Wf/0uZWB4TN7Fbn1MCE47FdY12dXgDlIhEUAvFCkfX8=; b=Yk5kOHIl0CLrboS9EJbYvPpeSc
	k6mNYiPGw10mcTYl2R0LlVmtxGn6x5Ib1V3bCdw6TsAlDfC4vlv30lP1XUPv5+IrbZSfm14BCVv0b
	TsgH1A5agj+hZV6Oymoe5FrNPRb1l0UkIbuoCJKR5oDNaOWZl0YLLio6sfkxKRAyJ1YY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ugs82-003EPg-Ro; Tue, 29 Jul 2025 23:44:58 +0200
Date: Tue, 29 Jul 2025 23:44:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	"alsi@bang-olufsen.dk" <alsi@bang-olufsen.dk>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"heiko@sntech.de" <heiko@sntech.de>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"olteanv@gmail.com" <olteanv@gmail.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"ziyao@disroot.org" <ziyao@disroot.org>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add RTL8367RB-VB switch to
 Radxa E24C
Message-ID: <fdb2e6f0-3732-49ee-b11d-e82f9a9cb2e9@lunn.ch>
References: <5bdd0009-589f-49bc-914f-62e5dc4469e9@kwiboo.se>
 <20250729115009.2158019-1-amadeus@jmu.edu.cn>
 <db1f42c3-c8bb-43ef-a605-12bfc8cd0d46@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db1f42c3-c8bb-43ef-a605-12bfc8cd0d46@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_144516_006022_E880051E 
X-CRM114-Status: GOOD (  14.58  )
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

> > I did a test today and the same problem occurred when running the new
> > kernel on my rk3568 + rtl8367s board. This problem does not exist on
> > older kernels (6.1 and 6.6). Not sure where the problem is.
> 
> I had only tested on a next-20250722 based kernel and on a vendor 6.1
> based kernel. And similar to your findings, on 6.1 based kernel there
> was no issue only on the newer kernel.
> 
> I will probably drop the use of "/delete-property/ snps,tso" and include
> a note in commit message about the TSO and RX checksum issue for v2.

You are submitting a patch for todays kernel, not a historic
kernel. If todays kernel needs this property to work, please include
it.

You can always remove it when you have done a git bisect and find what
changed, and submit a fix.

	Andrew


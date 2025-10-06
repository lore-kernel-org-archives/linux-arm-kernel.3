Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33B0CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 15:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lizV0k8IvCTAEiYWCtHMTokoOjYS99KwY/En0ypzY4=; b=yRzwL5MILKlLhblDIZSWhVNMT0
	R+Gpux7tJ80V6LQEJMsdxc+uNnpetGdmEc4b3zvUKzk5Q3Hn7yqOszJSqyqIepWpEyr2bklasnQjr
	AbJU3JZvv9H1iJ8NyCU6fldxP8ArcV0/zHpVxU9zjIfoa/vqkVzCA55xbt0Ih6l+BdgnDcjjkulSU
	fRD1N0Uabu9QA3uwqofStj02d1gxhSG4TaUG/hYYx8QJ5OxidTyXbIEc6/i7lEggi7JreLM3do8Xc
	Izo7Mx+UR13EV7yy1bZgjYJZeN1bdgm1DaRfgc6NSIKB/A2PJJZsqMo5mibW9fWp2YrHRVGOQnQV2
	NhwZQGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nNV-00000000JFj-0P9P;
	Mon, 06 Oct 2025 15:43:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nNS-00000000JE8-2gwa;
	Mon, 06 Oct 2025 15:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=5lizV0k8IvCTAEiYWCtHMTokoOjYS99KwY/En0ypzY4=; b=DU
	J9mxgdICTXHVmXLXd/h2dC36s8rbQWQZwud+V5Py7qhz4LGMYIo0W+pZ81un18cjeEkCf4a2cKClj
	ydermpj2SPzI1QPUzMs9WVL1LtDY1FPyTYui2JelvlPMRGQXOPPqwuGF3e537Pv9zkhzVqKVQCFmH
	P9jxMvkJaUh0bbk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v5nN8-00AIxf-9q; Mon, 06 Oct 2025 17:43:34 +0200
Date: Mon, 6 Oct 2025 17:43:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: jjm2473 <jjm2473@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, quentin.schulz@cherry.de,
	kever.yang@rock-chips.com, naoki@radxa.com, honyuenkwun@gmail.com,
	inindev@gmail.com, ivan8215145640@gmail.com,
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org,
	pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org,
	jbx6244@gmail.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add LinkEase EasePi R1
Message-ID: <6a5b9e68-4f23-49b9-b744-e84fc28a96b0@lunn.ch>
References: <20250929065714.27741-1-jjm2473@gmail.com>
 <20250929065714.27741-3-jjm2473@gmail.com>
 <5700676.tIAgqjz4sF@phil>
 <CAP_9mL6e8ekL14xycSfPmVSkL7pANLeyewWd=rjxbtMgMQXxxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP_9mL6e8ekL14xycSfPmVSkL7pANLeyewWd=rjxbtMgMQXxxw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_084354_683351_04A8BE31 
X-CRM114-Status: GOOD (  11.10  )
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

On Tue, Sep 30, 2025 at 02:20:57AM +0800, jjm2473 wrote:
> Heiko Stuebner <heiko@sntech.de> 于2025年9月29日周一 20:28写道：
> >
> > Am Montag, 29. September 2025, 08:57:13 Mitteleuropäische Sommerzeit schrieb Liangbin Lian:
> > > LinkEase EasePi R1 is a high-performance mini router based on RK3568.
> > >
> > > Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
> >
> > In v1 this patch received an
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> >
> >
> 
> In the next version, I will add 'Acked-by' to the commit message
> and then run `git format-patch` to avoid missing it.

Please consider using b4. It will automagically collect all these
reviewed-by, acked-by tags and all them to the patches for you.

	     Andrew


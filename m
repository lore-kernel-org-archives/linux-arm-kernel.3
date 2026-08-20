Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604B8C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YovAaYKiXn+Qq1GP17B+q6+CJmqK0Gm0WlW1hsq6A2s=; b=DsP/v4xTJQSbIAh7uPXelu4FGV
	NiTKrLxKlceF3PRys797+VurFfr/0qgXEMlL9xM+hO+OpRecXHNWpbRoZ/Ae7t4BvjtNOa+Ysic4O
	XqC0+PWtd7rtkXETBLJI3TsmbIIxm9VmRzgY1I9/8G++tu0W347xBV9CDZ/L+26kVIhCN7xgCpIYX
	vGQj83LSKk33e6cgTQvZmFEZvK3d8T/GGFfzRsjnDvtsTfKspk0kSIFihzqw3t2p3ty9JCwIwXwcB
	CXMxxC6alzPhjMVAs0oKc6DQ1HXINvyN3SyNS74ZDtRY9E6ppn7bvAYlQWqaLoM2by2P37LHA5t60
	h43DKjDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1SK-0000000BUsp-3Jc2;
	Thu, 20 Aug 2026 12:01:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1SH-0000000BUs8-3vtg;
	Thu, 20 Aug 2026 12:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YovAaYKiXn+Qq1GP17B+q6+CJmqK0Gm0WlW1hsq6A2s=; b=JWMrF72gutaao3Y5BH2hl/NXWJ
	RF/F4b25BTXYH3D35mR0+BQpY2M/L91uaK7npus4BQcn/4eahxD+K21x2Rw7qvpKkj1+B5QMdnBAO
	wWoAlyMzG4Mx0PjO503XGXIAGg1P7mZn4zknwdym8Gn5+GMulV10Q8ABq2LSJ3Km0lLLoSzBaiEV8
	I2x94caTEZHVBbo6iiP0dZTuQNpePphMkix6kfUP4eKHzMdcDD33387vcI4h2gUcLwqD0H6V4GSBt
	EtIYm4Q1YK9r6VfZr/tPWywueRndCqRsIRmMqwIW7MYwU7/FRgz2CzN8Dg7/q+5mNedr2uu+3CD/u
	Hsf2Hodw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vladislav Leonov <vlad@zlab.su>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simon Glass <sjg@chromium.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/25] dt-bindings: reset: Add RV1106 CRU reset definitions
Date: Thu, 20 Aug 2026 14:01:03 +0200
Message-ID: <2506382.tdWV9SEqCh@diego>
In-Reply-To: <20260814-pristine-warthog-of-tolerance-4be5cc@quoll>
References: <20260810121121.210040-1-vlad@zlab.su> <20260810121121.210040-2-vlad@zlab.su>
 <20260814-pristine-warthog-of-tolerance-4be5cc@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_050110_025748_22C7E01F 
X-CRM114-Status: UNSURE (   9.83  )
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

Am Freitag, 14. August 2026, 12:15:26 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Krzysztof Kozlowski:
> On Mon, Aug 10, 2026 at 03:10:52PM +0300, Vladislav Leonov wrote:
> > Add the reset ID definitions for the Rockchip RV1106 clock and
> > reset unit (CRU), to be used by the reset controller driver and
> > device tree nodes.
>=20
> This goes with the binding/compatible using it, where is it?

it was not part of the initial CRU submission, so the binding is at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3D713e4d54ff7369b8118f91e98a008220d60b2a5f

slated for the merge-window.


Heiko




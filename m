Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15DFCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 17:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Os2gdwgFgiG/vQXZuUM1r/XXyjqP6W0/g6mR5BtctSk=; b=4JmwkaQ76bHTsH1br+FYnRaQma
	bM/Y3nan00qMTFrE8Q780LBfXAn4p8aBjfovQSrWW7Kr1x+jr05u56gWYXKq/2RccdIxOfT+0CT3D
	MiDDGxTP8PewOYCVIHCVZXLAvANm8zvuciD3mhRw0vmXRVq+YBWETuHDAX5lRXmr1LSrs05m8mwsg
	nnlVLJD9pEaC6N2MdFel44ZSB/bbJ3revW7MBmft8SbtS25U1blAWN+k6ZNJhP+lWDaQQuWMDQF3l
	521juyNRik0fHSgKZvwa52lDgmohxp7b/zQLaVMopZx1BWu5hoBoP2P1fWZE1H/VrxhFK6kOuKgw9
	4lWF98rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD4ne-0000000CaxX-3gjo;
	Sun, 26 Oct 2025 17:45:02 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD4nb-0000000Cawo-2XwY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 17:45:01 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1761500695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Os2gdwgFgiG/vQXZuUM1r/XXyjqP6W0/g6mR5BtctSk=;
	b=WGObrId+lc+EJHIlJzN+dD7JmH64mJaxToM+He6Bg64ipj7P9PoZ51oO3eVEBKpVmNiPS8
	cKCqohngr3qvrAUcsONF/aT1AmNRoMPz6pmHrX0iTa8h17dzdC507UN3WqA6YW1YuLIYYR
	I0ZgGkQYUtAUvTeWUUO3rCuBqMOhJTOOCcvfq1alots9bWpGPB3ScyVLioV2j+vC3is/cP
	cXHRAem2rR/iS/mFCgVeXHQWCFFl0teHusYHPHYU76GZftHFY+EKoAmwzZ4M3C+Iqt2VVE
	n1Mk4v8P0S8vv50X6ix3myq3bU4MJUwtr0VN3UCIGwIHMGmeauBn9noYt0ASKA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Oct 2025 18:44:42 +0100
Message-Id: <DDSFVM1TXN8C.3JNX2M8XX04IF@cknow-tech.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Dragan Simic" <dsimic@manjaro.org>, "Johan Jonker" <jbx6244@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Harmonize regulator formatting
 for Pine64 rk3566 devices
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20251026153805.107774-1-diederik@cknow-tech.com>
In-Reply-To: <20251026153805.107774-1-diederik@cknow-tech.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_104459_937390_83E74DD4 
X-CRM114-Status: GOOD (  14.87  )
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

On Sun Oct 26, 2025 at 4:37 PM CET, Diederik de Haas wrote:
> The regulator node properties in Pine64 rk3566 devices were formatted
> rather inconsistently. To name a few:
> - 'name' was sometimes put at the top of the list, while at other times
>   it was (mostly) sorted in alphabetical order
> - 'always-on' and 'boot-on' were sometimes at the top of the list,
>   sometimes not
> - 'state-mem' nodes sometimes had a preceding blank line, as they
>   should, but sometimes not
> - other properties seem to have been added to the end of the list, not
>   in their alphabetical/natural order
>
> So harmonize the formatting by making all properties sorted
> alphabetically/naturally. And harmonize the formatting of the
> 'state-mem' nodes so they all have a preceding blank line. While at it,
> also fix 2 incorrectly indented nodes.
>
> No functional changes.

I just found some additional ones.
If these changes are considered OK (in principle), then I'll send a v2
at some point.

Cheers,
  Diederik

> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
> ---
>  .../boot/dts/rockchip/rk3566-pinenote.dtsi    | 52 +++++++++----------
>  .../boot/dts/rockchip/rk3566-pinetab2.dtsi    | 29 ++++++++---
>  .../boot/dts/rockchip/rk3566-quartz64-a.dts   | 51 +++++++++++-------
>  .../boot/dts/rockchip/rk3566-quartz64-b.dts   | 52 ++++++++++---------
>  .../dts/rockchip/rk3566-soquartz-blade.dts    |  6 +--
>  .../boot/dts/rockchip/rk3566-soquartz-cm4.dts |  6 +--
>  .../dts/rockchip/rk3566-soquartz-model-a.dts  | 10 ++--
>  .../boot/dts/rockchip/rk3566-soquartz.dtsi    | 43 ++++++++++-----
>  8 files changed, 148 insertions(+), 101 deletions(-)


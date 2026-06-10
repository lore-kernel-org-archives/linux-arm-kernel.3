Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49534CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ug7T5MCyWOrBz7+vEzcRwNA8uq82DdVzduyuYbrljug=; b=F55/VsC9eozpmMcMEyW/NSPVYW
	9ISLqOCQhI0urIKD+9RD5AxHmaQLv5uiQHJai26KUxmI2fRwClCsTmB9sPaQhpuXaEQ7L31pCi099
	5kipoQGGF8imWPJk7Kz6iJ7Sn0AiO/pg2NLq9bal90eWr0oIUWQFFojcC1MII8+KTNf7wj/Kf6ZE+
	5HV040UK4Cps4Bi1DTwPDzzf61joSr+dH9Foefp+MW0jMCPaPG/eVJxpcglEoe++kp9hzLopcp6Mg
	HW/z0gNgBOWS6TleauM/X81yfkv2gl5sNT0g3hGQM+KDXJIMeo3C5BlJkHJdJIawR8LS884MYL1fw
	cLqHzdhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXF4w-00000007C4Y-38zZ;
	Wed, 10 Jun 2026 09:18:30 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXF4u-00000007C43-2KaC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:18:30 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1781083105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ug7T5MCyWOrBz7+vEzcRwNA8uq82DdVzduyuYbrljug=;
	b=cG5a62YZ/AkUIwamW+e2RmoL/AJIB9UDW5YcxkiElVFBeBc8yyX0u15UgZgPl6GYb1gq/B
	duoL1i1F3AphaV2L68ndc90K4z1ovFJZDbr5WEBf4MYGtuNcwehEDzQHXlSBEp6vLqHhSm
	FssBXKsCLQle0f3fb5n6QW54TmVxaPeUkuaKDOpG3h11kZocmpl5yeP6dR8smVn+zmrnlh
	XWeodjwwjcJDtBaxE4AznxNsYkxpz9h3X3yRXwWgoAjKwBjmnMSlvaJssOPzYKDQXTH0Cx
	ShZWHzhmRjCemulQUUZaAaZd/lK9YORE9Dydo2Tl+rzgfXGPWy02YWfAlV6vXg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 11:18:22 +0200
Message-Id: <DJ599LMGW2UX.12U9YA1MOW7O0@cknow-tech.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Marcin Juszkiewicz"
 <marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH 0/2] Cleanup and fix for NanoPC-T6 Plus
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20260610081400.758687-1-diederik@cknow-tech.com>
In-Reply-To: <20260610081400.758687-1-diederik@cknow-tech.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_021828_873020_DE7442B6 
X-CRM114-Status: UNSURE (   9.28  )
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

On Wed Jun 10, 2026 at 10:14 AM CEST, Diederik de Haas wrote:
> Several nodes were enabled/configured when support for the NanoPC-T6 Plus=
 was

s/Plus/LTS/ in Subject and here ...=20

Still working on a submission for the NanoPC-T6 Plus ;-)

Cheers,
  Diederik

> added, but later those same nodes got enabled/configured in the dtsi file=
,
> making those in the dts file superfluous, so remove them.
>
> The MTT USB 2.0 Hub is connected to USB20 HOST1, so the phy-supply belong=
s to
> u2phy3_host, not u2phy2_host as that is for USB20 HOST0.
>
> Diederik de Haas (2):
>   arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS
>   arm64: dts: rockchip: Fix USB hub phy-supply config for NanoPC-T6 LTS
>
>  .../dts/rockchip/rk3588-nanopc-t6-lts.dts     | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)



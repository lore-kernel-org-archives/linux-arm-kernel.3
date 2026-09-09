Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1B4C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcb9YfER4aUun+/mAP98cPCcTZEZi5P+UMZaPdKako8=; b=ef6nDbHwL2R/Yi5pXTpKmnnBCA
	rWe8GyiPPZaocjcFS7fw2hhYgo9dd49G7vYkDdMYBJ/XugLFbm6Exixio/UHIUw/Wae/ycwKe8nCB
	NYUWi97dH2UMU73HQdwo781BR5xTiiNTujv09YnsWYpecKzCcoE0gW8LtW4tJNgovXaGp2b9C4n3x
	7EQ0Co8T06U91mBhFwLK2zgQdIw3eVwKUUKAm4MK7GtFwKuYZofmIOSNuSLaU8t69apT+naBp8IJY
	GjwQS2VMwJofYM+/G3N4uzM5AwHdeCz2uCxrMW7dFOAyElX9GymKrOkg/r+/eu9O/ia3Qoox1MNQh
	qkd9eXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FZA-0000000BQuY-39PB;
	Wed, 09 Sep 2026 10:30:08 +0000
Received: from out-19.mta0.migadu.com ([2001:41d0:1004:224b::13] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FZ5-0000000BQt7-0baB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:30:07 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=S1uOY2Lbxqeick8URdu0hldNgRFplEY0Z+aGMt8MGNs=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788949797; v=1; x=1789554597;
 b=DUg2nMjyD+rufCB208yH/cYd6cq0PSsmYvW1MQ9u1zU34PQN5ZMR+5D3IyVgshbAEOQdjkJo
 d0NL2hWP6nAz/r3rHvD1CMXdzAtSymDzEGCT7lNqx+16KUelg4S4BlSZ7x8dATZgqt2/8tjrmGX
 2GqwdL+FDJqP6YUD8d9QpcoOxQqcD0BHK8wUJmLR1F6nt7aHyUukq0mV5e7aNXax+2R5SemH9uS
 fgjTAJoUtUrS1GsYDshYE1XkTbx+Seth/tWA0Gy27iN6S6qLTknQ88/W4GRUL5kigrY/Khsh8Vh
 i5RVfgwQXMnA8DmZ3N/hB3e9NSemoEbY5FFPUyzD4akKw==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e2b854a189f54564;
	Wed, 09 Sep 2026 10:29:47 +0000
X-Mizu-Trace-ID: e2b854a189f54564
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 12:29:47 +0200
Message-Id: <DLAPRUR4Q73F.1KIBGA408LQSJ@cknow-tech.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Andrey Korshunov" <razor1702@gmail.com>, "Heiko Stuebner"
 <heiko@sntech.de>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260908235824.665-1-razor1702@gmail.com>
In-Reply-To: <20260908235824.665-1-razor1702@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_033005_699259_874DA0E2 
X-CRM114-Status: GOOD (  10.55  )
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

On Wed Sep 9, 2026 at 1:58 AM CEST, Andrey Korshunov wrote:
> The NanoPi R28S is a router board from FriendlyElec with the Rockchip
> RK3528A SoC.

There's already an attempt in the works to upstream NanoPi R28S support:
https://lore.kernel.org/linux-rockchip/20260907-r28s-upstream-v2-0-21ab570f=
c91c@proton.me/

Cheers,
  Diederik
>
> Signed-off-by: Andrey Korshunov <razor1702@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index a799bb843..1d937795a 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -340,6 +340,11 @@ properties:
>                - friendlyarm,nanopi-r2s-plus
>            - const: rockchip,rk3328
> =20
> +      - description: FriendlyElec NanoPi R28S
> +        items:
> +          - const: friendlyarm,nanopi-r28s
> +          - const: rockchip,rk3528
> +
>        - description: FriendlyElec NanoPi R3S
>          items:
>            - const: friendlyarm,nanopi-r3s
>
> base-commit: df2908090cda368b01ff43709f51890076c56157




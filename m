Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DAACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VE6qGcpOBptbfyWtsDbPdbSi5iQYynI3yhAWfcylssU=; b=jCTbmqQcaZPO3cTl90Gc89MDCT
	3sxSN/4q8UaKFLD/+6LcDlhgx+vpUrBZqgyasVftTB38jmp0erL6Ljpb+53ZMhwmSwXm0ooORTaEy
	wz0OAfvPOPvFkdBlpSqQbF2HocjDLfdLoLS2+VFZTPYrZ8+1KzyOflhB5psGeH97cQcU2BAZ4JQfD
	aqsMf6f6HGvGm3zuUo77BsoS+lunCd8XY6OFswX1jOJ6Wfo+HPARoMM32251DMmRJFm8DqgtgRB3m
	oiamWj6qPpFy5FugO5tzHknAlESDxpFUWG8ipmhsZNe5RXwuKvJR18Gtz9RsSV39t8fRXbFKnFxAC
	ORbShrXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfu-00000004VZC-426E;
	Sat, 23 Aug 2025 09:36:38 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upYrC-00000003Sw7-08xM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 20:59:31 +0000
DKIM-Signature: a=rsa-sha256; bh=VE6qGcpOBptbfyWtsDbPdbSi5iQYynI3yhAWfcylssU=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1755896360; v=1; x=1756328360;
 b=Fb/QHsdNqricuj3bK2V+FKhmpwu4jcDsV2yXmFGeltNEurS1jCPTBcPPwaC9TlikZNxye+NC
 87pJCNNEelNcsu77cJXshgdZEtBN+t30qGUijM3vjo9jKpPbfiiFHvaGejuKRtP7plDXfs9MOsD
 jHZ0BgPLAqvuaqk+p8RgObq4yJHzPKuJ3pd3K6AUI2EWB6UR0x8oKKdJcbjPwzuIw/qOt+/DM7C
 lC/mpaQyujSqaaDKilZUdqEy+LTEjwjCGq4ZIVEWNMIHVUDBCsa9Sj7duz+lzJM3P7OroO/MU0w
 GsoQ/ECyheEOc8nosjC2Vxh7Y0BRYb09lsHUzjXUNWcoA==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 17a16cd0; Fri, 22 Aug 2025 22:59:20 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: power: Add Marvell PXA1908 domains
Date: Fri, 22 Aug 2025 22:59:19 +0200
Message-ID: <5013342.GXAFRqVoOG@radijator>
In-Reply-To: <20250822193624.GA187008-robh@kernel.org>
References: <20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz>
 <20250821-pxa1908-genpd-v2-2-eba413edd526@dujemihanovic.xyz>
 <20250822193624.GA187008-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_135930_221524_675C27B7 
X-CRM114-Status: GOOD (  11.42  )
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

On Friday, 22 August 2025 21:36:24 Central European Summer Time Rob Herring=
 wrote:
> On Thu, Aug 21, 2025 at 01:17:44PM +0200, Duje Mihanovi=C4=87 wrote:
> > Add device tree bindings for Marvell PXA1908's power domains.
> >=20
> > Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> > ---
> > v2:
> > - Drop schema
> > ---
> >=20
> >  include/dt-bindings/power/marvell,pxa1908-power.h | 17 +++++++++++++++=
++
> >  1 file changed, 17 insertions(+)
>=20
> This should be squashed into the previous patch. The Reviewed-by stands
> with that.

Should the resulting patch have a 'dt-bindings: power:' title prefix?

Regards,
=2D-
Duje




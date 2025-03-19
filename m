Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DDAC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 19:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHQ3Ngz9cNLQIGQBw16DZBzL1L0whpDC6ssfPJFBJJM=; b=NCPJ0ScAnjcZMvxmpmJRSmjxD/
	AfQ9mAe4Ho1JZPHCWQO9GgaRcNerh8H9iFRUHamIDjrpX7SSe3rC1mOPaFEs3YBWoawkAs1tug2BE
	FaWDl9YxEPShHluNkmhYacKMOjPwhKeTWRhx+A4TZKEfwm6GVNp9fNDHqhWal4yFNiL/FUbXkZxaC
	RoOL8+phWt2Vky5rYbPlztOXU9yO6dhIDZ47QtCclN+Rd93Oke9h82HzH1gD9Nhfn5VrGzm1RL2+n
	/PGbfyOCcH2JJQTsFJf779PjLjOKwTWBkRic1NFFJSJSZz6Am2wATICpjErYpwJ+YdKQtED37O3lV
	H4P9RaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyqu-00000009vT1-35vh;
	Wed, 19 Mar 2025 19:13:20 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyk7-00000009uR3-0KjE;
	Wed, 19 Mar 2025 19:06:20 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1742411176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHQ3Ngz9cNLQIGQBw16DZBzL1L0whpDC6ssfPJFBJJM=;
	b=r1g/wOmqJPq1TMuu/XCjqxm9Zku1seTSsX6OX+DmtuZzslvAmn8XspEXWuAWAnV8pZUH2b
	8FpgGcss8pWSihofzHpqjjwfaxTyGbWOx9SRDo4EF7NAeCto+FkKzNlQbbn0kU7tclV5hC
	HeiSHhvJwdc8dCNe8d1CnhwodWoodcY8B943c9p3133YtvVPO4DytPy6p2Yhy2HmDXubJN
	4IrGwM6I6tFXhpo3nGHQGQVVmd8AA9hdYPtJeXPjeKhBGQzCETL0ojpWor9CNcLTvFZ4wm
	ZpEKg0O+aoi4pjxU33Wy5dr5kuVw5furP+u32rKisVFNDCAwA4/MBsvSfWmkKQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Mar 2025 19:05:50 +0000
Message-Id: <D8KH7CDPMWDS.396O6X214BX59@postmarketos.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>, "Christian Hewitt" <christianshewitt@gmail.com>
To: "Ferass El Hafidi" <funderscore@postmarketos.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v5 0/2] Add support for Xiaomi Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
References: <20250319190150.31529-2-funderscore@postmarketos.org>
In-Reply-To: <20250319190150.31529-2-funderscore@postmarketos.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_120619_258610_7EB9DF93 
X-CRM114-Status: UNSURE (   9.26  )
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

On Wed Mar 19, 2025 at 7:01 PM UTC, Ferass El Hafidi wrote:
<snip>
>
> More information is available on the postmarketOS wiki page [6].
>

Which would be https://wiki.postmarketos.org/wiki/Xiaomi_Mi_TV_Stick_(xiaom=
i-aquaman)

Sorry, forgot to put the link.

Regards.

> [1]: https://lore.kernel.org/all/20250203174346.13737-1-funderscore@postm=
arketos.org/
> [2]: https://lore.kernel.org/all/20250203091453.15751-1-funderscore@postm=
arketos.org/
> [3]: https://lore.kernel.org/all/20250201193044.28856-1-funderscore@postm=
arketos.org/
> [4]: https://lore.kernel.org/all/20250131200319.19996-1-funderscore@postm=
arketos.org/
> [5]: https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-marti=
n.blumenstingl@googlemail.com/
>
>
> Ferass El Hafidi (2):
>   dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
>   arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick
>
>  .../devicetree/bindings/arm/amlogic.yaml      |   7 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../meson-gxl-s805y-xiaomi-aquaman.dts        | 292 ++++++++++++++++++
>  .../boot/dts/amlogic/meson-gxl-s805y.dtsi     |  10 +
>  4 files changed, 310 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aq=
uaman.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi



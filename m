Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B8BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	From:Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZ3MU5Alwy2jOdKOqGh+Wgi75fgSkITzfd+ri8LOY3o=; b=1UUjalaaD9l7fU4S65lx5TVV0K
	YKJDbbEj7mpYB8kADMRmsJtckpxf42Qxth+tOH0Bjyf0z/4oxv8zt87yVFKummsLOsgOwOiCFayrp
	E3RxBUC+CMDtl7CasIJi6YSVjmN8Tdwe+fQHiM9fYP7E5cR7ajOE8Hc385MxA5htOV6VPQjaWY5YD
	2m33UJbFvR01Q5LBzCwCBro25S1ix8+2T6h0h5x/4qQa8VOAOFKrLMWHNGD7HU5x68H3aRuMvIshi
	QtNJeSy1zcj38o1H7OLT4BEkPF1LBNpQ43IkEOj3FaTC6xrhtmdM4qY5ZTRJOK/0df+ExL6hffzi7
	K/QT7sCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesfF-0000000Eyqz-0Yxu;
	Mon, 03 Feb 2025 09:22:45 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesaS-0000000ExuO-2gQW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:17:50 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738574263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZ3MU5Alwy2jOdKOqGh+Wgi75fgSkITzfd+ri8LOY3o=;
	b=XekN5ZnQzXVYdJE3CcYaapzKa2Kf+/Hikgg9TZHzdWkN0hdjEAbOTXyDB8ZJSOOLXXPyqU
	o9d0PSXbNEHynQkYfxqKwsgDkKa3cadPWHcfQNGfIzDMBycbwSQ+gg246IdtGtMxmENoNC
	DHaJhOL2JOkRsbjnCsENVNaosUXHeQhFOv5NC8nHc+HtANvdwjfj/LDbwpP05o7ftycr2/
	s4FyCnOAhIzxcwV8AVUbvzb/FjI7SVmaImOnBm8m9edCAiYQcOVdoihx0A+9VRb2mgjTsz
	SHy4DA5qMAvfRRE+aHQ/LL/GDzSHKVs/i8AsNacCXx4I3h61NO+50PyypzWIxQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Feb 2025 09:16:50 +0000
Message-Id: <D7IP4ECJ9XM5.3JSGHFAI75K9M@postmarketos.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV
 Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman"
 <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>, "Christian Hewitt" <christianshewitt@gmail.com>
References: <20250201193044.28856-1-funderscore@postmarketos.org>
 <20250201193044.28856-2-funderscore@postmarketos.org>
 <20250202-wisteria-rook-of-intensity-6fecfa@krzk-bin>
 <D7I0F3OMXALB.1ZT1G03JTKSEZ@postmarketos.org>
 <56ec442d-54b3-404a-a10b-763a00e7099e@kernel.org>
In-Reply-To: <56ec442d-54b3-404a-a10b-763a00e7099e@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_011748_818528_FB4344BF 
X-CRM114-Status: GOOD (  13.00  )
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

Hi Krzysztof,

On Sun Feb 2, 2025 at 2:07 PM UTC, Krzysztof Kozlowski wrote:
> On 02/02/2025 14:55, Ferass El Hafidi wrote:
> > Hi,
> >=20
> > On Sun Feb 2, 2025 at 1:54 PM UTC, Krzysztof Kozlowski wrote:
> >> On Sat, Feb 01, 2025 at 07:30:43PM +0000, Ferass El Hafidi wrote:
> >>> From: Ferass El=C2=A0Hafidi <funderscore@postmarketos.org>
> >>>
> >>> Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka=
.
> >>> xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
> >>> few minor differences.
> >>>
> >>> Signed-off-by: Ferass El=C2=A0Hafidi <funderscore@postmarketos.org>
> >>
> >> Please run checkpatch. You have from/SoB mismatch.
> >=20
> > I don't see any mismatch.  Maybe it complains because of a spurious
> > non-breaking space?
> >=20
> Could be, no clue. I copied them to editor and it also sees mismatch -
> both entries just do not match.

The From/SoB mismatch should be fixed in the v3:
https://lore.kernel.org/linux-amlogic/20250203091453.15751-1-funderscore@po=
stmarketos.org/T/#u

Thanks.

>
> Best regards,
> Krzysztof


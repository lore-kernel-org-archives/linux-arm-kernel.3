Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AAFC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 19:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdUpktaT2gX2CFPhryadTKFXcXwjP0lNYT9ptGL5Ero=; b=nUtUixu6K6R+tVB4xVvkNGd3wb
	xnWsvWjbTg4OBWjYCIcJHfhPI8K6qVuGv3yelcpqa2y7e9kgIfMa6l5S2LxfE3wIMaSW76x1TW582
	0JACNiRZVbZNTc7ZETch3NXPqH0TQZJhfr1E2WzLxpYDTl/Vi1tgzA9DKgFV9g9yEd3LbZKaaJ/bc
	zadHKdMzsuvM04agAkQy0RiHXCFxkgOczV55KLoXsox/xF1rHinVUzzi6jAXCVFBm2076QZ5apN3V
	8giO+Nu2CCUQOESBWSHduBxk4Y/2ibLWeAoq/MhFaNpN8iyhMGjgz1a+MPTYcYdblBYRnXy1LpvDW
	f8iUEArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukTAe-00000003ZKg-37Ji;
	Fri, 08 Aug 2025 19:54:32 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukT88-00000003Z2d-0zvf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 19:51:57 +0000
DKIM-Signature: a=rsa-sha256; bh=qdUpktaT2gX2CFPhryadTKFXcXwjP0lNYT9ptGL5Ero=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1754682705; v=1; x=1755114705;
 b=FwqlN8NAHSWMHPWImW/qCeBBypphh29Fvae2amh997SZV8FG1egAwUkT8FL1GgXqTn4q2iwQ
 /kyfnHPdWEAbwqgvMeqnP/LgTJs9LhXgdtelqkz4VIlyPZ0vqk7CjDNBjLrAq8lWoEuSE4SgJ5j
 2xgL0xif2573ngFwGRjxWB7cbN8+IKMbrjQfJfr8g/TCj9k3DlIL9CDxp5XuKYv2KWjWfJBkUoQ
 osu1EaE7Yi6W3z4EScUg2i6ALlRfcwRiyYptDRcTJ31iv3eJfx3yS3XS/VrGmcbKjZffQOYNWD/
 g1U0jMCC6FxYWCqR7LS9XiECNiF+Ix7GYD1AdvFDLdT9Q==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id be47afdb; Fri, 08 Aug 2025 21:51:45 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, David Wronek <david@mainlining.org>,
 Karel Balej <balejk@matfyz.cz>, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] Marvell PXA1908 power domains
Date: Fri, 08 Aug 2025 21:51:44 +0200
Message-ID: <3650391.iIbC2pHGDl@radijator>
In-Reply-To: <20250807-avatar-comply-30aa8001aa82@spud>
References: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
 <20250807-avatar-comply-30aa8001aa82@spud>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_125156_427470_61D2CAEC 
X-CRM114-Status: GOOD (  14.88  )
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

On Thursday, 7 August 2025 17:40:28 Central European Summer Time Conor Dool=
ey wrote:
> On Wed, Aug 06, 2025 at 07:33:19PM +0200, Duje Mihanovi=C4=87 wrote:
> > Hello,
> >=20
> > This series implements support for the power domains found in Marvell's
> > PXA1908 SoC. The domains control power for the graphics, video and image
> > processors along with the DSI PHY.
> >=20
> > The series is based on master as the MAINTAINERS and device tree patches
> > depend on the very recently merged initial Marvell PXA1908 support seri=
es.
> > That series can be found at the following link:
> > https://lore.kernel.org/all/20250708-pxa1908-lkml-v16-0-b4392c484180@du=
jemih
> > anovic.xyz
> It's not clear to me, nor mentioned anywhere I could see, why this is an
> RFC. What are you actually soliciting feedback on?

Apologies for that, should have mentioned it right away. I was unsure
whether I was handling domain clocks correctly, which is one of the
things Krzysztof since commented on.

Regards,
=2D-
Duje




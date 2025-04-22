Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D9AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4Yu/0eedyirCVG2wNYEo4XaHlcrDummMxSyiwWhFHQ=; b=Av8PfT7zjSeRWD/edDJeRrwMLE
	cPwahNtfHziNQlbIXqEf2Zr0sanP9Ff5wxTSChmZVeHb/HfuYwHaxxhYbSr5JKeNsjdUOy8B7kmYv
	GYvTFzoNeR2SXG3BfvcJHVenvDnD72j0D/VacIYn5QPVzLrlM9sPdrRGE6WkgyRxma++V1EIjJ/wX
	G3TRz/40zpvy5mIwW4gjhPERKuA2Q9pCPAkDoFVMenQSrpUCDjQ8456+2ICp6ENKbvDfcbkk6IJIL
	M7doKm4CjIz6qwD25kfVe/TZqQjTAZwwPutFGxkcLVkdI8NoINWp/Z6GzFYo8uI4IVJOmXWG+hI2G
	5yYACLUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79j4-00000006WSg-0gOz;
	Tue, 22 Apr 2025 09:15:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78SI-00000006BpX-01u6;
	Tue, 22 Apr 2025 07:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745308447;
	bh=s4Yu/0eedyirCVG2wNYEo4XaHlcrDummMxSyiwWhFHQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ODXopuCIQWF5J/3tiGk80rrxR73WRS0SHN2K9NjeAcfVlyCJsmSxNxC5iyfX1iYCj
	 JdhgZI7dLSuc+ZrTBJRA4SZub65pc1V2k6PWyItWbXj1G9kPzITt0mVs4tt5P4RUtc
	 ZEDEqxB7QsaeIlOUQFPz02eIkQsZU739jeuXF4UjVjpX4EVcTw/tDYl22wzHie0D+l
	 4chO/6uzAiM9Kd510GFxpOm/0hw7sVoEWq3sl63it9qEZP7X8LgIjqOVOMamjERpul
	 G/CarlWfJFUCgoYrYd8EenVq0ZehmV6nolBtYL8m4725vVx1JXHZpuRKQ14vExDpvf
	 dwfmSW77ufowA==
Received: from apertis-1.home (2a01cb0892f2D600C8F85Cf092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F1ED917E087F;
	Tue, 22 Apr 2025 09:54:06 +0200 (CEST)
Message-ID: <f0ff95074b74eb3e7fb5832ce83568a07974b67d.camel@collabora.com>
Subject: Re: [PATCH 4/6] ASoC: dt-bindings: mt8195: add compatible
 mt8195_mt6359
From: Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	 <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Date: Tue, 22 Apr 2025 09:54:06 +0200
In-Reply-To: <8ffa4ba2-6d22-4ca8-b5c9-04f91d45456b@collabora.com>
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
	 <20250417-mt8395-audio-sof-v1-4-30587426e5dd@collabora.com>
	 <8ffa4ba2-6d22-4ca8-b5c9-04f91d45456b@collabora.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_005410_193421_2A50CA30 
X-CRM114-Status: GOOD (  10.51  )
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

Hi AngeloGioacchino,

Thanks for the review.
On Thu, 2025-04-17 at 12:20 +0200, AngeloGioacchino Del Regno wrote:
> Il 17/04/25 10:44, Julien Massot ha scritto:
> > Make it also compatible for platform without external
> > codecs.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
>=20
> For the next time - please remember that bindings commits should come bef=
ore
> driver changes :-)

Since I'm about to send a V2 I will reorder the patches the correct way :)

Regards,
--=20
Julien


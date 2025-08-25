Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9345CA0FEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 17:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkjkbY+huenOf2R0Uu+UDRhWYT33+BX0joR0dNvMVOY=; b=wrRs+RVoE/aOfND6aNkZkqEUK9
	xrBAfvYpJOaiaEwEZ60Fyi+BXLZonN169lqD8dHv1d8MKEN81U4bk60wiGVmdFI3rJhbSYFXOgh39
	cv4fpdLvLdZRcPp/j13vvZaGysO1YQ5/Bx5UiY39kq/pjzc7oKxDCkKNhGxwxO9a72tgnPgomofnO
	L+WKXOmR4LLEtotNTZbIohzOvme4uM558PdMYeq+IXkSY53cnu0XmOlMKsslGVAZE/fPNgygub3zf
	a1mIdXxocDEdklpur73sy3DZyWDKvueKciw2VZNis4wdL/8bpKCWYVAyNxzxo4I6R1txfbwHkpTZk
	61HgVF4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaYi-00000008kHO-2Ap7;
	Mon, 25 Aug 2025 17:00:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZa5-00000008b8m-0loL;
	Mon, 25 Aug 2025 15:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756137479;
	bh=J5bupA+heQtL5Wcp4JAPKY1z0JPnUwdB+YBwuYoNau8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=E3+JVySOtDo6B73FegZ6Or80M/ila2fRd1xu2TVpmdEKV9Sc/1jbhYN+Iic29PXGo
	 ImJeCh0eMufQ8BWvZ/gXuqKyQQP79mjfpwEY1P8VUEMsz5UwauFcm7kPxheNobMKec
	 NyHFDDwFCs1N3p1feTcjEZK+bSrPSbd5gsDYVqJG2Kd9B1o82RnzEAOkJu9j25SwMc
	 Hiv0f6eatIri3ZDVVflvsaROY9xNzvxaDkvOG5o61OKcKhBPq59cJ2ITFzx8I9Ab66
	 qWC0Yn5VFl4k+YA9E5p7XZO8m8uF4RD4Al07heeqORCxhtPYonbw2jvJBUAnV2L7aY
	 ik/bz0vcVCXFQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600C8f85CF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 22E0C17E07FB;
	Mon, 25 Aug 2025 17:57:58 +0200 (CEST)
Message-ID: <c3b6c0ff993b7ebc9fb8abd8104b537f0c7f5fb3.camel@collabora.com>
Subject: Re: [PATCH v2 0/6] MediaTek devicetree/bindings warnings
 sanitization second round
From: Julien Massot <julien.massot@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>,
  Enric Balletbo i Serra	 <eballetbo@kernel.org>, Chen-Yu Tsai
 <wenst@chromium.org>, Weiyi Lu	 <weiyi.lu@mediatek.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Julien
 Massot <jmassot@collabora.com>, Sean Wang	 <sean.wang@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, 	linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 linux-sound@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Mon, 25 Aug 2025 17:57:57 +0200
In-Reply-To: <d02d2a5f-b8d7-4fdb-b3c5-6e6d21127733@sirena.org.uk>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
	 <d02d2a5f-b8d7-4fdb-b3c5-6e6d21127733@sirena.org.uk>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_085801_380020_FDB15CA5 
X-CRM114-Status: GOOD (  17.60  )
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

Hi Mark,

On Wed, 2025-08-20 at 15:21 +0100, Mark Brown wrote:
> On Wed, Aug 20, 2025 at 03:44:51PM +0200, Julien Massot wrote:
> > This patch series continues the effort to address Device Tree
> > validation warnings for MediaTek platforms, with a focus on MT8183. It
> > follows the initial cleanup series by Angelo
> > (https://www.spinics.net/lists/kernel/msg5780177.html)
> >=20
> > The patches in this set eliminate several of the remaining warnings by
> > improving or converting DT bindings to YAML, adding missing
> > properties, and updating device tree files accordingly.
>=20
> What's the story with interdepenencies between the patches in this
> series?
>=20
> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.=C2=A0 Doing this makes your messages =
much
> easier to read and reply to.

Thanks for the feedback, and apologies for the long lines =E2=80=94 I have =
fixed
my mail client for follow-ups.

Regarding interdependencies in the series:

  * Patch 1/6 can be picked up independently.
  * Patch 2/6 is standalone.
  * Patch 3/6 depends on 2/6.
  * Patch 4/6 fixes the DTS node name as expected by 3/6.
  * Patches 5/6 and 6/6 are independent.

So the only ordering requirement is that 2/6 should land before 3/6, with
4/6 included as well to avoid introducing a temporary new DTB warning.
All others can be applied in any order

Regards,
Julien


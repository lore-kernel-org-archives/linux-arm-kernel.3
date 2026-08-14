Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90F1C5DF69
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CyJvTE+C18+28hqN3SKsvblt/DEqcy8hmgnnZ6dd/s=; b=uD/TXIljB3KAQDHy8AAu98T8sy
	qIBPaf1G2Y0+lIDi/2Fp722XVCASIvhrFr3Ti+EjwB/wLydAj5F8NECLmcKGEGWqLpaEy3xpj8DYP
	zgwnFyVcxZ3TJnwOwLBv4b4GiC5V+iB/eZdJZKI/EAu8YGRsyq/cETOaOFafLz5+neUT/iUgdPG7I
	AtlSTsOiloYFoDICoS1rmGEeozKL1IJx44bS4o90gR631Gk8M1Gwp6jx0fqGIa6qR7V6vr0nK+xCh
	5Jiqg5nrW7QcoHEF10RI/m8X0TUNymBiMmheIzhlOflav3SxwIHhjr3SNEMUkuVOxIl8uRYGU6oTt
	m7TTp0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurRs-00000002gMp-2ck3;
	Fri, 14 Aug 2026 12:55:48 +0000
Received: from mail-24426.protonmail.ch ([109.224.244.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurRp-00000002gMB-2cp0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 12:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786712140; x=1786971340;
	bh=5CyJvTE+C18+28hqN3SKsvblt/DEqcy8hmgnnZ6dd/s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IOAFiCvOuY0ejXPK4bAzT4AU+PGHAGgoIV9Sy2zFNgzy7K6uJeFB5UB4+RQuc1Twf
	 Vt8I3eeTRc+ipNv+bnvM5WA2kNNO9KddSadf/WgvudTQ2p/5/SzOx0GFVRR2R/je0V
	 WWTQcC4Siv1BrugLahM6nNnBadVZmQA/AjJS22l0vnxTfOLDUDMhthoG4cOG4vOgBc
	 dLCxzG+1xc3FWQA32AI0d0aFHEPzta5PTU4X6F1I9MX36CzBGgyKtzmg5RExonfOR8
	 G0Pg8vlhKzTa59a8a7Szzq2a//c4ToKUp8A/e3rrq8tchkJCwPI3r42kLoNpJxQW4u
	 qKyfG6bFhMghg==
Date: Fri, 14 Aug 2026 12:55:32 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: gpu: arm,mali-utgard: add mt6572
Message-ID: <47r1iD-p_AVnHH7YeiXxNHnX9o8zmOaWUvLivra1vGyPngBdfaTKUtwGb_OAAwnW0-mu41sICz2PoKyCw99AACkhjt7XtyQp3_40jLMAUKU=@protonmail.com>
In-Reply-To: <20260814-portable-premium-avocet-eafbe2@quoll>
References: <20260810-6572-dt-mali-v1-1-fb908627bf23@protonmail.com> <20260814-portable-premium-avocet-eafbe2@quoll>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 2dc330e17f8b88bcaf3ae0dbfe5c2b4bce6048c8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_055545_859763_CBF87189 
X-CRM114-Status: UNSURE (   9.33  )
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

Hi Krzysztof,

On Friday, August 14th, 2026 at 1:36 PM, Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:

> On Mon, Aug 10, 2026 at 11:16:19PM +0300, Roman Vivchar wrote:
> > Add a compatible string for the mt6572 Mali-400 MP1 GPU.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>=20
> Does not come with resets?

As far as I understand, no. Vendor kernel says there's a reset, but
toggling bit in the reset controller doesn't crash the GPU. I assume
android kernel has copypaste leftover and the bit is reserved/unused.

>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> Best regards,
> Krzysztof
>=20
>=20

Best regards,
Roman


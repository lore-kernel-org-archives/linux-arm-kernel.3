Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF87C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdR6EPiemGpohVq7T8ccywqpepfo1bqholedAB1HuL8=; b=tx1K8KjUMpmqgE6j4so4fI6gLe
	dGDANWFlrQhiQtuXWjavOA/cBWIc6ET8h2FP+hU6weh5LJIhBNunPFY10F7xaMUolZ8zcKm2Zlt7P
	ofH7cal1TUF2mXXfVqTMSwxkPjSfbjmgJHq4J9OuDmnX+7MT2a0LJs7wvh/ujpNYIfZDTBiFVxRAy
	Mu4MWVnYnFdLWbk9hHY+tfDiLnriheSIlRmLh2Cbv79qohkDop1Z0kDfxJBvghaywZfPVNDnc2rAK
	2n+6NQeBZhBdw0PE9qSKMtC2PiDzvHIRMLaxuT8rjbSH+xEGXOmpp3nb/+zwFmqhy9fDrk4QYmk+p
	uyxGYhyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqwz-00000003MuW-1xVu;
	Mon, 07 Jul 2025 18:52:25 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqhQ-00000003Jp8-0ubH;
	Mon, 07 Jul 2025 18:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=TdR6EPiemGpohVq7T8ccywqpepfo1bqholedAB1HuL8=;
	t=1751913379; x=1753122979; b=qeqq+7o5fEFKuAcI1MQogfw5uP6euQLaPkYQy4lQ0LkmFSy
	W2rIOf3qEUGcFrOZaTNbEbavdL4Lp/ZvJsmjrJaxinHJZT2rM0P95Eq9mEIn1KtmGR9xPn8mxVnMN
	6MjH2ojfNFMl15fnKeVDVQorggXsWwfiTibbQxKIZo2fsCtlqBGZ45QKNFnigyEzBYBv6RaRGfcQA
	r2Qkpyf1jk5R8t0SJUh+cfPyRuQKjkDEb3j1+hDhJp/Bh3yZU0oKTmorWU8nv3B17iCCy020beoTI
	Ph9D/XDqLoXz3fxsIv9ghoC8p21yniaiikWjaRNgY8tyWVI21mXcEhEmcOSakt1g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uYqhJ-0000000ApJ4-2NVt;
	Mon, 07 Jul 2025 20:36:14 +0200
Message-ID: <b3a63d616c1ca337f6b9d14a9afaafe73bfbe8cc.camel@sipsolutions.net>
Subject: Re: [PATCH 0/6] wifi: rt2x00: add OF bindings + cleanup
From: Johannes Berg <johannes@sipsolutions.net>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, yangshiji66@qq.com,
 ansuelsmth@gmail.com,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka
 <stf_xl@wp.pl>,  "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS"	 <devicetree@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>,  "open list:MIPS"
 <linux-mips@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"	
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Mon, 07 Jul 2025 20:36:10 +0200
In-Reply-To: <CAKxU2N9vs5o4tj-9KxCHKevWU+J9wv+ZCOeD8o602y1GY8FzNw@mail.gmail.com> (sfid-20250707_194212_070361_0730191B)
References: <20250706214111.45687-1-rosenp@gmail.com>
	 <8c6f18ca47bf0dd78b6675d8b94000679b6c75cd.camel@sipsolutions.net>
	 <CAKxU2N9vs5o4tj-9KxCHKevWU+J9wv+ZCOeD8o602y1GY8FzNw@mail.gmail.com>
	 (sfid-20250707_194212_070361_0730191B)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_113620_284172_82884E0D 
X-CRM114-Status: GOOD (  12.41  )
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

On Mon, 2025-07-07 at 10:41 -0700, Rosen Penev wrote:
> On Mon, Jul 7, 2025 at 2:01=E2=80=AFAM Johannes Berg <johannes@sipsolutio=
ns.net> wrote:
> >=20
> > On Sun, 2025-07-06 at 14:41 -0700, Rosen Penev wrote:
> > > It doesn't even compile. Added OF bindings, documentation, and other
> > > stuff to hopefully this doesn't happen again.
> > >=20
> > > Rosen Penev (6):
> > >   wifi: rt2x00: fix compilation
> > >=20
> >=20
> > That was half covered by Felix already, and really shouldn't do two
> > things at the same time anyway.
> Just saw what you're talking about. That's gonna be annoying though.
> The COMPILE_TEST commit will cause compilation to fail and the bot to
> complain before Felix' patch gets merged.
>=20

Yeah well. That doesn't really mean it should be merged together though,
and we can pretty easily make that work by just putting the further work
in after net/wireless is merged back.

johannes


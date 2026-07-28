Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF79BC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9u5qLEzN513Om7tTBxbIoKa911cL3ZjjhICsAk3Ta0=; b=NwEAeen7f9P/eTmZFmKhbjY8or
	Me0eJ70HLRCrLpQBQQt+b/w3MkBnN1kSa7UueglwkVOmLNEQBHqh1SRWMN0YMJGS5kKs0QWIZECXS
	rLWfNU35+CtTlnx1WvH4lkFp3KXD5UFr3M2l5BwCqKS02K05OcCTs+F+z50uPR/sIkIRiUTfCfCdb
	CPij4cefWuWreQ/arjkyFZTJJz3VzCMWMccwrN+VvA2FhZNLiJiU9rl82lqdfqu9X24Wztfbo6OK/
	+suvXZQSRKUQU7J86fHMRvH4PjOntgfBkeg7LSjhEwESReepbe5vnCIm00CpgaysUUv4uFHStPej6
	2JC0BCEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokEb-00000005lNO-0rFk;
	Tue, 28 Jul 2026 16:00:49 +0000
Received: from mail-24431.protonmail.ch ([109.224.244.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokEX-00000005lLF-42EN;
	Tue, 28 Jul 2026 16:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1785254440; x=1785513640;
	bh=O9u5qLEzN513Om7tTBxbIoKa911cL3ZjjhICsAk3Ta0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CFcuX9hDoRFEIdPhuObcBEVaVxjQWI2FiWrhf8l+pqg+uxDmxwZcVN1gyXFsJij51
	 r1E4kexzupQ07ZmDLD6ODjXQjzzLbInQSPMi2B1hq+NsboyUlKWMU2/aeEKXaleY+K
	 hvUy7AQCleteYc2evkNi7wtqAv0Jdb7lVN0fROaelqzVGbV/wNww8iBURfsUIagmk6
	 052/kag9A760pV1ocsaHUnvEkh1JbVADPuW/d1DyqTdBU6eKrMnenC5W63V+yqO835
	 WWZrH0J1M99h/djzSXClecv5MRdxuLpTF/aDVjf4x6BdXbz3kfNIujdhMXRwmvhUWs
	 Wt+lTrSkvxYdg==
Date: Tue, 28 Jul 2026 16:00:31 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA support
Message-ID: <4DqPgMQaTb-zCbBTf04csJMoranOuYdtkQxgWLAAMyshzMog89Cp2d2k8v5j2g3Jx04-pj5eij-a9VdmPqLDLE641ZyKuyciNUIC2lZ_sNc=@protonmail.com>
In-Reply-To: <79379dbb-5e15-4e30-ab1d-136a40e77af0@collabora.com>
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com> <20260728-6572-gce-v1-2-750bba32689e@protonmail.com> <ebf419fc-24a8-472f-8996-a134ece69f21@collabora.com> <W3cNtJeiPe6gmMpfpNJOxa6NQtOyatXIFz6FyCh7pC8jkE90WX_1g3AgQwXadoba0BdHE3com-6cCkym5VCN5d-3sobraI8O4-TGwkqnWBA=@protonmail.com> <79379dbb-5e15-4e30-ab1d-136a40e77af0@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 779905ee24277d9a19628456e16ec17556306f92
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_090046_177257_C42C3879 
X-CRM114-Status: GOOD (  26.46  )
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

On Tuesday, July 28th, 2026 at 6:52 PM, AngeloGioacchino Del Regno <angelog=
ioacchino.delregno@collabora.com> wrote:

> On 7/28/26 17:47, Roman Vivchar wrote:
> > Hi Angelo,
> >
> > On Tuesday, July 28th, 2026 at 6:08 PM, AngeloGioacchino Del Regno <ang=
elogioacchino.delregno@collabora.com> wrote:
> >
> >> On 7/28/26 11:42, Roman Vivchar via B4 Relay wrote:
> >>> From: Roman Vivchar <rva333@protonmail.com>
> >>>
> >>> Some SoCs, such as mt6572, have different WRITE and POLL instruction
> >>> encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs h=
ave
> >>> 22-bit offset and 2-bit subsystem ID.
> >>
> >> What about poll_addr, mask, write_s, write_s_mask and others?
> >
> > These don't seem to exist in all 65xx except 6595. TL;DR - old GCEs are
> > essentially dumb compared to newer ones. They have only basics like MAS=
K (0x2),
> > WRITE (0x4), POLL (0x8), JUMP (0x10), WFE (0x20) and EOC (0x40). All lo=
gical
> > operations as well as GPR/SPR don't seem to exist.
> >
> > cmdq_pkt_poll_addr, write_s, write_s_mask are not used by the DRM subsy=
stem.
> > mask is the same across all GCEs because it takes only u32 mask without
> > address.
> >
> >> Not sure that this will actually work reliably (though I'm sure you're=
 not
> >> creating any regression).
> >
> > I have tested this change (on top of out-of-tree mt6572 DRM) with some
> > dd if=3D/dev/urandom of=3D/dev/null spam + modetest, as well as igt. Se=
ems to
> > work without issues...
> >
> > Best regards,
> > Roman
>=20
> Alright then - look, I'd really want to pick this one up, but it's a bit =
late
> in the cycle and I don't really have much time left for testing.
>=20
> I'm sure that this is fine, but please understand me - I can't take this =
now,
> also because I'm going on holiday very soon and can't be here to take car=
e of
> sudden breakages.
>=20
> I wonder if you could resend it in the next cycle, preferrably at the beg=
inning?

Sure, no problem :)

>=20
> Meanwhile, I'll get this series on the Collabora trees so that it gets cy=
cled by
> the CI a bit (though, it's not enough, because that needs to be tested ma=
nually).

I don't know if this one can be tested with the upstream tree (if you mean
legacy ISA)... Most likely you need some 65xx (besides 6577 and 6595) or
81xx, but I don't know about 81xx GCE. There's some effort for 6582 and
6589, but none has DRM (and so GCE) so far.

Best regards,
Roman


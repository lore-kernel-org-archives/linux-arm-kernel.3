Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5994BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmdIp0IWbh9uMcGZBmXfwVwi3hZVqqhcBZt5kYYfD6U=; b=CczaJdC5/Bi5Oe4u8pjMFjAIgQ
	VsXonXyTxgPDXFma0ReupJQuF4cw3kMnqXX+7y8WNli/OzS+Ki7ba3jP4EVLIMBZx+aaU5FehAPnE
	xl3OnMsk0V+6ttZ3zJgkr1e52DerxbjNy8HW4iRJiq0ppIgFhtY0yn3DwDsme8q5AcN9Emcl89Bih
	e2btUeJOg6QFa0wsoWGU5VicEumNUkIxUYM643W/uXFJX3liKiXYIVrY1px3/Kuch4hN748Gy17Ls
	2Xx/hBsgy4F5KigMnc/Ygl5L2Wi1khOlhVbiTU8VGxmRuiJewxmffWs2izS9mo+CU2tA80Q52iCEI
	qDRjUhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok1e-00000005h3E-23F9;
	Tue, 28 Jul 2026 15:47:26 +0000
Received: from mail-43167.protonmail.ch ([185.70.43.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok1b-00000005h2N-2N7f;
	Tue, 28 Jul 2026 15:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1785253640; x=1785512840;
	bh=lmdIp0IWbh9uMcGZBmXfwVwi3hZVqqhcBZt5kYYfD6U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NkqxqLr0fV4uC5Ahyx4llSCpnVPUYCajFXC1r13H6rKbKEtqvknze+lp2wro9gjyH
	 vg2qMtYK0Q5U9v7yev5o50DA+cY5Z1NWhFVg4Wpuprph1yMWOFVugvpcuItzWuwTcH
	 vmhoGvXwi30mB3Rvsrc8SDN8gEYw/gO9yrntnVGNoDdLehujP+LIamO9ayjWIqyBHe
	 YLuF2zNKHzqFwHv4KybYKF4srrzxWoss/yEQzb8H3dsvNzEIzd2aARNaZd+aTWSVAF
	 4ls5VadSFaF+LlYKednvR+0zI2tZuwHaAIy0ZCSWYLLj6V1o5Prwwbgk/Tfl6Q1nHX
	 DyW9JZjTP3g/w==
Date: Tue, 28 Jul 2026 15:47:14 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA support
Message-ID: <W3cNtJeiPe6gmMpfpNJOxa6NQtOyatXIFz6FyCh7pC8jkE90WX_1g3AgQwXadoba0BdHE3com-6cCkym5VCN5d-3sobraI8O4-TGwkqnWBA=@protonmail.com>
In-Reply-To: <ebf419fc-24a8-472f-8996-a134ece69f21@collabora.com>
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com> <20260728-6572-gce-v1-2-750bba32689e@protonmail.com> <ebf419fc-24a8-472f-8996-a134ece69f21@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: d64a8c1a1c422d7bf05de4f1fc9e5dca04c6f3e6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_084723_777508_D7731A4D 
X-CRM114-Status: UNSURE (   9.68  )
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

Hi Angelo,

On Tuesday, July 28th, 2026 at 6:08 PM, AngeloGioacchino Del Regno <angelog=
ioacchino.delregno@collabora.com> wrote:

> On 7/28/26 11:42, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > Some SoCs, such as mt6572, have different WRITE and POLL instruction
> > encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs hav=
e
> > 22-bit offset and 2-bit subsystem ID.
>=20
> What about poll_addr, mask, write_s, write_s_mask and others?

These don't seem to exist in all 65xx except 6595. TL;DR - old GCEs are
essentially dumb compared to newer ones. They have only basics like MASK (0=
x2),
WRITE (0x4), POLL (0x8), JUMP (0x10), WFE (0x20) and EOC (0x40). All logica=
l
operations as well as GPR/SPR don't seem to exist.

cmdq_pkt_poll_addr, write_s, write_s_mask are not used by the DRM subsystem=
.
mask is the same across all GCEs because it takes only u32 mask without
address.

> Not sure that this will actually work reliably (though I'm sure you're no=
t
> creating any regression).

I have tested this change (on top of out-of-tree mt6572 DRM) with some
dd if=3D/dev/urandom of=3D/dev/null spam + modetest, as well as igt. Seems =
to
work without issues...

Best regards,
Roman


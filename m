Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D85D6CFB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hbyjhex9kITqfDLBxrxOd0hxO79EBXto59nVbh5+k0=; b=aQ4jPVMldbzC4S9RRzWBFpUJgO
	FgoqVUPave2yUEBAM50sI6Zjw3wA58slo9JwbvusTmp5m3TqC2wg5CJnnVvCtBqeRuF6QplAVeCTj
	X4ex1KOcixTfGvx3NhjU29dDv+mgk/rgYblCg+jquvn8dBu2+TYqMicor9kZfAgnXceQZ08/PgKe5
	fYkWXvgn3pEPfSYlVRJ9i3EUh6UZnLXPvebj6Bf4Y/DeneeUsfrHRz/5QluWpf9oj2nhkblowVGPK
	j3mBMwoS5qo66vRl/34BPJoJGVG/92ngoUHWH9T7JQpSvwEB8k6oCX26E3iC/OWfn80g5VgPSfbnZ
	NRjxwVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6DW-00000007yzH-3Lgj;
	Fri, 23 Jan 2026 01:44:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6DV-00000007yz8-2XcU;
	Fri, 23 Jan 2026 01:44:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DECA6012B;
	Fri, 23 Jan 2026 01:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB159C116C6;
	Fri, 23 Jan 2026 01:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132644;
	bh=5hbyjhex9kITqfDLBxrxOd0hxO79EBXto59nVbh5+k0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ev7ziae6QynBpEoXuTw+tKhHXcIE6jAWIJ8Qr4jlrhkDwCxQ23DuGDiS8KR5RkSBO
	 XJJKpRuEQMSyjtyKqowRIVTALbgQikLe5jDmniZRcVpmFPaW3AcmIyqXFk4IfLj6Sj
	 d6njx51cvVSdwerUkssiTHBc178UZXFXkMNbtl+QFgQTAlNrfDESTq4wVDotoeMcEb
	 bRjoVzHnuNazboD8Eux2r9CZ7wFAKlyfBZECNF9YwGmZt9Ho1RYi3tHx6Gp9VVm7Fm
	 vMgE+1xnKi7d0Z/CrKlixDgaoCxuRtSxaREDd+af4Ps1QYHHJG/+Il6LKx/Ms0pCCS
	 R2oB6e7BPXgNA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260113110012.36984-2-angelogioacchino.delregno@collabora.com>
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com> <20260113110012.36984-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/5] dt-bindings: clock: mediatek,mt7622-pciesys: Remove syscon compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org
Date: Thu, 22 Jan 2026 18:44:00 -0700
Message-ID: <176913264088.4027.8181442365263055794@lazor>
User-Agent: alot/0.11
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

Quoting AngeloGioacchino Del Regno (2026-01-13 04:00:08)
> The PCIESYS register space contains a pure clock controller, which
> has no system controller register, so this definitely doesn't need
> any "syscon" compatible.
>=20
> As a side note, luckily no devicetree ever added the syscon string
> to PCIESYS clock controller node compatibles, so this also resolves
> a dtbs_check warning for mt7622.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next


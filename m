Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45914CFA473
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 05:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2FwM7GZO0cI1PqJuSMSgG5po4pWC/aYmRuf6oqJ0EA=; b=Sju4eVFsCHoi00J47mrRrcOJZp
	rO7xM9uOTs2OZGRZZ1nfhORbrwJzb2IY2dxldI9gAyCkn7X4ouTCup6ADXEKXYKbmVWi/ayt0j1x1
	Ywx1WvPNx/0xysDpNSwsCDeK/PDWj0kbfqHU6ui7Bbc5sNRP6plRPAsSF3mf4irXlhQJVVFknYMHr
	y4Sin4V6vB4ueyi8dBsL/Bs2q5zDqbyRel7t7J1tLLz9QrYupEVdl3K23o1RlmpCP2Sysd80vKdm3
	Vj9MZYqU73GaxCXrSeKe7/seVt3J1CGhuTt8VQ4EHKnYAmzIrfLf+CfzM5LsgHN+0o2/dAByKqfsu
	1IUB6VDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJZv-00000007pvJ-3v5I;
	Fri, 21 Nov 2025 05:21:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJZl-00000007ptO-0rrq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 05:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0C4F60220;
	Fri, 21 Nov 2025 05:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A316C116D0;
	Fri, 21 Nov 2025 05:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702452;
	bh=i2FwM7GZO0cI1PqJuSMSgG5po4pWC/aYmRuf6oqJ0EA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iAWS6/biLVL0sAnADt6xnjlkSpp6FCgCoqn3Le5I/Sp+XgWVcbCdnjOa0zak6Ycfl
	 r2Jl9qZvnskxyMPHAdWNWDY+ERbRRATeNj59nwBMNnii6lvkclm1b8t7IY5cI+lGCr
	 dnpHJHp7aGjsFxBHEiTG61jP0y+G0VSq1kZFR13Jbftn3GJl+QVYlaAkETjuBojy3w
	 0uVIl3a0CkvzNJDWDo0qOAWVGxvR4tZ8tziBrINd82mlI47heZpAXAdzwZ+4E8KjKi
	 EwV6Kd15zzjOJWUr1aVL6j63RPN2HG5qyzojIYzs536DPAYNEBBbSyxz77DH3+PdyY
	 pta0BKLZyhR6w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114070512.855008-2-yuji2.ishikawa@toshiba.co.jp>
References: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp> <20251114070512.855008-2-yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: tmpv770x: Add VIIF clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 20 Nov 2025 18:57:00 -0800
Message-ID: <176369382052.11952.16022702616514274716@localhost.localdomain>
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

Quoting Yuji Ishikawa (2025-11-13 23:05:11)
> Add clock and reset identifiers for the Video Input Interface.
> These identifiers support two instances: VIIF0 and VIIF1.
>=20
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---

Applied to clk-next


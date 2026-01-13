Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC6BD2D0E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 12:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mIzpSEjJlP0f9i4KYTcYSErkDPIom6vg3hsdO6a6OY=; b=U5RcR09W6DI/Aes8/IScoIQi/5
	Ve8unhdeoEgC5CW7MHXtlnmMrbpLOySDsf8Q11QRDT8iECQYt4Cu4CWLkZHd0eL4PRdPT9YUm1Ksg
	qPMDsSM5lXwaO7Ya+J9HzQf2nRvLhMHbVFb7zpPuJ5QpPsBUoHqtHJepbUOzib0WxoWF7anxTIVQc
	IreevncjseX1zmHU3qXUga58H+gK3zmy0e1H5MCCmNWof9iePJH7pX7DWHmj5HQw+LtsA0Qh7QhtA
	SH1gsyXtcs2HpdnE5ZJUkgEn/bGh+jRao8v8ixuVsfsVi0AKhp+m6WH1oylq5BKKWtq5ZuacecQUP
	eU/oj8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdf0-000000075VQ-49oH;
	Tue, 13 Jan 2026 12:38:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdey-000000075Uk-0W15;
	Tue, 13 Jan 2026 12:38:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5821344265;
	Tue, 13 Jan 2026 12:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E73C16AAE;
	Tue, 13 Jan 2026 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768307887;
	bh=XBh651uOFdz895yL+g9RcE+L3CQnvJrQsqohr3JUpro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ITei+nWuD0tmntKUe3z5GLKo96BDN6bl2LcQ2KuQO8tRhW73non6+I7D66FKs+POa
	 9UR+MtSJ9ntb2TxeuPYwi2+LCL8jSaCrg4oNSxQAe0hhp0mvF0idnXxdhWyNUGMiYr
	 l3TS/+ez5GBB9H3iJ5loMPeI1KlrLf2Ey6S96jXSCe+uoF/LTb1Ltv0kas3kJQe1Dd
	 jchfWlDhv7K831iQlXB6QCuUekkkos4sJebdg51tOKi4DiOw+r2ipzWlkRpvS76OfI
	 2J+8K7gnNGsLG4+YDM6HNF7/Wna4d7ca03ON4Kvv8fFDor2cfuZWIb3g65qvFMM5JM
	 +0LCSQ9UIzWLQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, sjoerd@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20260109114356.36454-1-angelogioacchino.delregno@collabora.com>
References: <20260109114356.36454-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: syscon: Allow syscon
 compatible for mediatek,mt7981-topmisc
Message-Id: <176830788476.2846051.17154311682129442278.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 12:38:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_043808_177381_ADE4C2DC 
X-CRM114-Status: UNSURE (   8.69  )
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

On Fri, 09 Jan 2026 12:43:56 +0100, AngeloGioacchino Del Regno wrote:
> Commit a95419ff9f21 ("dt-bindings: mfd: syscon: Add mt7981-topmisc")
> added the mediatek,mt7981-topmisc compatible to the `select` block
> which is used only for compatibility with older dtschema, but did
> not add it in the actual block allowing to specify the "syscon"
> fallback compatible, which is required for such node to do anything
> meaningful in the end.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: syscon: Allow syscon compatible for mediatek,mt7981-topmisc
      commit: a4d1081e82d588bd549284ad5321c018c86e6935

--
Lee Jones [李琼斯]



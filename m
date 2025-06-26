Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CE8C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A397tgaR1bEdoRqCg1ZuC1lQpG2cnqp02D0l1PbKLuU=; b=DKjUqnBpx+rS4QQWFQEzuj++zT
	oXprhoCZrreVkjzJXN3b4M4C9wUpO2iQhmzp5Zi5MjTwmbXu4tIi1KPctW2P3r2909PMFRhSB7OCw
	/2FNDmFnqll/iG/srVQC22/kbb+o6H+f4kLIXohqiw5Ik81TDD9xCaHXl+uP84dvGaDbEBVeEqiIf
	mx1MWTdMPJxXGAbGcOoDt4aD6ClS13GqdtiYzbNUcPv9OMTj8Adev7CNr+my8HQFpy4rhUpJvhuDd
	SkDtd29MolM+wNifj3W32p8vrH58ZCrP3waMBaRIGmmxYDtOlgPb4B8A1tn72R3qflVhIhioHrVh6
	DlMfFhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUws9-0000000DCDm-1lMu;
	Fri, 27 Jun 2025 00:23:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUviv-0000000D1HF-3AJA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 23:09:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BF74450AE;
	Thu, 26 Jun 2025 23:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37AD5C4CEEB;
	Thu, 26 Jun 2025 23:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750979381;
	bh=QWH4pxTEgncL6DAqMVzz0kKQZzAwd3ujWUCCA+RtVQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYMjO/OPkM4oShBjK75o0glbqAp0g1d7Eoy/U3UTedHYmJ+MtUxv6ZjgfYLnrjxRm
	 jak7POzg4amgAB4nZL3q0C10fpaL1gL/VEgNKTO5NwtzSELjNkXwp1k65ZfF3iFSaH
	 tkelN0EVst1Ib4hdqu2hMReclePB2PwE2Tk9i6VyE3HP/2KgKY+AiHt8akV5eKL7YA
	 d1Qb78LsBeKD/JdDN+9C7FDMuO2kuGKqlyRcvdlCFZ9+0V+NE25A2csIIAuu81ap+y
	 y8wIYlqTBcqWOEwfWio3iCwwXc2Px2VXnjXschMfOuYcUjarWI7StrTk/DwX5LKr+A
	 IEVy6XDvlvkEg==
Date: Thu, 26 Jun 2025 18:09:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v12 2/7] dt-bindings: serial: rsci: Update maintainer
 entry
Message-ID: <175097937956.1362465.5042902153110786227.robh@kernel.org>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250617134504.126313-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617134504.126313-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_160941_808735_BF2EA519 
X-CRM114-Status: GOOD (  10.39  )
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


On Tue, 17 Jun 2025 14:44:59 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add myself as the maintainer for the Renesas RSCI device tree binding,
> as Thierry Bultel no longer works for Renesas.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/serial/renesas,rsci.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



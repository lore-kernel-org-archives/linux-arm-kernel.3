Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B221606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VtOLYjj3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqE7GTbX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GoE0iVIoi+uRyPZc/06lle3SKlY2JN8H5v3aA9c3gcw=; b=VtOLYjj3/a63yCaWOwgTU2Z5S+
	eogPO7WEafZly295SevBtsR7YLSmwbh4XN5vGw+RaIwPiGZrExUl+FxVm4zND5AMyOJSnG+/F8g4B
	2Wp1b3PUlJGwlArcyLXYUXhM+FUJyzi4TGM+pIjZ8aXFCFP0zXtg2Ho8LzWPLHywNR0iKqP0q6toS
	SQql2a3tDfRmlm8w7q2fUG5S3A22aApwl2XbRuIxTf5LxJViOnsO5R++MhK2aqsPksVKCLtLLTIyx
	l/QgykOzdB+QuixeJmYUeD8YVTH0EtHgrqYy8elNZ0KVjpG8HycwQm5NlaA9ya1AnWsnKUb1OsqsJ
	tm6x1qoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLol6-00000005nOo-0Xf2;
	Tue, 27 Oct 2026 21:31:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLol4-00000005nOU-2YJA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 21:31:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 16ABA40283;
	Tue, 27 Oct 2026 21:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6521F01828;
	Tue, 27 Oct 2026 21:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793136662;
	bh=GoE0iVIoi+uRyPZc/06lle3SKlY2JN8H5v3aA9c3gcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MqE7GTbXTfq1LEe+yj/456Sc7hcIiIgzwXwcYeHpFmza9CbweMQvP5HhA4ao+zNo8
	 EupsUJhlWj026bItJRT+DAsl1pyghx5c3ZZyjsRlhXLrZpZO27cXKJF1Rl5H/0PKcp
	 vvbGvRPpGGKtiw/0grucIeWMpWH7+9OL21//3VoBssLLI2YqfD8kZYkYjm5wj79Xp+
	 j+e1LZD0E5c+/fzmrwO/hZ4wGSJF6N28Ka6Xk7jJccHlVtA5n54MbpeF+Q7tkaszZt
	 pLWKbKdYy9EOaQ+ErS9jMFhYm2anQyhuIxBX+D1PJErKYpDN5Mub+roqL3+enJJs40
	 R4JkrJItM0C2Q==
Date: Tue, 27 Oct 2026 16:30:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, stefandoesinger@gmail.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, arnd@arndb.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk@kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v2 02/24] dt-bindings: arm: Add ZTE ZX279128S platform
 descriptions
Message-ID: <179313665810.1186359.4184404774737293772.robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-3-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-3-ghahramani.navid@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 14 Oct 2026 08:20:42 +0100, Navid Ghahremani wrote:
> Describe the SoC board compatibility, SRAM used by the parked second CPU
> and the SMP enable method.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml  | 1 +
>  Documentation/devicetree/bindings/arm/zte.yaml   | 8 +++++++-
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



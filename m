Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GiwJ6ToP;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCh4IE6I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YbYmA1eZwnjs5cetbTbm+E9vWC5lU7xrhcJ8nb//OPk=; b=GiwJ6ToPhcXmW7DH9+5GIMPenI
	HXYt7jCfXU3e5Ndgfpm7hjalKmr/53AL3jX1mQtUawzof8KFSCwhi1IOF8DuPKsLAVOKFFSu756WU
	bWmVHXX7IDS0bIk4R2H6RmBn34HZZPYTJCsvArtAgO9QO8zICXeDnHXq8VqKaGBLK6kKVq7WxBnzd
	SHKas8m9HfKOXksfrJGMHoUPhuhi8AGvr5p3jl/gTl+fQ2vonOxPRAAMNV+hLnGPYDRVn/DDMUemy
	lXsZYt4I2GcA4HMcsggneLDY0PLLFYwRK5ZSou91vXJMLtsktwF7cztJ3M/i0Cdyk6cu5IcD7M2f6
	4pQ0oIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJhd-0000000COJV-0gzB;
	Fri, 06 Nov 2026 13:09:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJhb-0000000COJ0-17PR;
	Fri, 06 Nov 2026 13:09:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B040605F2;
	Fri,  6 Nov 2026 13:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004CD1F008A3;
	Fri,  6 Nov 2026 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970594;
	bh=YbYmA1eZwnjs5cetbTbm+E9vWC5lU7xrhcJ8nb//OPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nCh4IE6I/dmpvq5JKNNh09E+DHfZN3PXvtR9ors0GxwXeoEgXPTkZyEidzIPOHbHo
	 YYfkAMdpXrjqhYpU5NL++Ggd12xlQOdvZ98VdlziV04uQL4Iy3FnJo/C8GcuyYg7wm
	 N5gXtkclZ7dF61MmBLOqOR4FKIuOV2Eh0D3lcZSW9JX2S9LRr3vYhUGImLluNCON5T
	 yfAWTBCWKvDx7Mt8hxIzIB+Hjk1ffJwLzM+815MivU26bk4b1P6njBvX0qwFwxXkvY
	 yCRfRv0OIgetQMuZIKzblh1phP5gqK9xdvWZcgaCvoVzFR5hHzfOWV9WtRKcxBvu3O
	 xtZaya/jZSlcw==
Date: Fri, 6 Nov 2026 07:09:49 -0600
From: Rob Herring <robh@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: firmware: amlogic,meson-gxbb-sm: add
 amlogic,meson-s4-sm
Message-ID: <20261106130949.GA2536456-robh@kernel.org>
References: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106101854.46569-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261106101854.46569-2-christian.koever-draxl@student.uibk.ac.at>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 11:18:53AM +0100, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> The S4 secure monitor implements the GXBB interface, but its PSCI
> SYSTEM_OFF needs an extra firmware call first (a shutdown flag), so the
> driver has to tell it apart. Add an S4 compatible with the GXBB one as
> fallback.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Missing Krzysztof's ack...


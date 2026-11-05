Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF877606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XkYVkO1+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Md/X1igi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CHMws3iG9sp4MGsGwaHEnG9dzHeoN48MoG9k6aIiNoY=; b=XkYVkO1+ZWZuk/tF5BdrRrRgy8
	TFhwCx1R3F4ltsBy86DXqCSVWywY+vh1KlKKbjPgAyGcAlpKoL0GwsjLL2BEKRrsJGD066uXgWip/
	b8/ePXnLKDekjunVtdORGklunnlrNZPFNOCYl+OyF9AwcqC4XEsct8htZaor+Iv1EFu1B+QffrQQd
	wqr0h+q7Jgsg9rSiX6XvU6dmNBuzeQmwhOV8vE706fIbMXfwIp5UJR2QlidqvlEaS7cCWV39fnxXy
	Vv0lNSYD04rzUWEb8lR6ocTxcAFBXP3QPS71Oq4plmt7rjDvPW3GQP2hVc1y7SrqsbIlYRIsAkwZI
	ELUASmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Ht-00000009bTT-17eX;
	Thu, 05 Nov 2026 16:26:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Ho-00000009bSn-3dWn;
	Thu, 05 Nov 2026 16:26:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D3CD43689;
	Thu,  5 Nov 2026 16:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6C81F000C1;
	Thu,  5 Nov 2026 16:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895960;
	bh=CHMws3iG9sp4MGsGwaHEnG9dzHeoN48MoG9k6aIiNoY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Md/X1igiF31TbEPeouI3TA3NQK/nErcJ+DvEpF/ocSRtYk3pQa44RsipA8NaAADs8
	 iiKWhJEZRXwes/CNPAHM1G1BNg6PwLkNYXrrnJdlExdHgE4Bnh2UAhdCK6pdoHbLPs
	 AtqW+j9afF/w98mdrcvPoOWYXinipPwRYWSKOwmB4fSR5tzHwK0Eb7mpGqG0Rp1oxz
	 swkw5gthkFSUuHe2b+DRZfMablYaZ8ezlZauqZPxHlHxbWcx4wIcf0W3qz1ZF5zydZ
	 tDJOkoVG2UOU0WcYt+0JMey72S3IQLBsHOWqdGzFVpVAS3H70JHgZyunzeJbGhvsie
	 50dLQzmLJIRvQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Roman Vivchar <rva333@protonmail.com>
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6595
In-Reply-To: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>
References: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>
Date: Thu, 05 Nov 2026 17:25:57 +0100
Message-ID: <xhkdbo6c3w8h6.fsf@mkorpers-koolstof.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Roman,

Thank you for the patch.

On Thu, Nov 05, 2026 at 13:29, Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

> From: Roman Vivchar <rva333@protonmail.com>
>
> Add a compatible string for the mt6595 keypad, that is compatible with
> mt6779.
>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F1A606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 02:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PfFa38qb;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kPzRWNxA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owsw2t3VbnUT+VYXvyiHdO0anm6pLWfVu4gJk6+tS5I=; b=PfFa38qb6aRW2I1xb//T/WBE8h
	6Hc0NZQRBPkK3NLV5P7knlXrXSvR4K8RpOvbC/IZWQEwdvqFFHySlxBKzD0qlWFRXQnTEM8sseeKd
	AJh/3JLje783XfbnqQtjaTdYtb2kcJ0W4m2hznUyHwBXaQ/DVqjzRRJbeIzT/tRZ9JSxKnh/h0iqB
	Ul47wzgQicsrKFuS6mWq7a59ZvmHQLkaSmdNeKJHL+pud/Y8CSdeXJRR2744HWQCd9bvXHwM6Edp5
	3vv6E9BuuYPih19zyoZ975CD75QR/jBIoTf/814Yd9dZcwBf3CbCN0bqg3s5859h9Lc4mInpCAw2M
	D7a/AozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJj11-0000000DFPh-0Rii;
	Thu, 22 Oct 2026 02:58:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJj0z-0000000DFPG-2rUX;
	Thu, 22 Oct 2026 02:58:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25D1B42E7C;
	Thu, 22 Oct 2026 02:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D276C1F000C1;
	Thu, 22 Oct 2026 02:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792637929;
	bh=owsw2t3VbnUT+VYXvyiHdO0anm6pLWfVu4gJk6+tS5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kPzRWNxAw+rpFkdgDhE4B1ZH8n0Cp7DLop2rZpB+GTvfVrF3OcUkP5hIi1gEnvAl+
	 LQhqrMRAA4bijS2L9F9cb4QrQjdYdW3fPKVVacTENw0yOdItQiCVJZJm42LxRD3sML
	 EJaryHk7YHedsItsVVDVIV/SgryUPZzH4+MTT9NzDUOux/c4S1yD19kI/R9OVKhkKU
	 L2HB1/KxQchjCDxaBLqt3KIu9yvuNZoaNbGrmyGclZOox3o7YwoYGt0xnjmEioO3zK
	 +rXp+nLiNzNbpvRkj1rg4agawGvCDvEocE1/ZRkjItmK/D3ppswLYMSXOYRrbIi5c8
	 ClPyxMRZUmbDg==
Date: Wed, 21 Oct 2026 21:58:48 -0500
From: Rob Herring <robh@kernel.org>
To: Bob Hui <bg9oxa@163.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
Message-ID: <20261022025848.GA879686-robh@kernel.org>
References: <20261021-quarkpi-ca2-v9-0-b75006b22bc5@163.com>
 <20261021-quarkpi-ca2-v9-1-b75006b22bc5@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-quarkpi-ca2-v9-1-b75006b22bc5@163.com>
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

On Wed, Oct 21, 2026 at 10:05:21PM +0800, Bob Hui wrote:
> Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
> computer.
> 
> Assisted-by: Hermes:deepseek-v4-flash
> Signed-off-by: Bob Hui <bg9oxa@163.com>

You missed adding Conor's ack. Twice.

Rob


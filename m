Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C78C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gzsk+sCLhP2wDC9LPn4BoUyRFRzfkGfaURFuIu9Ie84=; b=FTxiWTpmeFM6tez7ebB+nqagSQ
	9+bVw8+G5vlDhmqVJ8mo3/AyMMtaI+bOcOQPYMm1V19nxwIqjHCoBXtf2TUELsSmDmGk/CE4iq7uN
	q+xlJgqOFQUubBTiBc2NVNQZrEYHv6MUQ98CHybHxrZ1PeILYVV/yK0n816enlcWm2iQbal9qgFlX
	V2qhBbDDqXg066XJbmokCobHyRqNzRj+GHbiUpxQuHhzCkk4zANwFTQisfecbi8/dxMDXL0FGhSh3
	5BK3n8C45g41UhXcxh/spS9VnctR8igl0OTS8nAuf/GjjXjYuG0Ida6B8pZSbJ0szvjIYEjvI0RnW
	Z2luZ1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFsA-0000000Fm23-0GCm;
	Fri, 27 Jun 2025 20:40:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFpp-0000000FlhM-3Voh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 20:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45FBF45EE7;
	Fri, 27 Jun 2025 20:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E939C4CEE3;
	Fri, 27 Jun 2025 20:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751056689;
	bh=VLsRMIIbHkcIiBubCm2O/Vz1rQK6YmG+Kz4kjvRqN0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKIP1j956FjIIkOUncDjuT3hx0qNF41n5qrEKUpQVoCNQRT14I/QbIlMbuZZRzQGE
	 WRfRw3pNyPaFk74ZWQQM+CoP2UfMaiaJxc0Uyeqg19H/+YLzoqG40oymmerNEAJ0VY
	 qboL7vpIkacDV4GZNNg6iHvYpUYVYF/Q8hZjod64XS+BVejhySidY9eGsksc16/3r4
	 M0DLJZq5KxPIpXd2jPoPI9kzHAhW8/pPbYBZxtU1xNp5B73qdmGg3FEeGoUhf8gDda
	 uDGZujIMvAzm2buJq7BAJQIUf8rjlBKhV7Xgeo5j/CxSGy5uFMatAKJql1NZINKjSI
	 Hf1MqS/pHZYkw==
Date: Fri, 27 Jun 2025 15:38:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fred Chen <fredchen.openbmc@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Santabarbara
 board
Message-ID: <175105668797.42558.2699449089558464482.robh@kernel.org>
References: <20250625073847.4054971-1-fredchen.openbmc@gmail.com>
 <20250625073847.4054971-2-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625073847.4054971-2-fredchen.openbmc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_133809_896236_D03EC30E 
X-CRM114-Status: UNSURE (   9.26  )
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


On Wed, 25 Jun 2025 15:38:37 +0800, Fred Chen wrote:
> Document the new compatibles used on Facebook Santabarbara.
> 
> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



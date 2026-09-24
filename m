Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CD9C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwFlxKa/rm3uWzVKg8J9eMUEjOqVTIuvcYQ/dkF2Wtk=; b=zOX7oPNrFt6a3h2fFlXXAmpFWA
	y9NEwuw8nd/jJuBl3Ll4KgIIveDLN9htkH7NWmhTExymZoUROKdIF+ZSzox5CDaB56f0XjUJPgap4
	JwODsp4mAWR3reqin/nM/OxEcbenHbXXTFmYVzKJNmydrzlnwPEPGDGNl7pj7l4H2VeKrb4/CCi4w
	m4o+wjfAQTs/YdbxS/pQgaiIaMxZhmM6WTMHp+7/kdYzi/bRR7dZYHQhAdYTPes1pTWbKhiMfEh8J
	TNXajVn4R6t799Dn6pw8GCK2jQYkSHopmDISvGeWpJNc7Qc70qMxfh5dZnlHwZgZhdAZg4eZSxHaV
	xlvvrPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jD4-0000000B3L1-1kNs;
	Thu, 24 Sep 2026 13:09:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jD2-0000000B3Kv-1saH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:09:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EBACC43B04;
	Thu, 24 Sep 2026 13:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14C41F000FF;
	Thu, 24 Sep 2026 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790255395;
	bh=mwFlxKa/rm3uWzVKg8J9eMUEjOqVTIuvcYQ/dkF2Wtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PrNQeQsd+wvgc6UXKR0zPzG79JwO9/C2wy8VHV6+BtxA+zGt8tylDIp3opMqLz7to
	 X9IbDHzEqPDUck+oIlad6SfMRK3y3Rv54IrfVhnnMkst8XUGCvDnhfhPBqMyTOoUhP
	 f/0mYJlyCWqJwTHI6rkWbUFYIwia4haI1Dl0MYrEDK7M+heUfVw7qrGYDUUkAYSIHK
	 7XfWYfIuB8X0Yjgr3Q14ukoNXKpKM9SdMyyhA/HXxZrSNozKEemOrKuAtpJqrDWVXe
	 +7yN/4PoKJ75JARg3dbp1NRM/zJDtraqA1gixs/HRQY3fZ0wSZL4miin4ntuSacX5g
	 Mr7xiU8TCmB5A==
Date: Thu, 24 Sep 2026 15:09:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrii Salivon <andrijsalivon@plajta.eu>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: add Amazon Kindle 4 (Yoshi)
Message-ID: <20260924-polite-mink-of-acceptance-da5ad4@quoll>
References: <20260920-imx50-yoshi-v1-0-b8a46b3a972f@plajta.eu>
 <20260920-imx50-yoshi-v1-1-b8a46b3a972f@plajta.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920-imx50-yoshi-v1-1-b8a46b3a972f@plajta.eu>
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

On Sun, Sep 20, 2026 at 09:21:37PM +0200, Andrii Salivon wrote:
> Add the amazon,yoshi compatible string for the Amazon Kindle 4
> non-touch e-reader to the i.MX50 board list.
> 
> Signed-off-by: Andrii Salivon <andrijsalivon@plajta.eu>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



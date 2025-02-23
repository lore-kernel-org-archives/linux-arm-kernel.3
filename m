Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7FEC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 11:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x//6FGyd+ICX9Yd6Zhc7oqflvER4Ti2z0iMovGaThZ0=; b=ko6IExcuZEMYiRMa+qUGVuydmg
	E1ysjVWjUd3Qcl6YEjsdfCsjSpHSE48bjj+QYY9TJBiAh2Vvsg2xzRo1QaN4nghw8DI+lK/Pu7uQE
	MdNfMhKvxD3nS93dZa/HvXgHpO9HJXvTdbq82gg+M07vLkMeasj0nZ6a/pXSUQAfuxv592dQpZzFG
	RQkBOWCJXK6FILbg+lhdHBckovkBjfPHtVLLoeKeb7ztHQbh9ehJ+dtTYeOeni9rbYpsmNVbfDKxy
	UJEHbENSkqMNnLWsrC7LFyUc6+25bKNq+p1rphk6zv9vULjmNCwn7s9OGnr2DNJJA/g7HfLFkhtjP
	kgSMGcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAWr-0000000B25F-0rG2;
	Sun, 23 Feb 2025 11:52:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAVM-0000000B1dF-3bkM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 11:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A1B8061143;
	Sun, 23 Feb 2025 11:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45362C4CEDD;
	Sun, 23 Feb 2025 11:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740311439;
	bh=hQuSDA97lCMpIvGvsB8HeScp/fD9G2ojAxcjSBtTtvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4JfxVLFiQ5Pu4uqfbL4ygsTH66+gFhJth7YPlh9QN0QceaaE2aPQpUicIj4MMCwa
	 sKkauQBx+HFu+amvbQycxlZmjlfa6gtOfysMB0g2V/KUqF4lzJ0ukL/gzfqkcYPPbN
	 L0rsjNgkXy/VLptBrRy7MSMRAr8ixcZtXymJZ5/SklwZX6BrGusFwVAnYDg7JVE/41
	 TlVVbITRFRS0sSKhIkLoiI8ifqNebhUACfnpDG0KXHNXG9el+xGN02q6mdaiwV3vKC
	 JZHlW/Ja4AXac+IR6Tq7YVv0RLm/FZJtcVykoN9jfH+aN34v9D5/w0hzJQjHXxsh8q
	 PzYto0djL2jMg==
Date: Sun, 23 Feb 2025 12:50:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
Message-ID: <20250223-ambrosial-macaw-of-imagination-dce169@krzk-bin>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221191909.31874-2-laurentiumihalcea111@gmail.com>
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

On Fri, Feb 21, 2025 at 02:19:05PM -0500, Laurentiu Mihalcea wrote:
> +properties:
> +  compatible:
> +    items:
> +      - const: fsl,imx8mp-aipstz
> +      - const: simple-bus
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1

That's not a simple bus anymore. simple-bus does not have reg. Neither
power domain really, because this means children depends on this device,
so again: not simple.

Best regards,
Krzysztof



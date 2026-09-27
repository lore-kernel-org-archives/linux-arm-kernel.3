Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3912C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 18:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XEoCOiEHSF66Tl36XozdroZPLAJ+sF9zsLneNYmRCk=; b=lgJItP40fzuuF+XhZpucM6Hrer
	pJ+QCKFG4iGyBHq/iguY/FI+dRMpNmjearQMqJ0pUp/QqeIBKKJTd4kjKdAKRPxzZ6drKSL+xV4OC
	CMCrt8rQz1fXu2uXoe08AN2P2URRwk+0HIjT83rXuFL6/GBpp4zOBpC84usK6BAnUpDDBEvy94CxT
	SNvfoUxzsQ45AJJ0A4zfHM1BKDsf7QgxP84/WJXCeCeRlZDgj+iBjRnfJhlaS4dxAvKUYUBOfAtUp
	W5yl/Z2Zozxf5ty9JMRYza7UGZerOs29DOvPIMbaI0O4RXZlb1iKMdGGnWaJJBcrBl+u3XeWNGJdn
	s/eXSdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtGw-0000000GgRL-2HmZ;
	Sun, 27 Sep 2026 18:06:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtGu-0000000GgR3-3hql
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 18:06:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE7BD60D79;
	Sun, 27 Sep 2026 18:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896241F000FF;
	Sun, 27 Sep 2026 18:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790532403;
	bh=6XEoCOiEHSF66Tl36XozdroZPLAJ+sF9zsLneNYmRCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SF0P6tTscRw/xse4NZsRmcE0+XRrIguAUwdAlc2M7cQYDKKuDz7fI7K1x16wUjYzv
	 sbKVLwmEcN55ZBNFi1iI9LRbaE/0GWphRfSFq1D1Izs+ppcmPDlmkr79i50uNbvEZs
	 lBGaZbyZ0ajSJMcbPgOqgHt0LE9jciMyqnZxjxRQbQjZQqMuC/tRPUIV51jSWjy10z
	 TXu+PiScqIDCEzsqXSrH2EmX3+U6pwqp6KAlUgd9BepoKpd6hevIPG1+Yt080JaI22
	 5C5BtKtXO5gsZ3lp8BwM7a6yKxZaFj/AlvZ3WH+3hLuUAfRE7vtkDuB8K7i4RMZ8MZ
	 yjJCn647PNBVA==
Date: Sun, 27 Sep 2026 20:06:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/3] dt-bindings: net: allwinner: add H616
 EMAC1
Message-ID: <20260927-amazing-loris-of-criticism-bfb38b@quoll>
References: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
 <20260921-submit-h616-emac1-v1-v5-2-ada661ed9e9b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-submit-h616-emac1-v1-v5-2-ada661ed9e9b@gmail.com>
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

On Mon, Sep 21, 2026 at 06:45:25PM -0600, James Hilliard wrote:
> The H616 secondary EMAC uses a separate system-control clock register
> and supports only RMII at 10/100 Mbps. Add its distinct compatible
> without an older fallback, since using the primary EMAC clock register
> would not work.
> 
> Constrain the PHY interface mode to RMII, matching the hardware.
> 
> Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
> Tested-by: Alastair D'Silva <alastair@d-silva.org>

Tested-by is not applicable here, please drop. Don't blindly apply cover
letter tags.

With this corrected (and assuming Alastair actually did review the
binding... otherwise just don't use blanket cover letter tags):

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



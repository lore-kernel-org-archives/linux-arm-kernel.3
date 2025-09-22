Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66530CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0x2NDUKJnXp7o74SB5p+Kw1c+BunWHl2O7DXqSMuY4=; b=Cfx1Wj2E4m1/iaQgsu2dxU3ZIl
	df806u58Qr1QcK9U16oIe8aZftWElRWPYJp4f+rUvim3mhZUx9N/0r3gAjWPRynuLlNuyyjtfQY1V
	+ny1yGNosdyige+cW1Dhx8n40Ka+zxYY6SEWIf/ur8xnqUUHnLGh37OoCkj5ayt/ef2dIPyM1+nQS
	0wfoQxI++qoeg2xXRB8lQoluc5KnKuukrx7TCQqdhCfuxLHXudLfRkRNnqlwU20WREnNBTD5nflta
	8vq7Ab+HGwj43lMl0lqzXA+5cbE4y1MmBG2V581Pp3n+UnyqXZUU9UcmWroPoA+qfDS51XIvTSLhu
	hpr32xdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kQL-0000000B93I-12B3;
	Mon, 22 Sep 2025 17:34:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kQH-0000000B90b-3JFL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:33:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78C3E43508;
	Mon, 22 Sep 2025 17:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C66C4CEF0;
	Mon, 22 Sep 2025 17:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758562437;
	bh=/VUh7SsvRLqVAoILRJvmLKOwGytnLANEuCYxE2Y6Nsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujixOvZ/cuH76701/N2sz1vu2SRUt38ykB39GGe9k/Rk33d5rK6o+EQQmmQoJwSe+
	 I8ukNEmX0UKxoeNqu2MJmke0E/iGRq0s8/Z3Gr0NodxphpIXyWZpdlWX5371Ddh0Ry
	 2bUjySSfg28fCpFpENGH8mHn142UNaMKIkD8CJtWbyYj6CxuiEAk18m8myXyp+NWas
	 fgQoVUO3qtE77qj+6GZ4RpQOfYcDBeCb0uivQr5Pq7azrWb098WZ8pTMYKEeD2MQ78
	 b88RN+F3xSsTrO75YY96NP4wr+D8OmBnnfgiJW15QEpkNSRDVeWXcW0VylsjlCr1O8
	 XtvCHdxD4ILpg==
Date: Mon, 22 Sep 2025 12:33:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Mark Brown <broonie@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	imx@lists.linux.dev, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: net: dsa: nxp,sja1105: Add
 reset-gpios property
Message-ID: <175856243558.512098.3904766472489050008.robh@kernel.org>
References: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
 <20250918-imx8mp-prt8ml-v2-1-3d84b4fe53de@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-imx8mp-prt8ml-v2-1-3d84b4fe53de@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_103357_859950_5AF8ADC5 
X-CRM114-Status: GOOD (  10.18  )
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


On Thu, 18 Sep 2025 14:19:44 +0200, Jonas Rebmann wrote:
> Both the nxp,sja1105 and the nxp,sja1110 series feature an active-low
> reset pin, rendering reset-gpios a valid property for all of the
> nxp,sja1105 family.
> 
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ED3E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tgWhNeBnE7Hge8p7qGU1SXvXbDK+DqHb8egE1HrRnE=; b=h2E76FbfhXndKEBrqYmnwib1ly
	T9R2buD0rGScTUZGXfT5TR/aBHV2SQpmCj/cNINCasQEogV7KKE/KudB2Jq0wUrjTLO1jW6w74+2k
	HwngiQXK+dDL3MadHo57XRWM5Cu33XOMTQIIx1VN72Ztni+Tx8DHpAxTMi9ocry1pPPIP/nBr+E04
	9YQbMIOC8mvzO73kNpA15XXOqcQi0DP09hsM3Q6qRWJA4qyuS5l6aZMJYnaAohr+Ib7GIoDHmvNx2
	N4RlewRoCHqZtlgQqAP0sqdyfERAMT+HFoF/DSLmH73VuOH2MAS2Oyv9JsgzztGYhDfwN0qXY9F9l
	wz88nvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXUs-0000000DY1S-21fw;
	Tue, 17 Dec 2024 13:20:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXSq-0000000DXaN-3TKM;
	Tue, 17 Dec 2024 13:18:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FD05A4101C;
	Tue, 17 Dec 2024 13:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2C0C4CED4;
	Tue, 17 Dec 2024 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734441495;
	bh=LgYSlCVhxva3zcs7YV247UvMnT+OkZcHDucG48hT898=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWEmcPewXktwLgiuhox8ozlQsK/lIgxiVOtV807N931COsH5Lq9S3PcN28jLvTtVW
	 RCNJfFqw+IiDt7NFzOM1ewhDwAwi+S6rD8g2mz1xw58FG4h/FCic+TSvlaZrxqZly6
	 f1OniB/T5YSWbnaaJGaTNhV2TJArmrqN2pYE4mj+M5UPo20Ce45LH+s7KHoj68msog
	 ZSK2g/ic+yoKlkMA6kQxPvtCuq/SLG8B4MT/KS0919fVbGx2W9hVHa4enD8dCeZtWn
	 nK5G+EkJkQj3SgxKmvTmIMtzDyB2DNMIQ1n2iIOXOMdgA+AqRsADm9SjJw0Q3nrp/q
	 L1pBQa4IlX7ng==
Date: Tue, 17 Dec 2024 07:18:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	linux-mediatek@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [net-next PATCH v11 1/9] dt-bindings: nvmem: Document support
 for Airoha AN8855 Switch EFUSE
Message-ID: <173444149293.1330948.15339441958855664724.robh@kernel.org>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209134459.27110-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_051816_927250_ACFE15EC 
X-CRM114-Status: UNSURE (   8.86  )
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


On Mon, 09 Dec 2024 14:44:18 +0100, Christian Marangi wrote:
> Document support for Airoha AN8855 Switch EFUSE used to calibrate
> internal PHYs and store additional configuration info.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/nvmem/airoha,an8855-efuse.yaml   | 123 ++++++++++++++++++
>  MAINTAINERS                                   |   8 ++
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C594ACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vd1fVjfecrNzv67FjQmaF3qTs66SkKr00KIyJJ5OAnY=; b=Qzqcdy5OnVh8fOf+kvhAlnghfe
	Q4TMOjR5ZtbGi6ZnXA8F9gtEgxsocTdvMSov+9gzqrl21LzSQWLk5VtlkCso3Vug+CqGaOWOUk1ck
	2hEwyHldx8WdAzH1M+tWK+pvBi/8suTf8ZN3p+jFdd8jUguMxjsE0ii2iGgZjdqXJA82HzK0iE71S
	wiqDeR4tuFv3xdHBmAxw0z5I/puvG3tIt7yJI4aCr1/mPUPcq7jboJelsdNz9DLfEX5cAOxg9GHxD
	D5vKf48CCndJWTo1HEor6Xh3a3mVywTIl+y2POEiFu542EV6f3026LsOVRpMrVJTiEkI/9VzojbnU
	ComY72oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRvC-0000000BOtT-2Z7K;
	Tue, 19 Aug 2025 19:23:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoP83-0000000B0R5-2FYf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 16:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Vd1fVjfecrNzv67FjQmaF3qTs66SkKr00KIyJJ5OAnY=; b=dX2G6QfFWoyouzS9hpaNTYhXe7
	fMvuvgVpl32Z6z2GGcajeKuyu2uwqMX8YFi3nXNAtIF/APmT/AuOTeC1SiolObvTzZdNNom2HaQZC
	qs2Can+jaTis9L6ghjqDlg8GQgXX7CCgXaEHKoEb30L/4lwy96kOspwgVa6Y7ZH+FVzU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uoP7w-005DFz-Gs; Tue, 19 Aug 2025 18:24:00 +0200
Date: Tue, 19 Aug 2025 18:24:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, stable+noautosel@kernel.org,
	Yijie Yang <quic_yijiyang@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
Message-ID: <813548c2-02be-40fa-bb6b-00c4e713d17c@lunn.ch>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-4-5050ed3402cb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-qcs615_eth-v4-4-5050ed3402cb@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_092407_572456_EF894A66 
X-CRM114-Status: UNSURE (   6.24  )
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

> +	mdio: mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		rgmii_phy: phy@7 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0x7>;
> +
> +			interrupts-extended = <&tlmm 121 IRQ_TYPE_EDGE_FALLING>;

PHY interrupt are always level, never edge.

    Andrew

---
pw-bot: cr



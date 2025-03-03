Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175DFC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkrJJdtA5uhi9S/UflXwkZvZrgvrR9Tt98ToUZKE9oQ=; b=pgZEFFXawKDAmaBbC7Nsw84yl9
	X3NpDl4LnE4cWJilB7cbuHtWJh6h89k3e0HFgQZPmPWkw1fZmbPt6e2nLhrD1pDX+0DfuZ+b2uPFE
	Svwka2eVJtY0ZD/MMdXWN4/2HEpA0h26wbPv+m0MHLGofKenryX4Xi/cXi2WSAqxG6AgOKHtIv0Ib
	9Fxa/CM10hUku5w/YjO8oaxuI068eL9/6o9wnWXsb7Xj6Qw9wZ1uCnGDCvLeR4M63aAcP+Dw3Kifl
	TuBr9ieZstJ6994cXPglL8N/kdDnUObR3dCAthXE5av1Zbj3TVbVugKit2nRX6Jjo5XalSUKCTfSp
	FZoDUb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7Rp-00000001EmB-2xE6;
	Mon, 03 Mar 2025 15:11:13 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7OQ-00000001E5G-1gih;
	Mon, 03 Mar 2025 15:07:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9FF0611E2;
	Mon,  3 Mar 2025 15:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C42EC4CED6;
	Mon,  3 Mar 2025 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741014461;
	bh=HuPOnOviq8r+tHWc9h2eXFiWNQM7CuuwBrKHN13HnOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e8lsaej9A2HXVSBTtk7NEa22kgHyP3MX8CO9eEccqrCx2bictg+yFVDreriVq3Gvk
	 HN1Jo4/Pu7xF/kgCJBQPGB46Z7EyG4nAYRI7ULlQMABBb3iyUgTNqdcDsGPsYqj2Dr
	 q1FAglCF8KP7tT1/JssrxgPw8O1n9cwwlgWorHT+u7Zu5f7+2kAG6A7TrJsXocFIIr
	 ZI+JL/h37Bqvfg/j8Ua6Jx3aOHE8uz/4Mg9OfyeFT2se1iJEXzqXE5NQ15JdGXtRxe
	 h5JJLpwB0IVNFHpfJgyR2VitKa2EPa60FKPTfDl6govGN7YkD8aHAE/ucBNpVuJ8ze
	 O3+dNqs3LQEdA==
Date: Mon, 3 Mar 2025 09:07:39 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: soc: rockchip: Add RK3528 VO GRF syscon
Message-ID: <174101445900.1859153.5372866255768427473.robh@kernel.org>
References: <20250301104250.36295-1-ziyao@disroot.org>
 <20250301104250.36295-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301104250.36295-2-ziyao@disroot.org>
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


On Sat, 01 Mar 2025 10:42:43 +0000, Yao Zi wrote:
> Add compatible string for VO GRF found on RK3528 SoC.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



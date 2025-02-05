Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FE7C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mda0fzhdUPau8QKHCTMo2bsFrM8+JaqlD8uZWViU6M=; b=dzW/ViVsTZX6x+sr/k6xrKggMw
	AB8HaTLSbSreCnABRSJN+E0HIsKSzWt+G5nDRZHnZ9ktWlkS0oxUKAeCw/xtFRuoS4OqLyy5+8Cfa
	TEuPYdnlJRLidTcvrn7B0/hwf4FHvkr2FP/6Y/KKGCLF6aLYH5Swc3X3sJ4TSg3yCbgSfX4rRPviH
	l5Ws6eqCiNqpZHktt8KFJNev0IXQWnWNlwtAHUdQXHbf687DhLE/LkzSKtWMhDZ/Xj2xCxkerfF3K
	9O+tZWhW34ykXxpoULmVQh2rhrHuG/14kFJ7iyg9mTApCNPsOo3Ql6dFKehIO/hJ3OIPwd3AxrRfA
	BqjtjO7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcIT-00000002oT1-03c8;
	Wed, 05 Feb 2025 10:06:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcH5-00000002oAR-4ArE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 10:04:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 750745C6293;
	Wed,  5 Feb 2025 10:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04202C4CED1;
	Wed,  5 Feb 2025 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738749891;
	bh=wiFPSU9Nu6XcNSSf48rTUunTbB1K/IA9ZU1/GaPkPSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFRPfzpZCD9spWSDgrws1wfBDubGn65XxXY3D8WfJTWj36wGmqEBcAc9WlkpzAPZ1
	 BLcoIIF7AXFaF8qRAfZ6rDG8r71B2YtRJxIh9/Y9nljwHDqooLnaItuJ90LqvRYNqK
	 oW/zEv19bgrZM/LhhZsLS/wKJCd2kmOxoBDdRlDyHi88w5Yp4wmJ4jBPqt1WEZb2bz
	 rOVhQQufGSpmD9lBfDsNA6tASQeRys4TyqVRStfSt25temHkKj/IA+1BXNY9zSeSAv
	 8bZ6G2/rTgIu6UG6OMMp4Fu38uvoJBWJF5mz3tyIB8zS3h8tqpaIllDhoSLvNwGgLT
	 RTjMB7s1wE3Cg==
Date: Wed, 5 Feb 2025 11:04:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: memory-controllers: Move qcom,ebi2 from
 bindings/bus/
Message-ID: <20250205-nippy-spiritual-tortoise-b0a68b@krzk-bin>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
 <20250203-dt-lan9115-fix-v1-1-eb35389a7365@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-dt-lan9115-fix-v1-1-eb35389a7365@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_020452_073096_7FB1A108 
X-CRM114-Status: UNSURE (   9.61  )
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

On Mon, Feb 03, 2025 at 03:29:13PM -0600, Rob Herring (Arm) wrote:
> The preferred location for external parallel/memory buses is in
> memory-controllers. 'bus' is generally for internal chip buses.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/{bus => memory-controllers}/qcom,ebi2.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



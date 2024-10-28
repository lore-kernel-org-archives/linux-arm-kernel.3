Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B38D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 07:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cf2NKVZmCXzc9O9wk4KmcsmrutLzGRLXSwq0IBHE45Y=; b=R/SeZnwrsb+zi+7KXDRww5PDT4
	ej4zguAXGNVVIiA5g6YSelbvGjODOReMjwpYKpcIrss24OZ4x/y8HA6Mx7RBvcqWgtuA0vidXl7dX
	OTcsZpGcYeR08vmeVLn8+nuBjQKguwcCftRXjzekAClJwA/ZsTxouWSUkpbDzdffD/gOaGgctlPc2
	zFkdB9UA6PA0jU1FCG2QekTiqWaH/ByCWiwA8IjawzKteu47BO59Ecg9sP3QHzRAzqFyXSXmadItp
	Emrpv+6kdyviqpjjEb+xuwa68xWO8/oJqctHzi/rYD2iaUKcVEKCsSK+DXf9c/7QM4++Br4W2Y3xs
	BdfV35LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KDV-00000009roy-1u10;
	Mon, 28 Oct 2024 07:31:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KBp-00000009rRR-1Qk8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 07:29:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7F8E5C564C;
	Mon, 28 Oct 2024 07:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEEBC4CEC3;
	Mon, 28 Oct 2024 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730100564;
	bh=eAdOEawa5eGk49560zkEDUAGIPAvX2hfDutdAy0RIpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1Fzg29FwGMPNq52Ui7Upa1ZqMWDvEnyjwXmWBJbwf2p3h29gAogy9+4a7GAlkXxx
	 1KY3J056WqZwQrec0VQDv/gjuwrgN9yh2beKo4Walc4qsCRIdB+LfB4vncGLOB8UdM
	 ueGpow/qgOtGqp8qvf8eFcNXw84LrsSQ25rPbz5tWNmfRF1HzUG1H/HSK2LZ5MGI3A
	 SU7KTJgVK33kxPxWhwBJOLPS+esrTeExM6QaNr9qikWTOiUI31SmWtOzd6UWHke0ao
	 h89NqaW4pLiaw60RgamQTtXzXQkMy67Whpf6q1bKUWNEKxZkG4P2/qxE7zXMONnMmE
	 sXpNrzC3AffbA==
Date: Mon, 28 Oct 2024 08:29:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_varada@quicinc.com
Subject: Re: [PATCH V5 2/6] dt-bindings: clock: Add Qualcomm IPQ5424 GCC
 binding
Message-ID: <cznvuyyhzltpdqabz7gjo3odjew46ppclvhhkw2r7ajczatgjk@7t3gcz47ivl2>
References: <20241028060506.246606-1-quic_srichara@quicinc.com>
 <20241028060506.246606-3-quic_srichara@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028060506.246606-3-quic_srichara@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_002925_443981_E75AE908 
X-CRM114-Status: UNSURE (   6.84  )
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

On Mon, Oct 28, 2024 at 11:35:02AM +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add binding for the Qualcomm IPQ5424 Global Clock Controller
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  [V5] Updated ipq5424 clk properties with minItems

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913A4CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3x4DI+r2o+M5OjqpFS6OZ1qGfPVvzMDKIrkU72g8iM=; b=p0OAakHUSYgIei0R4XXaB8HmAq
	JYYSSOePTAUQpQJB3DezesXHuG/8Tz+QhbbTxQirnhFk2AGEQDTdJAn/rdrLY3sM4t06sIAlm/6mx
	gGSSn9RvN04peYcFkSdqU455kAEiIx+ms2YfPDPhfXdMJGXIc8/vjtDOUMzAv5x0bI9xw3QHcSiUH
	FxJbvZmf4nomKBVbBtcZzh0r9A7YwECH0GH0fUaubaPF+e971vFetQ+UdDR4UzDfs6C/CaovoF/sV
	PxK9geYx5QkJ/1msi0AwdXbQ5kQkpoXO9aCVgTAf8YywQQPTmQq0RD1BwHnKBoI/SsPex+T6AK/85
	47dcUu0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSL9-00000001fHP-2T3t;
	Wed, 22 Oct 2025 06:28:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSL8-00000001fH6-2PR7;
	Wed, 22 Oct 2025 06:28:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A18956030D;
	Wed, 22 Oct 2025 06:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62BDC4CEE7;
	Wed, 22 Oct 2025 06:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761114533;
	bh=Ljm2ULtaHnAICwY5sdTetLQkB743kUutmk8GF2iooEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h113bMnY2l5y/tnVT3ynhN5CotZ6Q+5nOgPCFKU83/0Cc8U5vHIoF9RK3+d9hn908
	 6aQ2ggeu2H723AxMu7rDs6Psyc6+815khC6gxP6tSyGpTgp3WAYJ8d+OQPycMCNzms
	 +nT5Km8Vp9tirN2fbf20OH8EBzOAvQ/lQrPoOdmPHXbpOBMq2AonwScFfkzelA2bFt
	 iv8oTXzROTo2jdyQDVaHSffWxks71Fldjf5Nz6W11kHLMwzgQNP6NostPEScnZbCAC
	 slXk3xlsWhCL8+p7PaqU/7I4HJ+L9E7pCIyojIl0kQI10vMOFhOwPyED/gsJ8NGEqd
	 9IdXBHDa11Rsg==
Date: Wed, 22 Oct 2025 08:28:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ulf.hansson@linaro.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, zhangqing@rock-chips.com, sugar.zhang@rock-chips.com, 
	huangtao@rock-chips.com
Subject: Re: [PATCH v4 1/2] dt-bindings: power: rockchip: Add support for
 RV1126B
Message-ID: <20251022-competent-nondescript-ocelot-fd605f@kuoka>
References: <20251017093834.331998-1-finley.xiao@rock-chips.com>
 <20251017093834.331998-2-finley.xiao@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017093834.331998-2-finley.xiao@rock-chips.com>
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

On Fri, Oct 17, 2025 at 05:38:33PM +0800, Finley Xiao wrote:
> Add power domain IDs for RV1126B SoC.
> Add a new compatible because register fields have changed.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



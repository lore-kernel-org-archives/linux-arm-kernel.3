Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1E1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 20:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mut8X2MNoo6jz3edl0MFZIX4hx1h7hlXw05SmrRldgw=; b=n0Mbdc4Jjloj+Oopzp/m3EFAJ2
	S35eoS/qY6Zegn2p5yJY3ZdHytiyq2ig+EFs9PVi3NoJuFQMQmHBukbrgqyKZPDhFkBF/6MdguESv
	pAO87bOZElySwEOENX4265Qv/3l5OmaHrffkB1+HYeePDdX+iEPySrnKrSuKAuzUXwNpCkshd7jAE
	UTbSUs6q+13XLB/rXCCv9TWNd0bhGJ9JVv37RrddgaDEUyiSSmm9Su/SvQO0rKCZBTvcfMopzoVkP
	bJI7N83WMoRSqq0/8a1gX66Etgz5viAHtFKNVitX3Sm8d78U0NsLk7ib2DN47S6a44mcDi+PqMAnJ
	1qmeBFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twodL-00000004DeQ-0fXJ;
	Mon, 24 Mar 2025 20:42:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twoL9-00000004BNy-19LH;
	Mon, 24 Mar 2025 20:24:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA3CE5C43CE;
	Mon, 24 Mar 2025 20:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22244C4CEDD;
	Mon, 24 Mar 2025 20:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742847846;
	bh=Y8JdXz4w7Rb3q/NzS3QDuCo0lwePkl8nwoggfeIM59I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpS0uqO+GV78U+HhCW2Pa57Hp/F5lfUJ1TPrMxX9tm+Km4QEag0laYNWoLmJgmb0k
	 zqWDfjUKKludodl+A9N5q2QDF5NSUuzG11SLqNeXdlUd3ac/AwnZIW6OAIW6De2STL
	 mRdz2R22XloNfkaRETG6kAKRU8QZDJigmeAsmZ3In7+fjAx7tkwSewXO586gtQSV9+
	 Q4ohWhfKrMgUQ5OGuApJitcmW0DUGYYnmEpM2fFCUe7XAuPgDTgziFh0MIWmDY64GR
	 2KEOezRSks1Iz9iAGfweHqJUeNBhE+3AjtQEDzZs6pq7DnLQSu6IDlIahLOT4sSEwH
	 oytTG/oMBeKyQ==
Date: Mon, 24 Mar 2025 15:24:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: nvmem: Correct indentation and style in DTS
 example
Message-ID: <174284784448.810985.2720262744540534185.robh@kernel.org>
References: <20250324125214.82028-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324125214.82028-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_132407_354405_1414F96F 
X-CRM114-Status: GOOD (  10.41  )
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


On Mon, 24 Mar 2025 13:52:14 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/nvmem/nvmem.yaml      | 60 +++++++++----------
>  .../devicetree/bindings/nvmem/rmem.yaml       | 20 +++----
>  .../bindings/nvmem/rockchip-efuse.yaml        | 20 +++----
>  3 files changed, 50 insertions(+), 50 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



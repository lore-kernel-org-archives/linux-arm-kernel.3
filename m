Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309DACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmysuaiyz2LkPxhSqMIHHjXNjcia5yY7Oz7bV8bQr/A=; b=ctcSNhlHULXO1W506zYV4An7eB
	EO9ntLNNiVjrXMgPz7l1g3yqJyT1u3Ca0UfNOScUW3Vfigp79gTAzQDgC1L1nFToY+vTF3I3NiZhM
	Cb+UWqe8rePwtzGLSlbDNsLguh1YaDlKYdcdnbUzZu/CNnsY2wpvzWwlpLDaWu0Eukx1oyM5wS7oV
	/ZAz0MoqS42KBB0O8UlrPGWSsPzYJDulFwFiZgY9pkJNkzmI4Ft/l33YN8rFNdlGfb/V7uUsspM9N
	XN9W/+ohjztS/7B7VxeBwveHJYq4xgQXYvs5ARY8zFI/lUVBp/645EtkTiWB742XqZvh5B+UIE2UC
	G8OQQeiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENhB-00000003fU0-2Vdl;
	Thu, 30 Oct 2025 08:07:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENh9-00000003fTe-0uSf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 08:07:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69D3C43EF3;
	Thu, 30 Oct 2025 08:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B13C4CEF1;
	Thu, 30 Oct 2025 08:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761811662;
	bh=tx+9ONWz0erQeG73gAESo7zYQdNz6syhMPWKMFLR3HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdZ6/68boe1hfp3PniogA58QBsx6NZ7FXz+dP33luyMmfrP4T6JGDylpGUUV+TmZH
	 Qu7NVCmcyvO+PY1OywmXbAiJlbvTeKcSQfHQEeEuOmCmEFcytKIzJqQoVUKyq/FDti
	 wvnTk1rYQoRZSc/A15VbSDgsyqb+o+C0GAVVm4i8aQulRZTDKDGUzW8+0d9ExLfTmD
	 9aqod/VD83bD3cQIyU6p0nsXdiAhCWrG+K9P9yckjC8m5OYJQBRNgHyRL0vFmEipzN
	 0lzwZQ/ENzM1z+agqQRWhybduybGxtOx/Sn15vkQiqoNpmjsGJYlkPO4cUaAYkEc/+
	 sQim1O1B5V4yw==
Date: Thu, 30 Oct 2025 09:07:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harsh Jain <h.jain@amd.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mounika.botcha@amd.com, sarat.chand.savitala@amd.com, 
	michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, jay.buddhabhatti@amd.com
Subject: Re: [PATCH 04/15] dt-bindings: crypto: Mark zynqmp-aes as Deprecated
Message-ID: <20251030-wandering-happy-dalmatian-9cce2b@kuoka>
References: <20251029102158.3190743-1-h.jain@amd.com>
 <20251029102158.3190743-5-h.jain@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029102158.3190743-5-h.jain@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_010743_281146_07BEA72B 
X-CRM114-Status: UNSURE (   7.88  )
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

On Wed, Oct 29, 2025 at 03:51:47PM +0530, Harsh Jain wrote:
> zynqmp-aes-gcm updated to self discover, corresponding dt binding
> can be mark deprecated.
> 
> Signed-off-by: Harsh Jain <h.jain@amd.com>
> ---
>  Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml   | 2 ++
>  .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml          | 1 +

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



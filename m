Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CDAD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZ0ChmYx1yk18f2CE2YDpBrITPm5SOEwVLjda5p/aZg=; b=C0Q9s4M+zsEmUTIUgU7yYFC4nV
	9DD2IauaJ7mbnHA/OaJtrjy4uin2ulmlVMBEqXDCOqf4AXL7ACc7zqnklMZuDe8AjRuxibBk0TTp2
	NbFVHe8aR5BHFwh4HJjUBYb2nTuj/Ys/SHw3qc0EtGZFU+eO512trRvSRo/hEuz8/cA91OqfIMiLe
	rZKRuOFsbPEwUa6aPJkGmnXJekR0Hg5aOBRCeUaP9cgfkt5bPFPoCmi2i7e14Y/t6x4E4eYyPKqVf
	/ExmgrsR2g1v2WexQPUPUMH5JbID6uQv4kLdvH78zwqV6ebcfM9VWD2d0Ij6kP7cOlmto822yT3ds
	WLONvj2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8fS-00000003Zyp-3ePf;
	Tue, 20 Jan 2026 10:08:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8fQ-00000003Zx4-2i7n;
	Tue, 20 Jan 2026 10:08:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E873444263;
	Tue, 20 Jan 2026 10:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CC2C2BC86;
	Tue, 20 Jan 2026 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768903735;
	bh=FUBbceT0gdVJ7BI0SLVl6AzOLKzEY4BtDPW5/kA7ii4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ae9fJv6bDlrMXR5M59I1lB7gTIx2ntm6gGmBVjMEkocWwK+hMSl72gMBz2WPVTQSK
	 UEiucSpuMXdD7EcmqVbWwwOIijO2OGiHyPDwhphIcloHGlnpJAaBLvIpDAU2HuhNim
	 KdLB1m+8GikASNKh6VSic3YsePYCq2g1y8OosWFywWRNpPDkV7KpkEtwwXDtwwtxj3
	 +chDGZ5SWBjXWBXf8S+QIIL6ED9rwjA5t8XZdGaLfMinOE6WW1LqWSTi6x0Lvz4uSB
	 SKQwjD4MsWqencUUS0USrEUp545ctHEiLvjK9AxLgzjBiQeP6639k3ILAFcOw9SypE
	 5/wIdyvu7iMaw==
Date: Tue, 20 Jan 2026 11:08:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: airoha: npu: Add
 firmware-name property
Message-ID: <20260120-vagabond-jaybird-of-pizza-6bc8ca@quoll>
References: <20260119-airoha-npu-firmware-name-v3-0-cba88eed96cc@kernel.org>
 <20260119-airoha-npu-firmware-name-v3-1-cba88eed96cc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119-airoha-npu-firmware-name-v3-1-cba88eed96cc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_020856_708557_86622914 
X-CRM114-Status: GOOD (  13.74  )
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

On Mon, Jan 19, 2026 at 04:32:40PM +0100, Lorenzo Bianconi wrote:
> Add firmware-name property in order to introduce the capability to
> specify the firmware names used for 'RiscV core' and 'Data section'
> binaries. This patch is needed because NPU firmware binaries are board
> specific since they depend on the MediaTek WiFi chip used on the board
> (e.g. MT7996 or MT7992) and the WiFi chip version info is not available
> in the NPU driver. This is a preliminary patch to enable MT76 NPU
> offloading if the Airoha SoC is equipped with MT7996 (Eagle) WiFi chipset.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



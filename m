Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F79C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juwqgrYGCE5w996uXwogPcMmbvC5/i22u0VdOtMgdug=; b=E6VVWwVtbesIzp+81UqTAzos83
	9xn4pyjBD0i/U+I29UKWo/cexVDfFfBZ8iwUzLjLGaUWrZ6urhLSBT+ldpfSp9FPjaRuiWciyyzcV
	qROc2XV7dg3yp1sVQ/WBNHNG/XhJg5UkKCAKwZubE6LOxMfTrjYQ6YP3ffEE99P4Z9hcTrWJH9Emm
	5hX+V+GpbxEcVPDBm4u9lNRXHlAlbYJmZZgh+o6NquqGVP9Nr1avHAec9OxSO63m8+KUWc0pWWd1B
	9moWJMjjcXCvWoQX2wweznIjAWlZ7dGH/gdt1XD0gnZFY5lRbNct6GuFPcIzLzBDfJaJek6lCFNu+
	8Uqi9B+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjGL-00000007FHD-0HsB;
	Wed, 05 Mar 2025 07:33:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjEl-00000007F8p-1N44;
	Wed, 05 Mar 2025 07:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=juwqgrYGCE5w996uXwogPcMmbvC5/i22u0VdOtMgdug=; b=CCVDXchHiVKW/hiyn4foyX15lj
	EZHCL0DYeLvVjc7SFmDZPMaZUPStbAWsCQ/DbJgvmqzxDeBVxZbr3bzPQxtRyf9PFF+f0PDqS+fh5
	OVWAixorvS7REJ0Izmo0F+NvUh+qKWp6ogYcivNtxOTtBQB7elLG0UOR+8IKGK2cIwPyYeQbyB3IU
	sbl/Uw3lbqZviWEiqL4xdp7nm7DPnjKKd0pc00VmZFlqpE8aK7JF6Brmb75JWZfC+W/qxQ3ZWD0eK
	w2jMEWvYRsr19IR8fJq9z98PpohgldxtToY/Xvr+yAh3D5zEiYqp1j9Xu5UbPxSiN6lww/jQw/YEg
	nRWcV3oQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjEi-00000000P6P-0pea;
	Wed, 05 Mar 2025 07:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE6E9A44F1D;
	Wed,  5 Mar 2025 07:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83236C4CEE2;
	Wed,  5 Mar 2025 07:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741159930;
	bh=m62ntYl+OHjI4BbSj3eSfbV1M2IVOsVTJYXyzyiQ8cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WzXE2Tck/lDhxGd7+olXHUH9tYc7zFNpzzbFM4ShYSxjDqPsUD1z4Vjq5v/0+/Xe9
	 VHbU8E5BDJ2sqSrjARXmS6zWQdCRz1gE8SfwD/dbNDC5V+ks6RXYI7RYn905tGiwb7
	 wWBA4+wkkYTW8Y3dxJAagG9DGnY/QQvFVhVbHeOMVsTPBIqn4v4aUZW7mBv8pkfn6F
	 dx7qGEByHTDHznB/rhUumWoB4hDNWNK8ayR/5TwRNLxjF7uMAu3fE5NTeIn2M+TVGl
	 jzTzpoMEA8pLjq3wQF493TFciUCEpc3Mq5VJoDNedxso9It7grlylT4n8jxN8i5G2L
	 LNJ3/7YiXXepg==
Date: Wed, 5 Mar 2025 08:32:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/9] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Message-ID: <20250305-furry-finch-of-camouflage-e7ee5e@krzk-bin>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-2-a698a2e68e06@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-2-a698a2e68e06@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_073212_680660_7D2B3B7C 
X-CRM114-Status: UNSURE (   7.48  )
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

On Tue, Mar 04, 2025 at 01:56:35PM -0800, Melody Olvera wrote:
> +  vdd-supply:
> +    description:
> +      Phandle to 0.88V regulator supply to PHY digital circuit.
> +
> +  vdda12-supply:
> +    description:
> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - vdd-supply
> +  - vdda12-supply
> +  - resets

Keep the same order as in "properties" list.

> +
> +additionalProperties: false

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



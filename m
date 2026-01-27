Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDB9D25932
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 04:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8ppbEEXs9uF6hAUvvPUoYPX6LTO6Hgt7Ga5NzffJTE=; b=XuX52t1fwmDuppaI2+cyIc5Zfu
	Ucp5lTHEwcb89QTx9nMslM5KK1xRlVWZb8i5dA4ZLl6cI0rtG0x/SyWk4gdQkljPkjFzBRLwaTUES
	pYC2lqO22Z580VwrMnUklquAzxGeYV5CE2wpgzkBGwKripCArAA3ZXjnCkuBgDmVBrfuhOz4zSsx5
	PQ5z+2jHEZVzF83tKEEGQsGWafnih0uESUqNQ07v3FmdrXvWsSl8XwgnWbnw6c8GPDyqcem94NBER
	jWyJQRuPdcjJ17DmkEZIJ8SpShwBA39Kyr1rgXPEBm//OoikNH23XJn27IhaqHbLZHZH1g1rVvVCV
	UREH4o/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkawa-0000000DesA-0OhN;
	Tue, 27 Jan 2026 04:44:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkawX-0000000Dern-0vy4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 04:44:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA96D437AF;
	Tue, 27 Jan 2026 04:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF17FC116C6;
	Tue, 27 Jan 2026 04:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769489083;
	bh=N4/dTgsSkKgyPM4oXZP0ylgXW3yR83HN4AMrwnF75aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WF5KbspleVHuga8JwYh3EeefwmK+a6HDYpdOtJsIEhYhKi7SjlC1BWgGttTO8iTES
	 pnKiYzRN97JT9hPs+Xudm2RzaPx98OGJgd+B3CBaqga4r97b7UtC15r35QPKKKbGic
	 g02pRSd4SNV7lnfw0eCqPWJw6Ah31X1pRK9m2IP1udWZfsqBjAeOeTtyE+qzVFfxk2
	 6ACAOnIzIBkZ1r8gU/Fx2cWitvXT0Fr1JhoPMmBvXFRBnky5QC6k1Z0MSkoaI88pA1
	 xd/3vU1teyEqQuJhZpxRloBEM7oHKMRQHGs7yXbdPxjH1TaTVN+qPqm1+G1+MYw7bc
	 HP4pwwMayARyw==
Date: Tue, 27 Jan 2026 10:14:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christopher Ruehl <chris.ruehl@gtsys.com.hk>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Fix emails with spaces or missing brackets
Message-ID: <2pmaiz2yvgtmfjg6wtduoksjr34znalkvapr3dn3v6fqlxcdde@xkmnuvww7v37>
References: <20260126164724.2832009-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260126164724.2832009-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_204445_312058_51087645 
X-CRM114-Status: GOOD (  16.02  )
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

On Mon, Jan 26, 2026 at 10:47:22AM -0600, Rob Herring (Arm) wrote:
> Fix email addresses with spaces or missing brackets. A pending
> dtschema meta-schema change will check for these.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml    | 2 +-
>  Documentation/devicetree/bindings/input/syna,rmi4.yaml          | 2 +-
>  .../devicetree/bindings/media/samsung,exynos5250-gsc.yaml       | 2 +-
>  Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml     | 2 +-

For PCI controllers,

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
> index 3d14d5fc96c5..7b38f2182ffa 100644
> --- a/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Sensirion SHTC1 Humidity and Temperature Sensor IC
>  
>  maintainers:
> -  - Christopher Ruehl chris.ruehl@gtsys.com.hk
> +  - Christopher Ruehl <chris.ruehl@gtsys.com.hk>
>  
>  description: |
>    The SHTC1, SHTW1 and SHTC3 are digital humidity and temperature sensors
> diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> index f369385ffaf0..8685ef4481f4 100644
> --- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> +++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> @@ -8,7 +8,7 @@ title: Synaptics RMI4 compliant devices
>  
>  maintainers:
>    - Jason A. Donenfeld <Jason@zx2c4.com>
> -  - Matthias Schiffer <matthias.schiffer@ew.tq-group.com
> +  - Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>    - Vincent Huang <vincent.huang@tw.synaptics.com>
>  
>  description: |
> diff --git a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
> index 878397830a4d..9196cf5dac0f 100644
> --- a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
> +++ b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
> @@ -9,7 +9,7 @@ title: Samsung Exynos SoC G-Scaler
>  maintainers:
>    - Inki Dae <inki.dae@samsung.com>
>    - Krzysztof Kozlowski <krzk@kernel.org>
> -  - Seung-Woo Kim <sw0312.kim@samsung.com
> +  - Seung-Woo Kim <sw0312.kim@samsung.com>
>  
>  description:
>    G-Scaler is used for scaling and color space conversion on Samsung Exynos
> diff --git a/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml b/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
> index d286b77921e0..8f5d33050348 100644
> --- a/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Mobiveil AXI PCIe Host Bridge
>  
>  maintainers:
> -  - Frank Li <Frank Li@nxp.com>
> +  - Frank Li <Frank.Li@nxp.com>
>  
>  description:
>    Mobiveil's GPEX 4.0 is a PCIe Gen4 host bridge IP. This configurable IP
> -- 
> 2.51.0
> 

-- 
மணிவண்ணன் சதாசிவம்


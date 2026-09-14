Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6C2C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 22:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gX0+buPol0IOu2STFYojX6mwp/Bods897OXsqduo5aA=; b=SXY/3LEZzC7P6jlYKXKkn0Vxip
	bNUtpoPUdDrRF9mWx9rMO6cFv+GrE1QEOmUAvnjyKfJpo0y5saTQw3YGdwWDs8sIR+KCBUSsR9qCW
	N3OrBHtqpgrIVZ6X/HO/GGKvS1hE8CbjMkFaBT3Ap2Jq0nf9G9HuN/XtRSo3XVTQHFFR5uRqi5b/V
	eh7QQtGhFpo9kGCxAfAif9k9bHza56DHgE+3Jo0tbkI+65oS5ESQBuQHiHuTCokTkUB63gD/8FidU
	ZhLwRHZQQr9JYOoYBd/5VC5VOpVhLfwthefvGAk2nfSyxkn+Wz4Hk6+mY+fAKz8rf26y9KFWbLTEF
	hA8y0k0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6F51-00000004mO3-1Ak7;
	Mon, 14 Sep 2026 22:23:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6F4z-00000004mNV-3pnb;
	Mon, 14 Sep 2026 22:23:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1420360252;
	Mon, 14 Sep 2026 22:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBAD1F000FF;
	Mon, 14 Sep 2026 22:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789424592;
	bh=gX0+buPol0IOu2STFYojX6mwp/Bods897OXsqduo5aA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NOwfO8z0DKR9n0v0AyUrHXu/Z3wP42nsBxLo0tx0FGp2Emi5MCpMD36NqKiet0mAb
	 IXPC8DIN8pmkayfa+n1Z7hC/3olMJXvvaKUIo6QNmdWFSPkmHH63+mM1703odrTrZw
	 2+YvigqxHBQ4EGAVmpzwrx5cWeOwfvgMiUqTHaTPQXGpBmGdTZwec5mv3vphaphKo8
	 QyvjqVSrprtX/d5wqALXX2ExpnGjuF6jfAYHARk/xbN7sA8wTYSV7ndxcS3dq9FnT0
	 3GKB82ttVc5M3nL1SJZCEQAEdRk1EugwXIILObbzO4TY/H4M9n2uFgtxsM3Jzwt4Tf
	 ibMjyTgI8+Rsw==
Message-ID: <f506f53c-0fa1-4853-9560-2172bf880efa@kernel.org>
Date: Mon, 14 Sep 2026 23:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] nvmem: layouts: Add Rockchip OTP CPUID layout
 driver
To: Alexey Charkov <alchark@flipper.net>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
 <20260902-rk3576-otp-cpuid-mac-v2-3-e4b7fe2ab13f@flipper.net>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-3-e4b7fe2ab13f@flipper.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/2/26 2:07 PM, Alexey Charkov wrote:
> Rockchip SoCs customarily use the CPU ID programmed into their on-chip OTP
> memory to derive stable Ethernet MAC addresses even when a board doesn't
> otherwise have dedicated storage for those. The derivation depends on the
> particular bootloader implementation (e.g. it is done by upstream U-Boot,
> which patches the derived MAC addresses at runtime into the device tree it
> hands to the kernel). Using less featureful bootloaders, such as direct
> boot to Linux from SPL, leaves the kernel with only a random MAC address
> instead, even though everything required for the derivation is equally
> available to Linux as it is to U-Boot.
> 
> Reproduce the same derivation in the kernel and expose the result as an
> nvmem cell named "mac-address", so that of_get_mac_address() picks it up
> through its standard nvmem fallback. The address index comes from the DT
> phandle argument, which lets both interfaces of a dual Ethernet board
> share a single cell.
> 
> Enable the layout by default on Rockchip, as consumers of its cells would
> otherwise defer their probe indefinitely.
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  MAINTAINERS                                |   1 +
>  drivers/nvmem/layouts/Kconfig              |  13 ++++
>  drivers/nvmem/layouts/Makefile             |   1 +
>  drivers/nvmem/layouts/rockchip-otp-cpuid.c | 119 +++++++++++++++++++++++++++++
>  4 files changed, 134 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f3d07ce7b3c8..73e0531445be 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23727,6 +23727,7 @@ M:	Alexey Charkov <alchark@flipper.net>
>  L:	linux-rockchip@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml
> +F:	drivers/nvmem/layouts/rockchip-otp-cpuid.c
>  
>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>  M:	Daniel Golle <daniel@makrotopia.org>
> diff --git a/drivers/nvmem/layouts/Kconfig b/drivers/nvmem/layouts/Kconfig
> index 5e586dfebe47..6e2511ac6f7e 100644
> --- a/drivers/nvmem/layouts/Kconfig
> +++ b/drivers/nvmem/layouts/Kconfig
> @@ -26,6 +26,19 @@ config NVMEM_LAYOUT_ONIE_TLV
>  
>  	  If unsure, say N.
>  
> +config NVMEM_LAYOUT_ROCKCHIP_OTP_CPUID
> +	tristate "Rockchip OTP CPU ID layout support"
> +	default ARCH_ROCKCHIP
> +	select CRYPTO_LIB_SHA256
> +	help
> +	  Say Y here if you want to expose the MAC addresses that Rockchip
> +	  bootloaders derive from the CPU ID programmed into the OTP memory of
> +	  Rockchip SoCs. Boards which have no other source of MAC addresses
> +	  need this to get stable ones when the bootloader does not patch them
> +	  into the device tree.
> +
> +	  If unsure, say N.
> +
>  config NVMEM_LAYOUT_U_BOOT_ENV
>  	tristate "U-Boot environment variables layout"
>  	select CRC32
> diff --git a/drivers/nvmem/layouts/Makefile b/drivers/nvmem/layouts/Makefile
> index dd6c6c70b1a9..a0ade4c22c79 100644
> --- a/drivers/nvmem/layouts/Makefile
> +++ b/drivers/nvmem/layouts/Makefile
> @@ -6,4 +6,5 @@
>  obj-$(CONFIG_NVMEM_LAYOUTS) += fixed-layout.o
>  obj-$(CONFIG_NVMEM_LAYOUT_SL28_VPD) += sl28vpd.o
>  obj-$(CONFIG_NVMEM_LAYOUT_ONIE_TLV) += onie-tlv.o
> +obj-$(CONFIG_NVMEM_LAYOUT_ROCKCHIP_OTP_CPUID) += rockchip-otp-cpuid.o
>  obj-$(CONFIG_NVMEM_LAYOUT_U_BOOT_ENV) += u-boot-env.o
> diff --git a/drivers/nvmem/layouts/rockchip-otp-cpuid.c b/drivers/nvmem/layouts/rockchip-otp-cpuid.c
> new file mode 100644
> index 000000000000..61f509c4a8cf
> --- /dev/null
> +++ b/drivers/nvmem/layouts/rockchip-otp-cpuid.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: 2026 Flipper FZCO
> +/*
> + * NVMEM layout for the CPU ID in Rockchip OTP memory
> + */
> +
> +#include <crypto/sha2.h>
> +#include <linux/device-id/of.h>
> +#include <linux/etherdevice.h>
> +#include <linux/hex.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of.h>
> +#include <uapi/linux/if_ether.h>
...
> +
> +static int rockchip_cpuid_mac_pp(void *priv, const char *id, int index,
> +				 unsigned int offset, void *buf, size_t bytes)
> +{
> +	char cpuid[ROCKCHIP_CPUID_LEN * 2];
> +	u8 digest[SHA256_DIGEST_SIZE];
> +	u8 *mac = buf;
> +
> +	if (bytes != ROCKCHIP_CPUID_LEN)
> +		return -EINVAL;
> +
> +	if (index < 0 || index > 1)
> +		return -EINVAL;
> +
> +	/* The buffer still holds the raw CPU ID at this point */
> +	bin2hex(cpuid, mac, ROCKCHIP_CPUID_LEN);
> +
> +	sha256(cpuid, sizeof(cpuid), digest);
> +
> +	memcpy(mac, digest, ETH_ALEN);
> +	mac[0] &= 0xfe;		/* clear the multicast bit */
> +	mac[0] |= 0x02;		/* set the locally administered bit */
> +	mac[5] ^= index;
> +
> +	if (!is_valid_ether_addr(mac))
> +		return -EINVAL;
isn't this a dead check?

> +
> +	return 0;
> +}
> +
> +static int rockchip_cpuid_add_cells(struct nvmem_layout *layout)
> +{
> +	const struct rockchip_cpuid_data *data;
> +	struct nvmem_cell_info info = {0};
> +	struct device_node *layout_np;
> +	int ret;
> +
> +	data = of_device_get_match_data(&layout->dev);
> +	if (!data)
> +		return -EINVAL;
same here, this is dead check as we can never reach to this point
without matching compatible.

> +
> +	layout_np = of_nvmem_layout_get_container(layout->nvmem);
> +	if (!layout_np)
> +		return -ENOENT;
> +
> +	info.name = "mac-address";
> +	info.offset = data->offset;
> +	info.raw_len = ROCKCHIP_CPUID_LEN;
> +	info.bytes = ETH_ALEN;
> +	info.read_post_process = rockchip_cpuid_mac_pp;
> +	info.np = of_get_child_by_name(layout_np, info.name);
> +
> +	of_node_put(layout_np);
> +
> +	ret = nvmem_add_one_cell(layout->nvmem, &info);
> +	if (ret)
> +		of_node_put(info.np);
> +
> +	return ret;
> +}
> +...

> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Alexey Charkov <alchark@flipper.net>");
> +MODULE_DESCRIPTION("NVMEM layout driver for the CPU ID in Rockchip OTP memory");
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BACC9EC90
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsJh8E8UiJycX/1KxA58q5x+ZruCt4gSs5ZQlOLdQ4c=; b=hK5tGZo5PGe2tXa319OHxEW/ka
	1bNCFpt3OHQV123S2LAseoMwqDgUvuZNW+bHVmIAZpjNHL6QgOLREUeFfhUT550AzYVt0vu67jTRY
	O4NDxIYN6YHmGciXJqBrQLTooKwOW0QyQyByAvrNzPyjwfE1mMMgYgBzaiPT6zKdESn4QFszT7TjV
	2ko5YN9+YCbGKtZV9viIPGz+g4hOtsAxY9xiJCEeaH4Fvz5q5w0H7jpBrQ1TLQmoWqxIzT+r3mUQA
	C1d0epGqH0EFx5HNikPKyLs1DLHWAxgJ021ZvQ1Qw7eI9mSBAUla/gGeD36mPhXaYH2WnX1R/pNkl
	a9pRgxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHzq-00000005Pf5-2PFW;
	Mon, 12 Jan 2026 13:30:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHzo-00000005PeR-27EA;
	Mon, 12 Jan 2026 13:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fsJh8E8UiJycX/1KxA58q5x+ZruCt4gSs5ZQlOLdQ4c=; b=pRuPEFht0wctbrxahkRQ8mXek4
	zjWENWO8/oFBWF4txBJSSIi3//MpC4LQhV6ass8io8xmHGNaW6krvBN0INt2Rc148W1LpmY1ww5L0
	i8bdR9Wwk0u7p/eeMrrT68z8p2ecaHT1wLxAdECRk3ekvtcP57ggHrT6aghIDw/yrKBU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vfHzf-002Tk1-4i; Mon, 12 Jan 2026 14:30:03 +0100
Date: Mon, 12 Jan 2026 14:30:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] net: airoha: npu: Add the capability to
 read firmware names from dts
Message-ID: <f57867a0-a57d-4572-b0ed-b2adb41d9689@lunn.ch>
References: <20260112-airoha-npu-firmware-name-v1-0-d0b148b6710f@kernel.org>
 <20260112-airoha-npu-firmware-name-v1-2-d0b148b6710f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-airoha-npu-firmware-name-v1-2-d0b148b6710f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_053012_544510_83D38366 
X-CRM114-Status: GOOD (  11.33  )
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

On Mon, Jan 12, 2026 at 11:00:08AM +0100, Lorenzo Bianconi wrote:
> Introduce the capability to read the firmware binary names from device-tree
> using the firmware-name property if available.
> This is a preliminary patch to enable NPU offloading for MT7996 (Eagle)
> chipset since it requires a different binary with respect to the one
> used for MT7992 on the EN7581 SoC.

When i look at

airoha_npu.c

i see:

#define NPU_EN7581_FIRMWARE_DATA                "airoha/en7581_npu_data.bin"
#define NPU_EN7581_FIRMWARE_RV32                "airoha/en7581_npu_rv32.bin"
#define NPU_AN7583_FIRMWARE_DATA                "airoha/an7583_npu_data.bin"
#define NPU_AN7583_FIRMWARE_RV32                "airoha/an7583_npu_rv32.bin"

static const struct airoha_npu_soc_data en7581_npu_soc_data = {
        .fw_rv32 = {
                .name = NPU_EN7581_FIRMWARE_RV32,
                .max_size = NPU_EN7581_FIRMWARE_RV32_MAX_SIZE,
        },
        .fw_data = {
                .name = NPU_EN7581_FIRMWARE_DATA,
                .max_size = NPU_EN7581_FIRMWARE_DATA_MAX_SIZE,
        },
};

static const struct airoha_npu_soc_data an7583_npu_soc_data = {
        .fw_rv32 = {
                .name = NPU_AN7583_FIRMWARE_RV32,
                .max_size = NPU_EN7581_FIRMWARE_RV32_MAX_SIZE,
        },
        .fw_data = {
                .name = NPU_AN7583_FIRMWARE_DATA,
                .max_size = NPU_EN7581_FIRMWARE_DATA_MAX_SIZE,
        },
};

static const struct of_device_id of_airoha_npu_match[] = {
        { .compatible = "airoha,en7581-npu", .data = &en7581_npu_soc_data },
        { .compatible = "airoha,an7583-npu", .data = &an7583_npu_soc_data },
        { /* sentinel */ }
};

Why cannot this scheme be extended with another compatible?

    Andrew


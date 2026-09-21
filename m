Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76736C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYDViKrIG0nZq8ZVUxspXThd80bJEUDv5Z3wrqlrXf8=; b=zj/Yjl9zpLIMcd3jbtGMf+VDaK
	9gIM/VFWkBz1uToWATV/Dd1RVZeXneMCcCJPXyovQFTL93rvufthGSLu9JlutL724ZMo+3hwIivBk
	zu7lFvH2cLsk+Vt6EBA/kljfX8MiQM/nJE6UNAiNcACAK9IvcKVJAx2CvbjD5k40S9kOeKKqFcjIk
	TpDmnqQBXZYAnEJGVvpDskDjTfMgIo1RLrSZMWD8ujXZjpNbxaqH0jl4L7md7OVbILccbX0wK//xP
	BWrbwzOB+SlINbp4pq0PvLumpVu7+m3a1PCwUb7Loc8tzyUVx3HnOQXHu+4Dqf/yskagnbX1bbul+
	OpufNyXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ao8-00000001bi2-355D;
	Mon, 21 Sep 2026 09:59:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ao3-00000001bgg-3hZG;
	Mon, 21 Sep 2026 09:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789984764;
	bh=POq6O9lpYCG2fYcf29wFnU+bCnEivOJWg10hyj1xKyc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aK7N5wbtB/yy0rCrOMurDcqvUilNxcDo1dNZ48Tm/X4gPKV6L/WYEtzMLQN9HnA0E
	 xTRaP7MNsmhzC2zXnVq2oKQz796B7IpAcT1ZpkCtmIMt/m7YHxMXXsRVfUnUsm5YhR
	 DBxbz5b9yjSQSOzMNZjmPwU4LG6cjt1mpE3Mv8fFv20lln6kJfezROaovIt4DzbAtF
	 iM8FZIoClJ1Bf9zUJCYm61RqncZ9fAkQo8RSINIghYi8MZ/CTWWzevle86qTkMrt/i
	 SQz5/qJn8Ahc1slat4uZR9Z4LGAFU5hgGGpnAqQ5v4kev2YvZGFl1TGHBBsJYF/59l
	 D+ScIPTZKO37A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F1A5F17E047B;
	Mon, 21 Sep 2026 11:59:23 +0200 (CEST)
Message-ID: <a71b6552-ea57-4575-89e1-14d414d53569@collabora.com>
Date: Mon, 21 Sep 2026 11:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: mediatek: mt7988: keep combo-lane U3 PHY ref
 clock enabled
To: Frank Wunderlich <linux@fw-web.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Wunderlich <frank.wunderlich@linux.dev>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, Mihai Ordean
 <research@mihaiordean.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-usb@vger.kernel.org
References: <20260919114744.46777-1-linux@fw-web.de>
 <20260919114744.46777-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260919114744.46777-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_025928_108681_3DE5763C 
X-CRM114-Status: GOOD (  23.51  )
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

On 9/19/26 13:47, Frank Wunderlich wrote:
> From: Mihai Ordean <research@mihaiordean.com>
> 
> CLK_INFRA_USB_PIPE is the reference clock of xphyu3port0, the U3/PCIe
> combo serdes. On MT7988 that lane is shared between ssusb0's SuperSpeed
> side and pcie2, but only the consumer that claims the PHY holds the gate.
> 
> On the BPI-R4 Pro, ssusb0 is configured USB2-only (u3p-dis-msk=1) and
> pcie2 claims the lane for the CN13/CN15 M.2 slot, so pcie2 is the sole
> holder. u3p-dis-msk does not remove ssusb0's SuperSpeed root hub: that is
> decided by xhci_has_one_roothub(), which keys off usb3_rhub.num_ports
> from the xHCI capability registers, so bus 2 is registered and live
> regardless. When the M.2 slot is empty, pcie2 fails link training (-110)
> and its error path calls phy_power_off()/phy_exit(), which gates this
> clock - and sspxtp_sel with it, as nothing else consumes it. The still
> registered SuperSpeed root hub is then left polling a serdes whose PHY
> reference clock has just stopped,

I'm not sure why said clock cannot be assigned to the USB controller as well
as the PCIe PHY to keep the refcount high, avoiding to gate it?

Cheers,
Angelo

> and asserts the shared SSUSB interrupt
> outside the xHCI event ring; xhci_irq() reads USBSTS with EINT clear and
> returns IRQ_NONE, so the core disables the line ("nobody cared") and the
> next USB teardown blocks forever in xhci_disable_slot().
> 
> Boot logs show the storm threshold being crossed 86-107 ms after the
> pcie2 probe failure, while the earlier combo-mux switch to PCIe mode
> (~550 ms before) causes no trouble, pointing at the clock gating rather
> than the mux as the trigger.
> 
> Mark the gate CLK_IS_CRITICAL so the combo lane keeps its reference clock.
> Only port 0's gate is affected; ssusb1 uses CLK_INFRA_USB_PIPE_CK_P1.
> 
> Signed-off-by: Mihai Ordean <research@mihaiordean.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   drivers/clk/mediatek/clk-mt7988-infracfg.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> index 13ffa9d88e24..a8cbcb64d90f 100644
> --- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> @@ -225,7 +225,17 @@ static const struct mtk_gate infra_clks[] = {
>   			  CLK_IS_CRITICAL),
>   	GATE_INFRA3_FLAGS(CLK_INFRA_USB_FRMCNT_CK_P1, "infra_usb_frmcnt_ck_p1", "usb_frmcnt_p1_sel",
>   			  9, CLK_IS_CRITICAL),
> -	GATE_INFRA3(CLK_INFRA_USB_PIPE, "infra_usb_pipe", "sspxtp_sel", 10),
> +	/*
> +	 * Reference clock of the U3/PCIe combo serdes (xphyu3port0). The lane
> +	 * is shared between ssusb0 and pcie2, but only the PHY consumer that
> +	 * claims it holds this gate. On boards where pcie2 owns the lane, a
> +	 * failed pcie2 probe (e.g. empty M.2 slot) calls phy_exit() and gates
> +	 * this clock while ssusb0 still has a live SuperSpeed root hub on the
> +	 * same PHY, which wedges the shared SSUSB interrupt. CCF cannot model
> +	 * the cross-IP sharing, so keep the gate on.
> +	 */
> +	GATE_INFRA3_FLAGS(CLK_INFRA_USB_PIPE, "infra_usb_pipe", "sspxtp_sel", 10,
> +			  CLK_IS_CRITICAL),
>   	GATE_INFRA3(CLK_INFRA_USB_PIPE_CK_P1, "infra_usb_pipe_ck_p1", "usb_phy_sel", 11),
>   	GATE_INFRA3(CLK_INFRA_USB_UTMI, "infra_usb_utmi", "top_xtal", 12),
>   	GATE_INFRA3(CLK_INFRA_USB_UTMI_CK_P1, "infra_usb_utmi_ck_p1", "top_xtal", 13),



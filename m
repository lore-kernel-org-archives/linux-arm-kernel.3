Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F938CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 20:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSUhjkfC0Q2//h6dWhCqwgi4jeXYnkhNBRpnLdYChkc=; b=VqEHk/L7iQ9QOwa7E/eqZuKjbA
	GvLJOlH9zlCzKVJbemfudf8fjV45IRrvai7tKWFbXOUT5fM8cjK1l4oBbwJALb6VKfpHAM1+QS11I
	Pm8RyzqphBOO54CWcTnBQI4y8w/gLmavPVkXfFFdJWcFCNUaNaIoogbF8c0Ov8RCsquwgzmrJPtF/
	INKMjORVLatOZXs9HAiDg5n3gRSwTVqIhMBcJV/w+5BIXCZPS1OXesnVEt7pUN0KhhvIWMTwmmsUA
	U89tTQUYxBjRzW7Z1+8zYOjrTnzII5LzYmpRH4dBId2n74h3iF7InVYvBfzgSzkWIM4VZQeUdtJJn
	QQoRL9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD6WB-0000000E1CT-48kK;
	Sat, 03 Oct 2026 20:39:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD6WB-0000000E1CG-04pY;
	Sat, 03 Oct 2026 20:39:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6F2560120;
	Sat,  3 Oct 2026 20:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A7D1F0089B;
	Sat,  3 Oct 2026 20:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791059977;
	bh=tSUhjkfC0Q2//h6dWhCqwgi4jeXYnkhNBRpnLdYChkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=noA68/7ksmbSP7UWWC0+zA5kZh994tu+Z+faRzxxNrfp0AT6nCJlGUpSNMXxx1fUP
	 GRIbAYUlUrqClUoxTLdcx0TP8SVcfUtkH+sAaETa9Z8whx8gxSbLAjebarfJitsFJF
	 7XHDuUURtnQGPfZYoHN2F8p+EXF5ACwpGpguq31uHjm3yolN7WBeTPNBs3Z2NS5TNV
	 DwJksVsvtfbsS5ObA9cWGmuGLG1RKCry+TCfkDNBR7d57lxhkrKnD6yM4B8R33rsD1
	 yN2OmBM2kE9RRGwbcMgGOMQzjVKgx3pCmUzyUuVqfypnWNqg8MMkoAz6dR3ba7HeVD
	 zxLHpuf9ort0A==
Date: Sat, 3 Oct 2026 22:39:34 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/3] phy: hdmi: Add optional FRL TxFFE config options
Message-ID: <asFoBih6P7Cr6Ute@parshuram>
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
 <20260901-hdptx-ffe-v2-1-3a5922c76fc5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-hdptx-ffe-v2-1-3a5922c76fc5@collabora.com>
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

On 01-09-26, 22:55, Cristian Ciocaltea wrote:
> During HDMI 2.1 FRL link training, the source and sink can negotiate a
> Transmitter Feed-Forward Equalization (TxFFE) level to improve the
> signal quality.  Starting from zero, the source may increment the TxFFE
> level up to a maximum agreed during the LTS3 stage if the sink keeps
> reporting FLT failures.  TxFFE adjustment is optional and only attempted
> when both the source and the connected sink support it.
> 
> Since the existing HDMI PHY configuration API covers the FRL rate/lane
> selection only, provide the following fields to the frl sub-struct of
> phy_configure_opts_hdmi:
> 
> * ffe_level: the TxFFE level to apply, only meaningful when
>   set_ffe_level is set.
> 
> * set_ffe_level: a 1-bit flag that changes the semantics of the
>   phy_configure() call, i.e. when set, the PHY driver must apply the new
>   ffe_level and ignore the other frl related fields.

The ffe_level 0 implies it is disabled, so why should we use a flag for
this? Rather use if value valid (non zero) logic to apply..?

> 
> The flag-based approach reflects an important invariant in the link
> training process: whenever the FRL rate or lane count changes, the TxFFE
> level must be reset to zero.  A separate phy_configure() call with
> set_ffe_level can only follow after the rate has been established,
> making the two operations deliberately distinct.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  include/linux/phy/phy-hdmi.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
> index d4cf4430ee8f..1d4b62475079 100644
> --- a/include/linux/phy/phy-hdmi.h
> +++ b/include/linux/phy/phy-hdmi.h
> @@ -19,6 +19,10 @@ enum phy_hdmi_mode {
>   * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
>   * @frl.rate_per_lane: HDMI FRL Rate per Lane in Gbps.
>   * @frl.lanes: HDMI FRL lanes count.
> + * @frl.ffe_level: Transmitter Feed Forward Equalizer Level.
> + *	Optional, only meaningful when set_ffe_level flag is on.
> + * @frl.set_ffe_level: Flag indicating whether or not to reconfigure ffe_level.
> + *	All the other struct fields must be ignored when this is used.
>   *
>   * This structure is used to represent the configuration state of a HDMI phy.
>   */
> @@ -29,6 +33,8 @@ struct phy_configure_opts_hdmi {
>  		struct {
>  			u8 rate_per_lane;
>  			u8 lanes;
> +			u8 ffe_level;
> +			u8 set_ffe_level : 1;
>  		} frl;
>  	};
>  };
> 
> -- 
> 2.55.0

-- 
~Vinod


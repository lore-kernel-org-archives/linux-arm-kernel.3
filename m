Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B95CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 10:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ded2t/lxa5/OOJ87UbsbJnDc5Xdi5OA3X44Xyk2z2B0=; b=V1HKjHwJ4BTXVZflEgr0bNmb1P
	uHGJmhrbXxGhGp+PqFZZHN5wX3VjcxLMx5wFNkfN5zA19rieTESA3TmMQK74ssdxZqkYJnup/hVH8
	g1b7m9+da0+EXo9pZJXQYmtBAV4TBT1dXCOdIlf89SH/kUj/UPma2F8vAhw95M1y0aSV0cYSxFrbI
	4ikKYyQi+n/0BFeyABgwxaJCYsnvouJeL7vJYL5Rb7KNSDCUqy7ywrEf858YgF4jg+wCtn5BrQUxY
	YaElYJCVQ2kWsWFD4wvOXKIas+zl5gTE1Miaf1Rdl8EA4LYHzY/0eBZLDCLviTB3Kb+tHUavnrCP4
	VTQMZ4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJpF-0000000EgDj-20bU;
	Sun, 04 Oct 2026 10:52:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJpE-0000000EgCq-1SbB;
	Sun, 04 Oct 2026 10:52:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C73CA429D5;
	Sun,  4 Oct 2026 10:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0C51F000FF;
	Sun,  4 Oct 2026 10:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791111131;
	bh=Ded2t/lxa5/OOJ87UbsbJnDc5Xdi5OA3X44Xyk2z2B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FFLg41iwcTX3eTrwV8t5ajXGLkgtY0ZvuL5T/qeDdnKQBwVWD6N5vCzTPBYi+bBZY
	 05fFRj3tAJZR+cbH5AyVdJa2W40q3K3/wb9BimQtqdglNKNr8+LXBwCiacs6srl2OR
	 D1nb+Bqi7YFJkK8yerA5MXws9WGktv/Pf3ROeJSV0kVYffAZuT0/PNGgMQx5+u214k
	 A7n7yhaCNIk/le8m+R9bbMMpGoc9Bfk21DQzyv2XNzjpVvTYeobV8hfnxfA8c0sh0c
	 1v8WYrvs0C4AMhH4LDWpQBYsyvPmHVsnuGAofGaPT4Eyd4NqyueuT98NECkdbuH0nJ
	 vVE6AkYtBSPsw==
Date: Sun, 4 Oct 2026 12:52:07 +0200
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
Message-ID: <asIv1zepKlIvzHX5@parshuram>
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
 <20260901-hdptx-ffe-v2-1-3a5922c76fc5@collabora.com>
 <asFoBih6P7Cr6Ute@parshuram>
 <3c0dc77b-b692-498e-aed6-aa97d827b2f4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c0dc77b-b692-498e-aed6-aa97d827b2f4@collabora.com>
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

On 04-10-26, 00:33, Cristian Ciocaltea wrote:
> Hi Vinod,
> 
> On 10/3/26 11:39 PM, Vinod Koul wrote:
> > On 01-09-26, 22:55, Cristian Ciocaltea wrote:
> >> During HDMI 2.1 FRL link training, the source and sink can negotiate a
> >> Transmitter Feed-Forward Equalization (TxFFE) level to improve the
> >> signal quality.  Starting from zero, the source may increment the TxFFE
> >> level up to a maximum agreed during the LTS3 stage if the sink keeps
> >> reporting FLT failures.  TxFFE adjustment is optional and only attempted
> >> when both the source and the connected sink support it.
> >>
> >> Since the existing HDMI PHY configuration API covers the FRL rate/lane
> >> selection only, provide the following fields to the frl sub-struct of
> >> phy_configure_opts_hdmi:
> >>
> >> * ffe_level: the TxFFE level to apply, only meaningful when
> >>   set_ffe_level is set.
> >>
> >> * set_ffe_level: a 1-bit flag that changes the semantics of the
> >>   phy_configure() call, i.e. when set, the PHY driver must apply the new
> >>   ffe_level and ignore the other frl related fields.
> > 
> > The ffe_level 0 implies it is disabled, so why should we use a flag for
> > this? Rather use if value valid (non zero) logic to apply..?
> 
> That's not quite possible because level 0 is valid (and the default) according
> to HDMI 2.1 spec. The source is expected to reset TxFFE to default whenever a
> new FRL rate is set, hence the API shall be conformant. 

Ah, looks like AI gave me wrong info about 0 being invalid, this is okay
then


-- 
~Vinod


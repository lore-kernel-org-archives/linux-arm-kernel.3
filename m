Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A27C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 03:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGflFkaSRSLwt8cjOUfrI2G3kHK8o37reSjG+m13zz4=; b=r2RmvnuMF7JagOruA1s5LnrIJW
	xtp2sysK4+D0xuX7968HtAgHdrotjNUvOHFTZ3oAdjAGrOg0hk/lfuoPicXLv/nJllv/Jzvb+0FMO
	tDWdN9MUZH/VKbsjszU29HWiH45EaqieCIKTAtM8be5Z6Fuc2R54DUNotqJfRuu2TNhSGjIyh84Ao
	DeB3khF1pTHyLbqih/VQDHJVBFnWmWfNIp9czfjXazpvde4jI4Nwh6f/neW7M6iQMqip+90/3TTek
	r2j7qHq1kbcmL9By/jAVPC0LgYeuDoowQEj+7zy6wKodsm4SYGcNDiR2IHYHnWVgFC0m5gCTBBSaf
	ZxirrJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLtg-0000000HJ8P-23sa;
	Thu, 13 Aug 2026 03:14:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLtf-0000000HJ8G-0QID;
	Thu, 13 Aug 2026 03:14:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 34513600AD;
	Thu, 13 Aug 2026 03:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AA81F000E9;
	Thu, 13 Aug 2026 03:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786590861;
	bh=uGflFkaSRSLwt8cjOUfrI2G3kHK8o37reSjG+m13zz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bc6rFx7eALcIR6jfdK6CeFY10ziltAnQqytO+w7w+88p4DezqUye503z1W7/FUmWR
	 kuEVQWkE/T6Ga7aE26jvkUl7Z6dzrsLeaozLXvv87RAdogJN+SkNfHHCZHp/J21Upf
	 VuN/A1MtU0s6fZfE8ivUHU56gjmqzCf4hFpxStZNRl0vsxOgqzTheBJMWmmUYJoekn
	 UK1CKNGavgUko45SRCwSDdMGN/16Dakcd5yc2a9KXWjBN3jbMfBS2V/kCOTlwZ/Mw5
	 59CMakHhVfW49MOPuLlyXLCK6T7EwCG10cDrfD67ePgumDvBKiPhvXLBwkR57yP0sE
	 WXjy1CjxXcpTQ==
Date: Thu, 13 Aug 2026 03:14:17 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/9] platform/chrome: of_hw_prober: Add delay for hana
 trackpads
Message-ID: <an02idvk4GtZIMfn@google.com>
References: <20260811122011.3539250-1-wenst@chromium.org>
 <20260811122011.3539250-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811122011.3539250-8-wenst@chromium.org>
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

On Tue, Aug 11, 2026 at 08:20:07PM +0800, Chen-Yu Tsai wrote:
> Up until now, the MT8173 elm/hana device tree has set the dedicated
> regulator supplying the trackpad as always-on, simply because the Elan
> driver was missing proper delays. As a result the delay for the
> Synaptics trackpad was also omitted, as it was not strictly required
> under such a model and delayed the availability of the trackpad to the
> user.
> 
> The Elan driver recently gained proper delays after power-up, with
> adaptive skipping of the delay if the regulator was originally
> on. The I2C HID driver and I2C OF component prober library gained
> similar adaptive delay skipping. The device tree will be fixed to have
> the regulator not be always on, and proper post-power-on delay time
> added to the I2C HID device.
> 
> Also add the post-power-on delay to the ChromeOS OF component prober,
> so that if the regulator is off at the time of probing, the prober knows
> to wait for the hardware to initialize.

> [...]

This looks harmless even without the aforementioned patches.

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
      commit: 81c1c0cb68a13d14dd1bbffcf4c49e26f9a6478c

Thanks!


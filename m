Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2018AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqV/29FN8TAKwZ9jAVPZuJgB96iWFCzrBQyx4X5GjRI=; b=n6ji/nFIv2+inshB9PVzuUmDRX
	nXgQouc2mHf9JgR5lZyrOIEBDyN34UCLHRXiRvRv5abTgrsCkv47Y8/s+CC9iV1+PZHc3AAcNtUy7
	7cBE75qNGTWWn09zs6OWVuyLuGtL8Kk3Eyiw5qatLXu4ukJt3XuNcJvYnsxiz8gluDGgpprm2KJ4f
	XUf18vZh4+ksEXV+u1Rn35opsrPXNEX8K0fbH6X6nHc0OqmDHbUywHspjfBuImhsOWax9//C9VtGS
	S0anGzbCE8QUk55PZSD+nFqlF/jKDFBBdlNE7wo9vJXSfGGLoAB4PUazMqQI8usMa7SXoay4W3qU6
	xOFzq6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKca-00000007hbj-20Af;
	Tue, 18 Feb 2025 10:14:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKPa-00000007e1f-1suB;
	Tue, 18 Feb 2025 10:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XqV/29FN8TAKwZ9jAVPZuJgB96iWFCzrBQyx4X5GjRI=; b=NxiIsn1b7FykEg6OCLh5DpDtTw
	RDjum5Qx4uV2nMLbl4A6rKayYGAtYmRYhAH5mPNiqN74w7AOyScXoApT0M3CIAtB5pfTCduRV84jd
	8Y9wbfTlYPWDx+tG8n52sNCelLFypuJUEOv8RXNXELnwatmIl5F2DkL7iHY8TDhbx8bWA+EMZkzWV
	awy1oAO/ET4dDzpyQfTxmlkpCH5DD/0t5BSkPOJVNP06R7088+J5tbrXKad7fHL5iEhgRrswiU0aD
	P/xjDk3UO+AdXFAGXt0t8pbE8CJWS6djYfLefPC+snPPRg5SpASruOXsCRX6Fcqmmj6HbjXD424EU
	wvqiQjNA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tkKPS-0003jc-4g; Tue, 18 Feb 2025 11:00:58 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: cristian.ciocaltea@collabora.com, Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: airlied@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kernel@collabora.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, liujianfeng1994@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, robh@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2
 on RK3588
Date: Tue, 18 Feb 2025 11:00:57 +0100
Message-ID: <1919367.CQOukoFCf9@diego>
In-Reply-To: <20250218095216.1253498-1-liujianfeng1994@gmail.com>
References: <1b3234ce-4526-4735-b9c0-c242e6cc3cf0@collabora.com>
 <20250218095216.1253498-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_020106_479886_8E90A530 
X-CRM114-Status: GOOD (  18.99  )
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

Am Dienstag, 18. Februar 2025, 10:52:16 MEZ schrieb Jianfeng Liu:
> Hi Cristian,
> 
> No matter one or two hdmi ports the rk3588 boards have, most of
> devicetrees in mainline kernel only have hdmi0 supported. After applying
> this patch their hdmi0 support is broken.
> 
> So I recommend moving the vop clk part to board level devicetree.
> Then support of hdmi0 won't be broken, and board maintainers can add
> HDMI1 PHY PLL clk when they are adding hdmi1 support. I can add support
> for orangepi 5 max and armsom w3 for reference by other developers.

better, fix the VOP2 driver - both for the existing hdmi0 + this hdmi1
please.

I.e. the clock is optional, and the error you are seeing comes from the

       vop2->pll_hdmiphy1 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy1");
       if (IS_ERR(vop2->pll_hdmiphy1)) {
               drm_err(vop2->drm, "failed to get pll_hdmiphy1\n");
               return PTR_ERR(vop2->pll_hdmiphy1);
       }

part. clk_get_optional is supposed to return NULL when clock-retrieval
causes a ENOENT error. Seemingly going to a clock controller in a disabled
node returns a different error?

So I guess step1, check what error is actually returned.
Step2 check if clk_get_optional need to be adapted or alternatively
catch the error in the vop2 and set the clock to NULL ourself in that case.


hdptxphy0 + hdpxphy1 _are_ valid supplies for the vop, so their reference
should be in the soc-dtsi and the kernel code should just figure things out
correctly. Wiggling with clocks in each board will cause headaches down
the road.


Heiko




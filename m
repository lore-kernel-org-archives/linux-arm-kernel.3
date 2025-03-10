Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2D1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 07:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kd2fPcVm5IBbyvlRqelD6BKeUqVBV6LqAVTsXt7/gMo=; b=d4pGwf38lYwCnYs5reXFzpHKd+
	HBMy6GeFvUU+gVN2Br18NsX+OmBPjfJiA20XXroORh6Kb2z3QYi1xNwsNzjGg/GjxZcULMHLj+pHd
	DfjPRiIUmpnft+Z8FQviOmIWceo0VdtZgiIKCS2CZfeJ9AgbhDefTNmrAtTjA1qrTKjUUeN2vGTQj
	sifCNClvfExawhGBfSlVYkE/uCJ/PaV91mfWIVQihtcQvS8bkQyqCrz3ksxD4zOHmjYiToHqGRQil
	4VfOs+dKX/J75Ak6gwKneGLWvW8FbUHt8z18Hg5xAPhmaG3i0tvaEOfs3NC5GTBGItnodl2tTdmf3
	VGPajK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trXRA-00000001jHc-0eSU;
	Mon, 10 Mar 2025 07:20:32 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trXN9-00000001ioc-3JJf;
	Mon, 10 Mar 2025 07:16:25 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A9FC82591A;
	Mon, 10 Mar 2025 08:16:18 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QO2kUGrrvhG; Mon, 10 Mar 2025 08:16:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741590978; bh=ZSuThKs4RRRiIQBWC7D0j8baNXGHTK3a7S1ckfF9qdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iCfdHmgtbmqK8KQ3CKJXUznYpU7FQEJMgb78NWQR2d/qNTzzWwFfgdofObg9+B41p
	 LhZlu+K9VHzifZnDVyKdO/xKBRnl+xAU4s4pA4zaQ43aqHj+5N+4M6glv7M4ISRWVA
	 pCl9LPavMwU022eFNBiY7EgPRMCRkmPdT2dN2/yw93HLUaIFYF+/81NzB2ykfQrmMg
	 ABQNBBa4sgKYyoKPyu0cxjPNnNy5cDWLgH7T0czc/YvzGlmoQN6X4a8aO9BbitRkBM
	 dgaH/z7CjJ8qu7bAcXRtSFCWh2Btc1c23VlM4ZJjGlIbsGcjNgrvopi3JMirl4xfpd
	 m66kMTlO7QTmQ==
Date: Mon, 10 Mar 2025 07:15:58 +0000
From: Yao Zi <ziyao@disroot.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	heiko@sntech.de, jonas@kwiboo.se, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add onboard EEPROM for Radxa
 E20C
Message-ID: <Z86RrlBTvt9d40Dk@pie>
References: <20250309070603.35254-4-ziyao@disroot.org>
 <20250310070023.52290-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310070023.52290-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_001624_243585_C422E29A 
X-CRM114-Status: GOOD (  10.65  )
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

On Mon, Mar 10, 2025 at 03:00:23PM +0800, Chukun Pan wrote:
> Hi,
> 
> > +&i2c1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c1m0_xfer>;
> > +	status = "okay";
> > +
> > +	eeprom@50 {
> > +		compatible = "belling,bl24c16a", "atmel,24c16";
> > +		reg = <0x50>;
> > +		pagesize = <16>;
> > +		vcc-supply = <&vcc_3v3>;
> > +	};
> > +};
> 
> This eeprom stores the device information written by the manufacturer,
> such as mac address and sn. So it should be marked as read-only.

Thanks, this makes sense.

> Thanks,
> Chukun
> 
> -- 
> 2.25.1
> 

Best regards,
Yao Zi


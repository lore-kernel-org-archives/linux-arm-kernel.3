Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834B0CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 16:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8ppqvzfJbHLORVI4FUGxAEtvpysmOlFWvNRW2iwm/E=; b=tJhpylHYMuYsWDfgzH9j6zSoTn
	sTOjcjrbQVOjXPmcOFvGuJ2ojYhwcMFjPxJ4yJAHQbTERiBodR6E06N/hkgeXsQ9qlKds77+zmvKk
	DEhpP55E521ICDyqnI+5YcpJNwfXj/sGlgUdTam2mEAZqG4N0vuAm1BTHQmXYziD4KpbXM/3vj7JZ
	s8spaNm02RUl5OMYXx1EqltEQWko8E4koUhgoOmA6OJ4s+Chi3jfyadclTiXGI5N1uNWUed52Y32F
	B52QsgLBsmf48bMMNw0FBm7F1fUUbCQGli4M4BDMYBBMf12fs6vFXpz5MNeb/TuqWFPh72u6WgBhg
	LQIUqC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2B1q-00000002k0b-2nfM;
	Fri, 26 Sep 2025 16:10:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2B1o-00000002jxc-2epV;
	Fri, 26 Sep 2025 16:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=a8ppqvzfJbHLORVI4FUGxAEtvpysmOlFWvNRW2iwm/E=; b=cg9+AN104PlZDbjadHhLemQ6P3
	2SECT9YE20k1+7x95YYYNw64/FuHB2bAG83MSCcNdmOFxUVGUxbju3lD93C6rwX26VOe8M9IEDEtz
	nZZJn3lRXRQC8dkazzykeIzR/huKAQJlAUgvHcvi+NpFW+Wj0XaBPBwZxqytRph6F2js=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v2B1g-009a97-KM; Fri, 26 Sep 2025 18:10:28 +0200
Date: Fri, 26 Sep 2025 18:10:28 +0200
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
Subject: Re: [PATCH net-next 2/2] net: airoha: npu: Add 7583 SoC support
Message-ID: <b5ff2e06-df4f-423a-86ac-fb025b243844@lunn.ch>
References: <20250926-airoha-npu-7583-v1-0-447e5e2df08d@kernel.org>
 <20250926-airoha-npu-7583-v1-2-447e5e2df08d@kernel.org>
 <82a08bb5-cbc3-4bba-abad-393092d66557@lunn.ch>
 <aNa464zcFCvNhL33@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNa464zcFCvNhL33@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_091036_669437_DAC91B15 
X-CRM114-Status: GOOD (  14.70  )
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

On Fri, Sep 26, 2025 at 06:01:47PM +0200, Lorenzo Bianconi wrote:
> > > -	ret = request_firmware(&fw, NPU_EN7581_FIRMWARE_DATA, dev);
> > > +	if (of_device_is_compatible(dev->of_node, "airoha,an7583-npu"))
> > > +		fw_name = NPU_AN7583_FIRMWARE_DATA;
> > > +	else
> > > +		fw_name = NPU_EN7581_FIRMWARE_DATA;
> > > +	ret = request_firmware(&fw, fw_name, dev);
> > >  	if (ret)
> > >  		return ret == -ENOENT ? -EPROBE_DEFER : ret;
> > >  
> > > @@ -612,6 +623,7 @@ EXPORT_SYMBOL_GPL(airoha_npu_put);
> > >  
> > >  static const struct of_device_id of_airoha_npu_match[] = {
> > >  	{ .compatible = "airoha,en7581-npu" },
> > > +	{ .compatible = "airoha,an7583-npu" },
> > 
> > It would be more normal to make use of the void * in of_device_id to
> > have per compatible data, such are firmware name.
> > 
> > 	Andrew
> 
> ack, I implemted this way since we have 2 fw names but we can have a struct
> pointed by of_device_id driver_data pointer to contains both of them.
> What do you think?

That would work.

	Andrew


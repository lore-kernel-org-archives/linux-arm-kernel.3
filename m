Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16433C282E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOjvDYmGInDNpl4uK0wclrqqIaEOOTDIMXyt2aAG6PI=; b=jG9gXwJyFSoxFe4L4uVEBu01UJ
	4vTydkyMpcXPE7AZopaENyTbbhAYoMZ8HCdhSk+0q8KyVZLJT184li/X0hwSf+B5sb/5LtLQYAT/b
	XdFxKzzPUHfpNbpQwtMrRQEUAvEUsuTE3OUJZD5piLU912fnw/M0MhFy91pLSgvdMLpZB4VV9bD9R
	kpl8j2aITFEj7DZjATdS+VyfHx3ENVdhGEWmYxHiAdXosXSROdqTwGpELCpThfIh6Zf6isHdFJcm8
	9643FZvPYUwKgjMlYGm81xZbOPOcU6oDO8cMApFBFa8z/rFs73LNP38LhPnnQBqv3OF4FMjEDOsTK
	KJIea58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsOg-00000008me9-3LMx;
	Wed, 05 Mar 2025 17:19:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsN5-00000008mSs-1snW;
	Wed, 05 Mar 2025 17:17:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4AC45C6B57;
	Wed,  5 Mar 2025 17:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA68C4CEE2;
	Wed,  5 Mar 2025 17:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741195046;
	bh=XJWPRUoTb/Vx4G3uOprbaaDyJtXhaxTE+VvpTzPkG1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npHNn9Hmu0fwIcubnTn9GlArjuS6TL3Le08tOoG0Soe9wBKd4EwVUMJeSv1U/jb1W
	 6OCxCiDHqv82nOa7lFPKLlhLWpXaznbxEzkzosghO/Ep3XnyBy268838yYrLQrV5he
	 6qFNHtJKRh17Au2J7AzpWsefiGnQlPD8xPi42tugTUNry9eFcMg/rBYk4Ol5jwEOIn
	 tWkn0ltdEVZGNOm+bO8l4j4/lee8wIG453yx7V1KOpTQdsRz/g9wf+LoTodjlhLzBn
	 FAYuhG1isYF30vh/OBCBN/Ni5/Gg0tkMJKZmO4OM9xMjzuKPZ+ER/mr2w23ce78c1q
	 CKrpbE9CDpOIQ==
Date: Wed, 5 Mar 2025 11:17:24 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Yao Zi <ziyao@disroot.org>,
	Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3528 QoS register node
Message-ID: <20250305171724.GA2149138-robh@kernel.org>
References: <20250305140009.2485859-1-amadeus@jmu.edu.cn>
 <20250305140009.2485859-2-amadeus@jmu.edu.cn>
 <52155b03-20f3-4e64-b636-70042db03ffa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52155b03-20f3-4e64-b636-70042db03ffa@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_091727_542402_1320F7B8 
X-CRM114-Status: GOOD (  17.68  )
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

On Wed, Mar 05, 2025 at 04:41:23PM +0100, Krzysztof Kozlowski wrote:
> On 05/03/2025 15:00, Chukun Pan wrote:
> > Copy QoS nodes and add rk3528 compatible from bsp kernel,
> 
> No, don't copy stuff from BSP kernel. It results in terrible DTS.
> 
> > these can be used for power-domain.
> > 
> > Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 160 +++++++++++++++++++++++
> >  1 file changed, 160 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > index 5b334690356a..794f35654975 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > @@ -122,6 +122,166 @@ gic: interrupt-controller@fed01000 {
> >  			#interrupt-cells = <3>;
> >  		};
> >  
> > +		qos_crypto_a: qos@ff200000 {
> > +			compatible = "rockchip,rk3528-qos", "syscon";
> > +			reg = <0x0 0xff200000 0x0 0x20>;
> > +		};
> > +
> > +		qos_crypto_p: qos@ff200080 {
> > +			compatible = "rockchip,rk3528-qos", "syscon";
> > +			reg = <0x0 0xff200080 0x0 0x20>;
> > +		};
> 
> 
> Did you just define syscon per few registers? Third case last weeks...
> so no, define what is your device here. 8 registers is not a device usually.

Well, it is just a new compatible on top of existing 'qos' compatibles.
And in a quick scan I didn't see other things adjacent. 


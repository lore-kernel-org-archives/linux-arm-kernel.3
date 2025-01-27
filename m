Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42B9C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 17:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjOiN4o85W94RocPX2UZ9qDr6Ys8GYtCDY/o9kQHybY=; b=z0YuyHn6uDUpLkarRmOCeCWbEZ
	eZi/bXzXmR+s7dx2qrROBr1Emah27qlj4vdspqQYCcN6TKuXJbsUBvImPHd+HNIrIrzQF8kVP2EZl
	dYTDOeH80AZvrmoF9XFuCTF0MFjZyDQCixK/OXvALr5uBZxx9K5X/vPVHCvSZsyeK8pSRduMV3RDT
	RcqYSchZQ+uTpATWppEaGoftqxMWn+ulx55Hyhdjwmd3bcEmR3TB7wIwKCUtR0tkvNflEfAlOCCvQ
	AvgHup7lhQ9n6r+tXU9aAJSXdmfSDHjBZM5+PViNmoWrdR4bhgUJBkgR+L0WFOa4YXEXTBDYhcS44
	euWwAJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTOG-00000002y2H-464b;
	Mon, 27 Jan 2025 17:59:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTMw-00000002xoi-0ozk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 17:57:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C8135C594C;
	Mon, 27 Jan 2025 17:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DE6C4CED2;
	Mon, 27 Jan 2025 17:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738000673;
	bh=eRwlImKfy6D/j0+aY/e+F/BQIXecmw3nRjEYPm5CEZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taB8rt8Ov96Pr5tafV52h4gb5vqvmzMkRXJ+WUxoB/5DikFq1O2MDk33898jRyxzZ
	 wYA5bn9D336Pez6mMV/OJthVdR80+y79gz5NBI3F9CryDNlJBOZyLARn2RFZfEVrMy
	 Jfqh0wlUj43NglHquCaOUPfno/Cqe/8/Jcg+EdGmI5aWvWE2jwGhcCEU8t6wT8I7/g
	 syxdPMq5e03TTj4WvxzyZ7K5dkElHPbF43ZXuCHzXVQ6KcnKNoVKcqUtTZuurfH1X2
	 dH7AqG6klq7oWoehDJLfwbOvgLiJ/3Opu+kt4G2J4HbR5R0QAgT6PGZISGA8T9ObLv
	 ph7i0hIeMA6pQ==
Date: Mon, 27 Jan 2025 11:57:52 -0600
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Michal Simek <michal.simek@amd.com>, Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: spi: zynqmp-qspi: Add reset
Message-ID: <20250127175752.GA511180-robh@kernel.org>
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
 <20250116225521.2688224-2-sean.anderson@linux.dev>
 <8a0d8789-7a0d-42b7-9aff-e867c14db3c9@amd.com>
 <b8e63009-13fb-493f-adf6-4d30adbe9b1b@linux.dev>
 <20250123224520.GA456390-robh@kernel.org>
 <34e84bd2-381b-4f3e-99e1-92f7a878ed15@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34e84bd2-381b-4f3e-99e1-92f7a878ed15@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_095754_321702_9C330FBD 
X-CRM114-Status: GOOD (  23.31  )
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

On Thu, Jan 23, 2025 at 05:57:41PM -0500, Sean Anderson wrote:
> On 1/23/25 17:45, Rob Herring wrote:
> > On Fri, Jan 17, 2025 at 11:12:15AM -0500, Sean Anderson wrote:
> >> On 1/17/25 02:14, Michal Simek wrote:
> >> > 
> >> > 
> >> > On 1/16/25 23:55, Sean Anderson wrote:
> >> >> Add a reset to help recover from cancelled operations.
> >> >>
> >> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> >> >> ---
> >> >>
> >> >>   Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml | 6 ++++++
> >> >>   1 file changed, 6 insertions(+)
> >> >>
> >> >> diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> >> >> index 04d4d3b4916d..901e15fcce2d 100644
> >> >> --- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> >> >> +++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> >> >> @@ -36,12 +36,16 @@ properties:
> >> >>     power-domains:
> >> >>       maxItems: 1
> >> >>   +  resets:
> >> >> +    maxItems: 1
> >> >> +
> >> >>   required:
> >> >>     - compatible
> >> >>     - reg
> >> >>     - interrupts
> >> >>     - clock-names
> >> >>     - clocks
> >> >> +  - resets
> >> > 
> >> > In 2/5 you are calling devm_reset_control_get_optional_exclusive() that's why I expect reset is not really required property.
> >> 
> >> It's optional for the driver for backwards compatibility. But for the
> >> devicetree we make it mandatory since it should be included in all new
> >> devicetrees.
> > 
> > Generally, we discourage new required properties as that's an ABI 
> > change. The exception is really when optional was a mistake. That's 
> > arguably the case here if the h/w always has a reset.
> 
> This device has a reset on ZynqMP and Versal.
> 
> The driver still considers this property optional, so it's not an ABI break.
> But I made it required in the schema to help out the folks at AMD when they
> get around to upstreaming the Versal devicetree :)

Not 'the driver', but 'a driver'. You can't say what *all* drivers do. 
If I write a new driver and read the schema, then I can say 'resets is 
required so I'll make it required in my new driver'. But then my new 
driver doesn't work with an older DT that didn't have resets which was 
valid at the time.

Rob


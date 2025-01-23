Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267ACC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 22:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDR8+1krEGFc7t1so4ObamVSRugtr049iLmM4pBxaKw=; b=zZTdXHS0CmUTH2MM1LqGdI0e0u
	0w2H3C4hPi4CtM0B6CgTBQPI590O2bCZBdlb/GCHG71viw/Tx4/HknHYGCeGj0xUPqs+rIIHxE6Qi
	B023+Dc9bqudvfBAkMslGTr818PqCpRZ8RJmJMZO91YVsvc6Cu8+v/alY0hlQt0Qg4pv+GmDtCXKl
	XX7pxojydkLc3kxrA11Ma/49ERX+CIIKAqpwlW5afeFyTVLYhOVw9e7ifSGZwBXaGsaL3rrOb+r34
	col0VVXnkr0RJUzgj/ivB+kYKS2Jq3Y/c9NeF6RVUoxLcHgjj+FZm8/oTmhU2ZS1B+XYJWojFiRCp
	g3IsHKug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb5yE-0000000DRAJ-1H4q;
	Thu, 23 Jan 2025 22:46:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb5ww-0000000DR4o-2vcV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 22:45:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 88BF7A41463;
	Thu, 23 Jan 2025 22:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3942BC4CEE1;
	Thu, 23 Jan 2025 22:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737672321;
	bh=T6bckikkRvSw53DcAsE/gahId3+JXQyypP+wi/p2b1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Phb1REmoA5InyOxlBQ/tjC2/R/ZDD2uNX/kCH3UUhPCRtLDqekgmsZez7nLjkEU7N
	 YD+0GzJHDbAte0nJSs67wrD5Oa9vsNN9hItDNzQ6kmwkV/5sg9rZuxNwYuZ6r3HYYp
	 ZzVF8u0Lja9kLnrD+77XFu2CW21mRMl9ynQYfGhmyG1FyrARiZ35VsDNokQmzsV4Kb
	 XrdLZ8kvoLaNqzm1qfRmagQ8MvB7uLJr92ZTF4UiL8gWzqkfWASKuhl8DdwgOIqwqt
	 HhaL2U5q3gHD117qsgvX+IRipFa224iLHH4ZPsqMiECIU1bwoSsniBd7pn2bj2PKvk
	 1sGwviA70fi4A==
Date: Thu, 23 Jan 2025 16:45:20 -0600
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
Message-ID: <20250123224520.GA456390-robh@kernel.org>
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
 <20250116225521.2688224-2-sean.anderson@linux.dev>
 <8a0d8789-7a0d-42b7-9aff-e867c14db3c9@amd.com>
 <b8e63009-13fb-493f-adf6-4d30adbe9b1b@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8e63009-13fb-493f-adf6-4d30adbe9b1b@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_144522_802760_41BA4051 
X-CRM114-Status: GOOD (  17.52  )
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

On Fri, Jan 17, 2025 at 11:12:15AM -0500, Sean Anderson wrote:
> On 1/17/25 02:14, Michal Simek wrote:
> > 
> > 
> > On 1/16/25 23:55, Sean Anderson wrote:
> >> Add a reset to help recover from cancelled operations.
> >>
> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> >> ---
> >>
> >>   Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> >> index 04d4d3b4916d..901e15fcce2d 100644
> >> --- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> >> +++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> >> @@ -36,12 +36,16 @@ properties:
> >>     power-domains:
> >>       maxItems: 1
> >>   +  resets:
> >> +    maxItems: 1
> >> +
> >>   required:
> >>     - compatible
> >>     - reg
> >>     - interrupts
> >>     - clock-names
> >>     - clocks
> >> +  - resets
> > 
> > In 2/5 you are calling devm_reset_control_get_optional_exclusive() that's why I expect reset is not really required property.
> 
> It's optional for the driver for backwards compatibility. But for the
> devicetree we make it mandatory since it should be included in all new
> devicetrees.

Generally, we discourage new required properties as that's an ABI 
change. The exception is really when optional was a mistake. That's 
arguably the case here if the h/w always has a reset.

Unfortunately, there's not a way to distinguish 'required' from 
'required for new users'.

Rob


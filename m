Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F396E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opCwwM+Y+5ereQNRaMTDtpwtNW9iexMOHOpy6Y6Ebm0=; b=NpsnQRI1iDZ+2R78kNw3XxDvHG
	ybHD/n3WX82nqdcK5sRbyliChrQliPn6Alqt+v3yUi7gd8GbZjrGIhQGUSQOGcFAbcfrg24rMWsop
	JD/DzL+wMjfhKV/T2XG8T9C7r34AyTtge2BKLZIdHAPg6dsqDl379n2jHJ5O1oqvqlk9jUjRpIO4n
	oHz+T1w3S0hpYysUSbMZ8q5XSk5ALQSP5GBDsyt8aCS+AYWYtu51h5xhWywOTYY88emC9Un8htL24
	iQtgrukw/x2/Qqi+ye/3S260ETefiBDnDE0dMaz86GzWEPICzh7VRhd552Z5k1R+I0c7S5W01Jmi5
	y+zGwc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVREb-00000007WS7-3OAu;
	Wed, 08 Jan 2025 08:16:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRBz-00000007W3G-1eLB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 08:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B74AB5C4A20;
	Wed,  8 Jan 2025 08:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C3AC4CEE0;
	Wed,  8 Jan 2025 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736324010;
	bh=jZHEfq+T+rhY8yWw+U8ne465e6CWj3IX1cnnsWkkfLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhHdiyKpLTvWmHD+PArkrJ6XMwjvfiydeJrQZN7OAwVwEqQNvLZOSc8pEbTDbUmJV
	 qEjbUiPKa6zgSKYnxGwVnOmZ3CN5+x+fwLCpcXI1GqpzVigzG486Vtop3o98/pvQLU
	 NBBEOxnNHCkUYUfKgseAqYM2pPd3N/x75NuBAbXuu5qSDnUhYledRmo389cC0OF9cF
	 /6c3C9vuulfjOdKFSyg2oKAxv64m1Tyzd/oAQyAfRz3qBNi4ryMYrcmb7+QhWuc2Xx
	 BrXNuHL9C9aH0KOlvhrq4R9XiD648p3+ecRN6IMhpAry5BEuOfn8KF3+D/4YfvW1TN
	 chFFnpNpY33jg==
Date: Wed, 8 Jan 2025 09:13:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ming-Jen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com, 
	arnd@arndb.de, sudeep.holla@arm.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH v5 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <ux55pgpmkngxjsl4semw2cfiljbszvotaydrxrihdu3zphsfqc@vsk72c3wqorc>
References: <20250108011812.627-1-mjchen0829@gmail.com>
 <20250108011812.627-2-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108011812.627-2-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_001331_472012_0073DCAF 
X-CRM114-Status: GOOD (  12.72  )
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

On Wed, Jan 08, 2025 at 01:18:11AM +0000, Ming-Jen wrote:
> From: Ming-jen Chen <mjchen0829@gmail.com>
> 
> Add YAML bindings for MA35D1 SoC keypad.
> 
> Signed-off-by: Ming-jen Chen <mjchen0829@gmail.com>
> ---
>  .../bindings/input/nuvoton,ma35d1-keypad.yaml | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> new file mode 100644
> index 000000000000..889f253b3bc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

I don't see changes.

I already raised concern that you sent new versions without implementing
or responding to comments. So the fourth (!!!) time: Filename matching
compatible.

Best regards,
Krzysztof



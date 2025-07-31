Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DBEC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 06:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=To58GqKtVDhgzD+Qyo+UHbj1HickfStGsC4DJIVqF9E=; b=qJ25VYl880Z3Le6l0E1IJI+5To
	KbNBs2XQjgpxQNhJRi5FdudG7c0B6rMWQvx6TAtGckYsiajrY6rCzeU6cYf3j0sYSeD12vTnZ+Azr
	Tun8gNGz0NZMxlkzhucFid7DPL6HMknFO060WGrbNpnM7uL8zgh8rM13sNzFvtrPxWJg/1uveu8+d
	0/hvXsl/RqX3/wHBPiewJznqD21EjsRIP/EAHiepqLJgzhotk1H8Pq71DCkUz37oBBq9bbq5FZD2h
	zuq9DDxZUEFeoa65ce0e2pi/CE4YFecwcR1ec8FODfJKVbuzlze8iLlH/D/BdAicYvBHpcJWqRie9
	nzQa92pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhMt4-00000002zqk-3wLJ;
	Thu, 31 Jul 2025 06:35:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhMqb-00000002zhq-0FoW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 06:33:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E242A5525E;
	Thu, 31 Jul 2025 06:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F7CC4CEF6;
	Thu, 31 Jul 2025 06:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753943579;
	bh=10nRDdbRtJZpHUKeiyBjTnyVRKN1Tb81tLf8PDNnHBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qws2gpyyV9j+BYOBQcfUihn50ogp1E76SRWdvRY5sivhOzlu55L+gTg7zdkawi0Cq
	 9V7bw5Qn69XjBc2KXcsXrbTJc7vn57Yjt5Uhe1TL8hH7NdpRbhXJQxmzBKUhn3XAIH
	 gqDz81yxQHsmzE0cSqqwM1WHIakZFoqVfYBYugtyYxs/xQkPEdYzs3Cv4e5LiMhouq
	 I+0Q9ACzC/Dk/pdabZXRkANb6chMAZ0QHpH9XdcELC2iKB9CY0NrdAp4Ocl3xP+zDF
	 K6CpzFjnXD+Q9hLDVfGrlEpDiv1tAlxD56K+nCteqTYUvHvUKaVoNCkpbcF75Lw3PK
	 pyfWNc24urbXg==
Date: Thu, 31 Jul 2025 08:32:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: fsl: fsl,rcpm: Add
 #power-domain-cells
Message-ID: <20250731-funky-crab-of-defense-7cd658@kuoka>
References: <20250731055806.2265628-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250731055806.2265628-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_233301_168170_4A0B0478 
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

On Thu, Jul 31, 2025 at 07:58:04AM +0200, Alexander Stein wrote:
> dtbs_check for ls1021.dtsi warns about unsupported property:
>  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> But if removed the check warns about missing property:
>  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' is a required property


And if any other warning says something, are you going to do that as
well?

> 
> Given commit 8bcf67b8d893b ("ARM: dts: ls1021a: add #power-domain-cells
> for power-controller node") explicitly added that property, add it
> to the expected property list as well.

No, commit does not explain why! It's one of this NXP commits without
explanation, doing random things.

No, explain why do you think this is a power domain provider - fast
look told me that it is NOT.

Best regards,
Krzysztof



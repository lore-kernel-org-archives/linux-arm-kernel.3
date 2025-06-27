Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2619CC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wo4ohRmIN13miHAEYtOqw41nqz9JQp6Br2eCHVbYLp4=; b=GLZZANrCSXFq2VxSIiuCmmZCxe
	LWCeCu521+oHTusQ5Ni3lGYaC3JuzLqlny79lOfkVWiYI1gw2MPj0h5ZBjgdsbKYovH4mx1hDuq6e
	ZXOQCmcDYZ5f2sr+V11BPQw6jK4kCq6xOGApan7IGuVP/HvB43zVdELxnklEYgZL+9lGgsYw/Mwa0
	85ovM9DD4qOUvs16Hvg1QuYfW/nWjB7vdD2J9QBNHk85O6z1tXm33KG3y5u/abPZWFJgjWLKfKCsE
	7bmY8Ydb0XN5kPtwAgyZIE8y8lg1w6BNca/clQrH1+9dIYETkNAGW6J2SsVukeAuG67HXoN77rw3u
	+PwOCYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGw3-0000000Ft7Q-21Lq;
	Fri, 27 Jun 2025 21:48:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGp5-0000000FsBb-2JTR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 21:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 031E7434AB;
	Fri, 27 Jun 2025 21:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC49C4CEE3;
	Fri, 27 Jun 2025 21:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751060486;
	bh=6qGjtqck4coO6NZjDUGE9y+GBqUOpbdnYaMZr6gFMos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ltKWYsBVFs6COQQf8/KTq7n5oUd+XwK5vSrJDcKqAgqVp6fW+Hgz6NNtp/8aBcOrb
	 dWCUfItSGtpDrT4noMkswvJWAkH9mV6Ja+DilPt5pxREIy0JUDsmFJHsJB83b9/tMd
	 rj/OTmKxAEIzg4/gtrYXNfxXEm0OtaGd0rhLXJmr6zicbc3UT8RDTUio9G4gEE4+Fa
	 26A3IRj4/t3Y27ruVi+YQcdNtSOnNH/g9SuP7IOJ1W4KHXpHNeKV194HhMGSBrSoRE
	 y11ZBpaV5ZjCdqj6sJbH5aNqWwD5SbgevypuH/I6bqVDepAUSXp4hmydGwGUjaKZfX
	 TUSTeSaZRFCLw==
Date: Fri, 27 Jun 2025 16:41:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: samsung: exynos-sysreg: add
 exynos7870 sysregs
Message-ID: <175106048556.189134.1526670585968824295.robh@kernel.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <20250627-exynos7870-drm-dts-v2-1-d4a59207390d@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-exynos7870-drm-dts-v2-1-d4a59207390d@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_144127_607496_AAE1994A 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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


On Fri, 27 Jun 2025 01:43:24 +0530, Kaustabh Chakraborty wrote:
> Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs are
> added, used for the SoC MIPI PHY's CSIS and DSIM blocks.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



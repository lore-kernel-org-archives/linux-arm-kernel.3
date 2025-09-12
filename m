Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70252CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 07:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5hTN1rAvm/sbcc9ngdRzcUX07/qc9X4pWe6KU5+yWg=; b=2Sly6SOg5lfobv+9juVFWpWhrD
	N9uQmzv+9vgjJHO9R9otN207ppkyCqIGMII2wFKaFhdPoHA4iG1d1Zi4UAE3YZeIerWbNk1BCeo2Z
	AIIeaMrqo9F4gomqynSKmySD+uG/2sQ0S3vzXr/hBpqAXHZNH//SNqxYPEtr7qWmrxO3tR302ehcM
	peIysFkHnqcZDT8W5uxE15LhkTMym6vCfYKLuagDObcYRDmcJvd36hew9hv9/aDdO9LVKvjjNCXA2
	8G6Wh2FWuybyq3L4zGr3P8KBqWxDS6inXagH+6ledmw4tm513NanwEm6bRQQpikxqOzqfyTYMhaRl
	vz8savkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwy3j-00000007bqY-0nI0;
	Fri, 12 Sep 2025 07:19:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwy3h-00000007boo-0iSD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 07:19:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 256C1409F4;
	Fri, 12 Sep 2025 07:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EAD2C4CEF4;
	Fri, 12 Sep 2025 07:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757661540;
	bh=i5hTN1rAvm/sbcc9ngdRzcUX07/qc9X4pWe6KU5+yWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lrw+AsEqcaL+3zjmDBAaEHz+o33gND+24ns/E1XjXsv/mlCcAQaOf5xgFgM/TgcpW
	 ZBsYqjs7ko2/6AWXOzib/k1phAQf9xtPuDbRPvc5ITAxuXz4018oUH3q4Z0xdwa0eA
	 ADlhZzC90DEKzOQIrEibXAxl5oCFIIGGpoD5KgEqwF3TfYMPGBs2lOzF8DeLHALUoH
	 M0yG5SWFWF9ppjqsMvy46KwnY/sJgQ5gCj+da1euSUZioEOU/G5c2JDknIa+45eLVm
	 KAV3lNhT97y70pSJDM0k/ecCGut6pH71ZCL0CmoFh/BJfLAcuuopGFTG9Hwvf2Tjao
	 r43FcIi2EL65Q==
Date: Fri, 12 Sep 2025 09:18:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?VG9tw6HFoQ==?= Macholda <tomas.macholda@nic.cz>
Cc: gregory.clement@bootlin.com, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, robh@kernel.org, 
	kabel@kernel.org, michal.hrusecky@nic.cz
Subject: Re: [PATCH v3 0/2] Add support for RIPE Atlas Probe v5
Message-ID: <20250912-tricky-remarkable-binturong-d362e7@kuoka>
References: <20250911161308.52876-1-tomas.macholda@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250911161308.52876-1-tomas.macholda@nic.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_001901_239976_B9213BD1 
X-CRM114-Status: GOOD (  11.36  )
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

On Thu, Sep 11, 2025 at 06:13:06PM +0200, Tom=C3=A1=C5=A1 Macholda wrote:
> This version changes: armada-3720-ripe-atlas.dts -> armada-3720-atlas-v5.=
dts
>=20
> Adds support for RIPE Atlas Probe v5.=20
>=20
> The hardware is based on Turris MOX, without support for extending with
> board modules.
>=20
> - The first patch adds dt-bindings documentation for ripe,atlas-v5.
> - The second patch adds the device tree file.
>=20


You sent three versions, same time almost, no changelog, no explanations
why.

Give people time to review - minimum 24h between such postings. And
write detailed changelogs for each version. b4 helps you in that, if you
use that to create patches.

Best regards,
Krzysztof



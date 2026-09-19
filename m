Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA763C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 06:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NF44E/ilbxIzqmKrtLGcEZ0p7032A0tuueyzi7LgW4=; b=Tv8ptHtfWQJWjjD6fK6U7YjVEX
	8WQyXPdKRjRuZbWClseO29o8A/ZtAfKQV2QWiEp/QYqDHVRuVbJWys4Xqux5pq5QRfYvinTk/ic9Y
	+hcWQk3HPY6vm3MTEcQ6yeNipmsIXCGKv6JX6V7cIo+eA0G39Hd6A8zG6a6zyp+kJlScFE3UxxXpp
	ZMZUaJmD4ETftWLECVWtRZkUcft0gp1FBe/p0ez22Xlq9lHMFDml7QuIfpqR+H6aLffJ/HLJZW5T1
	dkfSCC3D4VRkX2IPfqEuaEHFWtFpGQu9Hnts5tkI3vbI2+3RG9n8NYYfG02x6t0uW+eFpNWHw6PNu
	zXmuWW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ooN-0000000FzTn-2mMl;
	Sat, 19 Sep 2026 06:44:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7oo2-0000000FzQV-20Hz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 06:44:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57EDA602C4;
	Sat, 19 Sep 2026 06:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587851F000FF;
	Sat, 19 Sep 2026 06:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789800253;
	bh=+NF44E/ilbxIzqmKrtLGcEZ0p7032A0tuueyzi7LgW4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=F2OWPAm4S19tf979eebZVGTq7EE+qd4tehDuhg5UhhViEufXnaNjnAsfiNNtqRNcz
	 YpUD2TiYqB5JwSlBAYlUT1LAZ8Ojh2PFy1D/nocPvj9MpgrKgwGS2JEYkxM/XZh47j
	 N+hf/OSKiAkFahlpfQY+rv7si2ljQKlrv15eXz8LKk1DsJQ6NuuaqHbh3sV/MOVU6J
	 Hq4BcFQt/bDb5aflAdXlNRHjS4vAPtZoPIBsFotnkqSvSqwmlsIOqME6UV8f/akoO1
	 5wGWYbshDDB1c9HmF3vHh3rYoiw7oQKYcpCyIkHSbqupgrm8V+aVkx8hpr+c7997XM
	 ppX5If+CJGisA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194054.107929-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194054.107929-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Replace spaces indentation with tabs
Message-Id: <178980024987.89886.1304993290857665882.b4-ty@b4>
Date: Sat, 19 Sep 2026 08:44:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Sat, 29 Aug 2026 21:40:55 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied, thanks!

[1/1] ARM: dts: aspeed: Replace spaces indentation with tabs
      https://git.kernel.org/krzk/linux-dt/c/5b21342479d303b98796ee50a50642843318e92f

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>



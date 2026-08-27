Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476B6C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7idqHOncmG7mF6Fij9tBltdrtulZ+mN4mIw16QKjBY=; b=utZ6XAj12QHS1xd+TqhSQKKWPw
	3czkYPjDjOyOdA01u55Dm5F2PZQM4lRlb8yO6/XAv4zHim3GT+gRaa56pqLg70BnU2ci8YvVRmW61
	oSN+DJ0y8/LxCo+Q3WhMzIXRAaKjPEoicCzrYZ3wAzW+RTer2ssB+NdhM8/vVv+qBNfixJyKVZw/U
	8rEf1wPbzem2loccMl1KSlt7VbUA8Gqi4Bez9GmGDmgQc38IUoY1+F5Ej2XGZ7mdzLHWjc3SXlxnd
	p9t0UV6EGKWIbjlVJpnfjvqIVs82bMC2FM50eZsk5P7r01a7kKRZnMJClNv9VBluAiBKGKuFXvvzo
	HWQWpGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZp7-000000041ct-3HGi;
	Thu, 27 Aug 2026 13:07:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZp6-000000041ck-2Z7S;
	Thu, 27 Aug 2026 13:07:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CB8B40914;
	Thu, 27 Aug 2026 13:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119E81F000E9;
	Thu, 27 Aug 2026 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787836036;
	bh=E7idqHOncmG7mF6Fij9tBltdrtulZ+mN4mIw16QKjBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HbkNkqofgca0N5Jj0aw+z4giRuz2xH3T4sWKZErKe9iV4Rla0Ul7qRVW3meU6hTXL
	 RzzC9URElHLfzSvuCUSJYk3m1rOoSCwWZF9jw7cIi3PZc2OncHlWQ+h4B8Y5z6Ddiw
	 n77PfXAVcTjuX5X9CAcdV7kvHjURMrI4WdBes/IYYEwo4uXXFeoFb4SfCnK71sp965
	 30BGGHUNDgnXCTK7aoRz3uiKhnspaGD/wTywqrV4qixFUcFlswhKBVUbRn4tVS+DEd
	 KJQ7cLa5lGntEhy47ujyEYXAFoaD8QVFk6JXT5hbfLWbh+7/oCVqr6vR334kaCWYGd
	 VfEUHF4prbYhA==
Date: Thu, 27 Aug 2026 15:07:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Christian Bruel <christian.bruel@foss.st.com>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, 
	Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 7/9] dt-bindings: arm: stm32: Switch
 st,stm32mp23/25-syscfg into simple-mfd
Message-ID: <20260827-skilled-optimal-shellfish-c548e5@quoll>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-8-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822074816.548662-8-marex@nabladev.com>
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

On Sat, Aug 22, 2026 at 09:46:40AM +0200, Marek Vasut wrote:
> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
> represent the USB 2.0 FEMTO-PHY. Turn the syscfg into "simple-mfd" so the
> PHYs would get populated by the OS.

Sashiko comment is partially valid - you change the ABI in incompatible
way, by requiring a new compatible. Commit msg should briefly explain
the impact, e.g. that there is no impact because phy was not
implemented by Linux and was not described in the binding.

OTOH, adding simple-mfd means children have no dependency on the parent,
so this should be considered or even explicitly mentioned in commit msg
(parent clock is irrelevant to child, right?)

OTOH2, you have now patchset dependency which is nowwhere explained.
Merging constraints are the most important part of cover letter so must
be clearly stated. IMO, should be stated also here, because many
maintainers do not read cover letters. Or just decouple dependencies
with using 'compatibles' pattern (see Qualcomm msm/mdss display
bindings).

Best regards,
Krzysztof



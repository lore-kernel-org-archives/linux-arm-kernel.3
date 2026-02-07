Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34955EE0AC8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yfe0JQENx3JzBys1xX1X12sylG5H3tkB7w1ZBl0x+eE=; b=QpmbA0Ja0WhlkUis6H+Wz3jVNa
	MJWZSK2AQci4TXWf24X7p2ngytPcjNL49yd4nfpeCJpqi50kid9duA9lorQSDkCUNZHcrhPvujbs/
	0pDHYBGudG6LhTOMlmTBXtK2XqIaxPVOAQOz8tQvtlX2WOolF9lw3C0QVDF8oQtr5ONKHQL6NQqdK
	KmkEWnIN2X6CD6owJMbXpcsNU3ppD0nstMEr2AbxdsYDy9A3sFaclSCEj2sWj1niakQ4G9dywxrr1
	p58j7bKRAJr7492uve2loIPPzMiU+gBFo+X1J6a1l54E3X0QWWhkBrDepi37aE7CcyZOpRgyDihkZ
	A4a1Inow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofuq-0000000CMWH-3gS9;
	Sat, 07 Feb 2026 10:51:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofuo-0000000CMVX-3IE8;
	Sat, 07 Feb 2026 10:51:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 647A642B87;
	Sat,  7 Feb 2026 10:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5B0C116D0;
	Sat,  7 Feb 2026 10:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770461510;
	bh=Yfe0JQENx3JzBys1xX1X12sylG5H3tkB7w1ZBl0x+eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aL4c56YhzpWOZd6f6yU7YVZZDUks+8I/U11G9l9PQD4zOAoyVfrtZ/xHwTvS5gnqY
	 +qjCDdW6YRk6OY+IH3RulTJXmArpvEhVmPPUUWm+Tske0cCn6smYWXAjFG7Ke3uQUg
	 onwEJ+P7v8RM7pzJASAWttZSrbUr2Y8xJ2nqkgGiIbD2D5boxJAibzXf8wiTC0CeRZ
	 TV7Me+O9nc0o9Rz8LhUWEIn27A37aNgPledniFgGmzw2O19G4WJ3t1kx7BoUdqw3dz
	 citAOOofu/x4eaMq+6jsJpB3N53HHcYcc8t52AyaUyq+AhM+fkFLA8iY6A/S9t/FL4
	 m7RU74gvdVMOA==
Date: Sat, 7 Feb 2026 11:51:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8516: fix syscfg-pctl
 compatible
Message-ID: <20260207-fragrant-malamute-of-pizza-64f1e8@quoll>
References: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
 <20260206-mt8516-syscfg-syscon-v1-2-96dcb37acdb4@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206-mt8516-syscfg-syscon-v1-2-96dcb37acdb4@lucaweiss.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_025150_839313_8A1D52B2 
X-CRM114-Status: UNSURE (   7.44  )
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

On Fri, Feb 06, 2026 at 11:20:49AM +0100, Luca Weiss wrote:
> Just 'syscon' is not allowed by the dt-bindings, so add
> mediatek,mt8516-syscfg to it.

We also do not allow to add fake hardware description, so above is not
enough.

Best regards,
Krzysztof



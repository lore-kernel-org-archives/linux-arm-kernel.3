Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB13C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATXQuhcsU1yRD4J9xK/fW6XCIpw54vLXsQ7cbzLGCDQ=; b=FnvqTb8ScyXuYi9rTwS1RFO9uU
	rvqySoFrbWTkwA+bmPYdlrJRVo8F7s9Pa63VcLbTfYqgpyUdd5CSrMG3qiTCCJpxKcPmOYO8jdGmV
	Dh0sHAt7qc0ID6FIxEh49/ydmAwGFbZxz6UGm2p2L/2MF999P6xhTgRE6iOgbxxETdohve+OeADJx
	HvFbwDZY8cHEPDCp4oQWZ/XnSPzFgNU+7YH/OwX7qd7/MTJ6GimmOmTTKPMCGdT6EEXluNVxsIhkO
	J+s9d38OKkGIA2tZlNdspLFr1rbfOet7TTIkXOcN4rvsCAFlHsqWcgZ7V7ERxczAj4Xk4WsVN95kX
	w/8fbYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPmE-000000052ZJ-2vA9;
	Fri, 21 Feb 2025 09:56:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPWT-00000004yZb-3pHj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:40:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E0D15C56F6;
	Fri, 21 Feb 2025 09:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B503AC4CED6;
	Fri, 21 Feb 2025 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740130841;
	bh=ATXQuhcsU1yRD4J9xK/fW6XCIpw54vLXsQ7cbzLGCDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gstzdaJDHFaz8EX/LddhLXI1wdgZpBxj5pUIAuDJrI0nej4P6ecZonO1bHnvfEx/2
	 b4zXWuRN+CVxu01lEH+lI1tMgyYVf9K5Und7+DMtIE68SfpAM0ui9PJWYF2GCidtrn
	 GWI4sb057Gdejb9Yadk8ENx1uinX/2nn8eLWfQgN3BXYcRtgF4Pz+p+VbrrlEh5Xw2
	 zoS9ffu28SIlQxOcGUfcTWZl3DHvW+Zwehy5IUlmkqJig0goJMkYvk4lmyA7VsbVE5
	 7d9aaz8d6NzpToDhANs41odryQmDhsZEoUTrmsXxA+FnQFZUy7uSwxgw6re/kTinjO
	 KzLGhUAGAdEPw==
Date: Fri, 21 Feb 2025 10:40:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos7870-chipid compatible
Message-ID: <20250221-independent-oxpecker-of-piety-4fb305@krzk-bin>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
 <20250219-exynos7870-v3-1-e384fb610cad@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-v3-1-e384fb610cad@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_014042_001742_FAF54AA7 
X-CRM114-Status: UNSURE (   7.09  )
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

On Wed, Feb 19, 2025 at 12:33:11AM +0530, Kaustabh Chakraborty wrote:
> Document the compatible string "samsung,exynos7870-chipid". The
> registers are entirely compatible with "samsung,exynos4210-chipid".

A bit odd (exynos7885 is compatible with 850), but I guess you really
checked that.

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AACC3ABB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 19:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUmS6GCIc0Zx34xRLAjI5cPOmu2Bqd2LdXigmDX7azg=; b=U9XKcmx3hrGwN5I/SDApBXQlSU
	gk3vVnU+XNB8vIhjVgMT9PS1GndwFzAOxDzPJPP1NzsgbNwLOnXAYu2C95PaVkCHsVmmo70pZTxHM
	CEKC+Jb1qQ8TrY5dUvZbTvda5/tWTgs4FEAdxOJFAzAj5rPBxE34fj6TvmHta9uSdltfiCPnKjtDX
	2RUXV4NnL9sfF8yf2WxASN+qZAfbBJTHtc2saVw+a/ZrHRSATAyNCFEwpHAAcKAjOzGnObPzu42Ub
	AJOt5HwCTEMumeJB3EWDWpbnLS49wjfX0A2mwy5sZBYEuGFcs0EYeNUzaAKZTm8vkjlhPGAIOur5V
	z0oQ7pEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1Xy-00000008Q9I-3lXd;
	Mon, 05 May 2025 19:32:14 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1Vy-00000008Py5-2ulr;
	Mon, 05 May 2025 19:30:12 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 11C45C0000E0;
	Mon,  5 May 2025 12:30:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 11C45C0000E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1746473409;
	bh=RO2rvPFwsU9Xpc/pkZSTBrPrQgVR/uHxXBggVsYUGa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BgDFCPzsvn9+Ee0fecqz78TJfQAONznFdsMayIslHOJy+73pDTEFjqvVUww1BZx6e
	 qQxrGekZSB+HXdVPgqzKRQq70mTaEsXHXwB4p6MI7n0ZaJdcaVpgI+4Tj0JdcL1soQ
	 v9cuBfK2bchqVoicRcI6WJcA1RCXuLGirIezGZQc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D022918000847;
	Mon,  5 May 2025 12:30:08 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: broadcom: MAINTAINERS: Cover bcm2712 files
Date: Mon,  5 May 2025 12:30:08 -0700
Message-ID: <20250505193008.1951252-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505191255.304500-2-krzysztof.kozlowski@linaro.org>
References: <20250505191255.304500-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_123010_796061_56E6327C 
X-CRM114-Status: UNSURE (   8.16  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon,  5 May 2025 21:12:56 +0200, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> Add bcm2712 files to existing BCM2711/BCM2835 entry, so the files will
> not feel abandoned.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/CAL_JsqJi+8-WdYEyrGjb=cQXPEb07Lkcj90a32d38ChvYJAA-Q@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/maintainers/next, thanks!
--
Florian


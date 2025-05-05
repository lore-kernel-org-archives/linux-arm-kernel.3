Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E521C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6DfAkqmatLxmLg8isSu9YmNjsXnPdrip922h5yy7h8=; b=GsVCAFEPlU/4E+YY1Lv/FrorWL
	ea5s20Gq2JnKbiXarN6djBZ8MP+Pyt6OIuFAZsho19EBhtnbK2OMVJsHF61NCrXKa5B31EFD938Ji
	X8KJ8m8D4V/STkbF6KL6a+JGnHhMoCiXhoyCXZaRnOaNgqp+agJZ0LQds4Lk236cbIt50sr+mPIja
	19XBgfH4qAEB/Z5+rr+nUT6VCAtNINbOMQ+tYBPRhPOq6HISNTkh3nUiIrrDzPD5v3HICI2nrogWd
	keZ6MIhOuV0fV4cHhCIzWqpMCsFwyav+R3vjmjNXZK3oGmrQZcOd1gh25sqgTqC7EjY48PiSRo9JN
	vId49+AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBrPJ-00000006oE1-0ZUx;
	Mon, 05 May 2025 08:42:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBr9i-00000006mR3-3f7v;
	Mon, 05 May 2025 08:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/6DfAkqmatLxmLg8isSu9YmNjsXnPdrip922h5yy7h8=; b=ZTcaDYH9sTVvm45ziriha1k+rA
	wBsEWPTsPuSJimgaphgfhwWZqpmue5vWy54/gqZySe7j0wcvjWQ199ke48Yq7SRp1DuUDDKM2pQto
	3N1gHXPG8su6J4j0dGis0+fbiexqw0kG5RVljdgMwR6vuAHd0FiN9iADTgUAPitoZCPWbIkCmj2rL
	tA3yR6B0YgmtzDEJpO66yQ2t682R+xl8zhMTU17lYtS8mhr2zOjNxjOts2dyJ4+ocdbr1lreshSov
	qBUS5tMOZsp/HygryeStXw0XbrI6yBZiDjnoPefBDKlf26DUgNmyZdjqpigPjOVbrt4AmJPMXwKMf
	8Cd3NR7Q==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBr9h-0001Ho-Gt; Mon, 05 May 2025 10:26:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH RESEND] arm64: dts: rockchip: Switch to undeprecated qcom,calibration-variant on RK3399
Date: Mon,  5 May 2025 10:26:18 +0200
Message-ID: <174643357079.1204535.2566293021923163121.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501160208.96451-2-krzysztof.kozlowski@linaro.org>
References: <20250501160208.96451-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_012630_907070_E3D8C78E 
X-CRM114-Status: UNSURE (   9.62  )
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


On Thu, 01 May 2025 18:02:09 +0200, Krzysztof Kozlowski wrote:
> The property qcom,ath10k-calibration-variant was deprecated in favor of
> recently introduced generic qcom,calibration-variant, common to all
> Qualcomm Atheros WiFi bindings.
> 
> Change will affect out of tree users, like other projects, of this DTS.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Switch to undeprecated qcom,calibration-variant on RK3399
      commit: ec169727bf7365f7475f335116e1bb5896dd3603

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


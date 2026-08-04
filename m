Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789EDC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9AGxBVYQpbNREErx1f6eRinTorOtZ7ZJAiCWo6mJWA=; b=h6DItakoNJLan+UWQW7KMuJvfZ
	rRm2O9sItC2xKfrZBIRhuMPTdfkLVWEJkI8wde/iq0ERrqJjixxHjQIwY0bTinfT8QDoMnBqB1jjV
	lQ68HEOrdy1rCmC/7Foa0KTMOIXII/imiNjW8hLSyIRkdBn7mEi/mDeB8A3Uf354bKyLTxQlL2NH9
	KJy4Qk2DIekeS222K1Cz3JKOXS5g0HTyN3gCZeWwRFCV9nAnu4ynKe2jmE7nzeYYhMswNHS4AZS4C
	dsieZqMMqAIUbmuISYy9/btMuqwtbsomBryKv8KgxdeJIsJPTY1jTjGYblPSeyikviVEj1JLZkBb6
	EIJR51gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr90D-000000019pj-27Gs;
	Tue, 04 Aug 2026 06:51:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr909-000000019pJ-02fw;
	Tue, 04 Aug 2026 06:51:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2066C600AE;
	Tue,  4 Aug 2026 06:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2FA1F000E9;
	Tue,  4 Aug 2026 06:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785826307;
	bh=E9AGxBVYQpbNREErx1f6eRinTorOtZ7ZJAiCWo6mJWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NYWcYct9Ik6x2Xq+ZGFnrvDBMhu8CYAQcx8ZgNlQcT0+zB81eVr3WepEdyG2R/bff
	 CwxD4WfnF3aAPt+VJf4YHJ0cXbxk9kPER/9h42Q7rxRq+0i8hcLkr6+TP4UhCeWjvt
	 PduqE6NXJSK9XDQne/BapirD23q8FspgolIdWQAM7m8TNFhfJYa1boNXS7qXG1qWHK
	 KJlDinn+Xti7FcPGoX4cYpma+n67agQV0zMJLGbwdX4DDL9KylaldmCszUY90ybu2m
	 ldS3GdtiuBPWrp7WKCyreiYJ/YRPY1vCQRBvz8Nis5mxAzi+/4IRy+FABEFKfGf+Fl
	 Gg1v70wpLdleA==
Date: Tue, 4 Aug 2026 08:51:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-rockchip@lists.infradead.org, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: rockchip,gpio-bank: Add
 rockchip,grf property
Message-ID: <20260804-advanced-meticulous-bullfinch-2657a3@quoll>
References: <20260729132736.3807082-1-sjg@chromium.org>
 <20260729072727.v3.2.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729072727.v3.2.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
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

On Wed, Jul 29, 2026 at 07:27:26AM -0600, Simon Glass wrote:
> Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
> IO control (IOC) register block rather than grouping the registers of
> all banks into a shared GRF region. Add an optional rockchip,grf
> property to the gpio-bank binding so that each bank node can reference
> the syscon for its own IOC block.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



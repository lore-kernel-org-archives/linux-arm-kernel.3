Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2DAE68944
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIa2Myv1u6mL7hEhLoRUl+/3Oo+fGrxYl+SCLSlltoA=; b=tVpT4AqcHpGRA8felZ3K+Hq8zs
	V1ACTfAgR9CfFitNnwyE8SxmSa8x5OWBGLmkazZJFUCb78WD7I8/gyTiHYBpcM3jbAHGLEfzgcFhh
	PAcGTmCQCtFt3kMPKT463QBJEOWDhCfpfv6OO1BWkd4hCnZs6pnrdwO/x7HSVUUO0hRDsR/uJl9ik
	qXTV5gYfyXnrS6Ncn0myHkigRaf1jLdLdzvhlHHcE0kCW5/aQlLSGh5qUg2vBVK6TLVO0BB6qr3pv
	1h+WKzjpvtVr99lMMuwojhgCMBqDfBGF8y0whHJ46IS7BRReTB9OcfMzSbEAsBZWa1OOAN6fB5c8b
	0YjinZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Qbu-00000002x0t-2CJI;
	Thu, 31 Oct 2024 08:32:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6QaG-00000002wqv-0Fxu;
	Thu, 31 Oct 2024 08:31:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69304A42FDE;
	Thu, 31 Oct 2024 08:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9613C4CEC3;
	Thu, 31 Oct 2024 08:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730363470;
	bh=xlqpRXm6GQ0UagqS3blmLRplAa4RYc97tCA9IGBFtcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sTxQJzmMpBKy/MOAa+h1uw6K+O6EuGffkeobixeFuNU4h85gQ6knUcRf6l8DAzO2i
	 ustFNd3rPLwFpeYbLLlL0BA7kKo09VOi8XrJLBmP+uevPSrQbqdm48ryPdi2toh+L2
	 d7J//5vG1ewPurrpP4H36OrYsufrIApaZIp3rZUd46i4afFSDZATwMdbJU5YOVP3No
	 W9QGTU3zDRhaaSYkMnK5oDGCl7UqKzYxISlitWoQCEAQy8xTGO1lrG5TlEaNT4O0jM
	 wCdfwPt3AXCEyxCCJ/msVaQp1tGJokXcmauJWFQuI5SB021hcOSBXGcQkXyLtLtkbV
	 YfXiHp8mKFzGg==
Date: Thu, 31 Oct 2024 09:31:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5
 Max
Message-ID: <qyrpjugdzdd3h7536cbjcb2uq5y44mliipmagthfxhbdrmnx3e@a4ttzrfak3gp>
References: <20241031031528.23428-2-honyuenkwun@gmail.com>
 <20241031031528.23428-3-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241031031528.23428-3-honyuenkwun@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_013112_182985_F6BB0F3D 
X-CRM114-Status: UNSURE (   7.76  )
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

On Wed, Oct 30, 2024 at 10:14:50PM -0500, Jimmy Hon wrote:
> Add devicetree binding for the Xunlong Orange Pi 5 Max board.
> 
> The Orange Pi 5 Max is a single board computer powered by the Rockchip
> RK3588.
> 
> Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



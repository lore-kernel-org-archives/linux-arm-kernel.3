Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E2EE95A8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhitdrdfjsFDdtWcu4vCn5M/fst89AUW/Vqwl7/eiUY=; b=JAM4W/4yb0j3BYtEclKxl7mTCP
	t8KCEEkfLS3jBd4eFOKCY8oRq3gVG3QHhm1VTLuS6go/m5/d+sUCDdpBoW4vp1MYQpo99Tbe2zhEQ
	Xqc6o1phj/5nQXho+s9Sz/84GIqiuwV59W1xOPDQ6wLUUd1vWG9ZVK/Mtu9IKEcVY/+v5+U280Jbn
	FwlIrGQKHeh5Hxl9SycSAIKl5MzWn+XLlb1/EpSOa9MsXs2mcBJKsPV4OWkq1VsoTf5uBIEB6XlwO
	hIfD5cmWfAguSvTgmUiyDSHk7jto3ods2ejla9edYDCSSj8IiOTDKb0tzsr8k6jObjO+9yREaE+1A
	pSmafY5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYw5-00000004oBY-1yZY;
	Tue, 30 Dec 2025 12:34:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYw4-00000004oB7-082m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 12:34:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7806260017;
	Tue, 30 Dec 2025 12:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D31C4CEFB;
	Tue, 30 Dec 2025 12:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767098087;
	bh=uhitdrdfjsFDdtWcu4vCn5M/fst89AUW/Vqwl7/eiUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qhxh4TSBjITakOzATPI30S88W6QM2clrGe1xkuaiqRkYJl5oj5ja9vlfwXvwkIfMM
	 DSmxa3dZngTRzsmNFLPVOP54wmza+9PIoKHUbCW71YS5uoJbTWi+9Lhfz+2oK91EGp
	 9JvW6Ejl9VztudLi9Cy76sTlVF7kCraW84Lw9ILfiqik/r7XYi6ERe2h/URSWMXR7m
	 xYdmSAfvBO10dqaJj+C5xXz78fskOq5Y3E8kOXGF21Fb3EJXn9zt4OhhQRK+Mm+wZX
	 YLUbR6nY3Kwr/50v6zJJSMCrUXv5pCQwHXQSmvNNd204F6fRLLGoynLheUn0D07bze
	 CbZ/zBE3wBhmw==
Date: Tue, 30 Dec 2025 13:34:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nandor Han <nandor.han@gehealthcare.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in
 low power mode
Message-ID: <20251230-hidden-okapi-of-reputation-6ef8be@quoll>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-3-nandor.han@gehealthcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229145000.421426-3-nandor.han@gehealthcare.com>
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

On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
> running in low power modes (STOP and DOZE). By default, the watchdog is
> suspended in these modes. This property provides the option to keep the
> watchdog active during low power states when needed.

And why exactly would that be a DT property? If system is sleeping
(assuming this is what you meant by low power), no one will pet the dog,
thus watchdog makes no sense.

Otherwise I fail to see how this is a hardware property and we do not
accept SW properties (see writing bindings, numerous presentations).

Best regards,
Krzysztof



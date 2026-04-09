Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542C1E9DE62
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMOUTQ2n8ZdUSc9lx4PDrliZ+neBQXCbhBCvjHLo1wo=; b=iuIi48J4hzZVjQkc6nWKhyCptR
	OKwuMlexVoxYsKLVVWi/PboO3kebnS2NBFrWqi+O5pPACA/yQK7JMKsJv4DmCgDDOuFHCtjMU7DHl
	72BU6Z27vrG0WX7+XatZRSB84DjTOPYYW5gQzb8K9CV35fEBUJomDzSTm5wSMUi3sec5O96IaWdmI
	Q0LbEt1v4abayKaYFOJ1bsQNQX/cjMb44F3E6otxreSTlfuvkWrelTucfQ8/vdYJSCL1BQH6ATG9b
	m85S8C+2VLAa6XYfp48pwlrpimROCkTQDtBxmI5WSYROUDxZ93L030FxL13KtRVBfueTNZOjpjNiI
	BcBhFCMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkXm-00000009vSu-018K;
	Thu, 09 Apr 2026 08:15:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkXj-00000009vSD-30YI;
	Thu, 09 Apr 2026 08:15:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55FEA4011B;
	Thu,  9 Apr 2026 08:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34BBC4CEF7;
	Thu,  9 Apr 2026 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775722515;
	bh=aMOUTQ2n8ZdUSc9lx4PDrliZ+neBQXCbhBCvjHLo1wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Va9irgINaO3bh5yRUsexQXriLdkEha6HsQSYQbbnu1Rl3c/xxehk2mlOKjpnhCCto
	 vRbzRaFU1JDJMuCHm46cGUsaQNqdBOPsUbhTyfDfO+CYFUmu3Mj/ikL28hrX4YcIwS
	 YSWL067120ZH4sy2nSV5HX0Qtv+9h8aY9RVH1sIiFsBP9OdeazHEwsuZhjKU/mk9Kr
	 2b1ug7oSahUJvSy+T95ZM7Ain69aWHK+MrgzJu4qlXCyArD9AtsyimMlV2SsAiw6bp
	 LQbPTvAtPw9WlRSVCJGWuQPU+tpId5ffg5OuHmTgoVsfJIlfO7O9x9mfHNB+fembEe
	 qBXWv8Rxt1zMQ==
Date: Thu, 9 Apr 2026 10:15:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: broadcom: bcm2712: Add the otp nodes to
 firmware
Message-ID: <20260409-imposing-strict-snail-5d2a6f@quoll>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-3-e02d1dbe6008@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408-rpi-otp-driver-v1-3-e02d1dbe6008@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_011515_776674_CCCDD545 
X-CRM114-Status: UNSURE (   8.06  )
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

On Wed, Apr 08, 2026 at 10:00:17AM +0200, Gregor Herburger wrote:
> The Raspberry Pi 5 has two OTP registers (private and customer), add these
> to the devicetree.

So this sentence confirms my question on bindings - your device
raspberrypi,bcm2835-firmware has these, thus you do not need these child
nodes at all. Neither compatibles.

Drop entire DTS and binding patches.

See also writing-bindings and DTS101 why we do not allow this.

Best regards,
Krzysztof



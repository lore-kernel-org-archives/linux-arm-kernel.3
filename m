Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5698BCE8E92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3/+XXgN/mQgFkd8Ao0W68TzGKjenM2/UMYi1IJWC1I=; b=PciOn1S+lyYSms9sKsS6jvuluh
	kCYURPmv6miNxdSvXd/mr2SKuxVbH3XGNw/bclCAgWb/llQZHtKZp5Ff/i/TUGrkSklpJM8agpU00
	MDN2h/BquAjM5fSymGm+1n1bmazPHJ+Xs3734NHtzKYxLjiEqElwObA6oVxfGeQTOyCQy322qdEvJ
	H8muWyIE7rsgJ1j5IAM+EHpJcSFTxgSkreypf+4G0KER0Zx4EtoIJhOw3yrApRY9gqBLGMTsOCrtP
	JJLwWuUKa+jsIbB227zjWpk6RULIdFL9q267vbmC6BIddvWGLM0R+maNHLjcxuOvJsEVd1r6wJUHg
	KR6kdgvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40VM-000000013aN-1Xcq;
	Thu, 24 Oct 2024 16:16:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zSl-00000000rzM-1ZA9;
	Thu, 24 Oct 2024 15:09:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0FD74A45588;
	Thu, 24 Oct 2024 15:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314CDC4CEE3;
	Thu, 24 Oct 2024 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729782561;
	bh=ojYx0PQYtL8ocNe8PCalEPMZedU+ieflQax3vzhR5e0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=hVaIwfYmQk52sKxzCADhMo0WcbOetCF2g/REWq7oymjGx8oRznaiKgKrGPKVmxD6k
	 PQT7/n9GQAnqpln1MfosQhKztUZg7X2MGKQTBYttK+vdGWxXLQHPVRshralR0mIGEY
	 v8DKcZD84N6WtUowmVQU/LS00nA/JYP7l3lxmKLAKcNqdnHkVDf8zi9uMLFuaRaswO
	 rbrSS41iWYkqBh7Ze1XQ6gH5cxF666cxMZiPJDRJp3rt45BLxOP5VRxMEPtbNDfN0B
	 pVLq26dqM8iFN9nnKp1bmf83dNRkQCdzL1WOaTBhy+gRFvRNfV67d33AiaqBuByYaT
	 mcuFPQ5XcnmHw==
Message-ID: <c7a4b58f0b557fab0c2b7824d50583e4@kernel.org>
Date: Thu, 24 Oct 2024 15:09:19 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 25/37] drm/vc4: plane: Add support for 2712 D-step.
In-Reply-To: <20241023-drm-vc4-2712-support-v1-25-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-25-1cc2d5594907@raspberrypi.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Florian Fainelli" <florian.fainelli@broadcom.com>, "Javier
 Martinez Canillas" <javierm@redhat.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Michael Turquette" <mturquette@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Ray Jui" <rjui@broadcom.com>, "Rob
 Herring" <robh@kernel.org>, "Scott Branden" <sbranden@broadcom.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Will Deacon" <will@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_080923_518605_8C172F1C 
X-CRM114-Status: UNSURE (   6.91  )
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

On Wed, 23 Oct 2024 17:50:22 +0100, Dave Stevenson wrote:
> There are a few minor changes in the display list generation
> for the D-step of the chip, so add them.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


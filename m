Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A44C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Kz2FwOoE8KALxnPW57GyKbpTj149Oz4OfFbgbzkihU=; b=LwDuLUc3vg4fCyEr3cy2Pw4Si6
	xv2G1tX4w5HzQV7xsBaZ+DMrV1Gu8hdpE9QmJ0UV9tEwdFNvLhl5kpwZ3TQE7gdONMCDIhxnSqbZV
	BaAheUVCdHF1BPxAVU06DrNarjD5tU+UyQNjIiS/2qBQHPSykTVsMmJMUEtqmLWoKdcgjUI23PEuV
	22zwUgq22zxTofKeLgY1u0q+ABensIfccXgDtbXHd9EM9decHeSERdCS6Mh9K2L38IOLwFuy4wIWx
	cGu4/27rqL4RGLok9YYlWwE/plQTlw3L9wziJ6JYzp5V7n7cHLoQreX7c3l0mJSyWYMJHZy1OhFQ9
	kFBy/6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tktAP-0000000FbZO-0SGa;
	Wed, 19 Feb 2025 23:07:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkt60-0000000FaNE-0O6k;
	Wed, 19 Feb 2025 23:03:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 295A35C5CCF;
	Wed, 19 Feb 2025 23:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26CAC4CED1;
	Wed, 19 Feb 2025 23:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740006191;
	bh=VUeQu1vrzQP2/7jPS3smCWyLj/rmS0K39e18uTexhz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dw8pTKvugW7ZaQzOiw3C0XKopY6Hf/aEGHoQAngd8UnAXxaEgWjpQDjUeGYfV6MvR
	 fdO1y+W4JYAkQwCIDAuTKxCiXqy+XJ+BBiMlzqk0pXqzQ2xhAE3cHcqlzQ62oYbd0T
	 cuQqDJRtFEt9dYl+9b7lT6ihRefYWnf4+1EqUN3FtTVKLFsRTTcx0/+hXqTJjUZ98w
	 HnfOEHTrbhwKbBdxNM1ZdtZ+kfYqYkjQCZoTFi4jrrQUKczyROSHTo6MMxg+V3MbyN
	 0Mk6Z2I/wY0IwiybtQbOsj3L08ZaOWBynwxpX4zCe5MGEKYETlTGzCXQwwWib+T7YQ
	 x3ncvP79QgYEA==
Date: Wed, 19 Feb 2025 17:03:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org,
	Zhang Rui <rui.zhang@intel.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@collabora.com,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: rockchip-thermal: Add RK3576 compatible
Message-ID: <174000618924.3136841.3347238546392310162.robh@kernel.org>
References: <20250216-rk3576-tsadc-upstream-v1-0-6ec969322a14@collabora.com>
 <20250216-rk3576-tsadc-upstream-v1-1-6ec969322a14@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216-rk3576-tsadc-upstream-v1-1-6ec969322a14@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_150312_189885_E69204E7 
X-CRM114-Status: UNSURE (   9.57  )
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


On Sun, 16 Feb 2025 00:34:50 +0100, Nicolas Frattaroli wrote:
> Add a new compatible for the thermal sensor device on the RK3576 SoC.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



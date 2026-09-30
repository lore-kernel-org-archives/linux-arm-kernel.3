Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFC6CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+H8Kg68nVhx6dtUfaMKJGO0vp0CyK/Fr5IyBgo7Aro=; b=mOASjqe7MU9wBhk0B3WrXlNIjE
	kUmK1srN7BbjgICb1cciqsNAUu+HQcJ6yxpuoXv9cTOLvFDHOK0sJ8GMPeuQ5NhsiRSv+VHOahePq
	yTbuGReNneIJgFjIYWLYHXy5lSbY27VzDOGEVn2euvvJw3zmlVZo65bo3DYxgffCaSUxnJZmQ3cQQ
	ITbdQwSU4UTm9kgyQo43todrkXAA/oppqNSRXCdS9Q6ysF5703Na/xvq6EPlIzKoKh9mvbQhLQ20o
	KAoZRZnjPOPlzKezg0YYGwbaKgzOxt8alTnqdWhPzJRphSKrdV1DWQHT/HHkyE2KhPqVvStjpsnOd
	gpHra+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsmO-00000005v4h-0QQF;
	Wed, 30 Sep 2026 11:47:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsmM-00000005v4V-0vTp;
	Wed, 30 Sep 2026 11:47:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B11304386C;
	Wed, 30 Sep 2026 11:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0201F00898;
	Wed, 30 Sep 2026 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790768837;
	bh=f+H8Kg68nVhx6dtUfaMKJGO0vp0CyK/Fr5IyBgo7Aro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q07wbSjEcLzVhHACNVpAkohD2c9bZOiBMrtMMpiQbRbxQW7DSWJhgnfKsT/M8aNtw
	 2ESLDoVIu1vC4boi7Yv32mgcN5LT4aqPCL3gsTvUUD0NE2nlsbV7Z371LVVjHlB2Jy
	 x87MQ8x67YHtq5Up1116zQMZnnewgS69K616Al7HWUq2gOVfSbRjobOA7E9ox2LPY/
	 uB0tDdUhLvPdPkISFfuOUwaMhcsZvMG2SOViNIJr9HmmUAgIhtyndIr/lxRlF8nP0O
	 xLbZwPl9X7PT00v1E5UutbwrQBWHKYhhCzKjFZhJ5oy1duXeMkq9FBi8NrXctBNZLs
	 ANXmrv/Mxu26A==
Date: Wed, 30 Sep 2026 13:47:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
Message-ID: <20260930-fascinating-cheetah-of-speed-7cccd0@quoll>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
 <20260929-b4-rk3576-reboot-mode-v2-2-5a34ca72065a@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-2-5a34ca72065a@flipper.net>
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

On Tue, Sep 29, 2026 at 02:28:19PM +0400, Alexey Charkov wrote:
> Whatever program that acts on a reboot mode runs before a full OS, so it
> may lack the capability to enable the regulators it depends on, and a
> reset that preserves the mode register generally leaves the regulators as
> the previously running system left them.
> 
> Allow a reboot mode node to name such supplies, so that they can be
> turned on while the mode is being requested.
> 
> Tested-by: Shawn Lin <shawn.lin@rock-chips.com>

Again fake tag.

> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
> index 79ffc78b23ea..5ed70c87269e 100644
> --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
> @@ -36,6 +36,14 @@ patternProperties:
>    "^mode-.*$":
>      maxItems: 1
>  
> +  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
> +    description:
> +      Supply that has to be powered for whatever program acts on the mode.
> +      That could be a boot ROM with no access to regulators, and a warm reset
> +      leaves them as the previously running system left them and not necessarily
> +      what their expected out-of-reboot state is. Any supply described here is
> +      enabled when a mode is requested, and stays enabled.

This looks like workaround for missing supply handling in actual
consumers. Fix your devices instead.

Best regards,
Krzysztof



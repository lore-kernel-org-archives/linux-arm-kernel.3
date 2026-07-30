Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261F1C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoZWekAB+mXCjKKPwdC/+UrxluXzPXzJ6a2Xt45RWOs=; b=C1OA2lt2RLc6lLSUXCgO9AgF23
	nTOFRXXKXyDfDlSoUZBi38kxZbhXgHkMoBhaPHvfZ90+y2wnWkAuORhvHFomMrjBb1tCxPPOsP686
	v7yLO1S+uiw8BGGffNH/oQMtuEWVc2+JZdqCF8gLkf3CQDVZOjEEbIJyT88r8sgBvg1M7U4AKGFLj
	yc9O2MW6DVx5PWGj7vXWBGsiy/gRcl04B2Iw0qUNWV6VQUndJxiLX+LRTesJGrdbbrhlKi7fhNusL
	9IeGThdXpc3n1b92sqK6eQk3d3hLJRiZpW3+giKbgnKXDswK/vhdPNUIk8vm25R/xQGSWTnsYW9+s
	/3+44VoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMOr-00000009uRz-0Z0C;
	Thu, 30 Jul 2026 08:45:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMOo-00000009uRb-3OJG;
	Thu, 30 Jul 2026 08:45:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1725D600C8;
	Thu, 30 Jul 2026 08:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBA81F000E9;
	Thu, 30 Jul 2026 08:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785401153;
	bh=KoZWekAB+mXCjKKPwdC/+UrxluXzPXzJ6a2Xt45RWOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gS4sB9ucDGszwk08PWGv43tuHHcuSoAXn7ePKg9ZpylPcS7XDn03z2KfvkRnVssRq
	 n0HW1Rd1guGWXdQRdAo7thocRrIQOQiDvBkViYFQoRw5hBChs+S6MF7GD1bmy8zCqQ
	 s9c1P4XLg32JdPUD7ah+thRDxIAWH9pi+xMQy9s6zRo6zKPffG+I1NcfltHPpYtRIy
	 M69KiIaMQzc5mmPZo4nIvkfynUpzx5RQmmvxOdZ7divXcsmvP6wGZJWuiEVvFnE+tQ
	 cYgr1GoKU9EwFIJra71Pd76jjSgurJeRNO3nbCsyPMFA8VtZsvHUJBT5q0sxIecQmN
	 dojKfdFLiNQXg==
Date: Thu, 30 Jul 2026 10:45:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: mediatek,gce-mailbox: add
 mt6572
Message-ID: <20260730-educational-accelerated-armadillo-a8a5d1@quoll>
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
 <20260728-6572-gce-v1-1-750bba32689e@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-6572-gce-v1-1-750bba32689e@protonmail.com>
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

On Tue, Jul 28, 2026 at 12:42:46PM +0300, Roman Vivchar wrote:
> Add a compatible string and a header for the GCE constants.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  .../bindings/mailbox/mediatek,gce-mailbox.yaml     |  1 +
>  include/dt-bindings/gce/mediatek,mt6572-gce.h      | 52 ++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> index 587126d03fc6..d6e93010bb94 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - mediatek,mt6572-gce
>            - mediatek,mt6779-gce
>            - mediatek,mt8173-gce
>            - mediatek,mt8183-gce
> diff --git a/include/dt-bindings/gce/mediatek,mt6572-gce.h b/include/dt-bindings/gce/mediatek,mt6572-gce.h
> new file mode 100644
> index 000000000000..e6d949d76f88
> --- /dev/null
> +++ b/include/dt-bindings/gce/mediatek,mt6572-gce.h

Wrong placement/directory. There is no hardware category as "gce".
Please find suitable subsystem. Probably you wanted mailbox.

Best regards,
Krzysztof



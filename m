Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711E5C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFX44yPNnHoY8IRIVNI3J4R5DCBXgA5sjpYq4Aa429E=; b=w6BAQwNcvTgMm7h4ilAPJgwsmV
	Wh3WQvwjHYmimXG4eIqQpWocqOIs2cscf/aBvKPb/cl+LyhlPz5c9lsQmS6IPGM/+0KpSZaX7z82E
	KzYULfxqhojHQN5/ztx0iN+uIdZI5bbVyTtqaFItT9ZTqn9dEeTTu3NwC7EoGId5CXIrLteJOswZO
	ZDNNip7q3wZtpwULljktJtYaLtNThfMvG7S3qPLzcwWCMn5j21UwdrMbriXbqL/aWeHdFrH2DqrNk
	/BvVTIjj6L7S6CPQ+0GsdY7e4ncZ4Ql5U8d0f/wb4ZyCZb4llx/pJhxjv0K5E/MjEIVOzFHC2OLZD
	zKev4mkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBt-0000000FuTl-33Ch;
	Wed, 14 May 2025 17:46:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEnX-0000000FibI-14Zo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:17:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C2AC5C573A;
	Wed, 14 May 2025 16:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A84C4CEE3;
	Wed, 14 May 2025 16:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747239454;
	bh=ynRgYDoQpROaSqMAtdzPR1ZOmRAM2GDU/bHhpMLKkJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ssoiA7zZ32W+g4oZ8nSfZ0GStHHA0K6AkMc2UkiJAkJ/prvS6zi7RoRNb5i8SeaJW
	 MK42Q20UfDZpt0dGcOUpQLr+8Vlh1GfdlXrBmKGin/VnvGpwv0k/ElKHmZAYh9xGOS
	 lylN7EANwTRxqvSR1BLQpcbbQgzH2RDqqr76s6n3+8zRdkJFa4OVi/7rbKdQNqnN/U
	 hKdIDBZMZGMpfFCJRL+XM4fbT+AyoByXjKM0unGuyMhJu2zUC0ZWOOeAW8BPYQuQts
	 gUAU5RLesGgveUQidXd62yHU7LE2KRDFuMqAhuCQAbaTIKwhqeLKSjO7WQo3tEm3YX
	 amgH6H8YW4wZg==
Date: Wed, 14 May 2025 11:17:32 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/11] dt-bindings: mailbox: tegra-hsp: Properly sort
 compatible string list
Message-ID: <20250514161732.GA2492164-robh@kernel.org>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506133118.1011777-4-thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_091735_337237_B45A8EB1 
X-CRM114-Status: GOOD (  15.65  )
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

On Tue, May 06, 2025 at 03:31:10PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> We want these strings to be sorted in order of release date of the
> chips, so the Tegra264 entry should go after the Tegra234 entry.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> index df6784a7c96a..cbc02b2a156a 100644
> --- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> @@ -66,10 +66,10 @@ properties:
>      oneOf:
>        - const: nvidia,tegra186-hsp
>        - const: nvidia,tegra194-hsp
> -      - const: nvidia,tegra264-hsp
>        - items:
>            - const: nvidia,tegra234-hsp
>            - const: nvidia,tegra194-hsp
> +      - const: nvidia,tegra264-hsp

The preference here is really to put all the single entry cases into 1 
enum. Order by release would be okay, but not something the DT 
maintainers know or can remember which bindings do that. So alphanumeric 
order is preferred.

Acked-by: Rob Herring (Arm) <robh@kernel.org>

Rob


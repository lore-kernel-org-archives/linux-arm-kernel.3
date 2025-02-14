Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2CAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbUzB3lcLZjSiOjNe3OchTS8JiBhzG18z+tPuOLA5dI=; b=Kh8E8ZSb5dHWtHIBuGEuPXy+4j
	UHF6cRUGfbCEYXfKJs68dytj1UkCn5QXs4ZTS1rE2jseQhN955qcspOnUx+sTy1awOXpF9KfhmpoY
	wYcegGXwYmk7sDEUgs2FKyfMmvEXYaGkdcy1QdzUhcn67gTcUgnD9nxfw5k+UHFNZ7WuT8eS7HQG0
	uFMtH0YA2MF014d6h7Wy3cd0B1H+iqp5tGImslSiWh1zcVy0Ak4BMpaaHvS8/yzVDzl9K2tNLpTlN
	XbCx8xel+MR3trbLuXDwxPLCHgebHmwONHGviAWyJHSpDc9LaXFqo3yplOLdMKt/Gu2c2t+pINPB7
	2OT5zgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirM6-0000000EAsk-2fYV;
	Fri, 14 Feb 2025 08:47:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirKf-0000000EAcL-150G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F9595C5946;
	Fri, 14 Feb 2025 08:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE00C4CED1;
	Fri, 14 Feb 2025 08:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739522756;
	bh=fjB8HqmqVH8rp5Jz5lXC7wUNsIKwFQMVWWlI1UO4+4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ertDIWL3KPj20gHOsk85e8SE4PyO6D68ljhLxDCK2scAfJ437BBe5bLIOTjmfh0/8
	 GbB5P3cMu3Fnj3USxCWsvTLsgem8rNzpUYGaxuXf2+dONmQlvbiBggwBfKXQe5rXke
	 M4ckpk+oBXkmqKB2mYf52rzrgKExzDq8t5IVt/nucSCSFZhDwgmn6PVkWVchbzG75e
	 eYBjPUv1FOQ98ah5s6cYIFeY58Ybnw7ftBbroHclC2kN6RKPrnA0TD0RGneA6QCvDX
	 a0StWKYfCtUyfp+UpTiaG6YJHSuE58TB/+6aUgYzPl0vxVvCrqEesddeD0iAPEv4JR
	 fxWtBD4/aujEA==
Date: Fri, 14 Feb 2025 09:45:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wilson Ding <dingwei@marvell.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, salee@marvell.com, gakula@marvell.com
Subject: Re: [PATCH 3/4] [PATCH 3/4] dt-bindings: cp110: Document the reset
 controller
Message-ID: <20250214-pony-from-small-town-b48816@krzk-bin>
References: <20250214065833.530276-1-dingwei@marvell.com>
 <20250214065833.530276-5-dingwei@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214065833.530276-5-dingwei@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_004557_348886_53F3A7E6 
X-CRM114-Status: GOOD (  12.17  )
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

On Thu, Feb 13, 2025 at 10:58:32PM -0800, Wilson Ding wrote:
> Add new compatible to be used for CP110's reset controller, and document
> the supported reset lines.
> 
> Signed-off-by: Wilson Ding <dingwei@marvell.com>
> ---

Subject: only one prefix

>  .../arm/marvell/cp110-system-controller.txt   | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
> index 9d5d70c98058..a5cc1360969c 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
> +++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
> @@ -190,6 +190,38 @@ CP110_LABEL(syscon0): system-controller@440000 {
>  
>  };
>  
> +Reset:
> +------
> +
> +The Device Tree node representing this System Controller 0 provides a
> +number of reset lines:
> +

No new bindings in TXT. Only DT schema.

Best regards,
Krzysztof



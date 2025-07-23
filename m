Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBAFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiSeklGXTHNclYYVVOQI8EShKXdV+LksKQOEcVg5v+M=; b=vtcIbJp+ey/1FlT7BssgFv5jtw
	ZVBv5ioDx0EijLgdHZdH1xcP2vJY/EfcDpf5ej95QZcH2VHArJk7N935WIoKd3e4ioPdeN+42KfVT
	zJUUIlTfwb68kK+BceFavaJGUEM7CiXyoET6WYokEE3QZ2dgMoM7iq8E0NAJ9U78n2NdCakRZTE6x
	XAhLmP3B3UmSJJLQ9OI2ryR3dux2tfIjMSckgrmkNKgRVA2/wPsMfwA0ynM9GC4A2CdlawFUmfVjG
	3NpyZy8Y33nXyq00fIq9uP6LN4h/AvEKvMs5b4J87a2Bt5mnqSsPqcg0e2fwaoBTOpWJ7OCcg7f0W
	mt9yW4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueV2n-00000004Okk-3I1G;
	Wed, 23 Jul 2025 08:41:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUdA-00000004LgW-0Hqj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:15:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A74945694;
	Wed, 23 Jul 2025 08:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6CEC4CEE7;
	Wed, 23 Jul 2025 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753258515;
	bh=eiSeklGXTHNclYYVVOQI8EShKXdV+LksKQOEcVg5v+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6Zn7yIZs/V8rT/TV1qly7sPAgTI4oeD4vCse/IUYII6mdfRnTdnMiK2ac8SCngrp
	 E6P1kvB8KBToFobjj5a3IJt4d9GIqrIyoA4EsS/9SsgwH82oOCdmQ/E8H4CQn0BCb1
	 NjnYdu0BZGL++jD9ciwQcewr/7CTRVCThweq1Okg+RFs2v/Nvur2bA+xWvmmpFrz8o
	 t1Ob9T8u8jVJefuajdX2QGQVnlw5Tln0hhZnrIsUAyEdz9WRvXFnsa5PMvURgeJgNZ
	 9lZGnDxS9TPYwKS9fMntWNTlZ54gT0wD0Rx57GLHp6M09gn0XhQ2HOpFQjD3CxYMT/
	 vo/LxXcu56/6w==
Date: Wed, 23 Jul 2025 10:15:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: samsung: usi: allow 64-bit
 address space
Message-ID: <20250723-hypnotic-malkoha-of-trust-9efdb6@kuoka>
References: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_011516_127731_404587B7 
X-CRM114-Status: UNSURE (   9.75  )
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

On Tue, Jul 22, 2025 at 03:10:36PM +0300, Ivaylo Ivanov wrote:
> Some device trees, like the exynos2200 one, configure the root node
> with #address-cells and #size-cells set to 2. However, the usi binding
> expects 32 bit address space only. Allow these determining properties to

So if USI expects 32 bit, then why do we allow 64?

Switching this to 2 means you use 64-bit addressing for children and
allowing DMA for >32 bit. This should be the true reason - what is the
address space and DMA range for children?

Best regards,
Krzysztof



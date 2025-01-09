Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D97E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jTgknoLVTgF8ETtuMLjrAXnLpxoKNWhrRT9KWrSqdk=; b=vYNCxN7U+HEjp0YjMYk1pXvVrZ
	DsH0GyhhpMoJlafoTdbiQQHsie8ffBEJPfHhTcgjC9H9P/p5HyLtBl+Gxl8eyFYUlcUReEwt6faMb
	rdWs816KztFQX6VRlyX0MZXSb53oLyo3VHMfZcCgTU6QKaPgIuKzNXD0KorZYstMDJcd8TamRIC8I
	NU4gcFxc5KQ9b0oguA0+BuAgkCFdojaW1g+Ji95tweiQBdv3kGhfK7hsnbosQ/V9Z+uCoLs4qRCJk
	mNFx8FP9fapKPmuvzLC1NF4BUc+CMR86YgCI7XAHdNQIP+THChBYRPgSewjkKzIX2Mx/raJX1NVNq
	GYeNTaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVokf-0000000BLAp-2GzI;
	Thu, 09 Jan 2025 09:22:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoew-0000000BJey-15vm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EBE17A4056D;
	Thu,  9 Jan 2025 09:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89030C4CEE1;
	Thu,  9 Jan 2025 09:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736414217;
	bh=qEZaozu+bXu2t7oNZxrWED/rFRW9H4LMBLptuZ38CgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lk+VgA5vyJ/3vcjDmyHDOznoG2NP1c8SoUJLaYLhir/BPWmfeBJ1qVJVWIMgp6wx8
	 JHBmKsKNo6ObIn7sXAgASr1Z17sCuqMyF8MV3gZaJgltvHjpvvnpW8seOMRUfjyzVt
	 Paaiib9sY8F49MVnX6/wjW2r0tyTLWTbOMQ4SmufvilFgAtzs0NOkrcIdhWQBlM5Gc
	 RLSwRXXpEM6c2CzfsvvXUOJyLAtvu1RXSwZKqgDx/g+sNI2Cytw5q/eil1e/p71KjQ
	 q/URwWPUmQpCuYITAgrCy25huCwMIS3iV/wP1y/MjdIDjCJ5h62HeD+9JtisIBGfk8
	 UeQgYECmXUuYg==
Date: Thu, 9 Jan 2025 10:16:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
Message-ID: <wbi7xppldoroq2okv4s43njug7x2yzgvnkhtjrtsij77fn6vsv@zzzzq6qzfeyh>
References: <20250108-am62lx-v2-0-581285a37d8f@ti.com>
 <20250108-am62lx-v2-3-581285a37d8f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108-am62lx-v2-3-581285a37d8f@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_011658_359955_66521590 
X-CRM114-Status: UNSURE (   7.07  )
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

On Wed, Jan 08, 2025 at 04:51:55PM -0600, Bryan Brattlof wrote:
> +	chosen {
> +		stdout-path = &main_uart0;
> +	};
> +
> +	memory@80000000 {
> +		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
> +		device_type = "memory";
> +		bootph-all;
> +	};
> +};
> +
> +&pmx0 {
> +	main_uart0_pins_default: main_uart0-default-pins {

Avoid underscore in node names.

Best regards,
Krzysztof



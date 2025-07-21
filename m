Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4859C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 09:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPz06fvHGJS3IqG6pR8pv22PSERO2G5DHxglf8CS8S8=; b=OwASFt0Jp+AwGYhqmYZHliHVNW
	FtQZ4YaZWFX1lXaKALRz7i9I/SIQxnVhN1s1KbU3LPZZj5ftZnyHqgC0cMU9e48JRRyKa2/UT2QUd
	0WJMxdd6Q3LZ6YTM3oEop6iRfqBHrERd9cRdHuVCJuHqSBnAgvfCmQQg5utvcPde8uL8Iw90X2L+/
	Jh2WZWwLyqLf8WN5Cs/BtW5Xh8UYYi1EMOJ2pJaeVLu5a2pAf2TPIcSr8tZJVHwmgNcIN9B4Ubkzf
	k/j4Wz1MDSyLO0N+uj1uDTWVxGG5ZtuzstpqqjVcfpeAdddYpVnEZODPSxxQ4hgCqwA2388kWdeHV
	f/irCwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmxr-0000000Gpka-1Nl1;
	Mon, 21 Jul 2025 09:37:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmSN-0000000GkAb-32ZN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 09:05:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EB0E45989;
	Mon, 21 Jul 2025 09:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB0FC4CEED;
	Mon, 21 Jul 2025 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753088710;
	bh=mPz06fvHGJS3IqG6pR8pv22PSERO2G5DHxglf8CS8S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcLdB/5OATdpifzdPVHBnD7jY4ntBYQ+RoyAN3kug0ppoeuK5wqX7nW6oK3Bntx70
	 TeZan1U82ZkJOi7jjGEO8fmavhEDrS0r6H5n/VrgNXrhFyorNxACbd9Le+9k3h/gMO
	 gdH/v+ENMDfI1202+ct9ZKBzuZBK5r5fWhzzibbPykeyYv5LeB2/lXXzioaHJZZcpQ
	 fo5/x5z3lE0MsulrODgHIU+FtSdW42z6RDHqmFlVxUOrmFnJ10lOyAD41p7CPDSOeG
	 bZyl1g3zv3de+tGcAQ5XBIa+9iYJImpTSgl7nBr0tqZvj5cxUOMaSET4u94Ha/EMLr
	 3Mu77StA38p+A==
Date: Mon, 21 Jul 2025 11:05:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 06/12] dt-bindings: sram: sunxi-sram: Add H616 SRAM C
 compatible
Message-ID: <20250721-spry-nifty-bandicoot-c7c4ad@kuoka>
References: <20250720085047.5340-1-ryan@testtoast.com>
 <20250720085047.5340-7-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720085047.5340-7-ryan@testtoast.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_020511_785283_183FE330 
X-CRM114-Status: UNSURE (   7.62  )
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

On Sun, Jul 20, 2025 at 08:48:44PM +1200, Ryan Walklin wrote:
> Add a compatible string for the H616 SRAM C region which is
> functionally similar to the A64 SRAM C region.

h616 for the parent device is already documented in the top, right? This
should be one patch.

Post complete bindings for the device, not chunk by chunk.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



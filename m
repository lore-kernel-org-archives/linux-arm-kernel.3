Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB4606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KhLmUy5p;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TPgKY+el
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KPo3Z5PTuahAgke8pWSVmA39AlUrhp+IqUhv7BZ+HAM=; b=KhLmUy5p4YjJPiffCbSss3we5P
	juiUxeNMXbrxixQy++JQoYxWEoVcbpceMLmjSlYhxh9HYoIpmbPp06LBRDMtvxc6ArbTxE6xjwN3T
	6Ew4zVA7s5MNNwPkhBbY2KWKyBCmJjcPgQ+rWGWOYV8vdwQlmwEYAUYxSXa/JRMdN79BsKcYYv4kp
	mBv1CC30LxduMxzl+DvjvKADKr9w1IjFV6O3RzUtG+xVFVc/B7uoVIWr2Asoo0EEqhAKtE3OgfZqg
	OKyEk6kuk8t4eOAbLWlKjcGGH7TGFtMzrxXy+9TChWsPIivfP0noE/PamW3SYAoBNkj+0lHW4vZTH
	9IWNipvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHGJ-000000026kn-0Zi0;
	Mon, 26 Oct 2026 09:45:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHGI-000000026ke-3ZBU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:45:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E03E60A87;
	Mon, 26 Oct 2026 09:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CB71F01829;
	Mon, 26 Oct 2026 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793007902;
	bh=KPo3Z5PTuahAgke8pWSVmA39AlUrhp+IqUhv7BZ+HAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TPgKY+elXAOknTgUvsWm6jQ99BFW07fiIm73EEE5yP7xvDahabri644vWSrLQiJxU
	 ykcc9p4H/hExcEo4/Z7VP8uJn8eGc7KsNboxBqX46xfhJeh42O0bJR1fHb02YC/ea4
	 EQTegq5bTATQv/sMGfTUY2WgRlhcgGPCOyWekKFhHOyVk5SQkdmOfIkIQh+UOYbOOT
	 kA+d1790nQIA5frnHoKLnxXZZFjcTu2p0rwcjj+NIhLQwgygLDew3QjBzoY6QVHDvU
	 UlKvdO4uadUs6414ZzrTWAehOfhFxart8mPFKf6UDmcP+HIAkv5AY/uoW7uuZOZxT3
	 6UnDFId/1Iajg==
Date: Mon, 26 Oct 2026 10:44:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com, 
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com, 
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
Message-ID: <20261026-attractive-puma-of-merriment-0dfbe4@quoll>
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
 <CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
 <20261023131501.3157463-2-selvarasu.g@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023131501.3157463-2-selvarasu.g@samsung.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 06:45:00PM +0530, Selvarasu Ganesan wrote:
> Add the Samsung Exynos8855 DWC3 binding using a flattened node
> representation, where the DWC3 controller is directly addressable
> rather than nested as a child node of a glue layer.
> 
> This is the first Samsung Exynos binding using the flattened
> representation.

Ah and:
A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Best regards,
Krzysztof



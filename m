Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6DACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDK39R7w/hqWxIteK4YKpZ1aUimGofjXGo43TqRTNUU=; b=JtN7ES/Mc2AwcB1m+tH1AkNk18
	c7hIub4Hjry3gpoeIOjFl07nEjTU836Yya+Aqlr2XtfWbI7ZOGdfH1KsOfmnxLq5DC5x+LRA3Ou3z
	Zxjz1R4tPLoyeeQgErlLapWVADGTF7T5o9kG2vWkm9Z4b2atV5k/zZhreMQxyoCkPWKLTBsjioXvl
	Q2RyWIOsGMsOqy6xnuog38dH+AWUzbeKtCTJVTCWSqQWcRQd8IGBBplU7x0gpdz6hXU8lWwPaFPUA
	hWGm59W5uCtulg7ib49/BwzwTMZ/a6xu8QcUobzd9gTmKAUXfJACMxAtpKZUQ/+tzcZ7FT4/CgctA
	VNbSGjpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHb1-00000004k95-0T6f;
	Sat, 16 Aug 2025 14:09:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHYQ-00000004jwi-1Kcp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 14:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7DCB4544C;
	Sat, 16 Aug 2025 14:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF77C4CEEF;
	Sat, 16 Aug 2025 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755353201;
	bh=n9KMFbKsDEZtJ9f9UHIfJm2mwyenMhPqIdyR4kfmItA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HlIIwG+uWOt/2nZYkISORRYS9zq7FDaj9GoQJJgbP7dqAppsOmMjwm4Ps94tVf+w0
	 Kc50fxJzXlRUnk5RPI7BC+3Z0POcvmNA2bV/paTYn1KIYh36Z2Dg5Ixx3r/OD4/7Po
	 xKX/Wdy0RuWa+hKaODaGCPsb+eggnR1GGEBLmVk1xU7Lpe51EhqEtk/8i3TGqVfMSJ
	 U1IiUg9aClnjG4REaSmbVWxp0WUVddG4tSMBdOW4y//NH7uhXUBgOBeecZ5k66opfD
	 unGAukxqx8Qoji4R5m6ihb6LvW98Eh1ajHnjxNQ7rn1NPkIBQ/mk76zVILoNzWwGQw
	 bJYGHxHjafYGQ==
Message-ID: <b7491aed-8942-4dd0-b2c8-349a9db1ca39@kernel.org>
Date: Sat, 16 Aug 2025 16:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Apple device tree sync from downstream kernel
To: j@jannau.net, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
 Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_070642_384082_88085509 
X-CRM114-Status: GOOD (  12.54  )
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

On 13.08.25 11:53, Janne Grunau via B4 Relay wrote:
> This series pulls changes from the downstream device trees which are
> supported in upstream kernel.
> Most importantly it fixes the PCIe description for a specific iMac model
> (iMac M1, 2 USB-C ports, 2021). This is worked around in the downstream
> kernel by not disabling the port. In preparation for submitting M2
> Pro/Max/Ultra devices trees I investigated the issue on the similarly
> affected M2 Pro Mac mini and fixed it this way.
> It completes the Wlan/BT device nodes for t600x based devices and adds
> the missing 15-inch Macbook Air (M2, 2023).
> 
> Checkpatch emits following warnings:
> 
> WARNING: DT compatible string vendor "pci14e4" appears un-documented --
> check ./Documentation/devicetree/bindings/vendor-prefixes.yaml
> 
> Which I chose to ignore. `vendor-prefixes.yaml` prefixes contains no
> other mapping for PCI vendor code and the list of ignored prefixes
> forbids extending it. Both options feel wrong though. "pci${vendor}" is
> clearly a vendor prefix but duplicating the PCI vendor data base feels
> wrong. `vendor-prefixes.yaml` currently does not contain and PCI vendor
> aliases.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

For the entire series:

Reviewed-by: Sven Peter <sven@kernel.org>



Thanks,


Sven



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094DF606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KAKrLno0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NAk6wFia
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EzjmXrkDzsq1ea6V54eY/ckSO21R5zXaobZj8IyNVuU=; b=KAKrLno0pxEd/AM4qc45yKKDjW
	LNFMPq4mFkeOE/EI0G8nYdrbw8dKvwWh6tKwoiOrqSNjOnZC2ARW1V7vDEA9Vq21VDSnwlbvbZAVA
	DYB7jL2THG0CbKYgkQL9h8mNTMTgXGoDXZz2ay+tXHjRLtxHdkj6li4PPM9agNEBvZbaLvKtkyyLJ
	jvLrIowhJgnumfYW7yPZvgCWtHXfYX5TvQQ5oTFO//eC/jSAetStlEUrSP4fgA+i+v7MMO0Pm2NYd
	DXB4LmYZhivPDYarssbM5ywPcRPiBxc8RUZqjLegdaUFJP1anWPLU+ed+Pt+aR9D10OGVIEq3Sugu
	0Lgp9xtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoWs-0000000G2ug-3S1n;
	Mon, 02 Nov 2026 09:40:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoWr-0000000G2uN-1xPZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:40:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A7F7043D4C;
	Mon,  2 Nov 2026 09:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F591F000C1;
	Mon,  2 Nov 2026 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612436;
	bh=EzjmXrkDzsq1ea6V54eY/ckSO21R5zXaobZj8IyNVuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NAk6wFiaQgBVuToA+AZR5hxbuFmP7Yqd4fmisg6yPTwpVv4E0gYqzHB40XSwU2+Vw
	 PBbZGi19uXHQ28XWxNU32kYBdcQYi54zKDvc2d8pAyOed6tZnbVNb7MGry8RGSrmyX
	 MPJ3lW6tH62zVSFv86ZGKiHRrWrkcCEz24YKIANpJRHOHAI7juMKcLLW56dFPQ3sgw
	 ktb54aU6BUy6YxDO6F02RcyqTRvgXzzYniYC9Mn7mFWRKvf2GIKGdYUcdEB9b8HOi4
	 XNeYUZlxLxWIzpyLg2ZevqB8pPA6/PXbvv2/2pruHYoZr1vizO9FUUKIp6xhOlSSEV
	 wNEsZF+qtUnAg==
Date: Mon, 2 Nov 2026 10:40:22 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Andre Draszik <andre.draszik@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v27 05/10] dt-bindings: arm: Document reboot mode magic
Message-ID: <fmik4cb4dltd7uivkdiyxrjsvi6xrsy3ivecx4nnwr5cvyadnd@xzofyqlmjwqf>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-5-fa4b3ff1359b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-5-fa4b3ff1359b@oss.qualcomm.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 02:30:59PM +0530, Shivendra Pratap wrote:
> Add bindings to describe vendor-specific reboot modes. Values here
> correspond to valid parameters to vendor-specific reset types in PSCI
> SYSTEM_RESET2 call.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


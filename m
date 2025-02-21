Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F1DC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 23:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsJVFydmTrOQeBQIFdL3QM8oGEXNVduTtMe2WG9REEs=; b=EynR3ygLQn0G59RG+7syvvZg8+
	07+9NDaBApiC0eT7j9dRYoi2y2kZ69QRq1FztDVxdlwqARi9pbVYlKUGjPaoOnE+7svu3SsM2FJio
	7oXyV/KxxuuTv2iMddCEX6gJN1KuGFHes9m+45xY3rjTbo83bAKKHw1Wj/lyxZFMtPzFCU9xt5uK5
	6PtRHOIc29/ARMAKahITBPt+N1AUkfhe5EABTBueVk1OrxXvcLuTTNels9Qcm4FHskwNUMdjyWB0F
	OGEgmoNjDC5hL07oFITewktuC0OOD/jESDTmfT/eOY6Y/Etl6CofcSwBAZjXtjG0LYeRMMPx7UZxP
	PMjOxOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlckX-00000007AIi-3QLJ;
	Fri, 21 Feb 2025 23:48:05 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlch5-000000079tq-0tgH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 23:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D32326834E;
	Fri, 21 Feb 2025 23:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C3AC4CED6;
	Fri, 21 Feb 2025 23:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740181470;
	bh=vFGP5lZIH+gffNa0hxiFJK7yHkXmM9iUr069pf8053Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ry6RJQ9I9XF3cINl85IOOQ/E2IAp83B8PsWIpVMktzB8xj49BdNgg9pGBkhuwnjwN
	 2vLwB1V1VhXIidjViE+nhTgubpBEMrqSHWUfK4RfB1355nPwg+g8hwfWtWUQoDdbLq
	 WjscZQvKDjJ49EUCHlH5PNJU9ZB8ZwE4b7VZ/tgInykkClsgr0gFweLIDarFgbvWP1
	 icUxa1ucRgYFWmygPL7U3h6fLsFQZ5HIH4Yqq/CE0JkhkEqTClwQFgPYtOAG0TjbuU
	 UbJ/HLCYirezkATZHGAAnnSHSNyKBb4i+41LCAVts1mCud9PSu6kSUbowhjmbFfh8L
	 p8Z5FOjnJOtrg==
Date: Fri, 21 Feb 2025 17:44:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add YuzukiHD Chameleon
 board name
Message-ID: <174018146811.396109.10176717812055404887.robh@kernel.org>
References: <20250221012038.13706-1-andre.przywara@arm.com>
 <20250221012038.13706-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221012038.13706-3-andre.przywara@arm.com>
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


On Fri, 21 Feb 2025 01:20:37 +0000, Andre Przywara wrote:
> The Chameleon is an Open Source hardware board designed by YuzkuiHD,
> using the Allwinner H618 SoC: https://github.com/YuzukiHD/YuzukiChameleon
> 
> Add its compatible name to the list of valid board name.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



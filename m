Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A817FCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 13:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZ3xRislVY2dmQNYXzUS70VxL4TYlWhOWdPBWcP5d9w=; b=HkgqZgPAA3icHgf4nC0Um/PtlU
	vylQZNpKJ7XB70bG+Iotg3RiM0Fb4dcb9ltVQxwLByBwiDfENgOFfj/WlKPjJaVPNVdRf8mIEUohH
	2hky2XY70BQs9NgtssyZRJyimoZNqfSMWzxLGxqEMTZE92sg7kUZs21BXv0rMtxFX+U5TX7sboLLr
	qCKHw+ILfi2EqLhlIBSM33qHIKA9LYcmKD0bBpixEX6X/9Ix7wYvupiP5qydVesLLDwVSm70fZwXl
	lztDbAtnkmZljxFLF5xrDS/FTlOGSAfPCkXh2k/YzsUp6Wm/omZwofuu2w692XQF3lMhBbkS6skQ5
	9OzsIwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCNm-0000000H8yX-0bEh;
	Tue, 21 Oct 2025 13:26:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCNj-0000000H8xX-3rsk;
	Tue, 21 Oct 2025 13:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E44644651;
	Tue, 21 Oct 2025 13:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8A4C4CEFD;
	Tue, 21 Oct 2025 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761053190;
	bh=mMSvgzeevb/tNsBtbMj0XDd/jCMbDeUuPxUm0ECM0uU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kp7mGeKybFExcxsSXsFQhYctj5YpaiLa67zVBsCwpKg0da2fFSm05GE2vkEoORwVP
	 NtBbJxuJ+AK74dRywC/fCs5Grpi/maWkMcuaJkejRNbOz4Y4t9gul8L/GDHCIhLhZs
	 3KWmdftqeO7Lf6k736beFglJ1WWqPe9+m3YR8Y6YSxadMl8t76bfKmJQTrRNuyvk2N
	 fY8ZDq2TV/PuTF0XN8RBJ9IFh9jaaV63xOPoRpR605saPLWCRMGhQ5YmuE4WY9HAvw
	 jXzH97sgoJtWZjwoPWXYYZo5YtoC7mr205oe1ntrW1J2D8v45bWeOvj7ybVFB0uWn/
	 2hIpkHZlIqJ9g==
Date: Tue, 21 Oct 2025 08:26:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	linux-actions@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: Convert Actions Owl SPS to DT schema
Message-ID: <176105318705.11992.2891926937989289463.robh@kernel.org>
References: <20251013215834.783501-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013215834.783501-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_062631_977494_593C5C88 
X-CRM114-Status: UNSURE (   8.71  )
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


On Mon, 13 Oct 2025 16:58:26 -0500, Rob Herring (Arm) wrote:
> Convert the Actions S500/S700/S900 Smart Power System binding to DT
> schema format. It's a straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/power/actions,owl-sps.txt        | 21 ----------
>  .../bindings/power/actions,s500-sps.yaml      | 39 +++++++++++++++++++
>  2 files changed, 39 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/actions,owl-sps.txt
>  create mode 100644 Documentation/devicetree/bindings/power/actions,s500-sps.yaml
> 

Applied, thanks!



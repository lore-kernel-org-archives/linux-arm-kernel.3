Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBFFCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJY/+izTasdMIlA3/V7pQet9f+W6QDbDZtxHiUOVDk0=; b=aKPBK52lfxzYzCSnYP447uA15K
	3Ys47+WqVpo5AgpeeWetYmKdLYC4lHN306sUYb9uCr9bNRLVloo/+mOQP899Yli1lbhaDZokhZ5up
	kq7iQOv6WLk3nT62xx9hKKLjbPznNmkKqHY7vlEyGfAqk7gHbWKb0I/aM6+suJQmYx96XNQiIadrA
	KpIO6dRlKlBihFNkxImLLAt7pMdspaJ5cS3KuZa07S767uEep8s5JvkqgQYXePwiAF96kogY6z2PW
	ryxXpxBatqA4hv24UVPgQ1xURzZI3v+yeE2lSNJNkfSHiL7nLy4XtPJSgo/RQ94M9YvZ30iiOwW2+
	yBRBkIWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUkx-00000005Ozy-3USu;
	Thu, 14 May 2026 12:01:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUkv-00000005OzG-0OrC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80FA34079A;
	Thu, 14 May 2026 12:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB5AC2BCB8;
	Thu, 14 May 2026 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760092;
	bh=cDzJLSWXKBK3yhL4X7j9TNlyzu5oMWNYXLARIumVm8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNH/P0/19SdLtkSwljWdUbMme9P0vOAw3gNrcNjaElXtMfzOz1pQI694D/GiWheci
	 Xm1pjHJmcpzLkNEUXDU7DeZK3/Pf9Y62hQwMOkwXzLZNxK15wjN847tQdEkTLtN4wu
	 q9j9nWYvq3pXNCXvtHGGFj0YQn9tFlKadIiLSk4Le7om1qBqR6mQ6dQSHIFgnPA91x
	 d8TypGmXEM86cKBSLyxsCj8Q7gej+U4Ga0aRayWEh99W1HsMlYKkUDHVW1Y1+k7MZe
	 MKcp6nwllEzefUtDk9BhTUcfrZ0KZjHBVRCHRYYHG1DkC4NzmWsD5Tf+XSkeWBVGG8
	 5WfDe7s3Ez36w==
Date: Thu, 14 May 2026 14:01:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: display: allwinner: Add DE33 planes
Message-ID: <20260514-impetuous-solemn-sambar-acca3c@quoll>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <20260509190015.79086-6-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260509190015.79086-6-jernej.skrabec@siol.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_050133_150206_F6B9DC48 
X-CRM114-Status: GOOD (  10.31  )
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

On Sat, May 09, 2026 at 09:00:12PM +0200, Jernej Skrabec wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Allwinner Display Engine 3.3 contains planes, which are shared resources
> between all mixers present in SoC. They can be assigned to specific
> mixer by using registers which reside in display clocks MMIO.
> 
> Add a binding for them.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
> Changes from v1:
> - dropped | for description
> - better description for allwinner,plane-mapping

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



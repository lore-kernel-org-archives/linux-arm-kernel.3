Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9623FC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0EcH5qfXefFGv2X/15hCzt/l1drzUySiO9qMgmBJ+E=; b=0O3Nv5Z8duxAOK1ylB4/1yz5Je
	aBLABz+JEJUxhAvxVGraY5lsUbZ5osyuxopaV1q1yFRm35xCGf7wDfnjejSPBmFnxqrBPHb4xH4v3
	Iv3RN72cswCYLEzTj9IxgSXII1/2Ux5ij/LXGiZaleuSzn4vopqZj8qaXsJ7S/a978RExr97P0UY7
	bqZ93zmubomECfb0TEdwgnD86DdvrtISzIxYCJofTBgxbJoevLwGLfKSo5SANHf7daNAE1h1XsNgU
	LsZqq5seIUIcMBG2p1OD9tJ6anOBiDUcz1Rv29NZO9ZrXITj0pVD8fu52XwMtlasOrD3CExRp5HkX
	BkR6J3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBS5-00000002hAJ-08Od;
	Sat, 18 Jan 2025 16:13:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBQo-00000002h1b-0bIR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 16:12:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72658A41653;
	Sat, 18 Jan 2025 16:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F195C4CED1;
	Sat, 18 Jan 2025 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737216737;
	bh=wz6R80GCtHE8Pub+JlZqdRoqRWL7RgSMjrqENer31tI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cywys806iFznKs1sz/lxDrbd2Vh8/1EkGHH9NWDEC4vVJv2QxztmgBwrSX14wB4+L
	 HzmiX0+pTh2OteReMNdIhfMx5lkoBxxzPhtqDHRd9VtSm3ZDvOjkQbaG4WfaigBd/T
	 TUqhXbHH2s3wIoorT4NsyW7dtjtJTiDvSdYZEj8/hCqIOw/yfROcmBdZXi3PDTg1Sp
	 OcQcQiMgL6yPXY98a7FNm9RCEQaznSoL3l/imyef4vGggy6SL5FcAx6iyTr91ud2iN
	 5to1fwqAVCZSiOHK7WrGjcXHUayGMWZKEK7M7GTyB9csuWeNZtiYRzZJ7vMCZOJ4cM
	 FL1j8mIbugZag==
Date: Sat, 18 Jan 2025 17:12:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:BROADCOM STB AVS TMON DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: Update for BCM74110
Message-ID: <20250118-mauve-panther-of-upgrade-1ee500@krzk-bin>
References: <20250116193842.758788-1-florian.fainelli@broadcom.com>
 <20250116193842.758788-2-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250116193842.758788-2-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_081218_245071_9732C32F 
X-CRM114-Status: UNSURE (   9.88  )
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

On Thu, Jan 16, 2025 at 11:38:41AM -0800, Florian Fainelli wrote:
> Update the binding with the BCM74110 compatible string which denotes the
> first device we need to support in a different process node requiring an
> updated thermal equation.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



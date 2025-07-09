Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23483C83F15
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4lxjV+PCEdmohe5HDd9zEkzu1V5jMe/tNs89Ry8dr8=; b=CvJ7ESINnwAsymBieAgdx5CAnr
	YS0TlE7om7eH4NociymrlAXoYZJAdWFqLtYgvUwzneFuJLLykVwoC21OTrP4T4S1/XJhmMxrc+EvE
	W+Pr4wX5Mp5EE/eXjc/RFKAebslzF0iBeX5De0J9qvbtnxNADUyYWFAu3tnE1aY3TRMkntT+4eUSZ
	zyaqPflJeQzFHZ6ZdR+cOzr87x6f2SI4AOhEDkk1wM3BbqM8wyPFH3K7jnHCt8syDgs6zpoOIKPrG
	M2ES4pdMkc3NVXQxVQRrEq36waKU7muD90ykJ9+UnP82Uv+uNh4K1UrBUDrxfGDs6d9WGEzprbyqt
	NdbFh7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFT-00000009flH-0NiO;
	Wed, 09 Jul 2025 19:14:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXBK-00000009EjT-0DS2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:58:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3A04461B8;
	Wed,  9 Jul 2025 15:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70383C4CEEF;
	Wed,  9 Jul 2025 15:58:01 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 6E1585FBBD;
	Wed,  9 Jul 2025 23:57:59 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: lukas.schmid@netcube.li
In-Reply-To: <20250706095804.50475-2-krzysztof.kozlowski@linaro.org>
References: <20250706095804.50475-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: arm: sunxi: Combine board variants into
 enums
Message-Id: <175207667942.3765461.12730253143033770336.b4-ty@csie.org>
Date: Wed, 09 Jul 2025 23:57:59 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_085802_113774_EAEADDAD 
X-CRM114-Status: UNSURE (   8.68  )
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

On Sun, 06 Jul 2025 11:58:05 +0200, Krzysztof Kozlowski wrote:
> The common style in all bindings for enumerating similar variants is to
> use 'enum', not 'oneOf', so all boards of same variant or using same SoM
> should be grouped under enum.  It is more readable, more compact and
> makes easier to find actual devices from the same family/type.  Also
> there is completely no point to repeat the compatible in the description
> (incircuit,icnova-a20-adb4006 implies this is "ICnova A20 ADB4006" and
> pine64,pinephone-1.2 implies "Pine64 PinePhone (1.2)").
> 
> [...]

Applied to sunxi/dt-for-6.17 in local tree, thanks!

[1/1] dt-bindings: arm: sunxi: Combine board variants into enums
      commit: 9615e017464dfbe72e12e36592b7c5b65e9203fd

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D40CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 06:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrd+LkEfv5MAEbwJjh86ojQMQ5+oIm/B8nP9VkcnUTk=; b=Ck0iGgh0wjxTGpajOCLoRu+yJ0
	nG+fMeP8uXpmZVoavZavdBJWrXwCdq3KMwvqF9wUjPZlOUgpqsgFze4SABqcIw5H+YwUpyH6P7fj6
	xBu0xG3huh9P3SVjp4XnD6eOL4d0fHhBQUeciQ6TtBiMru4xu6jvZxkBAf6RZv8TjBeVFh/tV6EVV
	Sm1DyOSWG/mVv7EXwRysU+s9aaQPeZ+t6+u+fpbbj2yjtQ3fnBsC13NvtteLeGcdmzKrKcZnUHCh1
	er0N67h5PiLdTh9y6+8AxArm3U2rlBgorsGWl9dJM7YrbBzoCFL6qDYAJXHz3TjERRa1urx00B5hB
	CZ2ccWYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHSi-00000007Fdy-48ya;
	Wed, 24 Jun 2026 06:51:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHSh-00000007Fdl-47hp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 06:51:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76C0B601F6;
	Wed, 24 Jun 2026 06:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AAA1F000E9;
	Wed, 24 Jun 2026 06:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782283910;
	bh=jrd+LkEfv5MAEbwJjh86ojQMQ5+oIm/B8nP9VkcnUTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d89k0TKgopbxJmvGycsqeVSY+xGJGzRzXaVBcfXFoJy+9paWh0L8ej6bqzVeeOZGo
	 MP7yuIprkO+o39oCTqarri6+Re+E1mR9p/qurHPz5oYCknyQf74R5/Senf3gDf6QhN
	 kZyCSuczjYORClqNgzcMYAIagaSswByNH3mvXclH5rffyDJb6570+hiclLbENVXEuY
	 yosaRTwrRS/4lGLZVlX4V1TAd+r9T7Afbf/8AjxVmodMOCMZaly76opo0DlzkwIFx2
	 eDONYgujK7SDbl/jPw+ywTG4k+EPfNtMzj5tQJIKly17fm3YGcsM1/hQFqhZfSBVvJ
	 g7M1upLooy84g==
Date: Wed, 24 Jun 2026 08:51:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Hans de Goede <hansg@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>, 
	Lukas Schmid <lukas.schmid@netcube.li>, =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
	Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 4/6] dt-bindings: input: sun4i-lradc-keys: Add
 A100/A133 compatible
Message-ID: <20260624-awesome-demonic-guppy-d494a7@quoll>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
 <20260623204824.691832-5-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623204824.691832-5-alexander.sverdlin@gmail.com>
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

On Tue, Jun 23, 2026 at 10:48:16PM +0200, Alexander Sverdlin wrote:
> The Allwinner A100/A133 SoCs have an LRADC which is compatible with the
> versions in existing SoCs. Add a compatible string for A100, with the R329
> fallback.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



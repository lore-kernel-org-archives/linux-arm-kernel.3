Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602FAE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 12:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlJNH9rnghGb4TIOP4FiA69peXsgwAq+/9kL8xxZlVQ=; b=djvRIeZ9h8BkpiolZcwDuCqUeB
	V83cJvRBc8Z/wrpmiRlza+Lx61of+p7owwuj0WrnlA065cMMSeFENdjag82U2mKSZTAHFy3YI0FN5
	m5gLbaxSeaPGAyPPb3knjb+4uaeT3rsr/wN23L2awwTUxejjWhbApqfiIJkTOiV3Iwr47wgMFbH5a
	sK/cXt8MrSpSF5+8ynYRL/b1+x6/nTioLsde0KdWF4iCbVmJTEYIFgvA0AeKWSdQlUQ2VPwfFdBh1
	WMBioXyaP88SEpBb10qF/hAZpqwHfF89a/ImKSMWgqKoMKTZYNKHqMj8FYXGdBSBgkPlEgiaSDNyl
	hFwdb7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLTf-0000000EmVr-1yuO;
	Wed, 11 Dec 2024 12:06:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLSb-0000000EmML-2vMJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 12:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733918697; x=1765454697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Yd5D9BJyOtyfIb8dJrBUAsYwwwWUWP+TpbR9XJzO0A=;
  b=z+m6LVNCl/Ad2Gup/EXr01DmMGjsicJoeEmAEjNvXjag4KZliKl2s84U
   Ek7ju0+XRFxnRMmeQvC8nx2pE8caMWas3N2MvSB91cT7urJ/l2LEyAM46
   ADMM/AHElYSu1Z2G6+Xxfi/4u0+SP/P+9MRiDNcrsByhQ0GHEhkAV49mJ
   j8OstjBi7izithstgdBE7qYWiJGpEqdwJdqJ+Y3orLbg9jmks2j8tJFeB
   38a6JN4Xi4nxiELKetH5qzxNZXkEaPVfFRGOT2gOd5lvLtjKleBobg8ME
   GKnQUwmLYPCfiFAmyfNtSorsdjUzY1tkOi1f1+QK4S9X0bWFHRDGHSy5r
   A==;
X-CSE-ConnectionGUID: Ptjd/tA+SRiWFGe/ObcJTg==
X-CSE-MsgGUID: v4RVO+SvRWyQH0g/1OUQug==
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="39094712"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Dec 2024 05:04:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 11 Dec 2024 05:04:16 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 11 Dec 2024 05:04:13 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <balakrishnan.s@microchip.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: sound: atmel-at91sam9g20ek: convert to json-schema
Date: Wed, 11 Dec 2024 14:03:17 +0200
Message-ID: <20241211120316.22494-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211-sound-atmel-at91sam9g20ek-v2-1-86a0e31e6af9@microchip.com>
References: <20241211-sound-atmel-at91sam9g20ek-v2-1-86a0e31e6af9@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_040457_747286_063053F6 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, robh@kernel.org, linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, linux-sound@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, andrei.simion@microchip.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 11.12.2024 11:46, Balakrishnan Sambath wrote:
> Convert atmel-at91sam9g20ek-wm8731-audio DT binding to yaml
> based json-schema.Change file name to match json-scheme naming.
> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
> Changes in v2:
> - Add missing CODEC pin options to 'atmel,audio-routing' items.
> - Drop 'minItems' from 'atmel,audio-routing' since enum defines valid connections.
> - Add subsystem tag to subject.
> - Add blank line between properties and fix typo.
> - Add audio complex description.
> - Link to v1: https://lore.kernel.org/lkml/20240214-at91sam9g20ek-wm8731-yaml-v1-1-33333e17383b@microchip.com
> ---
>  .../bindings/sound/atmel,at91sam9g20ek-wm8731.yaml | 70 ++++++++++++++++++++++
>  .../sound/atmel-at91sam9g20ek-wm8731-audio.txt     | 26 --------
>  2 files changed, 70 insertions(+), 26 deletions(-)

I recommend you to remove from title the word 'sound'.
You can check the commit history of the Documentation/devicetree/bindings/sound/
before you write the commit title.

Best Regards,
Andrei Simion





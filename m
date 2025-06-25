Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E416BC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAPRjUWU1FZrs72MGdDAltt9QRiTlsewOFZ3ZB0hiSc=; b=p/KzgYE1py1i0MefofcwVFb4j4
	ChENPHnB+yQ5+w6BK6MV1lGZ9QHbozdEls1OUJk62c9F3ssfVzx+ctDJiCCk0Ygyh7K2vshbMjPqE
	ymhteHqUPHLvjrSg0cXJOwl2xskLCpdX3QR7dyEHvzWlcpkp2q7gDKHLaAoWGdYla0JxN4aROSS9+
	Ap/kBblCE/xdikVwZfeUMxr4lnU7/cP81ZIwLP+dlXpbnM8eDazjfaZfVCN6Cx9TSiE0aqIeA9GML
	pqrDCJH2b6E8zG0LbgZWUeg01Ln1jwbVapizzaGpvUBeHvla1GW3pksQMjgAEV5hyiaGAHEmMLa0y
	H74p88hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNlE-00000008NSE-0iOk;
	Wed, 25 Jun 2025 10:53:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULoY-000000081jb-2ByJ;
	Wed, 25 Jun 2025 08:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LAPRjUWU1FZrs72MGdDAltt9QRiTlsewOFZ3ZB0hiSc=; b=gYXCRysvM4LSD8sPfW1ueEGWep
	CBOy7P0LRkSNuYjfodgrku/G/L0XAmfRd1vlSetS2QXdGOPcDKJcmhZ4A/pcRN/YBlbovCz+G5Zq0
	b44e/dtLG662KW/nT1Sr55J+twMwtwLMXrqaVSxHa+1mC6dnLTNhrBzHy/IwInnwmWci07L1reB3g
	r1LPG7FqKhp5Cs/+qhTHX/GoXEnQ2KyLfJjFQhOI+BT8+bZpdn0m+fuUWD0Fcsftr6f7kFZh0GeL9
	saSdgWc19f/g3AJY6M3pKuhBtnphjaWnn/SDwXFDfaDrt1D5iMR8CcGvhK6C+C79Bv2pCcvKLqsHP
	HRsNVmgQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULoV-00000005hZl-3INh;
	Wed, 25 Jun 2025 08:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750841341;
	bh=5thf8Wycz4i1YNTtM2V2Ka5a4Ck3r1j0sf6a6jbKBNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DBFjJ89dTMeINVLWX/krjxG40YJ+LvFI7sTmuGBSZPPRxQTu6WqNqzw+TwCBODDv/
	 HPzeT9NjRWXse9OtyaeNkYC2rZZQOADCENPN1dTSKAMoIW0oo0hccGxyW5gW4f6AoF
	 Gpso7kSHDX+OiV9Yv26e1apocQIYaqWrNWbarko4tQkHuwsppOmSH8ddblmH2JfwaT
	 BfW8USB44zbgfN8W19SRgCtNiFZTSK9s4W6bCeDlG/VD7XsSmzzgO7UP+Jk5v5blKm
	 qfvqMKJFn+/YJ67L7/O0dj6AnYofR9qAVaIlg+YcbmeS0ZSLYANrFuhyQXhwKjIbyW
	 CI/WdN9yN7Gig==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:9506:6478:3b8b:6f58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5519A17E017D;
	Wed, 25 Jun 2025 10:49:00 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: krzk@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	guangjie.song@mediatek.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	netdev@vger.kernel.org,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com,
	robh@kernel.org,
	sboyd@kernel.org,
	wenst@chromium.org
Subject: Re: [PATCH v2 10/29] dt-bindings: reset: Add MediaTek MT8196 Reset Controller binding
Date: Wed, 25 Jun 2025 10:48:23 +0200
Message-Id: <20250625084823.19856-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <ae13aeea-bf44-49e5-82c6-5e369ea96d84@kernel.org>
References: <ae13aeea-bf44-49e5-82c6-5e369ea96d84@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_094903_974456_10019E14 
X-CRM114-Status: GOOD (  12.50  )
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

Hi Krzysztof,

On 6/24/25 18:03, Krzysztof Kozlowski wrote:
> On 24/06/2025 16:32, Laura Nao wrote:
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Add a binding for the PEXTP0/1 and UFS reset controllers found in
>> the MediaTek MT8196 Chromebook SoC.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>  .../reset/mediatek,mt8196-resets.h            | 26 +++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 include/dt-bindings/reset/mediatek,mt8196-resets.h
>
> No improvements.
>

Apologies - I misinterpreted your comment. I assumed you were referring 
to adding the commit message details to the binding doc (which is why I
added a description for reset-cells), but I realize now you likely meant 
the header file should be included in the same commit which adds the 
clock binding documentation. Is that correct?

I’ll fix that in the next revision.

Thanks,

Laura


